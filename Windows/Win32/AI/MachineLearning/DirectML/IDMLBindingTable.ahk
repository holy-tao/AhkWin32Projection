#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLDeviceChild.ahk

/**
 * Wraps a range of an application-managed descriptor heap, and is used by DirectML to create bindings for resources. To create this object, call IDMLDevice::CreateBindingTable.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmlbindingtable
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLBindingTable extends IDMLDeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLBindingTable
     * @type {Guid}
     */
    static IID => Guid("{29c687dc-de74-4e3b-ab00-1168f2fc3cfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindInputs", "BindOutputs", "BindTemporaryResource", "BindPersistentResource", "Reset"]

    /**
     * Binds a set of resources as input tensors.
     * @param {Integer} bindingCount Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This parameter determines the size of the *bindings* array (if provided).
     * @param {Pointer<DML_BINDING_DESC>} bindings Type: **const [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc)\***
     * 
     * An optional pointer to a constant array of [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc) containing descriptions of the tensor resources to bind.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlbindingtable-bindinputs
     */
    BindInputs(bindingCount, bindings) {
        ComCall(8, this, "uint", bindingCount, "ptr", bindings)
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
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlbindingtable-bindoutputs
     */
    BindOutputs(bindingCount, bindings) {
        ComCall(9, this, "uint", bindingCount, "ptr", bindings)
    }

    /**
     * Binds a buffer to use as temporary scratch memory. You can determine the required size of this buffer range by calling IDMLDispatchable::GetBindingProperties.
     * @param {Pointer<DML_BINDING_DESC>} binding Type: <b>const [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc)*</b>
     * 
     * An optional pointer to a [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc) containing the description of a tensor resource to bind.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlbindingtable-bindtemporaryresource
     */
    BindTemporaryResource(binding) {
        ComCall(10, this, "ptr", binding)
    }

    /**
     * Binds a buffer as a persistent resource. You can determine the required size of this buffer range by calling IDMLDispatchable::GetBindingProperties.
     * @param {Pointer<DML_BINDING_DESC>} binding Type: <b>const [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc)*</b>
     * 
     * An optional pointer to a [DML_BINDING_DESC](/windows/win32/api/directml/ns-directml-dml_binding_desc) containing the description of a tensor resource to bind.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlbindingtable-bindpersistentresource
     */
    BindPersistentResource(binding) {
        ComCall(11, this, "ptr", binding)
    }

    /**
     * Resets the binding table to wrap a new range of descriptors, potentially for a different operator or initializer. This allows dynamic reuse of the binding table.
     * @param {Pointer<DML_BINDING_TABLE_DESC>} desc Type: <b>const [DML_BINDING_TABLE_DESC](/windows/win32/api/directml/ns-directml-dml_binding_table_desc)*</b>
     * 
     * An optional pointer to a [DML_BINDING_TABLE_DESC](/windows/win32/api/directml/ns-directml-dml_binding_table_desc) containing the binding table parameters. This may be <b>nullptr</b>, indicating an empty binding table.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlbindingtable-reset
     */
    Reset(desc) {
        result := ComCall(12, this, "ptr", desc, "HRESULT")
        return result
    }
}
