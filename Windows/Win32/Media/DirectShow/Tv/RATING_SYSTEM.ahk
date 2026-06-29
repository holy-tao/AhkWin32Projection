#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\RATING_ATTRIBUTE.ahk" { RATING_ATTRIBUTE }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct RATING_SYSTEM {
    #StructPack 8

    rating_system_id : Guid

    /**
     * This bitfield backs the following members:
     * - rating_system_is_age_type
     * - reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    rating_system_is_age_type {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }
    country_code : Int8[3]

    rating_attribute_count : UInt32

    lpratingattrib : RATING_ATTRIBUTE.Ptr

}
