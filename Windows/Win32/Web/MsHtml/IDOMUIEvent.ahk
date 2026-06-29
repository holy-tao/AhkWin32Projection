#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMUIEvent extends IDispatch {
    /**
     * The interface identifier for IDOMUIEvent
     * @type {Guid}
     */
    static IID := Guid("{305106ca-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMUIEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305106cb-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMUIEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_view    : IntPtr
        get_detail  : IntPtr
        initUIEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMUIEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLWindow2} 
     */
    view {
        get => this.get_view()
    }

    /**
     * @type {Integer} 
     */
    detail {
        get => this.get_detail()
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_view() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_detail() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} _view 
     * @param {Integer} detail 
     * @returns {HRESULT} 
     */
    initUIEvent(eventType, canBubble, cancelable, _view, detail) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(9, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", _view, "int", detail, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMUIEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_view := CallbackCreate(GetMethod(implObj, "get_view"), flags, 2)
        this.vtbl.get_detail := CallbackCreate(GetMethod(implObj, "get_detail"), flags, 2)
        this.vtbl.initUIEvent := CallbackCreate(GetMethod(implObj, "initUIEvent"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_view)
        CallbackFree(this.vtbl.get_detail)
        CallbackFree(this.vtbl.initUIEvent)
    }
}
