#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getname
     */
    GetName(ppszName) {
        result := ComCall(3, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncMgrHandlerInfo>} ppHandlerInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-gethandlerinfo
     */
    GetHandlerInfo(ppHandlerInfo) {
        result := ComCall(4, this, "ptr*", ppHandlerInfo, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} rguidObjectID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(rguidObjectID, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", rguidObjectID, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities
     */
    GetCapabilities(pmCapabilities) {
        pmCapabilitiesMarshal := pmCapabilities is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pmCapabilitiesMarshal, pmCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmPolicies 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getpolicies
     */
    GetPolicies(pmPolicies) {
        pmPoliciesMarshal := pmPolicies is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pmPoliciesMarshal, pmPolicies, "HRESULT")
        return result
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

        result := ComCall(10, this, "ptr", ppszItemIDs, "uint", cItems, "ptr", hwndOwner, "ptr", pSessionCreator, "ptr", punk, "HRESULT")
        return result
    }
}
