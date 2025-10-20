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
     * 
     * @param {Pointer<Int32>} eventType 
     * @returns {HRESULT} 
     */
    get_EventType(eventType) {
        result := ComCall(12, this, "int*", eventType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eventType 
     * @returns {HRESULT} 
     */
    put_EventType(eventType) {
        result := ComCall(13, this, "int", eventType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} messageText 
     * @returns {HRESULT} 
     */
    get_MessageText(messageText) {
        result := ComCall(14, this, "ptr", messageText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} messageText 
     * @returns {HRESULT} 
     */
    put_MessageText(messageText) {
        messageText := messageText is String ? BSTR.Alloc(messageText).Value : messageText

        result := ComCall(15, this, "ptr", messageText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
