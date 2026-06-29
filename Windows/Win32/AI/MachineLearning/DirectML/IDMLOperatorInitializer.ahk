#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDMLCompiledOperator.ahk" { IDMLCompiledOperator }
#Import ".\IDMLDispatchable.ahk" { IDMLDispatchable }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a specialized object whose purpose is to initialize compiled operators. To create an instance of this object, call IDMLDevice::CreateOperatorInitializer.
 * @remarks
 * Operator initializers are reusable: once an instance has been used to initialize a set of operators, you can reset it with a different set of compiled operators as targets.
 * 
 * When executing an initializer, the expected bindings are as follows:
 * 
 * - Inputs should be one buffer array binding for each target operator, in the order that you originally specified the operators when creating or resetting the initializer. Each buffer array binding itself should have a size equal to the inputs of its respective operator. Alternatively, you may specify NONE for a binding to bind no inputs for initialization of that target operator.
 * - Outputs should be the persistent resources for each target operator, in the order that you originally specified the operators when creating or resetting the initializer.
 * - As with any dispatchable object (an operator initializer, or a compiled operator), the initializer may require a temporary resource. Call [IDMLDispatchable::GetBindingProperties](/windows/win32/api/directml/nf-directml-idmldispatchable-getbindingproperties) to determine the require size of the temporary resource.
 * - Operator initializers don't ever require persistent resources. Therefore, calling [IDMLDispatchable::GetBindingProperties](/windows/win32/api/directml/nf-directml-idmldispatchable-getbindingproperties) on an operator initializer always returns a <b>PersistentResourceSize</b> of 0.
 * 
 * The operator initializer itself doesn't need to be initialized—GPU initialization only applies to compiled operators.
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmloperatorinitializer
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLOperatorInitializer extends IDMLDispatchable {
    /**
     * The interface identifier for IDMLOperatorInitializer
     * @type {Guid}
     */
    static IID := Guid("{427c1113-435c-469c-8676-4d5dd072f813}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLOperatorInitializer interfaces
    */
    struct Vtbl extends IDMLDispatchable.Vtbl {
        Reset : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLOperatorInitializer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Resets the initializer to handle initialization of a new set of operators.
     * @param {Integer} operatorCount Type: <b>UINT</b>
     * 
     * This parameter determines the number of elements in the array passed in the  <i>operators</i> parameter.
     * @param {Pointer<IDMLCompiledOperator>} operators Type: <b>[IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator)*</b>
     * 
     * An optional pointer to a constant array of [IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator) pointers containing the operators that the initializer should initialize.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmloperatorinitializer-reset
     */
    Reset(operatorCount, operators) {
        result := ComCall(9, this, "uint", operatorCount, IDMLCompiledOperator.Ptr, operators, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDMLOperatorInitializer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
    }
}
