#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk

/**
 * Contains information that the IOCTL_CHANGER_SET_ACCESS control code needs to set the state of the device's insert/eject port, door, or keypad.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_set_access
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_SET_ACCESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A
     * @type {CHANGER_ELEMENT}
     */
    Element{
        get {
            if(!this.HasProp("__Element"))
                this.__Element := CHANGER_ELEMENT(this.ptr + 0)
            return this.__Element
        }
    }

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
     * @type {Integer}
     */
    Control {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
