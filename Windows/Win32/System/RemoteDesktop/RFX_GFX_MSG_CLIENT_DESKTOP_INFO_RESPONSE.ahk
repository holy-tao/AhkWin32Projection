#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RFX_GFX_MSG_HEADER.ahk
#Include .\RFX_GFX_MONITOR_INFO.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class RFX_GFX_MSG_CLIENT_DESKTOP_INFO_RESPONSE extends Win32Struct
{
    static sizeof => 204

    static packingSize => 1

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
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    monitorCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<RFX_GFX_MONITOR_INFO>}
     */
    MonitorData{
        get {
            if(!this.HasProp("__MonitorDataProxyArray"))
                this.__MonitorDataProxyArray := Win32FixedArray(this.ptr + 12, 16, RFX_GFX_MONITOR_INFO, "")
            return this.__MonitorDataProxyArray
        }
    }

    /**
     * @type {String}
     */
    clientUniqueId {
        get => StrGet(this.ptr + 140, 31, "UTF-16")
        set => StrPut(value, this.ptr + 140, 31, "UTF-16")
    }
}
