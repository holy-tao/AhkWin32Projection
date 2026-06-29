#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASCOMMSETTINGS {
    #StructPack 4

    dwSize : UInt32

    bParity : Int8

    bStop : Int8

    bByteSize : Int8

    bAlign : Int8

}
