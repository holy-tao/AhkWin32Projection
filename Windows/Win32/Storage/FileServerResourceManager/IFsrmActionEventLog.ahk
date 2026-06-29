#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmAction.ahk" { IFsrmAction }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmEventType.ahk" { FsrmEventType }

/**
 * Used to log an event to the Windows Application event log in response to a quota, file screen, or file management job event.
 * @remarks
 * For most events, the event identifier is 12325. However, for events that a file management job logs, the event 
 *     identifier is 8244.
 * 
 * You must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioneventlog-get_messagetext">MessageText</a> 
 *     property; the other property is optional.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmactioneventlog
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmActionEventLog extends IFsrmAction {
    /**
     * The interface identifier for IFsrmActionEventLog
     * @type {Guid}
     */
    static IID := Guid("{4c8f96c3-5d94-4f37-a4f4-f56ab463546f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmActionEventLog interfaces
    */
    struct Vtbl extends IFsrmAction.Vtbl {
        get_EventType   : IntPtr
        put_EventType   : IntPtr
        get_MessageText : IntPtr
        put_MessageText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmActionEventLog.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {FsrmEventType} 
     */
    EventType {
        get => this.get_EventType()
        set => this.put_EventType(value)
    }

    /**
     * @type {BSTR} 
     */
    MessageText {
        get => this.get_MessageText()
        set => this.put_MessageText(value)
    }

    /**
     * Retrieves or sets the type of event that the action logs when it runs. (Get)
     * @returns {FsrmEventType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioneventlog-get_eventtype
     */
    get_EventType() {
        result := ComCall(12, this, "int*", &eventType := 0, "HRESULT")
        return eventType
    }

    /**
     * Retrieves or sets the type of event that the action logs when it runs. (Put)
     * @param {FsrmEventType} eventType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioneventlog-put_eventtype
     */
    put_EventType(eventType) {
        result := ComCall(13, this, FsrmEventType, eventType, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the event text that is logged when the action runs. (IFsrmActionEventLog.get_MessageText)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioneventlog-get_messagetext
     */
    get_MessageText() {
        messageText := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, messageText, "HRESULT")
        return messageText
    }

    /**
     * Retrieves or sets the event text that is logged when the action runs. (IFsrmActionEventLog.put_MessageText)
     * @param {BSTR} messageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioneventlog-put_messagetext
     */
    put_MessageText(messageText) {
        messageText := messageText is String ? BSTR.Alloc(messageText).Value : messageText

        result := ComCall(15, this, BSTR, messageText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmActionEventLog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EventType := CallbackCreate(GetMethod(implObj, "get_EventType"), flags, 2)
        this.vtbl.put_EventType := CallbackCreate(GetMethod(implObj, "put_EventType"), flags, 2)
        this.vtbl.get_MessageText := CallbackCreate(GetMethod(implObj, "get_MessageText"), flags, 2)
        this.vtbl.put_MessageText := CallbackCreate(GetMethod(implObj, "put_MessageText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EventType)
        CallbackFree(this.vtbl.put_EventType)
        CallbackFree(this.vtbl.get_MessageText)
        CallbackFree(this.vtbl.put_MessageText)
    }
}
