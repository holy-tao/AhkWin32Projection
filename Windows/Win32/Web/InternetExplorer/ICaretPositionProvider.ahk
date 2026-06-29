#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ICaretPositionProvider extends IUnknown {
    /**
     * The interface identifier for ICaretPositionProvider
     * @type {Guid}
     */
    static IID := Guid("{58da43a2-108e-4d5b-9f75-e5f74f93fff5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICaretPositionProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCaretPosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICaretPositionProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<POINT>} pptCaret 
     * @param {Pointer<Float>} pflHeight 
     * @returns {HRESULT} 
     */
    GetCaretPosition(pptCaret, pflHeight) {
        pflHeightMarshal := pflHeight is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, POINT.Ptr, pptCaret, pflHeightMarshal, pflHeight, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICaretPositionProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCaretPosition := CallbackCreate(GetMethod(implObj, "GetCaretPosition"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCaretPosition)
    }
}
