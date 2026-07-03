#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSAPI_REASON_HANDLER {
    #StructPack 8

    lpParameter : IntPtr

    pfnHandler : IntPtr

}
