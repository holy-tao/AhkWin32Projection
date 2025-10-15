#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class HTTP_PUSH_NOTIFICATION_STATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    ChannelStatusValid{
        get {
            if(!this.HasProp("__ChannelStatusValid"))
                this.__ChannelStatusValid := BOOL(this.ptr + 0)
            return this.__ChannelStatusValid
        }
    }

    /**
     * @type {Integer}
     */
    ChannelStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
