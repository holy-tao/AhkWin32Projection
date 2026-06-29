#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMLOperatorTypeInferenceContext.ahk" { IMLOperatorTypeInferenceContext }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorTypeInferrer extends IUnknown {
    /**
     * The interface identifier for IMLOperatorTypeInferrer
     * @type {Guid}
     */
    static IID := Guid("{781aeb48-9bcb-4797-bf77-8bf455217beb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorTypeInferrer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InferOutputTypes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorTypeInferrer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMLOperatorTypeInferenceContext} _context 
     * @returns {HRESULT} 
     */
    InferOutputTypes(_context) {
        result := ComCall(3, this, "ptr", _context, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLOperatorTypeInferrer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InferOutputTypes := CallbackCreate(GetMethod(implObj, "InferOutputTypes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InferOutputTypes)
    }
}
