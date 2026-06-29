#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ICanvasGradient extends IDispatch {
    /**
     * The interface identifier for ICanvasGradient
     * @type {Guid}
     */
    static IID := Guid("{30510714-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for CanvasGradient
     * @type {Guid}
     */
    static CLSID := Guid("{30510715-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICanvasGradient interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        addColorStop : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICanvasGradient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Float} offset 
     * @param {BSTR} _color 
     * @returns {HRESULT} 
     */
    addColorStop(offset, _color) {
        _color := _color is String ? BSTR.Alloc(_color).Value : _color

        result := ComCall(7, this, "float", offset, BSTR, _color, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICanvasGradient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.addColorStop := CallbackCreate(GetMethod(implObj, "addColorStop"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.addColorStop)
    }
}
