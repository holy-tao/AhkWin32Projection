#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrHandlerInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that make up the primary interface implemented by a sync handler.
 * @remarks
 * 
  * <b>ISyncMgrHandler</b> replaces <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronize">ISyncMgrSynchronize</a>. Some of the earlier functionality has been streamlined, while some has been moved to other interfaces. See the individual method pages for specific information.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrHandler
     * @type {Guid}
     */
    static IID => Guid("{04ec2e43-ac77-49f9-9b98-0307ef7a72a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetHandlerInfo", "GetObject", "GetCapabilities", "GetPolicies", "Activate", "Enable", "Synchronize"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @returns {ISyncMgrHandlerInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-gethandlerinfo
     */
    GetHandlerInfo() {
        result := ComCall(4, this, "ptr*", &ppHandlerInfo := 0, "HRESULT")
        return ISyncMgrHandlerInfo(ppHandlerInfo)
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} rguidObjectID 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(rguidObjectID, riid) {
        result := ComCall(5, this, "ptr", rguidObjectID, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(6, this, "int*", &pmCapabilities := 0, "HRESULT")
        return pmCapabilities
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getpolicies
     */
    GetPolicies() {
        result := ComCall(7, this, "int*", &pmPolicies := 0, "HRESULT")
        return pmPolicies
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-activate
     */
    Activate(fActivate) {
        result := ComCall(8, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-enable
     */
    Enable(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszItemIDs 
     * @param {Integer} cItems 
     * @param {HWND} hwndOwner 
     * @param {ISyncMgrSessionCreator} pSessionCreator 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize
     */
    Synchronize(ppszItemIDs, cItems, hwndOwner, pSessionCreator, punk) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        ppszItemIDsMarshal := ppszItemIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, ppszItemIDsMarshal, ppszItemIDs, "uint", cItems, "ptr", hwndOwner, "ptr", pSessionCreator, "ptr", punk, "HRESULT")
        return result
    }
}
