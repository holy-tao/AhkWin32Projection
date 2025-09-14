#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used when invoking the Microsoft IME's Dictionary Tool or Word Register Dialog Window from the app.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ns-msime-imedlg
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEDLG extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * The size of this structure. You must set this value before using the structure.
     * @type {Integer}
     */
    cbIMEDLG {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The parent window handle of the Register Word Dialog.
     * @type {Pointer<HWND>}
     */
    hwnd {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * <b>NULL</b>, or  the string to be registered. It shows in the Word Register Dialog's "Display" field.
     * @type {Pointer<PWSTR>}
     */
    lpwstrWord {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * The initial tab ID, 0 or 1.
     * @type {Integer}
     */
    nTabId {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
