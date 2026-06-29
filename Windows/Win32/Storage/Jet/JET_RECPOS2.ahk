#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @architecture X64, Arm64
 */
export default struct JET_RECPOS2 {
    #StructPack 8

    cbStruct : UInt32

    centriesLTDeprecated : UInt32

    centriesInRangeDeprecated : UInt32

    centriesTotalDeprecated : UInt32

    centriesLT : Int64

    centriesTotal : Int64

}
