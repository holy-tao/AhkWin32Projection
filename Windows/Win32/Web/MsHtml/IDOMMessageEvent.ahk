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
export default struct IDOMMessageEvent extends IDispatch {
    /**
     * The interface identifier for IDOMMessageEvent
     * @type {Guid}
     */
    static IID := Guid("{30510720-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMessageEvent
     * @type {Guid}
     */
    static CLSID := Guid("{30510721-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMMessageEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_data         : IntPtr
        get_origin       : IntPtr
        get_source       : IntPtr
        initMessageEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMMessageEvent.Vtbl()
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
    origin {
        get => this.get_origin()
    }

    /**
     * @type {IHTMLWindow2} 
     */
    source {
        get => this.get_source()
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
     * @returns {BSTR} 
     */
    get_origin() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_source() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {BSTR} data 
     * @param {BSTR} origin 
     * @param {BSTR} lastEventId 
     * @param {IHTMLWindow2} source 
     * @returns {HRESULT} 
     */
    initMessageEvent(eventType, canBubble, cancelable, data, origin, lastEventId, source) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        data := data is String ? BSTR.Alloc(data).Value : data
        origin := origin is String ? BSTR.Alloc(origin).Value : origin
        lastEventId := lastEventId is String ? BSTR.Alloc(lastEventId).Value : lastEventId

        result := ComCall(10, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, BSTR, data, BSTR, origin, BSTR, lastEventId, "ptr", source, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMMessageEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
        this.vtbl.get_origin := CallbackCreate(GetMethod(implObj, "get_origin"), flags, 2)
        this.vtbl.get_source := CallbackCreate(GetMethod(implObj, "get_source"), flags, 2)
        this.vtbl.initMessageEvent := CallbackCreate(GetMethod(implObj, "initMessageEvent"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_data)
        CallbackFree(this.vtbl.get_origin)
        CallbackFree(this.vtbl.get_source)
        CallbackFree(this.vtbl.initMessageEvent)
    }
}
