#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_END_BROWSER_SESSION_DATA {
    #StructPack 8

    lpBuffer : IntPtr

    dwBufferLength : UInt32

}
