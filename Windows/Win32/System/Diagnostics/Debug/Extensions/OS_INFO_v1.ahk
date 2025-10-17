#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class OS_INFO_v1 extends Win32Struct
{
    static sizeof => 352

    static packingSize => 8

    class _s extends Win32Struct {
        static sizeof => 352
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Checked
         * - Pae
         * - MultiProc
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Checked {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Pae {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        MultiProc {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 3) & 0x1FFFFFFF
            set => this._bitfield := ((value & 0x1FFFFFFF) << 3) | (this._bitfield & ~(0x1FFFFFFF << 3))
        }
    
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Major {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Minor {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    /**
     * @type {_Version}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := %this.__Class%._Version(8, this)
            return this.__Version
        }
    }

    /**
     * @type {Integer}
     */
    Ver64 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ProductType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Suite {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {_s}
     */
    s{
        get {
            if(!this.HasProp("__s"))
                this.__s := %this.__Class%._s(24, this)
            return this.__s
        }
    }

    /**
     * @type {Integer}
     */
    SrvPackNumber {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {String}
     */
    Language {
        get => StrGet(this.ptr + 32, 29, "UTF-16")
        set => StrPut(value, this.ptr + 32, 29, "UTF-16")
    }

    /**
     * @type {String}
     */
    OsString {
        get => StrGet(this.ptr + 92, 63, "UTF-16")
        set => StrPut(value, this.ptr + 92, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    ServicePackString {
        get => StrGet(this.ptr + 220, 63, "UTF-16")
        set => StrPut(value, this.ptr + 220, 63, "UTF-16")
    }
}
