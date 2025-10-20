#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a single method through which a handler or external application can notify Sync Center that synchronization has begun, as well as report progress and events.
 * @remarks
 * 
  * This interface is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize">ISyncMgrHandler::Synchronize</a>. The handler can choose to create a session in its <b>Synchronize</b> implementation. This allows the handler to report progress and events itself or to signal a background process to report progress and events itself.
  * 
  *                 
  * 
  * Alternatively, the handler can choose to signal an external process to create a CLSID_SyncMgrClient object. If a handler is implemented to perform automatic synchronizations in an external process such as a service, it must be able to provide progress reports to Sync Center so that Sync Center can update the UI for the user. The handler also must be able to add events to Sync Center's <b>Sync Results</b> folder. An external process creates the CLSID_SyncMgrClient object by passing the CLSCTX_SERVER flag and the <b>ISyncMgrSessionCreator</b> IID to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. This allows that process to report progress and events as well as to ask Sync Center whether the user canceled the synchronization. Note, however, that <b>ISyncMgrSessionCreator</b> cannot be marshaled to an external process.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrsessioncreator
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSessionCreator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrSessionCreator
     * @type {Guid}
     */
    static IID => Guid("{17f48517-f305-4321-a08d-b25a834918fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSession"]

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {Pointer<PWSTR>} ppszItemIDs 
     * @param {Integer} cItems 
     * @param {Pointer<ISyncMgrSyncCallback>} ppCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsessioncreator-createsession
     */
    CreateSession(pszHandlerID, ppszItemIDs, cItems, ppCallback) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(3, this, "ptr", pszHandlerID, "ptr", ppszItemIDs, "uint", cItems, "ptr*", ppCallback, "HRESULT")
        return result
    }
}
