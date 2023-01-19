import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/Api/message_service.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/provider/user_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widegt/chatI_buble.dart';

import '../models/product_model.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;

  DetailChatPage(this.product, {Key key}) : super(key: key);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    handleAddMessage() async {
      await MessageService().addMessage(
        user: userProvider.user,
        isFromUser: true,
        product: widget.product,
        message: messageController.text,
      );

      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

    Widget header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/image_on.png',
                width: 50,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget productPrev() {
      return Container(
        width: 225,
        height: 74,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.product.galleries[0].url,
                width: 54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.name,
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                'assets/icon_exit.png',
                width: 22,
              ),
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.product is UninitializedProductModel
                ? SizedBox()
                : productPrev(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: backgroundColor4,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Typle Message....',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Image.asset(
                    'assets/icon_send.png',
                    width: 45,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: userProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                children: snapshot.data
                    .map((MessageModel message) => ChatBuble(
                          isSender: message.isFromUser,
                          text: message.message,
                          product: message.product,
                        ))
                    .toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
