#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\IEEE1394_VDEV_PNP_REQUEST.ahk

/**
 * @namespace Windows.Win32.Devices
 * @version v4.0.30319
 */
class IEEE1394_API_REQUEST extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    RequestNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {IEEE1394_VDEV_PNP_REQUEST}
     */
    AddVirtualDevice{
        get {
            if(!this.HasProp("__AddVirtualDevice"))
                this.__AddVirtualDevice := IEEE1394_VDEV_PNP_REQUEST(8, this)
            return this.__AddVirtualDevice
        }
    }

    /**
     * @type {IEEE1394_VDEV_PNP_REQUEST}
     */
    RemoveVirtualDevice{
        get {
            if(!this.HasProp("__RemoveVirtualDevice"))
                this.__RemoveVirtualDevice := IEEE1394_VDEV_PNP_REQUEST(8, this)
            return this.__RemoveVirtualDevice
        }
    }
}
