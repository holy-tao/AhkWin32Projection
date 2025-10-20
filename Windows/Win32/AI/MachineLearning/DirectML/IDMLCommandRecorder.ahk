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
     * 
     * @param {ID3D12CommandList} commandList 
     * @param {IDMLDispatchable} dispatchable 
     * @param {IDMLBindingTable} bindings 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlcommandrecorder-recorddispatch
     */
    RecordDispatch(commandList, dispatchable, bindings) {
        ComCall(8, this, "ptr", commandList, "ptr", dispatchable, "ptr", bindings)
    }
}
