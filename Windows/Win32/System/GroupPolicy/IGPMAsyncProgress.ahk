#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMStatusMsgCollection.ahk" { IGPMStatusMsgCollection }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGPMAsyncProgress interface can be implemented by the client and passed as an input parameter to the Group Policy Management Console (GPMC) methods that can execute asynchronously.
 * @remarks
 * Complex GPMC operations, such as backup, restore, import, and copy operations, can execute asynchronously. To 
 *     use this interface with asynchronous operations, follow these steps.
 * 
 * <p class="proch"><b>To use this interface with asynchronous operations</b>
 * 
 * <ol>
 * <li>Implement the <b>IGPMAsyncProgress</b> interface.</li>
 * <li>Pass the <b>IGPMAsyncProgress</b> interface pointer to the GPMC method. For example, 
 *       pass the interface pointer to the 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmdomain-restoregpo">RestoreGPO</a> method or to the 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmgpo-import">Import</a> method.</li>
 * </ol>
 * The server will call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmasyncprogress-status">Status</a> method to 
 *     notify the client about the progress of the operation. This method also returns an 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface pointer so that the caller can cancel the 
 *     operation by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmasynccancel-cancel">Cancel</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmasyncprogress
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMAsyncProgress extends IDispatch {
    /**
     * The interface identifier for IGPMAsyncProgress
     * @type {Guid}
     */
    static IID := Guid("{6aac29f8-5948-4324-bf70-423818942dbc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMAsyncProgress interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Status : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMAsyncProgress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The server calls this method to notify the client about the status of a Group Policy Management Console (GPMC) operation.
     * @remarks
     * This method must be implemented by the client.
     * @param {Integer} lProgressNumerator Numerator of a fraction that represents the percent of the GPMC operation that is complete.
     * @param {Integer} lProgressDenominator Denominator of a fraction that represents the percent of the GPMC operation that is complete. The value of this parameter is proportional to the number of extensions in the Group Policy object (GPO), whether the GPO is a "live" GPO or a backed-up GPO. This value can be used to display the progress bar to the user.
     * 
     * In the GPMC user interface, the progress bar is divided into <i>lProgressDenominator</i> intervals. When <i>lProgressNumerator</i>==<i>lProgressDenominator</i> the operation is complete.
     * @param {HRESULT} hrStatus Status of the operation. If no error occurred, the value of the parameter is <b>S_OK</b>.
     * @param {Pointer<VARIANT>} pResult Result of the operation. 
     * This parameter is an interface pointer to the object that resulted from the GPMC operation. For example, it may be a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">GPMGPO</a> object or to  a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">GPMBackup</a> object. This object is only returned when the operation is complete.
     * @param {IGPMStatusMsgCollection} ppIGPMStatusMsgCollection A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface that contains detailed status information about the operation. In cases where there are no errors, or if there are no detailed messages, Status passes in a null collection.
     * @returns {HRESULT} This method has no return values.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmasyncprogress-status
     */
    Status(lProgressNumerator, lProgressDenominator, hrStatus, pResult, ppIGPMStatusMsgCollection) {
        result := ComCall(7, this, "int", lProgressNumerator, "int", lProgressDenominator, "int", hrStatus, VARIANT.Ptr, pResult, "ptr", ppIGPMStatusMsgCollection, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMAsyncProgress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Status := CallbackCreate(GetMethod(implObj, "Status"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Status)
    }
}
