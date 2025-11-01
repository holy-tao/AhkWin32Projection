#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_COMMAND_STATUS.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_error_info_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ERROR_INFO_LOG extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    class _ParameterErrorLocation extends Win32Struct {
        static sizeof => 72
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Byte
         * - Bit
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Byte {
            get => (this._bitfield >> 0) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
        }
    
        /**
         * @type {Integer}
         */
        Bit {
            get => (this._bitfield >> 8) & 0x7
            set => this._bitfield := ((value & 0x7) << 8) | (this._bitfield & ~(0x7 << 8))
        }
    
    }

    /**
     * @type {Integer}
     */
    ErrorCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SQID {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    CMDID {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {NVME_COMMAND_STATUS}
     */
    Status{
        get {
            if(!this.HasProp("__Status"))
                this.__Status := NVME_COMMAND_STATUS(12, this)
            return this.__Status
        }
    }

    /**
     * @type {_ParameterErrorLocation}
     */
    ParameterErrorLocation{
        get {
            if(!this.HasProp("__ParameterErrorLocation"))
                this.__ParameterErrorLocation := %this.__Class%._ParameterErrorLocation(16, this)
            return this.__ParameterErrorLocation
        }
    }

    /**
     * @type {Integer}
     */
    Lba {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    NameSpace {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    VendorInfoAvailable {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    TRTYPE {
        get => NumGet(this, 37, "char")
        set => NumPut("char", value, this, 37)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 38, 2, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CommandSpecificInfo {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    TransportTypeSpecificInfo {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 50, 22, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
