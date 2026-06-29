#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12CommandQueue.ahk" { ID3D12CommandQueue }
#Import ".\D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY.ahk" { D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_COMMAND_QUEUE_PROCESS_PRIORITY.ahk" { D3D12_COMMAND_QUEUE_PROCESS_PRIORITY }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12CommandQueue1 extends ID3D12CommandQueue {
    /**
     * The interface identifier for ID3D12CommandQueue1
     * @type {Guid}
     */
    static IID := Guid("{3a3c3165-0ee7-4b8e-a0af-6356b4c3bbb9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12CommandQueue1 interfaces
    */
    struct Vtbl extends ID3D12CommandQueue.Vtbl {
        SetProcessPriority : IntPtr
        GetProcessPriority : IntPtr
        SetGlobalPriority  : IntPtr
        GetGlobalPriority  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12CommandQueue1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {D3D12_COMMAND_QUEUE_PROCESS_PRIORITY} _Priority 
     * @returns {HRESULT} 
     */
    SetProcessPriority(_Priority) {
        result := ComCall(19, this, D3D12_COMMAND_QUEUE_PROCESS_PRIORITY, _Priority, "HRESULT")
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
        result := ComCall(21, this, D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY, _Priority, "HRESULT")
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

    Query(iid) {
        if (ID3D12CommandQueue1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProcessPriority := CallbackCreate(GetMethod(implObj, "SetProcessPriority"), flags, 2)
        this.vtbl.GetProcessPriority := CallbackCreate(GetMethod(implObj, "GetProcessPriority"), flags, 2)
        this.vtbl.SetGlobalPriority := CallbackCreate(GetMethod(implObj, "SetGlobalPriority"), flags, 2)
        this.vtbl.GetGlobalPriority := CallbackCreate(GetMethod(implObj, "GetGlobalPriority"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProcessPriority)
        CallbackFree(this.vtbl.GetProcessPriority)
        CallbackFree(this.vtbl.SetGlobalPriority)
        CallbackFree(this.vtbl.GetGlobalPriority)
    }
}
