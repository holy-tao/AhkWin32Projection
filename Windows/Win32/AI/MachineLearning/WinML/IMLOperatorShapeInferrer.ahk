#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMLOperatorShapeInferenceContext.ahk" { IMLOperatorShapeInferenceContext }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorShapeInferrer extends IUnknown {
    /**
     * The interface identifier for IMLOperatorShapeInferrer
     * @type {Guid}
     */
    static IID := Guid("{540be5be-a6c9-40ee-83f6-d2b8b40a7798}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorShapeInferrer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InferOutputShapes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorShapeInferrer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMLOperatorShapeInferenceContext} _context 
     * @returns {HRESULT} 
     */
    InferOutputShapes(_context) {
        result := ComCall(3, this, "ptr", _context, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLOperatorShapeInferrer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InferOutputShapes := CallbackCreate(GetMethod(implObj, "InferOutputShapes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InferOutputShapes)
    }
}
