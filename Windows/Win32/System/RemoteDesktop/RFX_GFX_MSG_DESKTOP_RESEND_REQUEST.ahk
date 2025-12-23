#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RFX_GFX_MSG_HEADER.ahk
#Include .\RFX_GFX_RECT.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class RFX_GFX_MSG_DESKTOP_RESEND_REQUEST extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {RFX_GFX_MSG_HEADER}
     */
    channelHdr{
        get {
            if(!this.HasProp("__channelHdr"))
                this.__channelHdr := RFX_GFX_MSG_HEADER(0, this)
            return this.__channelHdr
        }
    }

    /**
     * @type {RFX_GFX_RECT}
     */
    RedrawRect{
        get {
            if(!this.HasProp("__RedrawRect"))
                this.__RedrawRect := RFX_GFX_RECT(4, this)
            return this.__RedrawRect
        }
    }
}
