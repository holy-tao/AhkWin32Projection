#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OS_TYPE.ahk" { OS_TYPE }
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct OS_INFO_v1 {
    #StructPack 8


    struct _Version {
        Major : UInt32

        Minor : UInt32

    }

    struct _s {
        /**
         * This bitfield backs the following members:
         * - Checked
         * - Pae
         * - MultiProc
         * - Reserved
         */
        _bitfield : Int32


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
    }

    Type : OS_TYPE

    Version : OS_INFO_v1._Version

    ProductType : UInt32

    Suite : UInt32

    s : OS_INFO_v1._s

    SrvPackNumber : UInt32

    Language : CHAR[30]

    OsString : CHAR[64]

    ServicePackString : CHAR[64]

    static __New() {
        DefineProp(this.Prototype, 'Ver64', { type: Int64, offset: 8 })
        this.DeleteProp("__New")
    }
}
