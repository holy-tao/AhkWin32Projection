#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_DEVICE_TYPE {
    #StructPack 2

    CategoryID : UInt16

    SubCategoryID : UInt16

    OUI : Int8[4]

}
