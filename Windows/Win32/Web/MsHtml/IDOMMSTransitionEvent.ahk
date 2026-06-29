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
export default struct IDOMMSTransitionEvent extends IDispatch {
    /**
     * The interface identifier for IDOMMSTransitionEvent
     * @type {Guid}
     */
    static IID := Guid("{305107b5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMSTransitionEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305107b6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMMSTransitionEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_propertyName      : IntPtr
        get_elapsedTime       : IntPtr
        initMSTransitionEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMMSTransitionEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    propertyName {
        get => this.get_propertyName()
    }

    /**
     * @type {Float} 
     */
    elapsedTime {
        get => this.get_elapsedTime()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_propertyName() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_elapsedTime() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {BSTR} propertyName 
     * @param {Float} elapsedTime 
     * @returns {HRESULT} 
     */
    initMSTransitionEvent(eventType, canBubble, cancelable, propertyName, elapsedTime) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(9, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, BSTR, propertyName, "float", elapsedTime, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMMSTransitionEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_propertyName := CallbackCreate(GetMethod(implObj, "get_propertyName"), flags, 2)
        this.vtbl.get_elapsedTime := CallbackCreate(GetMethod(implObj, "get_elapsedTime"), flags, 2)
        this.vtbl.initMSTransitionEvent := CallbackCreate(GetMethod(implObj, "initMSTransitionEvent"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_propertyName)
        CallbackFree(this.vtbl.get_elapsedTime)
        CallbackFree(this.vtbl.initMSTransitionEvent)
    }
}
