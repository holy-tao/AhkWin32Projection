#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINML_BINDING_DESC.ahk" { WINML_BINDING_DESC }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the context to bind inputs and outputs to a WinML model.
 * @see https://learn.microsoft.com/windows/win32/api/winml/nn-winml-iwinmlevaluationcontext
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IWinMLEvaluationContext extends IUnknown {
    /**
     * The interface identifier for IWinMLEvaluationContext
     * @type {Guid}
     */
    static IID := Guid("{95848f9e-583d-4054-af12-916387cd8426}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinMLEvaluationContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BindValue      : IntPtr
        GetValueByName : IntPtr
        Clear          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinMLEvaluationContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Binds the input/output to the given model.
     * @param {Pointer<WINML_BINDING_DESC>} pDescriptor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winml/ns-winml-winml_binding_desc">WINML_BINDING_DESC</a> containing the input/output binding descriptor.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlevaluationcontext-bindvalue
     */
    BindValue(pDescriptor) {
        result := ComCall(3, this, WINML_BINDING_DESC.Ptr, pDescriptor, "HRESULT")
        return result
    }

    /**
     * Returns the input/output description for the specific binding name.
     * @param {PWSTR} Name The name of the binding.
     * @returns {Pointer<WINML_BINDING_DESC>} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winml/ns-winml-winml_binding_desc">WINML_BINDING_DESC</a> containing the specified (Name) binding description.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlevaluationcontext-getvaluebyname
     */
    GetValueByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(4, this, "ptr", Name, "ptr*", &pDescriptor := 0, "HRESULT")
        return pDescriptor
    }

    /**
     * Clears the bindings for a model.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlevaluationcontext-clear
     */
    Clear() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWinMLEvaluationContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BindValue := CallbackCreate(GetMethod(implObj, "BindValue"), flags, 2)
        this.vtbl.GetValueByName := CallbackCreate(GetMethod(implObj, "GetValueByName"), flags, 3)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BindValue)
        CallbackFree(this.vtbl.GetValueByName)
        CallbackFree(this.vtbl.Clear)
    }
}
