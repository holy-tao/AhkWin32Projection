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
export default struct IDOMCompositionEvent extends IDispatch {
    /**
     * The interface identifier for IDOMCompositionEvent
     * @type {Guid}
     */
    static IID := Guid("{305106d8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMCompositionEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305106d9-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMCompositionEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_data             : IntPtr
        initCompositionEvent : IntPtr
        get_locale           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMCompositionEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
    }

    /**
     * @type {BSTR} 
     */
    locale {
        get => this.get_locale()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {BSTR} data 
     * @param {BSTR} locale 
     * @returns {HRESULT} 
     */
    initCompositionEvent(eventType, canBubble, cancelable, viewArg, data, locale) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        data := data is String ? BSTR.Alloc(data).Value : data
        locale := locale is String ? BSTR.Alloc(locale).Value : locale

        result := ComCall(8, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", viewArg, BSTR, data, BSTR, locale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_locale() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IDOMCompositionEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
        this.vtbl.initCompositionEvent := CallbackCreate(GetMethod(implObj, "initCompositionEvent"), flags, 7)
        this.vtbl.get_locale := CallbackCreate(GetMethod(implObj, "get_locale"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_data)
        CallbackFree(this.vtbl.initCompositionEvent)
        CallbackFree(this.vtbl.get_locale)
    }
}
