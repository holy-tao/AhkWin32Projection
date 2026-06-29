#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGPoint.ahk" { ISVGPoint }
#Import ".\ISVGRect.ahk" { ISVGRect }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGZoomEvent extends IDispatch {
    /**
     * The interface identifier for ISVGZoomEvent
     * @type {Guid}
     */
    static IID := Guid("{3051054e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGZoomEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305105d9-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGZoomEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_zoomRectScreen    : IntPtr
        get_previousScale     : IntPtr
        get_previousTranslate : IntPtr
        get_newScale          : IntPtr
        get_newTranslate      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGZoomEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGRect} 
     */
    zoomRectScreen {
        get => this.get_zoomRectScreen()
    }

    /**
     * @type {Float} 
     */
    previousScale {
        get => this.get_previousScale()
    }

    /**
     * @type {ISVGPoint} 
     */
    previousTranslate {
        get => this.get_previousTranslate()
    }

    /**
     * @type {Float} 
     */
    newScale {
        get => this.get_newScale()
    }

    /**
     * @type {ISVGPoint} 
     */
    newTranslate {
        get => this.get_newTranslate()
    }

    /**
     * 
     * @returns {ISVGRect} 
     */
    get_zoomRectScreen() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGRect(p)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_previousScale() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {ISVGPoint} 
     */
    get_previousTranslate() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPoint(p)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_newScale() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {ISVGPoint} 
     */
    get_newTranslate() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPoint(p)
    }

    Query(iid) {
        if (ISVGZoomEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_zoomRectScreen := CallbackCreate(GetMethod(implObj, "get_zoomRectScreen"), flags, 2)
        this.vtbl.get_previousScale := CallbackCreate(GetMethod(implObj, "get_previousScale"), flags, 2)
        this.vtbl.get_previousTranslate := CallbackCreate(GetMethod(implObj, "get_previousTranslate"), flags, 2)
        this.vtbl.get_newScale := CallbackCreate(GetMethod(implObj, "get_newScale"), flags, 2)
        this.vtbl.get_newTranslate := CallbackCreate(GetMethod(implObj, "get_newTranslate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_zoomRectScreen)
        CallbackFree(this.vtbl.get_previousScale)
        CallbackFree(this.vtbl.get_previousTranslate)
        CallbackFree(this.vtbl.get_newScale)
        CallbackFree(this.vtbl.get_newTranslate)
    }
}
