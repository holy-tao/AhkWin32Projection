#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMCustomEvent extends IDispatch {
    /**
     * The interface identifier for IDOMCustomEvent
     * @type {Guid}
     */
    static IID := Guid("{305106de-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMCustomEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305106df-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMCustomEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_detail      : IntPtr
        initCustomEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMCustomEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    detail {
        get => this.get_detail()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_detail() {
        p := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {Pointer<VARIANT>} detail 
     * @returns {HRESULT} 
     */
    initCustomEvent(eventType, canBubble, cancelable, detail) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(8, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, VARIANT.Ptr, detail, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMCustomEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_detail := CallbackCreate(GetMethod(implObj, "get_detail"), flags, 2)
        this.vtbl.initCustomEvent := CallbackCreate(GetMethod(implObj, "initCustomEvent"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_detail)
        CallbackFree(this.vtbl.initCustomEvent)
    }
}
