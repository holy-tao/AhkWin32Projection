#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class GUEST_OS_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _ClosedSource extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - BuildNumber
         * - ServiceVersion
         * - MinorVersion
         * - MajorVersion
         * - OsId
         * - VendorId
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        BuildNumber {
            get => (this._bitfield >> 0) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
        }
    
        /**
         * @type {Integer}
         */
        ServiceVersion {
            get => (this._bitfield >> 16) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 16) | (this._bitfield & ~(0xFF << 16))
        }
    
        /**
         * @type {Integer}
         */
        MinorVersion {
            get => (this._bitfield >> 24) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
        }
    
        /**
         * @type {Integer}
         */
        MajorVersion {
            get => (this._bitfield >> 32) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 32) | (this._bitfield & ~(0xFF << 32))
        }
    
        /**
         * @type {Integer}
         */
        OsId {
            get => (this._bitfield >> 40) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 40) | (this._bitfield & ~(0xFF << 40))
        }
    
        /**
         * @type {Integer}
         */
        VendorId {
            get => (this._bitfield >> 48) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 48) | (this._bitfield & ~(0xFFFF << 48))
        }
    
    }

    class _OpenSource extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - VendorSpecific1
         * - Version
         * - VendorSpecific2
         * - OsId
         * - IsOpenSource
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        VendorSpecific1 {
            get => (this._bitfield >> 0) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
        }
    
        /**
         * @type {Integer}
         */
        Version {
            get => (this._bitfield >> 16) & 0xFFFFFFFF
            set => this._bitfield := ((value & 0xFFFFFFFF) << 16) | (this._bitfield & ~(0xFFFFFFFF << 16))
        }
    
        /**
         * @type {Integer}
         */
        VendorSpecific2 {
            get => (this._bitfield >> 48) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 48) | (this._bitfield & ~(0xFF << 48))
        }
    
        /**
         * @type {Integer}
         */
        OsId {
            get => (this._bitfield >> 56) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 56) | (this._bitfield & ~(0x7F << 56))
        }
    
        /**
         * @type {Integer}
         */
        IsOpenSource {
            get => (this._bitfield >> 63) & 0x1
            set => this._bitfield := ((value & 0x1) << 63) | (this._bitfield & ~(0x1 << 63))
        }
    
    }

    /**
     * @type {Integer}
     */
    AsUINT64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_ClosedSource}
     */
    ClosedSource{
        get {
            if(!this.HasProp("__ClosedSource"))
                this.__ClosedSource := %this.__Class%._ClosedSource(this.ptr + 0)
            return this.__ClosedSource
        }
    }

    /**
     * @type {_OpenSource}
     */
    OpenSource{
        get {
            if(!this.HasProp("__OpenSource"))
                this.__OpenSource := %this.__Class%._OpenSource(this.ptr + 0)
            return this.__OpenSource
        }
    }
}
