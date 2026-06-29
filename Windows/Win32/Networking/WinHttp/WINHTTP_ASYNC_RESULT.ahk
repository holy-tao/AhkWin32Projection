#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WINHTTP_ASYNC_RESULT structure contains the result of a call to an asynchronous function. This structure is used with the WINHTTP_STATUS_CALLBACK prototype.
 * @remarks
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_async_result
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_ASYNC_RESULT {
    #StructPack 8

    dwResult : IntPtr

    /**
     * Contains the error code if 
     * <b>dwResult</b> indicates that the function failed.
     */
    dwError : UInt32

}
