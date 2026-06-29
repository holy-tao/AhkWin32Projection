#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASCTRYINFO {
    #StructPack 4

    dwSize : UInt32

    dwCountryID : UInt32

    dwNextCountryID : UInt32

    dwCountryCode : UInt32

    dwCountryNameOffset : UInt32

}
