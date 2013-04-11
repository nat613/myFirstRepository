function Trim(str) { if(str) return( str.replace(/^\s*([\s\S]*\S+)\s*$|^\s*$/,'$1') ); else return ""; }
function RetFalse(obj,msg) { alert(msg);obj.focus();obj.select();return false; }

function CheckRASE(TheForm,DType) {
/*
  for ( i = 0; i < parent.frames.length; ++i )
    if ( parent.frames[i].FCK )
      parent.frames[i].FCK.UpdateLinkedField();

  TheForm.Title.value=Trim(TheForm.Title.value);
  if (TheForm.Title.value == "") return RetFalse(TheForm.Title, "שגיאה: אתה חייב להכניס כותרת.");
  if ((DType!="Tip") && (DType!="EMail")) {
    TheForm.NewImage.value=Trim(TheForm.NewImage.value);
    if ((TheForm.NewImage.value == "") && (location.href.indexOf("Edit")==-1)) return RetFalse(TheForm.Image, "שגיאה: אתה חייב להכניס תמונה.");
  }
  if ((DType!="EMail") && (DType!="Tip")) {
    TheForm.ShortBody.value=Trim(TheForm.ShortBody.value);
    if (TheForm.ShortBody.value == "") {
      alert("שגיאה: אתה חייב להכניס תוכן מקוצר.");
      return false;
    }
  }
  TheForm.Body.value=Trim(TheForm.Body.value);
//  if (TheForm.Body.value == "") {
//    alert("שגיאה: אתה חייב להכניס תוכן.");
//    return false;
//  }
*/
  TheForm.SubmitButton.disabled=true;
  return true;
}