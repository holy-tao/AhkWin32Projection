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
export default struct IDOMProgressEvent extends IDispatch {
    /**
     * The interface identifier for IDOMProgressEvent
     * @type {Guid}
     */
    static IID := Guid("{3051071e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMProgressEvent
     * @type {Guid}
     */
    static CLSID := Guid("{3051071f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMProgressEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_lengthComputable : IntPtr
        get_loaded           : IntPtr
        get_total            : IntPtr
        initProgressEvent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMProgressEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    lengthComputable {
        get => this.get_lengthComputable()
    }

    /**
     * @type {Integer} 
     */
    loaded {
        get => this.get_loaded()
    }

    /**
     * @type {Integer} 
     */
    total {
        get => this.get_total()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_lengthComputable() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_loaded() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_total() {
        result := ComCall(9, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {VARIANT_BOOL} lengthComputableArg 
     * @param {Integer} loadedArg 
     * @param {Integer} totalArg 
     * @returns {HRESULT} 
     */
    initProgressEvent(eventType, canBubble, cancelable, lengthComputableArg, loadedArg, totalArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(10, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, VARIANT_BOOL, lengthComputableArg, "uint", loadedArg, "uint", totalArg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMProgressEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_lengthComputable := CallbackCreate(GetMethod(implObj, "get_lengthComputable"), flags, 2)
        this.vtbl.get_loaded := CallbackCreate(GetMethod(implObj, "get_loaded"), flags, 2)
        this.vtbl.get_total := CallbackCreate(GetMethod(implObj, "get_total"), flags, 2)
        this.vtbl.initProgressEvent := CallbackCreate(GetMethod(implObj, "initProgressEvent"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_lengthComputable)
        CallbackFree(this.vtbl.get_loaded)
        CallbackFree(this.vtbl.get_total)
        CallbackFree(this.vtbl.initProgressEvent)
    }
}
