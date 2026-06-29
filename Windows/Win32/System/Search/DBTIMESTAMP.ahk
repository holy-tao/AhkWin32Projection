#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBTIMESTAMP {
    #StructPack 4

    year : Int16

    month : UInt16

    day : UInt16

    hour : UInt16

    minute : UInt16

    second : UInt16

    fraction : UInt32

}
