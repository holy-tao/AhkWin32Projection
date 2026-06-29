#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WME_AC_PARAMETERS {
    #StructPack 2

    ucAccessCategoryIndex : Int8

    ucAIFSN : Int8

    ucECWmin : Int8

    ucECWmax : Int8

    usTXOPLimit : UInt16

}
