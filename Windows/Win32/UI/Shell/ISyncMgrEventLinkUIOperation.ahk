#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrUIOperation.ahk

/**
 * Provides a method that is called when event links are clicked in the sync results folder.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgruioperation">ISyncMgrUIOperation</a> interface, from which it inherits.
  * 
  * Sync Center calls <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a>, specifying SYNCMGR_OBJECTID_EventLinkClick for the object ID.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgreventlinkuioperation
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrEventLinkUIOperation extends ISyncMgrUIOperation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrEventLinkUIOperation
     * @type {Guid}
     */
    static IID => Guid("{64522e52-848b-4015-89ce-5a36f00b94ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init"]

    /**
     * 
     * @param {Pointer<Guid>} rguidEventID 
     * @param {ISyncMgrEvent} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgreventlinkuioperation-init
     */
    Init(rguidEventID, pEvent) {
        result := ComCall(4, this, "ptr", rguidEventID, "ptr", pEvent, "HRESULT")
        return result
    }
}
