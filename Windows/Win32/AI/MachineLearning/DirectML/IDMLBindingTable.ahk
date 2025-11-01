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
     * 
     * @param {Integer} bindingCount 
     * @param {Pointer<DML_BINDING_DESC>} bindings 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-bindinputs
     */
    BindInputs(bindingCount, bindings) {
        ComCall(8, this, "uint", bindingCount, "ptr", bindings)
    }

    /**
     * 
     * @param {Integer} bindingCount 
     * @param {Pointer<DML_BINDING_DESC>} bindings 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-bindoutputs
     */
    BindOutputs(bindingCount, bindings) {
        ComCall(9, this, "uint", bindingCount, "ptr", bindings)
    }

    /**
     * 
     * @param {Pointer<DML_BINDING_DESC>} binding 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-bindtemporaryresource
     */
    BindTemporaryResource(binding) {
        ComCall(10, this, "ptr", binding)
    }

    /**
     * 
     * @param {Pointer<DML_BINDING_DESC>} binding 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-bindpersistentresource
     */
    BindPersistentResource(binding) {
        ComCall(11, this, "ptr", binding)
    }

    /**
     * 
     * @param {Pointer<DML_BINDING_TABLE_DESC>} desc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlbindingtable-reset
     */
    Reset(desc) {
        result := ComCall(12, this, "ptr", desc, "HRESULT")
        return result
    }
}
