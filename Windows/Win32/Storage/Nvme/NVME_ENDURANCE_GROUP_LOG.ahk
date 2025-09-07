#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains fields that specify the information in an Endurance Group Information log page that indicates the amount of data being read from and written to an Endurance Group.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_endurance_group_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ENDURANCE_GROUP_LOG extends Win32Struct
{
    static sizeof => 512

    static packingSize => 1

    /**
     * 
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The amount of spare capacity before the threshold is reached, expressed as a normalized percentage (0 to 100).
     * @type {Integer}
     */
    AvailableSpareThreshold {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * A vendor-specific estimate of the percentage of life used for the NVM set(s) in the Endurance Group, expressed in units of one billion.
     * @type {Integer}
     */
    PercentageUsed {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * An estimate of the total number of data bytes written to NVM set(s) in the Endurance Group, expressed in units of one billion.
     * @type {Array<Byte>}
     */
    EnduranceEstimate{
        get {
            if(!this.HasProp("__EnduranceEstimateProxyArray"))
                this.__EnduranceEstimateProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__EnduranceEstimateProxyArray
        }
    }

    /**
     * The total number of data bytes read from NVM set(s) in the Endurance Group, expressed in units of one billion.
     * @type {Array<Byte>}
     */
    DataUnitsRead{
        get {
            if(!this.HasProp("__DataUnitsReadProxyArray"))
                this.__DataUnitsReadProxyArray := Win32FixedArray(this.ptr + 48, 1, Primitive, "char")
            return this.__DataUnitsReadProxyArray
        }
    }

    /**
     * The total number of data bytes written to the NVM sets(s) in the Endurance Group, expressed in units of one billion.
     * 
     * This value only includes data written by the host.
     * @type {Array<Byte>}
     */
    DataUnitsWritten{
        get {
            if(!this.HasProp("__DataUnitsWrittenProxyArray"))
                this.__DataUnitsWrittenProxyArray := Win32FixedArray(this.ptr + 64, 1, Primitive, "char")
            return this.__DataUnitsWrittenProxyArray
        }
    }

    /**
     * The total number of data bytes written to the NVM sets(s) in the Endurance Group, expressed in units of one billion.
     * 
     * This value includes data written by the host and the controller.
     * @type {Array<Byte>}
     */
    MediaUnitsWritten{
        get {
            if(!this.HasProp("__MediaUnitsWrittenProxyArray"))
                this.__MediaUnitsWrittenProxyArray := Win32FixedArray(this.ptr + 80, 1, Primitive, "char")
            return this.__MediaUnitsWrittenProxyArray
        }
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 96, 1, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}
