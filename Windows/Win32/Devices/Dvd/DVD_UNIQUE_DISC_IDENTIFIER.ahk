#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_UNIQUE_DISC_IDENTIFIER {
    #StructPack 1

    Reserved0 : Int8[2]

    RandomNumber : Int8[2]

    Year : Int8[4]

    Month : Int8[2]

    Day : Int8[2]

    Hour : Int8[2]

    Minute : Int8[2]

    Second : Int8[2]

}
