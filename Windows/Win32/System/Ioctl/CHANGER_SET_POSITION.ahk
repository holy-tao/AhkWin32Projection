#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Contains information needed by the IOCTL_CHANGER_SET_POSITION control code to set the changer's robotic transport mechanism to the specified element address.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-changer_set_position
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_SET_POSITION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates the transport to be moved. The <b>ElementType</b> member must be ChangerTransport.
     * @type {CHANGER_ELEMENT}
     */
    Transport{
        get {
            if(!this.HasProp("__Transport"))
                this.__Transport := CHANGER_ELEMENT(this.ptr + 0)
            return this.__Transport
        }
    }

    /**
     * A
     * @type {CHANGER_ELEMENT}
     */
    Destination{
        get {
            if(!this.HasProp("__Destination"))
                this.__Destination := CHANGER_ELEMENT(this.ptr + 8)
            return this.__Destination
        }
    }

    /**
     * If this member is <b>TRUE</b>, the media currently carried by <b>Transport</b> should be flipped. Otherwise, it should not. This member is valid only if the <b>Features0</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a> structure is CHANGER_MEDIUM_FLIP.
     * @type {BOOLEAN}
     */
    Flip{
        get {
            if(!this.HasProp("__Flip"))
                this.__Flip := BOOLEAN(this.ptr + 16)
            return this.__Flip
        }
    }
}
