#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_PRERECORDED_INFORMATION {
    #StructPack 1

    FieldID_1 : Int8

    DiscApplicationCode : Int8

    DiscPhysicalCode : Int8

    LastAddressOfDataRecordableArea : Int8[3]

    /**
     * This bitfield backs the following members:
     * - ExtensionCode
     * - PartVers1on
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    ExtensionCode {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    PartVers1on {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    Reserved0 : Int8

    FieldID_2 : Int8

    OpcSuggestedCode : Int8

    WavelengthCode : Int8

    WriteStrategyCode : Int8[4]

    Reserved2 : Int8

    FieldID_3 : Int8

    ManufacturerId_3 : Int8[6]

    Reserved3 : Int8

    FieldID_4 : Int8

    ManufacturerId_4 : Int8[6]

    Reserved4 : Int8

    FieldID_5 : Int8

    ManufacturerId_5 : Int8[6]

    Reserved5 : Int8

    Reserved99 : Int8[24]

}
