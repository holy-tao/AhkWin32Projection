#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmAction.ahk

/**
 * Used to log an event to the Windows Application event log in response to a quota, file screen, or file management job event.
 * @remarks
 * 
  * For most events, the event identifier is 12325. However, for events that a file management job logs, the event 
  *     identifier is 8244.
  * 
  * You must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioneventlog-get_messagetext">MessageText</a> 
  *     property; the other property is optional.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmactioneventlog
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmActionEventLog extends IFsrmAction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmActionEventLog
     * @type {Guid}
     */
    static IID => Guid("{4c8f96c3-5d94-4f37-a4f4-f56ab463546f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "put_EventType", "get_MessageText", "put_MessageText"]

    /**
     * 
     * @param {Pointer<Integer>} eventType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioneventlog-get_eventtype
     */
    get_EventType(eventType) {
        eventTypeMarshal := eventType is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, eventTypeMarshal, eventType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eventType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioneventlog-put_eventtype
     */
    put_EventType(eventType) {
        result := ComCall(13, this, "int", eventType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} messageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioneventlog-get_messagetext
     */
    get_MessageText(messageText) {
        result := ComCall(14, this, "ptr", messageText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} messageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioneventlog-put_messagetext
     */
    put_MessageText(messageText) {
        messageText := messageText is String ? BSTR.Alloc(messageText).Value : messageText

        result := ComCall(15, this, "ptr", messageText, "HRESULT")
        return result
    }
}
