#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ICanvasImageData extends IDispatch {
    /**
     * The interface identifier for ICanvasImageData
     * @type {Guid}
     */
    static IID := Guid("{3051071a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for CanvasImageData
     * @type {Guid}
     */
    static CLSID := Guid("{3051071b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICanvasImageData interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_width  : IntPtr
        get_height : IntPtr
        get_data   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICanvasImageData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    width {
        get => this.get_width()
    }

    /**
     * @type {Integer} 
     */
    height {
        get => this.get_height()
    }

    /**
     * @type {VARIANT} 
     */
    data {
        get => this.get_data()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(7, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_data() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (ICanvasImageData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.get_data)
    }
}
