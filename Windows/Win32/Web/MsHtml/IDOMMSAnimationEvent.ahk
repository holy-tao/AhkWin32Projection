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
export default struct IDOMMSAnimationEvent extends IDispatch {
    /**
     * The interface identifier for IDOMMSAnimationEvent
     * @type {Guid}
     */
    static IID := Guid("{305107b7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMSAnimationEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305107b8-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMMSAnimationEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_animationName    : IntPtr
        get_elapsedTime      : IntPtr
        initMSAnimationEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMMSAnimationEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    animationName {
        get => this.get_animationName()
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
    get_animationName() {
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
     * @param {BSTR} animationName 
     * @param {Float} elapsedTime 
     * @returns {HRESULT} 
     */
    initMSAnimationEvent(eventType, canBubble, cancelable, animationName, elapsedTime) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        animationName := animationName is String ? BSTR.Alloc(animationName).Value : animationName

        result := ComCall(9, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, BSTR, animationName, "float", elapsedTime, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMMSAnimationEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_animationName := CallbackCreate(GetMethod(implObj, "get_animationName"), flags, 2)
        this.vtbl.get_elapsedTime := CallbackCreate(GetMethod(implObj, "get_elapsedTime"), flags, 2)
        this.vtbl.initMSAnimationEvent := CallbackCreate(GetMethod(implObj, "initMSAnimationEvent"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_animationName)
        CallbackFree(this.vtbl.get_elapsedTime)
        CallbackFree(this.vtbl.initMSAnimationEvent)
    }
}
