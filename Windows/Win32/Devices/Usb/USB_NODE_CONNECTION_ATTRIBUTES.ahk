#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_NODE_CONNECTION_ATTRIBUTES extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * @type {Integer}
     */
    ConnectionIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ConnectionStatus {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PortAttributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
