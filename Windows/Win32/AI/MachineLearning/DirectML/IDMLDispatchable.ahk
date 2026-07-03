#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DML_BINDING_PROPERTIES.ahk" { DML_BINDING_PROPERTIES }
#Import ".\IDMLPageable.ahk" { IDMLPageable }

/**
 * Implemented by objects that can be recorded into a command list for dispatch on the GPU, using IDMLCommandRecorder::RecordDispatch.
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmldispatchable
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLDispatchable extends IDMLPageable {
    /**
     * The interface identifier for IDMLDispatchable
     * @type {Guid}
     */
    static IID := Guid("{dcb821a8-1039-441e-9f1c-b1759c2f3cec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLDispatchable interfaces
    */
    struct Vtbl extends IDMLPageable.Vtbl {
        GetBindingProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLDispatchable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the binding properties for a dispatchable object (an operator initializer, or a compiled operator).
     * @returns {DML_BINDING_PROPERTIES} Type: [**DML_BINDING_PROPERTIES**](/windows/win32/api/directml/ns-directml-dml_binding_properties)
     * 
     * A [DML_BINDING_PROPERTIES](/windows/win32/api/directml/ns-directml-dml_binding_properties) value containing binding properties.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldispatchable-getbindingproperties
     */
    GetBindingProperties() {
        result := ComCall(8, this, DML_BINDING_PROPERTIES)
        return result
    }

    Query(iid) {
        if (IDMLDispatchable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBindingProperties := CallbackCreate(GetMethod(implObj, "GetBindingProperties"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBindingProperties)
    }
}
