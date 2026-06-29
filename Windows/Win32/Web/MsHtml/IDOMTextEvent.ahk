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
export default struct IDOMTextEvent extends IDispatch {
    /**
     * The interface identifier for IDOMTextEvent
     * @type {Guid}
     */
    static IID := Guid("{305106d4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMTextEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305106d5-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMTextEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_data        : IntPtr
        get_inputMethod : IntPtr
        initTextEvent   : IntPtr
        get_locale      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMTextEvent.Vtbl()
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
     * @type {Integer} 
     */
    inputMethod {
        get => this.get_inputMethod()
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
     * @returns {Integer} 
     */
    get_inputMethod() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {BSTR} dataArg 
     * @param {Integer} inputMethod 
     * @param {BSTR} locale 
     * @returns {HRESULT} 
     */
    initTextEvent(eventType, canBubble, cancelable, viewArg, dataArg, inputMethod, locale) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        dataArg := dataArg is String ? BSTR.Alloc(dataArg).Value : dataArg
        locale := locale is String ? BSTR.Alloc(locale).Value : locale

        result := ComCall(9, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", viewArg, BSTR, dataArg, "uint", inputMethod, BSTR, locale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_locale() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IDOMTextEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
        this.vtbl.get_inputMethod := CallbackCreate(GetMethod(implObj, "get_inputMethod"), flags, 2)
        this.vtbl.initTextEvent := CallbackCreate(GetMethod(implObj, "initTextEvent"), flags, 8)
        this.vtbl.get_locale := CallbackCreate(GetMethod(implObj, "get_locale"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_data)
        CallbackFree(this.vtbl.get_inputMethod)
        CallbackFree(this.vtbl.initTextEvent)
        CallbackFree(this.vtbl.get_locale)
    }
}
