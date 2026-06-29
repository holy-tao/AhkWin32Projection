#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACCEL_VIRT_FLAGS.ahk" { ACCEL_VIRT_FLAGS }

/**
 * Defines an accelerator key used in an accelerator table.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-accel
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct ACCEL {
    #StructPack 8

    /**
     * Type: <b>BYTE</b>
     */
    fVirt : ACCEL_VIRT_FLAGS

    /**
     * Type: <b>WORD</b>
     * 
     * The accelerator key. This member can be either a <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">virtual-key code</a> or a character code.
     */
    key : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * The accelerator identifier. This value is placed in the low-order word of the <i>wParam</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> or <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-syscommand">WM_SYSCOMMAND</a> message when the accelerator is pressed.
     */
    cmd : UInt16

}
