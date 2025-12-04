import "package:flutter/material.dart";
import "package:its_aa_pn_2025_cross_platform/input.dart";
import "package:reactive_forms/reactive_forms.dart";

class AddFormDialog extends StatefulWidget {
  const AddFormDialog({super.key});

  @override
  State<AddFormDialog> createState() => _AddFormDialogState();
}

class _AddFormDialogState extends State<AddFormDialog> {
  FormGroup _form = FormGroup({
    "name": FormControl<String>(
      validators: [RequiredValidator(), MinLengthValidator(2)],
    ),
    "comment": FormControl<String>(),
    "rating": FormControl<String>(
      validators: [RequiredValidator(), Validators.pattern(r"^[1-5]$")],
    ),
  });

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ReactiveForm(
          formGroup: _form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nuova Recensione"),
              const SizedBox(height: 40),
              ReactiveTextField(
                formControlName: "name",
                decoration: const InputDecoration(hintText: "Nome"),
              ),
              const SizedBox(height: 20),
              ReactiveTextField(
                formControlName: "comment",
                decoration:
                    const InputDecoration(hintText: "Commento (opzionale)"),
              ),
              const SizedBox(height: 20),
              ReactiveTextField(
                formControlName: "rating",
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Voto (1-5)"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Salva"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_form.valid) return;

    final review = Personal(
      name: _form.control("name").value as String,
      comment: _form.control("comment").value as String?,
      rating: _form.control("rating").value as String,
    );

    Navigator.pop(context, review);
  }
}