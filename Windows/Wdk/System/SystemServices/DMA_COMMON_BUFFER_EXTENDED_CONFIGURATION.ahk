#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ConfigType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _LogicalAddressLimits extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        MinimumAddress {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MaximumAddress {
            get => NumGet(this, 8, "int64")
            set => NumPut("int64", value, this, 8)
        }
    
    }

    class _SubSection extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Offset {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Length {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * @type {_LogicalAddressLimits}
     */
    LogicalAddressLimits{
        get {
            if(!this.HasProp("__LogicalAddressLimits"))
                this.__LogicalAddressLimits := %this.__Class%._LogicalAddressLimits(8, this)
            return this.__LogicalAddressLimits
        }
    }

    /**
     * @type {_SubSection}
     */
    SubSection{
        get {
            if(!this.HasProp("__SubSection"))
                this.__SubSection := %this.__Class%._SubSection(8, this)
            return this.__SubSection
        }
    }

    /**
     * @type {Integer}
     */
    HardwareAccessType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
