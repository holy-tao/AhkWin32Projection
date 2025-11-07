#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
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
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-geteventid
     */
    GetEventID() {
        pguidEventID := Guid()
        result := ComCall(3, this, "ptr", pguidEventID, "HRESULT")
        return pguidEventID
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-gethandlerid
     */
    GetHandlerID() {
        result := ComCall(4, this, "ptr*", &ppszHandlerID := 0, "HRESULT")
        return ppszHandlerID
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getitemid
     */
    GetItemID() {
        result := ComCall(5, this, "ptr*", &ppszItemID := 0, "HRESULT")
        return ppszItemID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getlevel
     */
    GetLevel() {
        result := ComCall(6, this, "int*", &pnLevel := 0, "HRESULT")
        return pnLevel
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getflags
     */
    GetFlags() {
        result := ComCall(7, this, "int*", &pnFlags := 0, "HRESULT")
        return pnFlags
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-gettime
     */
    GetTime() {
        pfCreationTime := FILETIME()
        result := ComCall(8, this, "ptr", pfCreationTime, "HRESULT")
        return pfCreationTime
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getname
     */
    GetName() {
        result := ComCall(9, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getdescription
     */
    GetDescription() {
        result := ComCall(10, this, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getlinktext
     */
    GetLinkText() {
        result := ComCall(11, this, "ptr*", &ppszLinkText := 0, "HRESULT")
        return ppszLinkText
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getlinkreference
     */
    GetLinkReference() {
        result := ComCall(12, this, "ptr*", &ppszLinkReference := 0, "HRESULT")
        return ppszLinkReference
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getcontext
     */
    GetContext() {
        result := ComCall(13, this, "ptr*", &ppszContext := 0, "HRESULT")
        return ppszContext
    }
}
