// Checks for confirmation of passwords

const passwordValidation = () => {
  const password = document.getElementById('password');
  const passwordConfirmation = document.getElementById('password_confirmation');

  if (!password || !passwordConfirmation) return;

  const passwordValidator = () => {
    if (password.value !== passwordConfirmation.value) {
      passwordConfirmation.setCustomValidity('De wachtwoorden komen niet overeen.');
    } else {
      passwordConfirmation.setCustomValidity('');
    }
  }

  passwordConfirmation.onblur = passwordValidator;
  passwordConfirmation.onkeyup = passwordValidator;
}

// Check to see if all fields have been touched (to prevent validation from going off too early)

const allFieldsTouched = fields => {
  const requiredFields = Array.from(fields).filter(f => f.hasAttribute('required'));
  const hasBeenTouched = field => Array.from(field.classList).includes('touched');

  fields.forEach(field => {
    // Set touched-class after it has been touched

    field.onblur = () => !hasBeenTouched(field) && field.classList.add('touched');
  });
}

// Set the pattern for validating the e-mail address

const emailValidation = () => {
  const email = document.getElementById('email');

  if (!email) return;

  const emailRegex = new RegExp(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);

  const emailValidator = () => {
    if (!emailRegex.test(email.value)) {
      email.setCustomValidity('Geen geldige invoer.');
    } else {
      email.setCustomValidity('');
    }
  }

  email.onblur = emailValidator;
  email.onkeyup = emailValidator;
}

const applyAll = () => {
  const fields = document.querySelectorAll('input, select');

  emailValidation();
  passwordValidation();
  allFieldsTouched(fields);
}

document.addEventListener('turbolinks:load', applyAll);
