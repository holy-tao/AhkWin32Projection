#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RFX_GFX_MSG_HEADER.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class RFX_GFX_MSG_RDP_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {RFX_GFX_MSG_HEADER}
     */
    channelHdr{
        get {
            if(!this.HasProp("__channelHdr"))
                this.__channelHdr := RFX_GFX_MSG_HEADER(this.ptr + 0)
            return this.__channelHdr
        }
    }

    /**
     * @type {Array<Byte>}
     */
    rdpData{
        get {
            if(!this.HasProp("__rdpDataProxyArray"))
                this.__rdpDataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__rdpDataProxyArray
        }
    }
}
