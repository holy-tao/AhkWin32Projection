#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct BD_PAC_HEADER {
    #StructPack 1

    PACId : Int8[3]

    PACFormatNumber : Int8

    PACUpdateCount : Int8[4]

    UnknownPACRules : Int8[4]

    UnkownPACEntireDiscFlag : Int8

    Reserved1 : Int8[2]

    NumberOfSegments : Int8

    Segments : Int8[256]

    Reserved2 : Int8[112]

}
