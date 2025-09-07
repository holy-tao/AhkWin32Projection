#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An HRECOWORDLIST handle is used to manage a word list you attach to a recognizer context. You use a word list to improve recognition results.
 * @remarks
 * The following function use an **HRECOWORDLIST**.
  * 
  * 
  * 
  * | Function                                         | Description                                         |
  * |--------------------------------------------------|-----------------------------------------------------|
  * | [**AddWordsToWordList**](/windows/desktop/api/recapis/nf-recapis-addwordstowordlist) | Adds one or more words to the word list.<br/> |
  * | [**DestroyWordList**](/windows/desktop/api/recapis/nf-recapis-destroywordlist)       | Destroys the current word list.<br/>          |
  * | [**MakeWordList**](/windows/desktop/api/recapis/nf-recapis-makewordlist)             | Creates a word list.<br/>                     |
 * @see https://learn.microsoft.com/windows/win32/tablet/hrecowordlist-handle
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class HRECOWORDLIST extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
