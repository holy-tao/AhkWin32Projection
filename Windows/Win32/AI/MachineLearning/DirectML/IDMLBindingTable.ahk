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
     * 
     * @param {Integer} bindingCount 
     * @param {Pointer<DML_BINDING_DESC>} bindings 
     * @returns {String} Nothing - always returns an empty string
     */
    BindInputs(bindingCount, bindings) {
        ComCall(8, this, "uint", bindingCount, "ptr", bindings)
        return result
    }

    /**
     * 
     * @param {Integer} bindingCount 
     * @param {Pointer<DML_BINDING_DESC>} bindings 
     * @returns {String} Nothing - always returns an empty string
     */
    BindOutputs(bindingCount, bindings) {
        ComCall(9, this, "uint", bindingCount, "ptr", bindings)
        return result
    }

    /**
     * 
     * @param {Pointer<DML_BINDING_DESC>} binding 
     * @returns {String} Nothing - always returns an empty string
     */
    BindTemporaryResource(binding) {
        ComCall(10, this, "ptr", binding)
        return result
    }

    /**
     * 
     * @param {Pointer<DML_BINDING_DESC>} binding 
     * @returns {String} Nothing - always returns an empty string
     */
    BindPersistentResource(binding) {
        ComCall(11, this, "ptr", binding)
        return result
    }

    /**
     * 
     * @param {Pointer<DML_BINDING_TABLE_DESC>} desc 
     * @returns {HRESULT} 
     */
    Reset(desc) {
        result := ComCall(12, this, "ptr", desc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
