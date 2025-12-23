#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IMAGE_DELAYLOAD_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    class _Attributes_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        AllAttributes {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * This bitfield backs the following members:
         * - RvaBased
         * - ReservedAttributes
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        RvaBased {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        ReservedAttributes {
            get => (this._bitfield >> 1) & 0x7FFFFFFF
            set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
        }
    
    }

    /**
     * @type {_Attributes_e__Union}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := %this.__Class%._Attributes_e__Union(0, this)
            return this.__Attributes
        }
    }

    /**
     * @type {Integer}
     */
    DllNameRVA {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ModuleHandleRVA {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ImportAddressTableRVA {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ImportNameTableRVA {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BoundImportAddressTableRVA {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    UnloadInformationTableRVA {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
