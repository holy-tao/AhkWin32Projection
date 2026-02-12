#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve data from an event store. An event store allows Sync Center to get an enumerator of all events in the store, as well as to retrieve individual events.
 * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nn-syncmgr-isyncmgrevent
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
     * Gets the event ID.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * When this method returns, contains a pointer to an event ID.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-geteventid
     */
    GetEventID() {
        pguidEventID := Guid()
        result := ComCall(3, this, "ptr", pguidEventID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pguidEventID
    }

    /**
     * Gets the ID of the handler for which the event was logged.
     * @remarks
     * The handler ID can have a maximum length of MAX_SYNCMGR_ID, including the terminating null character. The event is expected to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a handler ID as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-gethandlerid
     */
    GetHandlerID() {
        result := ComCall(4, this, "ptr*", &ppszHandlerID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszHandlerID
    }

    /**
     * Gets the ID of the item for which the event was logged.
     * @remarks
     * The item ID can have a maximum length of MAX_SYNCMGR_ID, including the terminating null character. The event is expected to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Contains a pointer to an item ID as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-getitemid
     */
    GetItemID() {
        result := ComCall(5, this, "ptr*", &ppszItemID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszItemID
    }

    /**
     * Gets the log level of the event.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_level">SYNCMGR_EVENT_LEVEL</a>*</b>
     * 
     * When this method returns, contains a pointer to a member of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_level">SYNCMGR_EVENT_LEVEL</a> enumeration that indicates the log level.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-getlevel
     */
    GetLevel() {
        result := ComCall(6, this, "int*", &pnLevel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnLevel
    }

    /**
     * Gets event flags.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_flags">SYNCMGR_EVENT_FLAGS</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that indicates the currently set flags, taken from members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_flags">SYNCMGR_EVENT_FLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-getflags
     */
    GetFlags() {
        result := ComCall(7, this, "int*", &pnFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnFlags
    }

    /**
     * Gets the creation time.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * When this method returns, contains a pointer to a creation time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-gettime
     */
    GetTime() {
        pfCreationTime := FILETIME()
        result := ComCall(8, this, "ptr", pfCreationTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfCreationTime
    }

    /**
     * Gets the name of the event. This string can be a simple name for the event or a short summary. It is displayed in the folder and in the property sheet for the event.
     * @remarks
     * The event is expected to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a name as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-getname
     */
    GetName() {
        result := ComCall(9, this, "ptr*", &ppszName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszName
    }

    /**
     * Gets the event description.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated Unicode buffer that contains the description.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-getdescription
     */
    GetDescription() {
        result := ComCall(10, this, "ptr*", &ppszDescription := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszDescription
    }

    /**
     * Gets the text for the hot link for the event.
     * @remarks
     * The event is expected to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to the link text as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-getlinktext
     */
    GetLinkText() {
        result := ComCall(11, this, "ptr*", &ppszLinkText := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszLinkText
    }

    /**
     * Gets the reference for the hot link for the event. The hot link is a displayed property that the user can click to execute an action. This allows the handler to show an available action that the user can see at a glance in the folder.
     * @remarks
     * The link reference is executed when the user clicks on the hot link. When the user clicks the link, Sync Center calls <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">GetObject</a>, requesting the SYNCMGR_OBJECTID_EventLinkClick object for the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgreventlinkuioperation">ISyncMgrEventLinkUIOperation</a> interface. The object is initialized with an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrevent">ISyncMgrEvent</a> interface pointer that can be used by the <i>Run</i> method. If the handler does not support this object ID, Sync Center passes the link reference to <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecutea">ShellExecute</a>.
     *             
     * 
     * The event is expected to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a link reference as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-getlinkreference
     */
    GetLinkReference() {
        result := ComCall(12, this, "ptr*", &ppszLinkReference := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszLinkReference
    }

    /**
     * Gets a context object that can be used by a handler to display properties or execute a context menu action.
     * @remarks
     * The handler is expected to allocate the buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to the context as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrevent-getcontext
     */
    GetContext() {
        result := ComCall(13, this, "ptr*", &ppszContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszContext
    }
}
