#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEventTarget.ahk" { IEventTarget }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMEvent extends IDispatch {
    /**
     * The interface identifier for IDOMEvent
     * @type {Guid}
     */
    static IID := Guid("{305104ba-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305104bb-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_bubbles              : IntPtr
        get_cancelable           : IntPtr
        get_currentTarget        : IntPtr
        get_defaultPrevented     : IntPtr
        get_eventPhase           : IntPtr
        get_target               : IntPtr
        get_timeStamp            : IntPtr
        get_type                 : IntPtr
        initEvent                : IntPtr
        preventDefault           : IntPtr
        stopPropagation          : IntPtr
        stopImmediatePropagation : IntPtr
        get_isTrusted            : IntPtr
        put_cancelBubble         : IntPtr
        get_cancelBubble         : IntPtr
        get_srcElement           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    bubbles {
        get => this.get_bubbles()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    cancelable {
        get => this.get_cancelable()
    }

    /**
     * @type {IEventTarget} 
     */
    currentTarget {
        get => this.get_currentTarget()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    defaultPrevented {
        get => this.get_defaultPrevented()
    }

    /**
     * @type {Integer} 
     */
    eventPhase {
        get => this.get_eventPhase()
    }

    /**
     * @type {IEventTarget} 
     */
    target {
        get => this.get_target()
    }

    /**
     * @type {Integer} 
     */
    timeStamp {
        get => this.get_timeStamp()
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isTrusted {
        get => this.get_isTrusted()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    cancelBubble {
        get => this.get_cancelBubble()
        set => this.put_cancelBubble(value)
    }

    /**
     * @type {IHTMLElement} 
     */
    srcElement {
        get => this.get_srcElement()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_bubbles() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_cancelable() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IEventTarget} 
     */
    get_currentTarget() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IEventTarget(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_defaultPrevented() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_eventPhase() {
        result := ComCall(11, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IEventTarget} 
     */
    get_target() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IEventTarget(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_timeStamp() {
        result := ComCall(13, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @returns {HRESULT} 
     */
    initEvent(eventType, canBubble, cancelable) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(15, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    preventDefault() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopPropagation() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopImmediatePropagation() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isTrusted() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_cancelBubble(v) {
        result := ComCall(20, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_cancelBubble() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_srcElement() {
        result := ComCall(22, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    Query(iid) {
        if (IDOMEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_bubbles := CallbackCreate(GetMethod(implObj, "get_bubbles"), flags, 2)
        this.vtbl.get_cancelable := CallbackCreate(GetMethod(implObj, "get_cancelable"), flags, 2)
        this.vtbl.get_currentTarget := CallbackCreate(GetMethod(implObj, "get_currentTarget"), flags, 2)
        this.vtbl.get_defaultPrevented := CallbackCreate(GetMethod(implObj, "get_defaultPrevented"), flags, 2)
        this.vtbl.get_eventPhase := CallbackCreate(GetMethod(implObj, "get_eventPhase"), flags, 2)
        this.vtbl.get_target := CallbackCreate(GetMethod(implObj, "get_target"), flags, 2)
        this.vtbl.get_timeStamp := CallbackCreate(GetMethod(implObj, "get_timeStamp"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.initEvent := CallbackCreate(GetMethod(implObj, "initEvent"), flags, 4)
        this.vtbl.preventDefault := CallbackCreate(GetMethod(implObj, "preventDefault"), flags, 1)
        this.vtbl.stopPropagation := CallbackCreate(GetMethod(implObj, "stopPropagation"), flags, 1)
        this.vtbl.stopImmediatePropagation := CallbackCreate(GetMethod(implObj, "stopImmediatePropagation"), flags, 1)
        this.vtbl.get_isTrusted := CallbackCreate(GetMethod(implObj, "get_isTrusted"), flags, 2)
        this.vtbl.put_cancelBubble := CallbackCreate(GetMethod(implObj, "put_cancelBubble"), flags, 2)
        this.vtbl.get_cancelBubble := CallbackCreate(GetMethod(implObj, "get_cancelBubble"), flags, 2)
        this.vtbl.get_srcElement := CallbackCreate(GetMethod(implObj, "get_srcElement"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_bubbles)
        CallbackFree(this.vtbl.get_cancelable)
        CallbackFree(this.vtbl.get_currentTarget)
        CallbackFree(this.vtbl.get_defaultPrevented)
        CallbackFree(this.vtbl.get_eventPhase)
        CallbackFree(this.vtbl.get_target)
        CallbackFree(this.vtbl.get_timeStamp)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.initEvent)
        CallbackFree(this.vtbl.preventDefault)
        CallbackFree(this.vtbl.stopPropagation)
        CallbackFree(this.vtbl.stopImmediatePropagation)
        CallbackFree(this.vtbl.get_isTrusted)
        CallbackFree(this.vtbl.put_cancelBubble)
        CallbackFree(this.vtbl.get_cancelBubble)
        CallbackFree(this.vtbl.get_srcElement)
    }
}
