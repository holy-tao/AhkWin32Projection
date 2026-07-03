#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLPainterOverlay extends IUnknown {
    /**
     * The interface identifier for IHTMLPainterOverlay
     * @type {Guid}
     */
    static IID := Guid("{3050f7e3-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPainterOverlay interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnMove : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPainterOverlay.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {RECT} rcDevice 
     * @returns {HRESULT} 
     */
    OnMove(rcDevice) {
        result := ComCall(3, this, RECT, rcDevice, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLPainterOverlay.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnMove := CallbackCreate(GetMethod(implObj, "OnMove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnMove)
    }
}
