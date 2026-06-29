#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_ASYNC_OUTPUT.ahk" { VDS_ASYNC_OUTPUT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsAsync (vdshwprv.h) interface manages asynchronous operations. Methods that initiate asynchronous operations return a pointer to an IVdsAsync interface.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsasync
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsAsync extends IUnknown {
    /**
     * The interface identifier for IVdsAsync
     * @type {Guid}
     */
    static IID := Guid("{d5d23b6d-5a55-4492-9889-397a3c2d2dbc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsAsync interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Cancel      : IntPtr
        Wait        : IntPtr
        QueryStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsAsync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsAsync::Cancel method (vdshwprv.h) cancels the asynchronous operation.
     * @remarks
     * Dynamic providers do not implement this method. The basic provider checks for this method only when cleaning 
     *     a disk and does not implement it for any other operation.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsasync-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The IVdsAsync::Wait method (vdshwprv.h) returns when the asynchronous operation has either finished successfully or failed.
     * @remarks
     * This method adds a reference to the contained object produced by the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-createvolume">IVdsPack::CreateVolume</a>, 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-breakplex">IVdsVolume::BreakPlex</a>, 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun">IVdsSubSystem::CreateLun</a>, and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-createpartition">IVdsAdvancedDisk::CreatePartition</a>, and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdscreatepartitionex-createpartitionex">IVdsCreatePartitionEx::CreatePartitionEx</a> 
     *     methods. Callers must release the reference to the contained object.
     * @param {Pointer<HRESULT>} pHrResult The address of an <b>HRESULT</b> passed in by the caller.
     * @param {Pointer<VDS_ASYNC_OUTPUT>} pAsyncOut The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure 
     *       passed in by the caller.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used.
     * 
     * There are two <b>HRESULT</b> return values to examine. The one returned by the method 
     *        reports failures from the call. The <b>HRESULT</b> returned through 
     *        <i>pHrResult</i> is used to report failures with the asynchronous operation associated with 
     *        the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> object. Both values must be examined.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsasync-wait
     */
    Wait(pHrResult, pAsyncOut) {
        pHrResultMarshal := pHrResult is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pHrResultMarshal, pHrResult, VDS_ASYNC_OUTPUT.Ptr, pAsyncOut, "HRESULT")
        return result
    }

    /**
     * The IVdsAsync::QueryStatus method (vdshwprv.h) returns when the asynchronous operation is in progress, has finished successfully, or has failed.
     * @remarks
     * The <b>QueryStatus</b> method does not wait for 
     *     the operation to complete before returning.
     * @param {Pointer<HRESULT>} pHrResult The address of an <b>HRESULT</b> for the asynchronous operation passed in by the 
     *       caller. If the operation is in progress, the value is <b>VDS_E_OPERATION_PENDING</b>. If the 
     *       operation has finished, the value is the returned <b>HRESULT</b> of the operation.
     * @param {Pointer<Integer>} pulPercentCompleted The address of a <b>ULONG</b> passed in by the caller, representing the status of the 
     *       asynchronous operation, given as a percentage. If the operation is in progress, the value is between 0 and 99. 
     *       If the operation has finished, the value is 100. If the progress of the operation cannot be estimated, the value 
     *       is 0.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsasync-querystatus
     */
    QueryStatus(pHrResult, pulPercentCompleted) {
        pHrResultMarshal := pHrResult is VarRef ? "int*" : "ptr"
        pulPercentCompletedMarshal := pulPercentCompleted is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pHrResultMarshal, pHrResult, pulPercentCompletedMarshal, pulPercentCompleted, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsAsync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.Wait := CallbackCreate(GetMethod(implObj, "Wait"), flags, 3)
        this.vtbl.QueryStatus := CallbackCreate(GetMethod(implObj, "QueryStatus"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.Wait)
        CallbackFree(this.vtbl.QueryStatus)
    }
}
