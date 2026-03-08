#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32Handle.ahk

/**
 * Places the window at the bottom of the Z order. If the <i>hWnd</i> parameter identifies a topmost window, the window loses its topmost status and is placed at the bottom of all other windows.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-deferwindowpos
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class HWND extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
