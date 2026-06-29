#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_LIMIT_TYPES.ahk" { POWER_LIMIT_TYPES }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct POWER_LIMIT_ATTRIBUTES {
    #StructPack 4


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - SupportTimeParameter
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        SupportTimeParameter {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : POWER_LIMIT_TYPES

    DomainId : UInt32

    MaxValue : UInt32

    MinValue : UInt32

    MinTimeParameter : UInt32

    MaxTimeParameter : UInt32

    DefaultACValue : UInt32

    DefaultDCValue : UInt32

    Flags : POWER_LIMIT_ATTRIBUTES._Flags

}
