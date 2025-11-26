#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssAsync interface is returned to calling applications by methods that initiate asynchronous operations, which run in the background and typically require a long time to complete.
 * @see https://docs.microsoft.com/windows/win32/api//vss/nn-vss-ivssasync
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssAsync
     * @type {Guid}
     */
    static IID => Guid("{507c37b4-cf5b-4e95-b0af-14eb9767467e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Wait", "QueryStatus"]

    /**
     * The Cancel method cancels an incomplete asynchronous operation.
     * @returns {HRESULT} All calls to 
     * <b>Cancel</b> for all 
     * <a href="/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> objects support the following status codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation had been successfully canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_S_ASYNC_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation had been canceled prior to calling this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_S_ASYNC_FINISHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation had completed prior to calling this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If an operation has completed unsuccessfully before 
     * <b>Cancel</b> was called, then 
     * <b>Cancel</b> returns the error that operation encountered.
     * 
     * To obtain a complete list of return values for a specific <b>IVssAsync::Cancel</b>, see the error codes of the method that returned the 
     * <a href="/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//vss/nf-vss-ivssasync-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The Wait method waits until an incomplete asynchronous operation finishes.
     * @param {Integer} dwMilliseconds Length of time, in milliseconds, that the method will wait for an asynchronous process to return before timing out. 
     * 
     * 
     * 
     * 
     * The default value for this argument is INFINITE.
     * 
     * <b>Windows Server 2003:  </b>This parameter is reserved and must be INFINITE. If any other value is specified for this parameter, the call to <b>Wait</b> fails with E_INVALIDARG.
     * 
     * <b>Windows XP:  </b>This method has no parameters.
     * @returns {HRESULT} All calls to 
     * <b>Wait</b> for all 
     * <a href="/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> objects support the following status codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait operation was successful. Call 
     * <a href="/windows/desktop/api/vss/nf-vss-ivssasync-querystatus">IVssAsync::QueryStatus</a> to determine the final status of the asynchronous operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait operation failed because the user did not have the correct privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If an operation fails while being waited on, 
     * <b>Wait</b> returns the error that operation encountered.
     * 
     * To obtain a complete list of return values for a specific <b>Wait</b>, see the error codes of the method that returned the 
     * <a href="/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//vss/nf-vss-ivssasync-wait
     */
    Wait(dwMilliseconds) {
        result := ComCall(4, this, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * The QueryStatus method queries the status of an asynchronous operation.
     * @param {Pointer<Integer>} pReserved The value of this parameter should be <b>NULL</b>.
     * @returns {HRESULT} The status of the asynchronous operation that returned the current 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> object. 
     *       
     * 
     * All calls to <b>QueryStatus</b> for all 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> objects support the following status codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_S_ASYNC_CANCELLED"></a><a id="vss_s_async_cancelled"></a><dl>
     * <dt><b>VSS_S_ASYNC_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation was canceled by a previous call to 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vss/nf-vss-ivssasync-cancel">IVssAsync::Cancel</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_S_ASYNC_FINISHED"></a><a id="vss_s_async_finished"></a><dl>
     * <dt><b>VSS_S_ASYNC_FINISHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_S_ASYNC_PENDING"></a><a id="vss_s_async_pending"></a><dl>
     * <dt><b>VSS_S_ASYNC_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still running.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Additional return values can be returned, but depend on the return codes of the method that initially 
     *        returned the <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//vss/nf-vss-ivssasync-querystatus
     */
    QueryStatus(pReserved) {
        pReservedMarshal := pReserved is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int*", &pHrResult := 0, pReservedMarshal, pReserved, "HRESULT")
        return pHrResult
    }
}
