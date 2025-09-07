#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBD_ENDPOINT_OFFLOAD_INFORMATION extends Win32Struct
{
    static sizeof => 82

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EndpointAddress {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ResourceId {
        get => NumGet(this, 6, "uint")
        set => NumPut("uint", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 10, "int")
        set => NumPut("int", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 14, "uint")
        set => NumPut("uint", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 18, "uint")
        set => NumPut("uint", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    TransferSegmentLA {
        get => NumGet(this, 22, "int64")
        set => NumPut("int64", value, this, 22)
    }

    /**
     * @type {Pointer<Void>}
     */
    TransferSegmentVA {
        get => NumGet(this, 30, "ptr")
        set => NumPut("ptr", value, this, 30)
    }

    /**
     * @type {Pointer}
     */
    TransferRingSize {
        get => NumGet(this, 38, "ptr")
        set => NumPut("ptr", value, this, 38)
    }

    /**
     * @type {Integer}
     */
    TransferRingInitialCycleBit {
        get => NumGet(this, 46, "uint")
        set => NumPut("uint", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    MessageNumber {
        get => NumGet(this, 50, "uint")
        set => NumPut("uint", value, this, 50)
    }

    /**
     * @type {Integer}
     */
    EventRingSegmentLA {
        get => NumGet(this, 54, "int64")
        set => NumPut("int64", value, this, 54)
    }

    /**
     * @type {Pointer<Void>}
     */
    EventRingSegmentVA {
        get => NumGet(this, 62, "ptr")
        set => NumPut("ptr", value, this, 62)
    }

    /**
     * @type {Pointer}
     */
    EventRingSize {
        get => NumGet(this, 70, "ptr")
        set => NumPut("ptr", value, this, 70)
    }

    /**
     * @type {Integer}
     */
    EventRingInitialCycleBit {
        get => NumGet(this, 78, "uint")
        set => NumPut("uint", value, this, 78)
    }
}
