#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDMLDispatchable.ahk" { IDMLDispatchable }

/**
 * Represents a compiled, efficient form of an operator suitable for execution on the GPU. To create this object, call IDMLDevice::CompileOperator.
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmlcompiledoperator
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLCompiledOperator extends IDMLDispatchable {
    /**
     * The interface identifier for IDMLCompiledOperator
     * @type {Guid}
     */
    static IID := Guid("{6b15e56a-bf5c-4902-92d8-da3a650afea4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLCompiledOperator interfaces
    */
    struct Vtbl extends IDMLDispatchable.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLCompiledOperator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDMLCompiledOperator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
