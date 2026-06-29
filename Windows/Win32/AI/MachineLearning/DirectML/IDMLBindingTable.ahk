#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DML_BINDING_DESC.ahk" { DML_BINDING_DESC }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DML_BINDING_TABLE_DESC.ahk" { DML_BINDING_TABLE_DESC }
#Import ".\IDMLDeviceChild.ahk" { IDMLDeviceChild }

/**
 * Wraps a range of an application-managed descriptor heap, and is used by DirectML to create bindings for resources. To create this object, call IDMLDevice::CreateBindingTable.
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmlbindingtable
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLBindingTable extends IDMLDeviceChild {
    /**
     * The interface identifier for IDMLBindingTable
     * @type {Guid}
     */
    static IID := Guid("{29c687dc-de74-4e3b-ab00-1168f2fc3cfc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLBindingTable interfaces
    */
    struct Vtbl extends IDMLDeviceChild.Vtbl {
        BindInputs             : IntPtr
        BindOutputs            : IntPtr
        BindTemporaryResource  : IntPtr
        BindPersistentResource : IntPtr
        Reset                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLBindingTable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Binds a set of resources as input tensors.
     * @param {Integer} bindingCount Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This parameter determines the size of the *bindings* array (if provided).
     * @param {Pointer<DML_BINDING_DESC>} bindings Type: **const [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc)\***
     * 
     * An optional pointer to a constant array of [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc) containing descriptions of the tensor resources to bind.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-bindinputs
     */
    BindInputs(bindingCount, bindings) {
        ComCall(8, this, "uint", bindingCount, DML_BINDING_DESC.Ptr, bindings)
    }

    /**
     * Binds a set of resources as output tensors.
     * @param {Integer} bindingCount Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This parameter determines the size of the <i>bindings</i> array (if provided).
     * @param {Pointer<DML_BINDING_DESC>} bindings Type: <b>const [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc)*</b>
     * 
     * An optional pointer to a constant array of [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc) containing descriptions of the tensor resources to bind.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-bindoutputs
     */
    BindOutputs(bindingCount, bindings) {
        ComCall(9, this, "uint", bindingCount, DML_BINDING_DESC.Ptr, bindings)
    }

    /**
     * Binds a buffer to use as temporary scratch memory. You can determine the required size of this buffer range by calling IDMLDispatchable::GetBindingProperties.
     * @param {Pointer<DML_BINDING_DESC>} binding Type: <b>const [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc)*</b>
     * 
     * An optional pointer to a [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc) containing the description of a tensor resource to bind.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-bindtemporaryresource
     */
    BindTemporaryResource(binding) {
        ComCall(10, this, DML_BINDING_DESC.Ptr, binding)
    }

    /**
     * Binds a buffer as a persistent resource. You can determine the required size of this buffer range by calling IDMLDispatchable::GetBindingProperties.
     * @param {Pointer<DML_BINDING_DESC>} binding Type: <b>const [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc)*</b>
     * 
     * An optional pointer to a [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc) containing the description of a tensor resource to bind.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-bindpersistentresource
     */
    BindPersistentResource(binding) {
        ComCall(11, this, DML_BINDING_DESC.Ptr, binding)
    }

    /**
     * Resets the binding table to wrap a new range of descriptors, potentially for a different operator or initializer. This allows dynamic reuse of the binding table.
     * @param {Pointer<DML_BINDING_TABLE_DESC>} desc Type: <b>const [DML_BINDING_TABLE_DESC](/windows/win32/api/directml/ns-directml-dml_binding_table_desc)*</b>
     * 
     * An optional pointer to a [DML_BINDING_TABLE_DESC](/windows/win32/api/directml/ns-directml-dml_binding_table_desc) containing the binding table parameters. This may be <b>nullptr</b>, indicating an empty binding table.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-reset
     */
    Reset(desc) {
        result := ComCall(12, this, DML_BINDING_TABLE_DESC.Ptr, desc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDMLBindingTable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BindInputs := CallbackCreate(GetMethod(implObj, "BindInputs"), flags, 3)
        this.vtbl.BindOutputs := CallbackCreate(GetMethod(implObj, "BindOutputs"), flags, 3)
        this.vtbl.BindTemporaryResource := CallbackCreate(GetMethod(implObj, "BindTemporaryResource"), flags, 2)
        this.vtbl.BindPersistentResource := CallbackCreate(GetMethod(implObj, "BindPersistentResource"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BindInputs)
        CallbackFree(this.vtbl.BindOutputs)
        CallbackFree(this.vtbl.BindTemporaryResource)
        CallbackFree(this.vtbl.BindPersistentResource)
        CallbackFree(this.vtbl.Reset)
    }
}
