#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ELEMENT_TYPE.ahk" { ELEMENT_TYPE }
#Import ".\CHANGER_ELEMENT.ahk" { CHANGER_ELEMENT }

/**
 * Contains information that the IOCTL_CHANGER_SET_ACCESS control code needs to set the state of the device's insert/eject port, door, or keypad.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_set_access
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_SET_ACCESS {
    #StructPack 4

    /**
     * A
     */
    Element : CHANGER_ELEMENT

    /**
     * The operation to be performed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXTEND_IEPORT"></a><a id="extend_ieport"></a><dl>
     * <dt><b>EXTEND_IEPORT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element is to be extended. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_OPEN_IEPORT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCK_ELEMENT"></a><a id="lock_element"></a><dl>
     * <dt><b>LOCK_ELEMENT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element is to be locked. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_LOCK_UNLOCK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RETRACT_IEPORT"></a><a id="retract_ieport"></a><dl>
     * <dt><b>RETRACT_IEPORT</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element is to be retracted. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_CLOSE_IEPORT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNLOCK_ELEMENT"></a><a id="unlock_element"></a><dl>
     * <dt><b>UNLOCK_ELEMENT</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element is to be unlocked. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_LOCK_UNLOCK.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Control : UInt32

}
