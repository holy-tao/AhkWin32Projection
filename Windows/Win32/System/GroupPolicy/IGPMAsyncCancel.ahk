#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * A pointer to the IGPMAsyncCancel interface is returned to the client by the Group Policy Management Console (GPMC) method that the client calls asynchronously.
 * @remarks
 * 
  * GPMC operations such as backup, restore, import, copy, and report generation can execute asynchronously. For more information about how to use this interface with asynchronous operations, see the "Remarks" section of 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress Interface</a>. The server calls 
  * the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmasyncprogress-status">IGPMAsyncProgress::Status</a> method to notify the client about the progress of the operation. The 
  * <b>Status</b> method also returns an interface pointer to the resultant object, for example, to a <b>GPMGPO</b> or to a <b>GPMBackup</b> object. The caller can then cancel the operation by calling the 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmasynccancel-cancel">IGPMAsyncCancel::Cancel</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmasynccancel
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMAsyncCancel extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMAsyncCancel
     * @type {Guid}
     */
    static IID => Guid("{ddc67754-be67-4541-8166-f48166868c9c}")

    /**
     * The class identifier for GPMAsyncCancel
     * @type {Guid}
     */
    static CLSID => Guid("{372796a9-76ec-479d-ad6c-556318ed5f9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmasynccancel-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
