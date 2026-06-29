#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SNAP_HEADER {
    #StructPack 2

    Dsap : Int8

    Ssap : Int8

    Control : Int8

    Oui : Int8[3]

    Type : UInt16

}
