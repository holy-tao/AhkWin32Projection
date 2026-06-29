#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct TIMESTAMP_STRUCT {
    #StructPack 4

    year : Int16

    month : UInt16

    day : UInt16

    hour : UInt16

    minute : UInt16

    second : UInt16

    fraction : UInt32

}
