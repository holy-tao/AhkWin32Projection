#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class DRIVER_INFO_ENTRY extends Win32Struct {
    static sizeof => 56

    static packingSize => 4

    class _Flags_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 2

        /**
         * This bitfield backs the following members:
         * - Unloaded
         * - BootDriver
         * - HotPatch
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
        Unloaded {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        BootDriver {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        HotPatch {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        AsUInt16 {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    }

    /**
     * @type {String}
     */
    InternalName {
        get => StrGet(this.ptr + 0, 31, "UTF-8")
        set => StrPut(value, this.ptr + 0, 31, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    ImageHashAlgorithm {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    PublisherThumbprintHashAlgorithm {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * @type {Integer}
     */
    ImageHashOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    PublisherThumbprintOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    LoadCount {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    OemNameSize {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    OemNameOffset {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {_Flags_e__Union}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := DRIVER_INFO_ENTRY._Flags_e__Union(52, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    Padding {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }
}
