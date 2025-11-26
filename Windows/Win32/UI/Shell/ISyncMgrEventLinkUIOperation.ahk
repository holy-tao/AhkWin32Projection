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
     * Enables Sync Center to provide the event to link to so ISyncMgrUIOperation::Run knows which event to operate upon.
     * @param {Pointer<Guid>} rguidEventID Type: <b>REFGUID</b>
     * 
     * A reference to the event ID that is being stored. This parameter is the same as what is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrevent-geteventid">GetEventID</a> method of the <i>pEvent</i> parameter.
     * @param {ISyncMgrEvent} pEvent Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrevent">ISyncMgrEvent</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrevent">ISyncMgrEvent</a> object for <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgruioperation-run">Run</a> to use. This is the event object that owns the link.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgreventlinkuioperation-init
     */
    Init(rguidEventID, pEvent) {
        result := ComCall(4, this, "ptr", rguidEventID, "ptr", pEvent, "HRESULT")
        return result
    }
}
