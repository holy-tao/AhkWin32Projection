#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_COPYRIGHT_MANAGEMENT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    class _Dvdrom extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - CopyProtectionMode
         * - ContentGenerationManagementSystem
         * - CopyProtectedSector
         * - CopyProtectedMaterial
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        CopyProtectionMode {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }
    
        /**
         * @type {Integer}
         */
        ContentGenerationManagementSystem {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        CopyProtectedSector {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }
    
        /**
         * @type {Integer}
         */
        CopyProtectedMaterial {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
    }

    class _DvdRecordable_Version1 extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - Reserved0001
         * - ContentGenerationManagementSystem
         * - Reserved0002
         * - CopyProtectedMaterial
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Reserved0001 {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }
    
        /**
         * @type {Integer}
         */
        ContentGenerationManagementSystem {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        Reserved0002 {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }
    
        /**
         * @type {Integer}
         */
        CopyProtectedMaterial {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
    }

    class _Dvdram extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * @type {Integer}
         */
        Reserved0003 {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
    }

    class _DvdRecordable extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - Reserved0004
         * - ADP_TY
         * - Reserved0005
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Reserved0004 {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        ADP_TY {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }
    
        /**
         * @type {Integer}
         */
        Reserved0005 {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
    
    }

    /**
     * @type {_Dvdrom}
     */
    Dvdrom{
        get {
            if(!this.HasProp("__Dvdrom"))
                this.__Dvdrom := %this.__Class%._Dvdrom(0, this)
            return this.__Dvdrom
        }
    }

    /**
     * @type {_DvdRecordable_Version1}
     */
    DvdRecordable_Version1{
        get {
            if(!this.HasProp("__DvdRecordable_Version1"))
                this.__DvdRecordable_Version1 := %this.__Class%._DvdRecordable_Version1(0, this)
            return this.__DvdRecordable_Version1
        }
    }

    /**
     * @type {_Dvdram}
     */
    Dvdram{
        get {
            if(!this.HasProp("__Dvdram"))
                this.__Dvdram := %this.__Class%._Dvdram(0, this)
            return this.__Dvdram
        }
    }

    /**
     * @type {_DvdRecordable}
     */
    DvdRecordable{
        get {
            if(!this.HasProp("__DvdRecordable"))
                this.__DvdRecordable := %this.__Class%._DvdRecordable(0, this)
            return this.__DvdRecordable
        }
    }

    /**
     * @type {Integer}
     */
    CPR_MAI {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }
}
