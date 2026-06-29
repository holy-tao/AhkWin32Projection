#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMMutationEvent extends IDispatch {
    /**
     * The interface identifier for IDOMMutationEvent
     * @type {Guid}
     */
    static IID := Guid("{305106da-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMutationEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305106db-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMMutationEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_relatedNode   : IntPtr
        get_prevValue     : IntPtr
        get_newValue      : IntPtr
        get_attrName      : IntPtr
        get_attrChange    : IntPtr
        initMutationEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMMutationEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_prevValue() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_newValue() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_attrName() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
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

        result := ComCall(12, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", relatedNodeArg, BSTR, prevValueArg, BSTR, newValueArg, BSTR, attrNameArg, "ushort", attrChangeArg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMMutationEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_relatedNode := CallbackCreate(GetMethod(implObj, "get_relatedNode"), flags, 2)
        this.vtbl.get_prevValue := CallbackCreate(GetMethod(implObj, "get_prevValue"), flags, 2)
        this.vtbl.get_newValue := CallbackCreate(GetMethod(implObj, "get_newValue"), flags, 2)
        this.vtbl.get_attrName := CallbackCreate(GetMethod(implObj, "get_attrName"), flags, 2)
        this.vtbl.get_attrChange := CallbackCreate(GetMethod(implObj, "get_attrChange"), flags, 2)
        this.vtbl.initMutationEvent := CallbackCreate(GetMethod(implObj, "initMutationEvent"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_relatedNode)
        CallbackFree(this.vtbl.get_prevValue)
        CallbackFree(this.vtbl.get_newValue)
        CallbackFree(this.vtbl.get_attrName)
        CallbackFree(this.vtbl.get_attrChange)
        CallbackFree(this.vtbl.initMutationEvent)
    }
}
