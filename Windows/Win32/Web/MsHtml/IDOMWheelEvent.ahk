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
export default struct IDOMWheelEvent extends IDispatch {
    /**
     * The interface identifier for IDOMWheelEvent
     * @type {Guid}
     */
    static IID := Guid("{305106d2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMWheelEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305106d3-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMWheelEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_deltaX     : IntPtr
        get_deltaY     : IntPtr
        get_deltaZ     : IntPtr
        get_deltaMode  : IntPtr
        initWheelEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMWheelEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    deltaX {
        get => this.get_deltaX()
    }

    /**
     * @type {Integer} 
     */
    deltaY {
        get => this.get_deltaY()
    }

    /**
     * @type {Integer} 
     */
    deltaZ {
        get => this.get_deltaZ()
    }

    /**
     * @type {Integer} 
     */
    deltaMode {
        get => this.get_deltaMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_deltaX() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_deltaY() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_deltaZ() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_deltaMode() {
        result := ComCall(10, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {Integer} detailArg 
     * @param {Integer} screenXArg 
     * @param {Integer} screenYArg 
     * @param {Integer} clientXArg 
     * @param {Integer} clientYArg 
     * @param {Integer} buttonArg 
     * @param {IEventTarget} relatedTargetArg 
     * @param {BSTR} modifiersListArg 
     * @param {Integer} deltaX 
     * @param {Integer} deltaY 
     * @param {Integer} deltaZ 
     * @param {Integer} deltaMode 
     * @returns {HRESULT} 
     */
    initWheelEvent(eventType, canBubble, cancelable, viewArg, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, buttonArg, relatedTargetArg, modifiersListArg, deltaX, deltaY, deltaZ, deltaMode) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        modifiersListArg := modifiersListArg is String ? BSTR.Alloc(modifiersListArg).Value : modifiersListArg

        result := ComCall(11, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", viewArg, "int", detailArg, "int", screenXArg, "int", screenYArg, "int", clientXArg, "int", clientYArg, "ushort", buttonArg, "ptr", relatedTargetArg, BSTR, modifiersListArg, "int", deltaX, "int", deltaY, "int", deltaZ, "uint", deltaMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMWheelEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_deltaX := CallbackCreate(GetMethod(implObj, "get_deltaX"), flags, 2)
        this.vtbl.get_deltaY := CallbackCreate(GetMethod(implObj, "get_deltaY"), flags, 2)
        this.vtbl.get_deltaZ := CallbackCreate(GetMethod(implObj, "get_deltaZ"), flags, 2)
        this.vtbl.get_deltaMode := CallbackCreate(GetMethod(implObj, "get_deltaMode"), flags, 2)
        this.vtbl.initWheelEvent := CallbackCreate(GetMethod(implObj, "initWheelEvent"), flags, 17)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_deltaX)
        CallbackFree(this.vtbl.get_deltaY)
        CallbackFree(this.vtbl.get_deltaZ)
        CallbackFree(this.vtbl.get_deltaMode)
        CallbackFree(this.vtbl.initWheelEvent)
    }
}
