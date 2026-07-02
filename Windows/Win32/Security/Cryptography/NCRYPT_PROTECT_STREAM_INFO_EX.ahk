#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFNCryptStreamOutputCallbackEx.ahk" { PFNCryptStreamOutputCallbackEx }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_PROTECT_STREAM_INFO_EX {
    #StructPack 8

    pfnStreamOutput : PFNCryptStreamOutputCallbackEx

    pvCallbackCtxt : IntPtr

}
