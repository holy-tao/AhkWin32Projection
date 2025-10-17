#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DEVICE_SELF_TEST_RESULT_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    class _Status extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Result
         * - CodeValue
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Result {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }
    
        /**
         * @type {Integer}
         */
        CodeValue {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
    
    }

    class _ValidDiagnostics extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - NSIDValid
         * - FLBAValid
         * - SCTValid
         * - SCValid
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        NSIDValid {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        FLBAValid {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        SCTValid {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        SCValid {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
    }

    class _StatusCodeType extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - AdditionalInfo
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        AdditionalInfo {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    
    }

    /**
     * @type {_Status}
     */
    Status{
        get {
            if(!this.HasProp("__Status"))
                this.__Status := %this.__Class%._Status(0, this)
            return this.__Status
        }
    }

    /**
     * @type {Integer}
     */
    SegmentNumber {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {_ValidDiagnostics}
     */
    ValidDiagnostics{
        get {
            if(!this.HasProp("__ValidDiagnostics"))
                this.__ValidDiagnostics := %this.__Class%._ValidDiagnostics(2, this)
            return this.__ValidDiagnostics
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    POH {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NSID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    FailingLBA {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {_StatusCodeType}
     */
    StatusCodeType{
        get {
            if(!this.HasProp("__StatusCodeType"))
                this.__StatusCodeType := %this.__Class%._StatusCodeType(32, this)
            return this.__StatusCodeType
        }
    }

    /**
     * @type {Integer}
     */
    StatusCode {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }

    /**
     * @type {Integer}
     */
    VendorSpecific {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }
}
