#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AutoProxyHelperVtbl.ahk" { AutoProxyHelperVtbl }

/**
 * The AutoProxyHelperFunctions structure is used create a v-table of Proxy Auto-Config functions that can be passed to InternetInitializeAutoProxyDll.
 * @remarks
 * Together with the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-autoproxyhelpervtbl">AutoProxyHelperVtbl</a> structure, <b>AutoProxyHelperFunctions</b> serves to create a standard v-table that can be declared and populated using C rather than requiring the use of C++.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-autoproxyhelperfunctions
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct AutoProxyHelperFunctions {
    #StructPack 8

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-autoproxyhelpervtbl">AutoProxyHelperVtbl</a> structure that contains an array of pointers to autoproxy helper functions.
     */
    lpVtbl : AutoProxyHelperVtbl.Ptr

}
