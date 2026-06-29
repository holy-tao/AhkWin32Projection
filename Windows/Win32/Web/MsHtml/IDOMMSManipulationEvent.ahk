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
export default struct IDOMMSManipulationEvent extends IDispatch {
    /**
     * The interface identifier for IDOMMSManipulationEvent
     * @type {Guid}
     */
    static IID := Guid("{30510816-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMSManipulationEvent
     * @type {Guid}
     */
    static CLSID := Guid("{30510817-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMMSManipulationEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_lastState           : IntPtr
        get_currentState        : IntPtr
        initMSManipulationEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMMSManipulationEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    lastState {
        get => this.get_lastState()
    }

    /**
     * @type {Integer} 
     */
    currentState {
        get => this.get_currentState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_lastState() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_currentState() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {Integer} detailArg 
     * @param {Integer} lastState 
     * @param {Integer} currentState 
     * @returns {HRESULT} 
     */
    initMSManipulationEvent(eventType, canBubble, cancelable, viewArg, detailArg, lastState, currentState) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(9, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", viewArg, "int", detailArg, "int", lastState, "int", currentState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMMSManipulationEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_lastState := CallbackCreate(GetMethod(implObj, "get_lastState"), flags, 2)
        this.vtbl.get_currentState := CallbackCreate(GetMethod(implObj, "get_currentState"), flags, 2)
        this.vtbl.initMSManipulationEvent := CallbackCreate(GetMethod(implObj, "initMSManipulationEvent"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_lastState)
        CallbackFree(this.vtbl.get_currentState)
        CallbackFree(this.vtbl.initMSManipulationEvent)
    }
}
