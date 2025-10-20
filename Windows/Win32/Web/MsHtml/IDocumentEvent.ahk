#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDocumentEvent extends IDispatch{
    /**
     * The interface identifier for IDocumentEvent
     * @type {Guid}
     */
    static IID => Guid("{305104bc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} eventType 
     * @param {Pointer<IDOMEvent>} ppEvent 
     * @returns {HRESULT} 
     */
    createEvent(eventType, ppEvent) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(7, this, "ptr", eventType, "ptr", ppEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
