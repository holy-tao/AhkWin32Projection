#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct SCARD_T0_COMMAND {
    #StructPack 1

    bCla : Int8

    bIns : Int8

    bP1 : Int8

    bP2 : Int8

    bP3 : Int8

}
