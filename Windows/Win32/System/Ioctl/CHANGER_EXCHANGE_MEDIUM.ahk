#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk

/**
 * Contains information the IOCTL_CHANGER_EXCHANGE_MEDIUM control code uses to move a piece of media to a destination, and the piece of media originally in the first destination to a second destination.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_exchange_medium
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_EXCHANGE_MEDIUM extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates which transport element to use for the exchange operation. The <b>ElementType</b> member of this structure must be ChangerTransport.
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
    Destination1{
        get {
            if(!this.HasProp("__Destination1"))
                this.__Destination1 := CHANGER_ELEMENT(16, this)
            return this.__Destination1
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates the element that is the destination of the media originally at <b>Destination1</b>.
     * @type {CHANGER_ELEMENT}
     */
    Destination2{
        get {
            if(!this.HasProp("__Destination2"))
                this.__Destination2 := CHANGER_ELEMENT(24, this)
            return this.__Destination2
        }
    }

    /**
     * If this member is <b>TRUE</b>, the medium at <b>Destination1</b> should be flipped. Otherwise, it should not. This member is valid only if the <b>Features0</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a> structure is CHANGER_MEDIUM_FLIP.
     * @type {BOOLEAN}
     */
    Flip1 {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * If this member is <b>TRUE</b>, the medium at <b>Destination2</b> should be flipped. Otherwise, it should not. This member is valid only if the <b>Features0</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a> structure is CHANGER_MEDIUM_FLIP.
     * @type {BOOLEAN}
     */
    Flip2 {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }
}
