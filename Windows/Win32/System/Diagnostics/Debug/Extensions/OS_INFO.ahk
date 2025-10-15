#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class OS_INFO extends Win32Struct
{
    static sizeof => 1004

    static packingSize => 4

    class _s extends Win32Struct {
        static sizeof => 1004
        static packingSize => 4

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
    MajorVer {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MinorVer {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Build {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BuildQfe {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
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
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {_s}
     */
    s{
        get {
            if(!this.HasProp("__s"))
                this.__s := %this.__Class%._s(this.ptr + 28)
            return this.__s
        }
    }

    /**
     * @type {Integer}
     */
    SrvPackNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ServicePackBuild {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    Architecture {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Lcid {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 48, 63, "UTF-16")
        set => StrPut(value, this.ptr + 48, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    FullName {
        get => StrGet(this.ptr + 176, 255, "UTF-16")
        set => StrPut(value, this.ptr + 176, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    Language {
        get => StrGet(this.ptr + 688, 29, "UTF-16")
        set => StrPut(value, this.ptr + 688, 29, "UTF-16")
    }

    /**
     * @type {String}
     */
    BuildVersion {
        get => StrGet(this.ptr + 748, 63, "UTF-16")
        set => StrPut(value, this.ptr + 748, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    ServicePackString {
        get => StrGet(this.ptr + 876, 63, "UTF-16")
        set => StrPut(value, this.ptr + 876, 63, "UTF-16")
    }
}
