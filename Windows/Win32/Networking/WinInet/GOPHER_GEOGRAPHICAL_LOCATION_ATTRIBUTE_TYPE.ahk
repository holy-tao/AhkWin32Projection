#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE {
    #StructPack 4

    DegreesNorth : Int32

    MinutesNorth : Int32

    SecondsNorth : Int32

    DegreesEast : Int32

    MinutesEast : Int32

    SecondsEast : Int32

}
