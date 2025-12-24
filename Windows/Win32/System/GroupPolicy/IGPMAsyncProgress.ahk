#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMAsyncProgress interface can be implemented by the client and passed as an input parameter to the Group Policy Management Console (GPMC) methods that can execute asynchronously.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmasyncprogress
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMAsyncProgress extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMAsyncProgress
     * @type {Guid}
     */
    static IID => Guid("{6aac29f8-5948-4324-bf70-423818942dbc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Status"]

    /**
     * The server calls this method to notify the client about the status of a Group Policy Management Console (GPMC) operation.
     * @param {Integer} lProgressNumerator Numerator of a fraction that represents the percent of the GPMC operation that is complete.
     * @param {Integer} lProgressDenominator Denominator of a fraction that represents the percent of the GPMC operation that is complete. The value of this parameter is proportional to the number of extensions in the Group Policy object (GPO), whether the GPO is a "live" GPO or a backed-up GPO. This value can be used to display the progress bar to the user.
     * 
     * In the GPMC user interface, the progress bar is divided into <i>lProgressDenominator</i> intervals. When <i>lProgressNumerator</i>==<i>lProgressDenominator</i> the operation is complete.
     * @param {HRESULT} hrStatus Status of the operation. If no error occurred, the value of the parameter is <b>S_OK</b>.
     * @param {Pointer<VARIANT>} pResult Result of the operation. 
     * This parameter is an interface pointer to the object that resulted from the GPMC operation. For example, it may be a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">GPMGPO</a> object or to  a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">GPMBackup</a> object. This object is only returned when the operation is complete.
     * @param {IGPMStatusMsgCollection} ppIGPMStatusMsgCollection A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface that contains detailed status information about the operation. In cases where there are no errors, or if there are no detailed messages, Status passes in a null collection.
     * @returns {HRESULT} This method has no return values.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmasyncprogress-status
     */
    Status(lProgressNumerator, lProgressDenominator, hrStatus, pResult, ppIGPMStatusMsgCollection) {
        result := ComCall(7, this, "int", lProgressNumerator, "int", lProgressDenominator, "int", hrStatus, "ptr", pResult, "ptr", ppIGPMStatusMsgCollection, "HRESULT")
        return result
    }
}
