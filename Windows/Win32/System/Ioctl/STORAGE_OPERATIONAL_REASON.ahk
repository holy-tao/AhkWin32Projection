#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_OPERATIONAL_REASON extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reason {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    class _ScsiSenseKey extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        SenseKey {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ASC {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        ASCQ {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
    }

    class _NVDIMM_N extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        CriticalHealth {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        ModuleHealth{
            get {
                if(!this.HasProp("__ModuleHealthProxyArray"))
                    this.__ModuleHealthProxyArray := Win32FixedArray(this.ptr + 1, 2, Primitive, "char")
                return this.__ModuleHealthProxyArray
            }
        }
    
        /**
         * @type {Integer}
         */
        ErrorThresholdStatus {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
    }

    /**
     * @type {_ScsiSenseKey}
     */
    ScsiSenseKey{
        get {
            if(!this.HasProp("__ScsiSenseKey"))
                this.__ScsiSenseKey := %this.__Class%._ScsiSenseKey(this.ptr + 12)
            return this.__ScsiSenseKey
        }
    }

    /**
     * @type {_NVDIMM_N}
     */
    NVDIMM_N{
        get {
            if(!this.HasProp("__NVDIMM_N"))
                this.__NVDIMM_N := %this.__Class%._NVDIMM_N(this.ptr + 12)
            return this.__NVDIMM_N
        }
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
