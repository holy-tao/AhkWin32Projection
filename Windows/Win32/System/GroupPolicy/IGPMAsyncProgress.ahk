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
     * The Status enumeration indicates the result of a Windows GDI+ method call.
     * @remarks
     * 
     * If you construct a GDI+ object and then immediately call the 
     * 				<b>GetLastStatus</b> method of that object, you can determine whether the constructor succeeded or failed. In such cases, 
     * 				<b>GetLastStatus</b> might return <b><b>OutOfMemory</b></b> even though there was plenty of memory available to create the object. Several GDI+ constructors set the status to <b><b>OutOfMemory</b></b> when they fail regardless of the reason for failure.
     * 
     * @param {Integer} lProgressNumerator 
     * @param {Integer} lProgressDenominator 
     * @param {HRESULT} hrStatus 
     * @param {Pointer<VARIANT>} pResult 
     * @param {IGPMStatusMsgCollection} ppIGPMStatusMsgCollection 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/ne-gdiplustypes-status
     */
    Status(lProgressNumerator, lProgressDenominator, hrStatus, pResult, ppIGPMStatusMsgCollection) {
        result := ComCall(7, this, "int", lProgressNumerator, "int", lProgressDenominator, "int", hrStatus, "ptr", pResult, "ptr", ppIGPMStatusMsgCollection, "HRESULT")
        return result
    }
}
