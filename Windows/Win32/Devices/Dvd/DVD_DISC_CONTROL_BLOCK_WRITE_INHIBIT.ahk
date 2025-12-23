#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DVD_DISC_CONTROL_BLOCK_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DISC_CONTROL_BLOCK_WRITE_INHIBIT extends Win32Struct
{
    static sizeof => 32768

    static packingSize => 1

    class _WriteProtectActions_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 1

        /**
         * @type {Array<Byte>}
         */
        ReservedDoNotUse_UseAsByteInstead_0{
            get {
                if(!this.HasProp("__ReservedDoNotUse_UseAsByteInstead_0ProxyArray"))
                    this.__ReservedDoNotUse_UseAsByteInstead_0ProxyArray := Win32FixedArray(this.ptr + 0, 3, Primitive, "char")
                return this.__ReservedDoNotUse_UseAsByteInstead_0ProxyArray
            }
        }
    
        /**
         * This bitfield backs the following members:
         * - WriteProtectStatus
         * - ReservedDoNotUse_UseAsByteInstead_1
         * - UpdateRequiresPassword
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
        /**
         * @type {Integer}
         */
        WriteProtectStatus {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        ReservedDoNotUse_UseAsByteInstead_1 {
            get => (this._bitfield >> 2) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 2) | (this._bitfield & ~(0x1F << 2))
        }
    
        /**
         * @type {Integer}
         */
        UpdateRequiresPassword {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
        /**
         * @type {Array<Byte>}
         */
        AsByte{
            get {
                if(!this.HasProp("__AsByteProxyArray"))
                    this.__AsByteProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
                return this.__AsByteProxyArray
            }
        }
    
    }

    /**
     * @type {DVD_DISC_CONTROL_BLOCK_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := DVD_DISC_CONTROL_BLOCK_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    UpdateCount{
        get {
            if(!this.HasProp("__UpdateCountProxyArray"))
                this.__UpdateCountProxyArray := Win32FixedArray(this.ptr + 40, 4, Primitive, "char")
            return this.__UpdateCountProxyArray
        }
    }

    /**
     * @type {_WriteProtectActions_e__Union}
     */
    WriteProtectActions{
        get {
            if(!this.HasProp("__WriteProtectActions"))
                this.__WriteProtectActions := %this.__Class%._WriteProtectActions_e__Union(44, this)
            return this.__WriteProtectActions
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 48, 16, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    UpdatePassword{
        get {
            if(!this.HasProp("__UpdatePasswordProxyArray"))
                this.__UpdatePasswordProxyArray := Win32FixedArray(this.ptr + 64, 32, Primitive, "char")
            return this.__UpdatePasswordProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 96, 32672, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
