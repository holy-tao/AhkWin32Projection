#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMDragEvent extends IDispatch{
    /**
     * The interface identifier for IDOMDragEvent
     * @type {Guid}
     */
    static IID => Guid("{30510761-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMDragEvent
     * @type {Guid}
     */
    static CLSID => Guid("{30510762-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IHTMLDataTransfer>} p 
     * @returns {HRESULT} 
     */
    get_dataTransfer(p) {
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {Pointer<IHTMLWindow2>} viewArg 
     * @param {Integer} detailArg 
     * @param {Integer} screenXArg 
     * @param {Integer} screenYArg 
     * @param {Integer} clientXArg 
     * @param {Integer} clientYArg 
     * @param {VARIANT_BOOL} ctrlKeyArg 
     * @param {VARIANT_BOOL} altKeyArg 
     * @param {VARIANT_BOOL} shiftKeyArg 
     * @param {VARIANT_BOOL} metaKeyArg 
     * @param {Integer} buttonArg 
     * @param {Pointer<IEventTarget>} relatedTargetArg 
     * @param {Pointer<IHTMLDataTransfer>} dataTransferArg 
     * @returns {HRESULT} 
     */
    initDragEvent(eventType, canBubble, cancelable, viewArg, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, relatedTargetArg, dataTransferArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(8, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", viewArg, "int", detailArg, "int", screenXArg, "int", screenYArg, "int", clientXArg, "int", clientYArg, "short", ctrlKeyArg, "short", altKeyArg, "short", shiftKeyArg, "short", metaKeyArg, "ushort", buttonArg, "ptr", relatedTargetArg, "ptr", dataTransferArg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
