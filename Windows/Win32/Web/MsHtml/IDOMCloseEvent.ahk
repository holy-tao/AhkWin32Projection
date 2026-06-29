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
export default struct IDOMCloseEvent extends IDispatch {
    /**
     * The interface identifier for IDOMCloseEvent
     * @type {Guid}
     */
    static IID := Guid("{305107ff-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMCloseEvent
     * @type {Guid}
     */
    static CLSID := Guid("{30510800-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMCloseEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_wasClean   : IntPtr
        initCloseEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMCloseEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    wasClean {
        get => this.get_wasClean()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_wasClean() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {VARIANT_BOOL} wasClean 
     * @param {Integer} code 
     * @param {BSTR} reason 
     * @returns {HRESULT} 
     */
    initCloseEvent(eventType, canBubble, cancelable, wasClean, code, reason) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        reason := reason is String ? BSTR.Alloc(reason).Value : reason

        result := ComCall(8, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, VARIANT_BOOL, wasClean, "int", code, BSTR, reason, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMCloseEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_wasClean := CallbackCreate(GetMethod(implObj, "get_wasClean"), flags, 2)
        this.vtbl.initCloseEvent := CallbackCreate(GetMethod(implObj, "initCloseEvent"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_wasClean)
        CallbackFree(this.vtbl.initCloseEvent)
    }
}
