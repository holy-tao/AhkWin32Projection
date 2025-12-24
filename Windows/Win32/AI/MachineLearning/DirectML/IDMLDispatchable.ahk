#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLPageable.ahk

/**
 * Implemented by objects that can be recorded into a command list for dispatch on the GPU, using IDMLCommandRecorder::RecordDispatch.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmldispatchable
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLDispatchable extends IDMLPageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLDispatchable
     * @type {Guid}
     */
    static IID => Guid("{dcb821a8-1039-441e-9f1c-b1759c2f3cec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBindingProperties"]

    /**
     * Retrieves the binding properties for a dispatchable object (an operator initializer, or a compiled operator).
     * @returns {DML_BINDING_PROPERTIES} Type: [**DML_BINDING_PROPERTIES**](/windows/win32/api/directml/ns-directml-dml_binding_properties)
     * 
     * A [DML_BINDING_PROPERTIES](/windows/win32/api/directml/ns-directml-dml_binding_properties) value containing binding properties.
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmldispatchable-getbindingproperties
     */
    GetBindingProperties() {
        result := ComCall(8, this, "ptr")
        return result
    }
}
