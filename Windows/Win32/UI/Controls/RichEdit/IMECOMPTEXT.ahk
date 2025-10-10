#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the Input Method Editor (IME) composition text in a Microsoft Rich Edit control.
 * @remarks
 * 
  * This structure is used with the <a href="https://msdn.microsoft.com/1516305c-5f87-4ae0-97db-8709c71abacc">EM_GETIMECOMPTEXT</a> message.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-imecomptext
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class IMECOMPTEXT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Size of the output buffer, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
