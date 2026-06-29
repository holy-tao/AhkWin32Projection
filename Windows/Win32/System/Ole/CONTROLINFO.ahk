#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\WindowsAndMessaging\HACCEL.ahk" { HACCEL }

/**
 * Contains parameters that describe a control's keyboard mnemonics and keyboard behavior. The structure is populated during the IOleControl::GetControlInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-controlinfo
 * @namespace Windows.Win32.System.Ole
 */
export default struct CONTROLINFO {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cb : UInt32

    /**
     * A handle to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-accel">ACCEL</a> structures, each structure describing a keyboard mnemonic. The array is created with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createacceleratortablea">CreateAcceleratorTable</a> function. The control always maintains the memory for this array; the caller of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iolecontrol-getcontrolinfo">IOleControl::GetControlInfo</a> should not attempt to free the memory.
     */
    hAccel : HACCEL

    /**
     * The number of mnemonics described in the <b>hAccel</b> field. This value can be zero to indicate no mnemonics.
     */
    cAccel : UInt16

    /**
     * Flags that indicate the keyboard behavior of the control. The possible values are:
     * 
     * <ul>
     * <li>CTRLINFO_EATS_RETURN: When the control has the focus, it will process the Return key. 
     * </li>
     * <li>CTRLINFO_EATS_ESCAPE: When the control has the focus, it will process the Escape key. </li>
     * </ul>
     * When the control has the focus, the dialog box containing the control cannot use the Return or Escape keys as mnemonics for the default and cancel buttons.
     */
    dwFlags : UInt32

}
