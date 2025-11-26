#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLDeviceChild.ahk

/**
 * Records dispatches of DirectML work into a Direct3D 12 command list.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmlcommandrecorder
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLCommandRecorder extends IDMLDeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLCommandRecorder
     * @type {Guid}
     */
    static IID => Guid("{e6857a76-2e3e-4fdd-bff4-5d2ba10fb453}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RecordDispatch"]

    /**
     * Records execution of a dispatchable object (an operator initializer, or a compiled operator) onto a command list.
     * @param {ID3D12CommandList} commandList Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandlist">ID3D12CommandList</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandlist">ID3D12CommandList</a> interface representing the command list to record the execution into. The command list must be open and must have type
     *           <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_list_type">D3D12_COMMAND_LIST_TYPE_DIRECT</a> or <b>D3D12_COMMAND_LIST_TYPE_COMPUTE</b>.
     * @param {IDMLDispatchable} dispatchable Type: <b>[IDMLDispatchable](/windows/win32/api/directml/nn-directml-idmldispatchable)*</b>
     * 
     * A pointer to an [IDMLDispatchable](/windows/win32/api/directml/nn-directml-idmldispatchable) interface representing the object (an operator initializer, or a compiled operator) whose execution will be recorded into the command list.
     * @param {IDMLBindingTable} bindings Type: <b>[IDMLBindingTable](/windows/win32/api/directml/nn-directml-idmlbindingtable)*</b>
     * 
     * A pointer to an [IDMLBindingTable](/windows/win32/api/directml/nn-directml-idmlbindingtable) interface representing the bindings to use for executing the dispatchable object. If the [DML_EXECUTION_FLAG_DESCRIPTORS_VOLATILE](/windows/win32/api/directml/ne-directml-dml_execution_flags)
     *           flag was not set, then you must fill out all required bindings, otherwise an error will result.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlcommandrecorder-recorddispatch
     */
    RecordDispatch(commandList, dispatchable, bindings) {
        ComCall(8, this, "ptr", commandList, "ptr", dispatchable, "ptr", bindings)
    }
}
