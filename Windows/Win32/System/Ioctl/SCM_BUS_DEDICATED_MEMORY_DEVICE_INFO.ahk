#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO {
    #StructPack 8


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - ForcedByRegistry
         * - Initialized
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        ForcedByRegistry {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Initialized {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    DeviceGuid : Guid

    DeviceNumber : UInt32

    Flags : SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO._Flags

    DeviceSize : Int64

}
