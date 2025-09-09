#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEVICE_PERFORMANCE_INFO extends Win32Struct
{
    static sizeof => 228

    static packingSize => 1

    /**
     * @type {Integer}
     */
    BulkBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ControlDataBytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    IsoBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    InterruptBytes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    BulkUrbCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ControlUrbCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    IsoUrbCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    InterruptUrbCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<UInt32>}
     */
    AllocedInterrupt{
        get {
            if(!this.HasProp("__AllocedInterruptProxyArray"))
                this.__AllocedInterruptProxyArray := Win32FixedArray(this.ptr + 32, 6, Primitive, "uint")
            return this.__AllocedInterruptProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    AllocedIso {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Total32secBandwidth {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    TotalTtBandwidth {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {String}
     */
    DeviceDescription {
        get => StrGet(this.ptr + 68, 59, "UTF-16")
        set => StrPut(value, this.ptr + 68, 59, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    DeviceSpeed {
        get => NumGet(this, 188, "int")
        set => NumPut("int", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    TotalIsoLatency {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    DroppedIsoPackets {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    TransferErrors {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    PciInterruptCount {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    HcIdleState {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    HcAsyncIdleState {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    HcAsyncCacheFlushCount {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    HcPeriodicIdleState {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    HcPeriodicCacheFlushCount {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }
}
