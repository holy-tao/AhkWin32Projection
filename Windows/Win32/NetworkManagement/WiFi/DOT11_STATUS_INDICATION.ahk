#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_STATUS_INDICATION {
    #StructPack 4

    uStatusType : UInt32

    ndisStatus : Int32

}
