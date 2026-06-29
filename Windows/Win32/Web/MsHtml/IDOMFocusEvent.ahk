#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEventTarget.ahk" { IEventTarget }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMFocusEvent extends IDispatch {
    /**
     * The interface identifier for IDOMFocusEvent
     * @type {Guid}
     */
    static IID := Guid("{305106cc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMFocusEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305106cd-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMFocusEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_relatedTarget : IntPtr
        initFocusEvent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMFocusEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IEventTarget} 
     */
    relatedTarget {
        get => this.get_relatedTarget()
    }

    /**
     * 
     * @returns {IEventTarget} 
     */
    get_relatedTarget() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IEventTarget(p)
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} _view 
     * @param {Integer} detail 
     * @param {IEventTarget} relatedTargetArg 
     * @returns {HRESULT} 
     */
    initFocusEvent(eventType, canBubble, cancelable, _view, detail, relatedTargetArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(8, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", _view, "int", detail, "ptr", relatedTargetArg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMFocusEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_relatedTarget := CallbackCreate(GetMethod(implObj, "get_relatedTarget"), flags, 2)
        this.vtbl.initFocusEvent := CallbackCreate(GetMethod(implObj, "initFocusEvent"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_relatedTarget)
        CallbackFree(this.vtbl.initFocusEvent)
    }
}
