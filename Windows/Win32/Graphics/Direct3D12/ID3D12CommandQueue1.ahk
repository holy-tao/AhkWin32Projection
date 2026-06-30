#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY.ahk
#Include .\D3D12_COMMAND_QUEUE_PROCESS_PRIORITY.ahk
#Include .\ID3D12CommandQueue.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class ID3D12CommandQueue1 extends ID3D12CommandQueue {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12CommandQueue1
     * @type {Guid}
     */
    static IID => Guid("{3a3c3165-0ee7-4b8e-a0af-6356b4c3bbb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProcessPriority", "GetProcessPriority", "SetGlobalPriority", "GetGlobalPriority"]

    /**
     * 
     * @param {D3D12_COMMAND_QUEUE_PROCESS_PRIORITY} _Priority 
     * @returns {HRESULT} 
     */
    SetProcessPriority(_Priority) {
        result := ComCall(19, this, "int", _Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMMAND_QUEUE_PROCESS_PRIORITY>} pOutValue 
     * @returns {HRESULT} 
     */
    GetProcessPriority(pOutValue) {
        pOutValueMarshal := pOutValue is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pOutValueMarshal, pOutValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY} _Priority 
     * @returns {HRESULT} 
     */
    SetGlobalPriority(_Priority) {
        result := ComCall(21, this, "int", _Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY>} pOutValue 
     * @returns {HRESULT} 
     */
    GetGlobalPriority(pOutValue) {
        pOutValueMarshal := pOutValue is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pOutValueMarshal, pOutValue, "HRESULT")
        return result
    }
}
