#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGZoomAndPan extends IDispatch {
    /**
     * The interface identifier for ISVGZoomAndPan
     * @type {Guid}
     */
    static IID := Guid("{305104e1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGZoomAndPan interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_zoomAndPan : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGZoomAndPan.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    zoomAndPan {
        get => this.get_zoomAndPan()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_zoomAndPan() {
        result := ComCall(7, this, "short*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGZoomAndPan.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_zoomAndPan := CallbackCreate(GetMethod(implObj, "get_zoomAndPan"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_zoomAndPan)
    }
}
