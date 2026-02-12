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
     * @type {IDispatch} 
     */
    relatedNode {
        get => this.get_relatedNode()
    }

    /**
     * @type {BSTR} 
     */
    prevValue {
        get => this.get_prevValue()
    }

    /**
     * @type {BSTR} 
     */
    newValue {
        get => this.get_newValue()
    }

    /**
     * @type {BSTR} 
     */
    attrName {
        get => this.get_attrName()
    }

    /**
     * @type {Integer} 
     */
    attrChange {
        get => this.get_attrChange()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_relatedNode() {
        result := ComCall(7, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_prevValue() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_newValue() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_attrName() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_attrChange() {
        result := ComCall(11, this, "ushort*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(eventType is String) {
            pin := BSTR.Alloc(eventType)
            eventType := pin.Value
        }
        if(prevValueArg is String) {
            pin := BSTR.Alloc(prevValueArg)
            prevValueArg := pin.Value
        }
        if(newValueArg is String) {
            pin := BSTR.Alloc(newValueArg)
            newValueArg := pin.Value
        }
        if(attrNameArg is String) {
            pin := BSTR.Alloc(attrNameArg)
            attrNameArg := pin.Value
        }

        result := ComCall(12, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", relatedNodeArg, "ptr", prevValueArg, "ptr", newValueArg, "ptr", attrNameArg, "ushort", attrChangeArg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
