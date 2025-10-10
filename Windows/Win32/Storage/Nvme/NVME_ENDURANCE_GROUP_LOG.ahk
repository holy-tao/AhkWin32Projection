#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ENDURANCE_GROUP_LOG extends Win32Struct
{
    static sizeof => 512

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AvailableSpareThreshold {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PercentageUsed {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 6, 26, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    EnduranceEstimate{
        get {
            if(!this.HasProp("__EnduranceEstimateProxyArray"))
                this.__EnduranceEstimateProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__EnduranceEstimateProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    DataUnitsRead{
        get {
            if(!this.HasProp("__DataUnitsReadProxyArray"))
                this.__DataUnitsReadProxyArray := Win32FixedArray(this.ptr + 48, 16, Primitive, "char")
            return this.__DataUnitsReadProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    DataUnitsWritten{
        get {
            if(!this.HasProp("__DataUnitsWrittenProxyArray"))
                this.__DataUnitsWrittenProxyArray := Win32FixedArray(this.ptr + 64, 16, Primitive, "char")
            return this.__DataUnitsWrittenProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MediaUnitsWritten{
        get {
            if(!this.HasProp("__MediaUnitsWrittenProxyArray"))
                this.__MediaUnitsWrittenProxyArray := Win32FixedArray(this.ptr + 80, 16, Primitive, "char")
            return this.__MediaUnitsWrittenProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 96, 416, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}
