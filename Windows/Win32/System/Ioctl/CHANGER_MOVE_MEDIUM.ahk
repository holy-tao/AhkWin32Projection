#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk

/**
 * Contains information that the IOCTL_CHANGER_MOVE_MEDIUM control code uses to move a piece of media to a destination.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_move_medium
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_MOVE_MEDIUM extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates which transport element to use for the move operation.
     * @type {CHANGER_ELEMENT}
     */
    Transport{
        get {
            if(!this.HasProp("__Transport"))
                this.__Transport := CHANGER_ELEMENT(0, this)
            return this.__Transport
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates the element that contains the media that is to be moved.
     * @type {CHANGER_ELEMENT}
     */
    Source{
        get {
            if(!this.HasProp("__Source"))
                this.__Source := CHANGER_ELEMENT(8, this)
            return this.__Source
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates the element that is the destination of the media originally at <b>Source</b>.
     * @type {CHANGER_ELEMENT}
     */
    Destination{
        get {
            if(!this.HasProp("__Destination"))
                this.__Destination := CHANGER_ELEMENT(16, this)
            return this.__Destination
        }
    }

    /**
     * If this member is <b>TRUE</b>, the media should be flipped. Otherwise, it should not. This member is valid only if the <b>Features0</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a> structure is CHANGER_MEDIUM_FLIP.
     * @type {BOOLEAN}
     */
    Flip {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }
}
