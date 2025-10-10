#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an accelerator key used in an accelerator table.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-accel
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class ACCEL extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * Type: <b>BYTE</b>
     * @type {Integer}
     */
    fVirt {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The accelerator key. This member can be either a <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">virtual-key code</a> or a character code.
     * @type {Integer}
     */
    key {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The accelerator identifier. This value is placed in the low-order word of the <i>wParam</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> or <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-syscommand">WM_SYSCOMMAND</a> message when the accelerator is pressed.
     * @type {Integer}
     */
    cmd {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
