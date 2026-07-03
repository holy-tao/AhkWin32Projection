#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCLUSAPI_PFN_REASON_HANDLER.ahk" { PCLUSAPI_PFN_REASON_HANDLER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSAPI_REASON_HANDLER {
    #StructPack 8

    lpParameter : IntPtr

    pfnHandler : PCLUSAPI_PFN_REASON_HANDLER

}
