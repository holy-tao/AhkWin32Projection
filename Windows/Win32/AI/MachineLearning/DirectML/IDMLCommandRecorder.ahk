#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Graphics\Direct3D12\ID3D12CommandList.ahk" { ID3D12CommandList }
#Import ".\IDMLDispatchable.ahk" { IDMLDispatchable }
#Import ".\IDMLBindingTable.ahk" { IDMLBindingTable }
#Import ".\IDMLDeviceChild.ahk" { IDMLDeviceChild }

/**
 * Records dispatches of DirectML work into a Direct3D 12 command list.
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmlcommandrecorder
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLCommandRecorder extends IDMLDeviceChild {
    /**
     * The interface identifier for IDMLCommandRecorder
     * @type {Guid}
     */
    static IID := Guid("{e6857a76-2e3e-4fdd-bff4-5d2ba10fb453}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLCommandRecorder interfaces
    */
    struct Vtbl extends IDMLDeviceChild.Vtbl {
        RecordDispatch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLCommandRecorder.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlcommandrecorder-recorddispatch
     */
    RecordDispatch(commandList, dispatchable, bindings) {
        ComCall(8, this, "ptr", commandList, "ptr", dispatchable, "ptr", bindings)
    }

    Query(iid) {
        if (IDMLCommandRecorder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RecordDispatch := CallbackCreate(GetMethod(implObj, "RecordDispatch"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RecordDispatch)
    }
}
