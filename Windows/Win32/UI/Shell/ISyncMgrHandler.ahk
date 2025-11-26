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
     * Gets the display name of the handler.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a <b>null</b>-terminated buffer that receives the handler name. The name can be of maximum length MAX_SYNCMGR_NAME, including the terminating <b>null</b> character. If the name exceeds that length, it is truncated.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandler-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets properties that describe the handler.
     * @returns {ISyncMgrHandlerInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandlerinfo">ISyncMgrHandlerInfo</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandlerinfo">ISyncMgrHandlerInfo</a> interface that provides access to the handler properties.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandler-gethandlerinfo
     */
    GetHandlerInfo() {
        result := ComCall(4, this, "ptr*", &ppHandlerInfo := 0, "HRESULT")
        return ISyncMgrHandlerInfo(ppHandlerInfo)
    }

    /**
     * Creates a specific type of object related to the handler.
     * @param {Pointer<Guid>} rguidObjectID Type: <b>REFGUID</b>
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the requested interface. This depends on the object type named in <i>rguidObjectID</i>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the requested interface.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandler-getobject
     */
    GetObject(rguidObjectID, riid) {
        result := ComCall(5, this, "ptr", rguidObjectID, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a set of flags describing the handler's defined capabilities.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities">SYNCMGR_HANDLER_CAPABILITIES</a>*</b>
     * 
     * When this method returns, contains a pointer to a bitwise combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities">SYNCMGR_HANDLER_CAPABILITIES</a> enumeration that defines the capabilities of the handler. Compare against <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities">SYNCMGR_HCM_VALID_MASK</a> to verify a valid value.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(6, this, "int*", &pmCapabilities := 0, "HRESULT")
        return pmCapabilities
    }

    /**
     * Gets a set of flags describing the policies set by the handler.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_HANDLER_POLICIES</a>*</b>
     * 
     * When this method returns, contains a pointer to a bitwise combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_HANDLER_POLICIES</a> enumeration that define the handler's policies.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandler-getpolicies
     */
    GetPolicies() {
        result := ComCall(7, this, "int*", &pmPolicies := 0, "HRESULT")
        return pmPolicies
    }

    /**
     * Requests that the handler is activated or deactivated. An active handler can be synchronized; an inactive handler cannot.
     * @param {BOOL} fActivate Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to activate; <b>FALSE</b> to deactivate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandler-activate
     */
    Activate(fActivate) {
        result := ComCall(8, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * Requests that an active handler be enabled or disabled. An enabled handler can be synchronized and a disabled handler cannot.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable; <b>FALSE</b> to disable.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandler-enable
     */
    Enable(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Initiates a synchronization of a selection of the handler's sync items.
     * @param {Pointer<PWSTR>} ppszItemIDs Type: <b>LPCWSTR*</b>
     * 
     * A pointer to an array of item IDs representing the items to be synchronized. Each item ID is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Integer} cItems Type: <b>ULONG</b>
     * 
     * The number of items in <i>ppszItemIDs</i>.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the window that the item uses to display any necessary UI. This value can be <b>NULL</b>.
     * @param {ISyncMgrSessionCreator} pSessionCreator Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsessioncreator">ISyncMgrSessionCreator</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsessioncreator">ISyncMgrSessionCreator</a> interface. This interface enables the handler itself to report progress and events, or to signal a background process to report progress and events.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an interface to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrcontrol">ISyncMgrControl</a>. <b>ISyncMgrHandler::Synchronize</b> is called either when a user requests a synchronization from the Sync Center folder or when one of the <b>ISyncMgrControl</b> synchronize methods is called, such as <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-startsyncall">StartSyncAll</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandler-synchronize
     */
    Synchronize(ppszItemIDs, cItems, hwndOwner, pSessionCreator, punk) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        ppszItemIDsMarshal := ppszItemIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, ppszItemIDsMarshal, ppszItemIDs, "uint", cItems, "ptr", hwndOwner, "ptr", pSessionCreator, "ptr", punk, "HRESULT")
        return result
    }
}
