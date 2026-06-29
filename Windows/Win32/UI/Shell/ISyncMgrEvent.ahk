#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SYNCMGR_EVENT_FLAGS.ahk" { SYNCMGR_EVENT_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\SYNCMGR_EVENT_LEVEL.ahk" { SYNCMGR_EVENT_LEVEL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that retrieve data from an event store. An event store allows Sync Center to get an enumerator of all events in the store, as well as to retrieve individual events.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrevent
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrEvent extends IUnknown {
    /**
     * The interface identifier for ISyncMgrEvent
     * @type {Guid}
     */
    static IID := Guid("{fee0ef8b-46bd-4db4-b7e6-ff2c687313bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEventID       : IntPtr
        GetHandlerID     : IntPtr
        GetItemID        : IntPtr
        GetLevel         : IntPtr
        GetFlags         : IntPtr
        GetTime          : IntPtr
        GetName          : IntPtr
        GetDescription   : IntPtr
        GetLinkText      : IntPtr
        GetLinkReference : IntPtr
        GetContext       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the event ID.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * When this method returns, contains a pointer to an event ID.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-geteventid
     */
    GetEventID() {
        pguidEventID := Guid()
        result := ComCall(3, this, Guid.Ptr, pguidEventID, "HRESULT")
        return pguidEventID
    }

    /**
     * Gets the ID of the handler for which the event was logged.
     * @remarks
     * The handler ID can have a maximum length of MAX_SYNCMGR_ID, including the terminating null character. The event is expected to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a handler ID as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-gethandlerid
     */
    GetHandlerID() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszHandlerID := 0, "HRESULT")
        return ppszHandlerID
    }

    /**
     * Gets the ID of the item for which the event was logged.
     * @remarks
     * The item ID can have a maximum length of MAX_SYNCMGR_ID, including the terminating null character. The event is expected to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Contains a pointer to an item ID as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getitemid
     */
    GetItemID() {
        result := ComCall(5, this, PWSTR.Ptr, &ppszItemID := 0, "HRESULT")
        return ppszItemID
    }

    /**
     * Gets the log level of the event.
     * @returns {SYNCMGR_EVENT_LEVEL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_level">SYNCMGR_EVENT_LEVEL</a>*</b>
     * 
     * When this method returns, contains a pointer to a member of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_level">SYNCMGR_EVENT_LEVEL</a> enumeration that indicates the log level.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getlevel
     */
    GetLevel() {
        result := ComCall(6, this, "int*", &pnLevel := 0, "HRESULT")
        return pnLevel
    }

    /**
     * Gets event flags.
     * @returns {SYNCMGR_EVENT_FLAGS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_flags">SYNCMGR_EVENT_FLAGS</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that indicates the currently set flags, taken from members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_flags">SYNCMGR_EVENT_FLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getflags
     */
    GetFlags() {
        result := ComCall(7, this, "int*", &pnFlags := 0, "HRESULT")
        return pnFlags
    }

    /**
     * Gets the creation time.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * When this method returns, contains a pointer to a creation time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-gettime
     */
    GetTime() {
        pfCreationTime := FILETIME()
        result := ComCall(8, this, FILETIME.Ptr, pfCreationTime, "HRESULT")
        return pfCreationTime
    }

    /**
     * Gets the name of the event. This string can be a simple name for the event or a short summary. It is displayed in the folder and in the property sheet for the event.
     * @remarks
     * The event is expected to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a name as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getname
     */
    GetName() {
        result := ComCall(9, this, PWSTR.Ptr, &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets the event description.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated Unicode buffer that contains the description.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getdescription
     */
    GetDescription() {
        result := ComCall(10, this, PWSTR.Ptr, &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * Gets the text for the hot link for the event.
     * @remarks
     * The event is expected to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to the link text as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getlinktext
     */
    GetLinkText() {
        result := ComCall(11, this, PWSTR.Ptr, &ppszLinkText := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getlinkreference
     */
    GetLinkReference() {
        result := ComCall(12, this, PWSTR.Ptr, &ppszLinkReference := 0, "HRESULT")
        return ppszLinkReference
    }

    /**
     * Gets a context object that can be used by a handler to display properties or execute a context menu action.
     * @remarks
     * The handler is expected to allocate the buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, which Sync Center uses to deallocate the string buffer.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to the context as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrevent-getcontext
     */
    GetContext() {
        result := ComCall(13, this, PWSTR.Ptr, &ppszContext := 0, "HRESULT")
        return ppszContext
    }

    Query(iid) {
        if (ISyncMgrEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventID := CallbackCreate(GetMethod(implObj, "GetEventID"), flags, 2)
        this.vtbl.GetHandlerID := CallbackCreate(GetMethod(implObj, "GetHandlerID"), flags, 2)
        this.vtbl.GetItemID := CallbackCreate(GetMethod(implObj, "GetItemID"), flags, 2)
        this.vtbl.GetLevel := CallbackCreate(GetMethod(implObj, "GetLevel"), flags, 2)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
        this.vtbl.GetTime := CallbackCreate(GetMethod(implObj, "GetTime"), flags, 2)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.GetLinkText := CallbackCreate(GetMethod(implObj, "GetLinkText"), flags, 2)
        this.vtbl.GetLinkReference := CallbackCreate(GetMethod(implObj, "GetLinkReference"), flags, 2)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventID)
        CallbackFree(this.vtbl.GetHandlerID)
        CallbackFree(this.vtbl.GetItemID)
        CallbackFree(this.vtbl.GetLevel)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.GetTime)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.GetLinkText)
        CallbackFree(this.vtbl.GetLinkReference)
        CallbackFree(this.vtbl.GetContext)
    }
}
