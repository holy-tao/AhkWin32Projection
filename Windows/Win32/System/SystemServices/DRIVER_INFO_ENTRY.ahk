#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct DRIVER_INFO_ENTRY {
    #StructPack 4


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - Unloaded
         * - BootDriver
         * - HotPatch
         * - Reserved
         */
        _bitfield : Int16


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
        static __New() {
            DefineProp(this.Prototype, 'AsUInt16', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    InternalName : CHAR[32]

    ImageHashAlgorithm : UInt16

    PublisherThumbprintHashAlgorithm : UInt16

    ImageHashOffset : UInt32

    PublisherThumbprintOffset : UInt32

    LoadCount : UInt16

    OemNameSize : UInt16

    OemNameOffset : UInt32

    Flags : DRIVER_INFO_ENTRY._Flags

    Padding : UInt16

}
