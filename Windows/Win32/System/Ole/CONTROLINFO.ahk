#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters that describe a control's keyboard mnemonics and keyboard behavior. The structure is populated during the IOleControl::GetControlInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-controlinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class CONTROLINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-accel">ACCEL</a> structures, each structure describing a keyboard mnemonic. The array is created with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createacceleratortablea">CreateAcceleratorTable</a> function. The control always maintains the memory for this array; the caller of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iolecontrol-getcontrolinfo">IOleControl::GetControlInfo</a> should not attempt to free the memory.
     * @type {Pointer<Void>}
     */
    hAccel {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of mnemonics described in the <b>hAccel</b> field. This value can be zero to indicate no mnemonics.
     * @type {Integer}
     */
    cAccel {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Flags that indicate the keyboard behavior of the control. The possible values are:
     * 
     * <ul>
     * <li>CTRLINFO_EATS_RETURN: When the control has the focus, it will process the Return key. 
     * </li>
     * <li>CTRLINFO_EATS_ESCAPE: When the control has the focus, it will process the Escape key. </li>
     * </ul>
     * When the control has the focus, the dialog box containing the control cannot use the Return or Escape keys as mnemonics for the default and cancel buttons.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
