#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve data from an event store. An event store allows Sync Center to get an enumerator of all events in the store, as well as to retrieve individual events.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrevent
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrEvent
     * @type {Guid}
     */
    static IID => Guid("{fee0ef8b-46bd-4db4-b7e6-ff2c687313bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventID", "GetHandlerID", "GetItemID", "GetLevel", "GetFlags", "GetTime", "GetName", "GetDescription", "GetLinkText", "GetLinkReference", "GetContext"]

    /**
     * 
     * @param {Pointer<Guid>} pguidEventID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-geteventid
     */
    GetEventID(pguidEventID) {
        result := ComCall(3, this, "ptr", pguidEventID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszHandlerID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-gethandlerid
     */
    GetHandlerID(ppszHandlerID) {
        result := ComCall(4, this, "ptr", ppszHandlerID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszItemID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getitemid
     */
    GetItemID(ppszItemID) {
        result := ComCall(5, this, "ptr", ppszItemID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getlevel
     */
    GetLevel(pnLevel) {
        result := ComCall(6, this, "int*", pnLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getflags
     */
    GetFlags(pnFlags) {
        result := ComCall(7, this, "int*", pnFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pfCreationTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-gettime
     */
    GetTime(pfCreationTime) {
        result := ComCall(8, this, "ptr", pfCreationTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getname
     */
    GetName(ppszName) {
        result := ComCall(9, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getdescription
     */
    GetDescription(ppszDescription) {
        result := ComCall(10, this, "ptr", ppszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszLinkText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getlinktext
     */
    GetLinkText(ppszLinkText) {
        result := ComCall(11, this, "ptr", ppszLinkText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszLinkReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getlinkreference
     */
    GetLinkReference(ppszLinkReference) {
        result := ComCall(12, this, "ptr", ppszLinkReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getcontext
     */
    GetContext(ppszContext) {
        result := ComCall(13, this, "ptr", ppszContext, "HRESULT")
        return result
    }
}
