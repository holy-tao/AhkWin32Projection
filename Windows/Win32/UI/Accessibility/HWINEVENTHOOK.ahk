#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to declare a window event hook function.
 * @remarks
 * This data type is used with the [*WinEventProc*](/windows/desktop/api/Winuser/nc-winuser-wineventproc) callback function and the [**SetWinEventHook**](/windows/desktop/api/Winuser/nf-winuser-setwineventhook) and [**UnhookWinEvent**](/windows/desktop/api/Winuser/nf-winuser-unhookwinevent) functions.
 * @see https://learn.microsoft.com/windows/win32/WinAuto/hwineventhook
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class HWINEVENTHOOK extends Win32Struct
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
