#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_PREFETCH_STATUS {
    #StructPack 4

    dwStatus : UInt32

    dwSize : UInt32

}
