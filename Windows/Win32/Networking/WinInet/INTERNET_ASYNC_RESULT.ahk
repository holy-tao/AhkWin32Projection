#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the result of a call to an asynchronous function. This structure is used with InternetStatusCallback.
 * @remarks
 * 
 * The value of 
 * <b>dwResult</b> is determined by the value of  
 * <i>dwInternetStatus</i> in  the status callback function.
 * 				
 * 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Value of 
 * <i>dwInternetStatus</i></th>
 * <th>Value of 
 * <b>dwResult</b></th>
 * </tr>
 * <tr>
 * <td>INTERNET_STATUS_HANDLE_CREATED</td>
 * <td>Pointer to the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle</td>
 * </tr>
 * <tr>
 * <td>INTERNET_STATUS_REQUEST_COMPLETE</td>
 * <td>Boolean return code from the asynchronous function.</td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-internet_async_result
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_ASYNC_RESULT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Result. This parameter can be an 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle, unsigned long integer, or Boolean return code from an asynchronous function.
     * @type {Pointer}
     */
    dwResult {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Error code, if 
     * <b>dwResult</b> indicates that the function failed. If the operation succeeded, this member usually contains ERROR_SUCCESS.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
