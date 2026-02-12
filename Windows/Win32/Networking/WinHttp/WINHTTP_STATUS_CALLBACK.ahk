#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an application-defined status callback function.
 * @remarks
 * The callback function must be threadsafe and reentrant because it can be called on another thread for a separate request, and reentered on the same thread for the current request. It must therefore be coded to handle reentrance safely while processing. When the <i>dwInternetStatus</i> parameter is equal to <b>WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING</b>, the callback does not need to be able to handle reentrance for the same request, because this callback is guaranteed to be the last, and does not occur when other messages for this request are handled.
 * 
 * The status callback function receives updates on the status of asynchronous operations through notification flags.  Notifications that indicate a particular operation is complete are called completion notifications, or just completions.  The following table lists the six completion flags and the corresponding function that is complete when this flag is received.
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Completion flag</th>
 * <th>Function</th>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpquerydataavailable">WinHttpQueryDataAvailable</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_READ_COMPLETE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreaddata">WinHttpReadData</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwritedata">WinHttpWriteData</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_REQUEST_ERROR</td>
 * <td>Any of the above functions when an error occurs.</td>
 * </tr>
 * </table>
 *  
 * 
 * Because callbacks are made during the processing of the request, the application should spend as little time as possible in the callback function to avoid degrading data throughput on the network. For example, displaying a dialog box in a callback function can be such a lengthy operation that the server terminates the request.
 * 
 * The callback function can be called in a thread context different from the thread that initiated the request.
 * 
 * Similarly, there is no callback thread affinity when you call WinHttp asynchronously: a call might start from one thread, but any other thread can receive the callback.
 * 
 * 
 * <div class="alert"><b>Note</b>  For more information about implementation in Windows XP and Windows 2000, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/winhttp/nc-winhttp-winhttp_status_callback
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_STATUS_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} hInternet 
     * @param {Pointer} dwContext 
     * @param {Integer} dwInternetStatus 
     * @param {Pointer<Void>} lpvStatusInformation 
     * @param {Integer} dwStatusInformationLength 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hInternet, dwContext, dwInternetStatus, lpvStatusInformation, dwStatusInformationLength) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpvStatusInformationMarshal := lpvStatusInformation is VarRef ? "ptr" : "ptr"

        ComCall(3, this, hInternetMarshal, hInternet, "ptr", dwContext, "uint", dwInternetStatus, lpvStatusInformationMarshal, lpvStatusInformation, "uint", dwStatusInformationLength)
    }
}
