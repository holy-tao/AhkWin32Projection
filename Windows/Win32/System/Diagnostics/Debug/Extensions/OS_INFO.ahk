#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct OS_INFO {
    #StructPack 4


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

    MajorVer : UInt32

    MinorVer : UInt32

    Build : UInt32

    BuildQfe : UInt32

    ProductType : UInt32

    Suite : UInt32

    Revision : UInt32

    s : OS_INFO._s

    SrvPackNumber : UInt32

    ServicePackBuild : UInt32

    Architecture : UInt32

    Lcid : UInt32

    Name : CHAR[64]

    FullName : CHAR[256]

    Language : CHAR[30]

    BuildVersion : CHAR[64]

    ServicePackString : CHAR[64]

}
