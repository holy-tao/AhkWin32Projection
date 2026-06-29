#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_PUSH_NOTIFICATION_STATUS extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    ChannelStatusValid {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ChannelStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
