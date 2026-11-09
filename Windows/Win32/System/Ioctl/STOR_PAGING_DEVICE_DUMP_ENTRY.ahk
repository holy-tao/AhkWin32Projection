#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STOR_PAGING_DEVICE_DUMP_ENTRY extends Win32Struct {
    static sizeof => 122

    static packingSize => 2

    class _Flags extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - IsBootDevice
         * - IsNativeNVMe
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
        IsBootDevice {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        IsNativeNVMe {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        AsUchar {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    }

    /**
     * @type {String}
     */
    MiniportName {
        get => StrGet(this.ptr + 0, 32, "UTF-8")
        set => StrPut(value, this.ptr + 0, 32, "UTF-8")
    }

    /**
     * @type {String}
     */
    ModelName {
        get => StrGet(this.ptr + 34, 64, "UTF-8")
        set => StrPut(value, this.ptr + 34, 64, "UTF-8")
    }

    /**
     * @type {String}
     */
    FirmwareRevision {
        get => StrGet(this.ptr + 100, 16, "UTF-8")
        set => StrPut(value, this.ptr + 100, 16, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    PagingPathCount {
        get => NumGet(this, 118, "ushort")
        set => NumPut("ushort", value, this, 118)
    }

    /**
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := STOR_PAGING_DEVICE_DUMP_ENTRY._Flags(120, this)
            return this.__Flags
        }
    }
}
