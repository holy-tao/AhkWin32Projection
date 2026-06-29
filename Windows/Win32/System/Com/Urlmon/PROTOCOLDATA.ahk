#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct PROTOCOLDATA {
    #StructPack 8

    grfFlags : UInt32

    dwState : UInt32

    pData : IntPtr

    cbData : UInt32

}
