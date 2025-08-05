function makeActive(id){
	document.getElementById(id).classList.add("active");
}

function validateInsertForm() {
  const email = document.getElementsByName("email")[0].value.trim();
  const phone = document.getElementsByName("phone")[0].value.trim();
  const countryCode = document.getElementsByName("countryCode")[0].value.trim();

  const fullPhone = countryCode + phone;

  const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  const phonePattern = /^\+?[0-9\s\-().]{7,20}$/;  // Accepts international formats

  if (!emailPattern.test(email)) {
    alert("Please enter a valid email address.");
    return false;
  }

  if (!phonePattern.test(fullPhone)) {
    alert("Please enter a valid phone number with correct format.");
    return false;
  }

  return true;
}



