import 'package:flutter/material.dart';

import '../../../core/constants/gaps.dart';
import '../../../core/extension/number_extension.dart';
import '../../../core/utils/uuid_generator.dart';
import '../../../domain/entities/user_entity.dart';

mixin _Controllers {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
}

class AddOrUpdateUserWidget extends StatefulWidget {
  const AddOrUpdateUserWidget(
      {super.key, required this.onAddOrUpdateUser, this.userEntity});

  final void Function(UserEntity) onAddOrUpdateUser;
  final UserEntity? userEntity;

  @override
  State<AddOrUpdateUserWidget> createState() => _AddOrUpdateUserWidgetState();
}

class _AddOrUpdateUserWidgetState extends State<AddOrUpdateUserWidget>
    with _Controllers, UuidGenerator {
  @override
  void initState() {
    super.initState();
    if (widget.userEntity != null) {
      _firstnameController.text = widget.userEntity?.firstname ?? '';
      _lastnameController.text = widget.userEntity?.lastname ?? '';
      _emailController.text = widget.userEntity?.email ?? '';
      _phoneController.text = widget.userEntity?.phoneNumber ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _firstnameController,
          decoration: const InputDecoration(hintText: 'Firstname'),
        ),
        TextField(
          controller: _lastnameController,
          decoration: const InputDecoration(hintText: 'Lastname'),
        ),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        TextField(
          controller: _phoneController,
          decoration: const InputDecoration(hintText: 'Phone number'),
        ),
        kLarge.vSpace,
        ElevatedButton(
            onPressed: () {
              widget.onAddOrUpdateUser(UserEntity(
                id: widget.userEntity == null
                    ? uuidV1
                    : widget.userEntity?.id ?? '',
                firstname: _firstnameController.text,
                lastname: _lastnameController.text,
                email: _emailController.text,
                phoneNumber: _phoneController.text,
              ));
              Navigator.pop(context);
            },
            child: Text(widget.userEntity == null ? 'Add' : 'Update')),
        kLarge.vSpace,
      ],
    );
  }
}
