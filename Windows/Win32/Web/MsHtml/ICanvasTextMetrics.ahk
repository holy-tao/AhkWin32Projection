#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ICanvasTextMetrics extends IDispatch {
    /**
     * The interface identifier for ICanvasTextMetrics
     * @type {Guid}
     */
    static IID := Guid("{30510718-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for CanvasTextMetrics
     * @type {Guid}
     */
    static CLSID := Guid("{30510719-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICanvasTextMetrics interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_width : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICanvasTextMetrics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    width {
        get => this.get_width()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_width() {
        result := ComCall(7, this, "float*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (ICanvasTextMetrics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_width)
    }
}
