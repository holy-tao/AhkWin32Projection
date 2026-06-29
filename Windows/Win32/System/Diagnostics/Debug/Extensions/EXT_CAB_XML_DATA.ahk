#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_CAB_XML_DATA {
    #StructPack 8


    struct _SUBTAGS {
        SubTag : PWSTR

        MatchPattern : PWSTR

        ReturnText : PWSTR

        ReturnTextSize : UInt32

        /**
         * This bitfield backs the following members:
         * - MatchType
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        MatchType {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
        Reserved2 : UInt32

    }

    SizeOfStruct : UInt32

    XmlObjectTag : PWSTR

    NumSubTags : UInt32

    SubTags : EXT_CAB_XML_DATA._SUBTAGS[1]

}
