#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGMatrix.ahk" { ISVGMatrix }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGPoint extends IDispatch {
    /**
     * The interface identifier for ISVGPoint
     * @type {Guid}
     */
    static IID := Guid("{305104f4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPoint
     * @type {Guid}
     */
    static CLSID := Guid("{305105ba-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGPoint interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_x           : IntPtr
        get_x           : IntPtr
        put_y           : IntPtr
        get_y           : IntPtr
        matrixTransform : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGPoint.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    x {
        get => this.get_x()
        set => this.put_x(value)
    }

    /**
     * @type {Float} 
     */
    y {
        get => this.get_y()
        set => this.put_y(value)
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_x(v) {
        result := ComCall(7, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_x() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_y(v) {
        result := ComCall(9, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_y() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {ISVGMatrix} pMatrix 
     * @returns {ISVGPoint} 
     */
    matrixTransform(pMatrix) {
        result := ComCall(11, this, "ptr", pMatrix, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    Query(iid) {
        if (ISVGPoint.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_x := CallbackCreate(GetMethod(implObj, "put_x"), flags, 2)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.put_y := CallbackCreate(GetMethod(implObj, "put_y"), flags, 2)
        this.vtbl.get_y := CallbackCreate(GetMethod(implObj, "get_y"), flags, 2)
        this.vtbl.matrixTransform := CallbackCreate(GetMethod(implObj, "matrixTransform"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_x)
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.put_y)
        CallbackFree(this.vtbl.get_y)
        CallbackFree(this.vtbl.matrixTransform)
    }
}
