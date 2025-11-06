#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMMutationEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMMutationEvent
     * @type {Guid}
     */
    static IID => Guid("{305106da-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMutationEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106db-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_relatedNode", "get_prevValue", "get_newValue", "get_attrName", "get_attrChange", "initMutationEvent"]

    /**
     * 
     * @returns {IDispatch} 
     */
    get_relatedNode() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_prevValue() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_newValue() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_attrName() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_attrChange() {
        result := ComCall(11, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IDispatch} relatedNodeArg 
     * @param {BSTR} prevValueArg 
     * @param {BSTR} newValueArg 
     * @param {BSTR} attrNameArg 
     * @param {Integer} attrChangeArg 
     * @returns {HRESULT} 
     */
    initMutationEvent(eventType, canBubble, cancelable, relatedNodeArg, prevValueArg, newValueArg, attrNameArg, attrChangeArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        prevValueArg := prevValueArg is String ? BSTR.Alloc(prevValueArg).Value : prevValueArg
        newValueArg := newValueArg is String ? BSTR.Alloc(newValueArg).Value : newValueArg
        attrNameArg := attrNameArg is String ? BSTR.Alloc(attrNameArg).Value : attrNameArg

        result := ComCall(12, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", relatedNodeArg, "ptr", prevValueArg, "ptr", newValueArg, "ptr", attrNameArg, "ushort", attrChangeArg, "HRESULT")
        return result
    }
}
