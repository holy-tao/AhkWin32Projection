#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrUIOperation.ahk

/**
 * Exposes a method that allows a handler to display the sync schedule wizard for the handler.
 * @remarks
 * 
  * The wizard can be invoked by CoCreating CLSID_SyncMgrScheduleWizard, which is typically done when Sync Center calls <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a>, specifying SYNCMGR_OBJECTID_ShowSchedule for the object ID.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrschedulewizarduioperation
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrScheduleWizardUIOperation extends ISyncMgrUIOperation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrScheduleWizardUIOperation
     * @type {Guid}
     */
    static IID => Guid("{459a6c84-21d2-4ddc-8a53-f023a46066f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitWizard"]

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrschedulewizarduioperation-initwizard
     */
    InitWizard(pszHandlerID) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(4, this, "ptr", pszHandlerID, "HRESULT")
        return result
    }
}
