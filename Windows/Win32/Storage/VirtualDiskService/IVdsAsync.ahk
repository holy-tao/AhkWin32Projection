#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages asynchronous operations. Methods that initiate asynchronous operations return a pointer to an IVdsAsync interface, allowing the caller to optionally cancel, wait for, or query the status of the asynchronous operation.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsasync
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsAsync
     * @type {Guid}
     */
    static IID => Guid("{d5d23b6d-5a55-4492-9889-397a3c2d2dbc}")

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
     * Cancels the asynchronous operation.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not supported. Neither the basic provider nor the current dynamic provider support this 
     *         method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OPERATION_CANCELED</b></dt>
     * <dt>0x8004240DL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation has already been canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_CANCEL_TOO_LATE</b></dt>
     * <dt>0x8004240CL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation has progressed too far to cancel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INCOMPATIBLE_FILE_SYSTEM</b></dt>
     * <dt>0x80042425L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file system is incompatible with the specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INCOMPATIBLE_MEDIA</b></dt>
     * <dt>0x80042426L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media is incompatible with this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ACCESS_DENIED</b></dt>
     * <dt>0x80042427L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. An application using VDS must run under the Backup Operator or Administrators group 
     *         account.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsasync-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Returns when the asynchronous operation has either finished successfully or failed.
     * @param {Pointer<HRESULT>} pHrResult The address of an <b>HRESULT</b> passed in by the caller.
     * @param {Pointer<VDS_ASYNC_OUTPUT>} pAsyncOut The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure 
     *       passed in by the caller.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used.
     * 
     * There are two <b>HRESULT</b> return values to examine. The one returned by the method 
     *        reports failures from the call. The <b>HRESULT</b> returned through 
     *        <i>pHrResult</i> is used to report failures with the asynchronous operation associated with 
     *        the <a href="/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> object. Both values must be examined.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsasync-wait
     */
    Wait(pHrResult, pAsyncOut) {
        pHrResultMarshal := pHrResult is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pHrResultMarshal, pHrResult, "ptr", pAsyncOut, "HRESULT")
        return result
    }

    /**
     * Returns when the asynchronous operation is in progress, or has either finished successfully or failed.
     * @param {Pointer<HRESULT>} pHrResult The address of an <b>HRESULT</b> for the asynchronous operation passed in by the 
     *       caller. If the operation is in progress, the value is <b>VDS_E_OPERATION_PENDING</b>. If the 
     *       operation has finished, the value is the returned <b>HRESULT</b> of the operation.
     * @param {Pointer<Integer>} pulPercentCompleted The address of a <b>ULONG</b> passed in by the caller, representing the status of the 
     *       asynchronous operation, given as a percentage. If the operation is in progress, the value is between 0 and 99. 
     *       If the operation has finished, the value is 100. If the progress of the operation cannot be estimated, the value 
     *       is 0.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is in progress or has completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OPERATION_PENDING</b></dt>
     * <dt>0x80042409L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsasync-querystatus
     */
    QueryStatus(pHrResult, pulPercentCompleted) {
        pHrResultMarshal := pHrResult is VarRef ? "int*" : "ptr"
        pulPercentCompletedMarshal := pulPercentCompleted is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pHrResultMarshal, pHrResult, pulPercentCompletedMarshal, pulPercentCompleted, "HRESULT")
        return result
    }
}
