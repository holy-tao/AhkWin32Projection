#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }

/**
 * Used when invoking the Microsoft IME's Dictionary Tool or Word Register Dialog Window from the app.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ns-msime-imedlg
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEDLG {
    #StructPack 8

    /**
     * The size of this structure. You must set this value before using the structure.
     */
    cbIMEDLG : Int32

    /**
     * The parent window handle of the Register Word Dialog.
     */
    hwnd : HWND

    /**
     * <b>NULL</b>, or  the string to be registered. It shows in the Word Register Dialog's "Display" field.
     */
    lpwstrWord : PWSTR

    /**
     * The initial tab ID, 0 or 1.
     */
    nTabId : Int32

}
