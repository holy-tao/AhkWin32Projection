#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINHTTP_ASYNC_RESULT structure contains the result of a call to an asynchronous function. This structure is used with the WINHTTP_STATUS_CALLBACK prototype.
 * @remarks
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_async_result
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_ASYNC_RESULT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Pointer}
     */
    dwResult {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the error code if 
     * <b>dwResult</b> indicates that the function failed.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
