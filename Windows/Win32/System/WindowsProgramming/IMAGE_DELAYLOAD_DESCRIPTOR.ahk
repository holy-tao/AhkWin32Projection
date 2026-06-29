#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct IMAGE_DELAYLOAD_DESCRIPTOR {
    #StructPack 4


    struct _Attributes {
        AllAttributes : UInt32


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
        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Attributes : IMAGE_DELAYLOAD_DESCRIPTOR._Attributes

    DllNameRVA : UInt32

    ModuleHandleRVA : UInt32

    ImportAddressTableRVA : UInt32

    ImportNameTableRVA : UInt32

    BoundImportAddressTableRVA : UInt32

    UnloadInformationTableRVA : UInt32

    TimeDateStamp : UInt32

}
