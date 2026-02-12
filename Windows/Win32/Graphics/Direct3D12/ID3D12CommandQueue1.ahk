#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12CommandQueue.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CommandQueue1 extends ID3D12CommandQueue{

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
     * Disables or enables the ability of the system to temporarily boost the priority of the threads of the specified process.
     * @remarks
     * When a thread is running in one of the dynamic priority classes, the system temporarily boosts the thread's priority when it is taken out of a wait state. If 
     * <b>SetProcessPriorityBoost</b> is called with the <i>DisablePriorityBoost</i> parameter set to TRUE, its threads' priorities are not boosted. This setting affects all existing threads and any threads subsequently created by the process. To restore normal behavior, call 
     * <b>SetProcessPriorityBoost</b> with <i>DisablePriorityBoost</i> set to FALSE.
     * @param {Integer} Priority_ 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-setprocesspriorityboost
     */
    SetProcessPriority(Priority_) {
        result := ComCall(19, this, "int", Priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the priority boost control state of the specified process.
     * @param {Pointer<Integer>} pOutValue 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero. In that case, the variable pointed to by the <i>pDisablePriorityBoost</i> parameter receives the priority boost control state.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-getprocesspriorityboost
     */
    GetProcessPriority(pOutValue) {
        pOutValueMarshal := pOutValue is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pOutValueMarshal, pOutValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Priority_ 
     * @returns {HRESULT} 
     */
    SetGlobalPriority(Priority_) {
        result := ComCall(21, this, "int", Priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pOutValue 
     * @returns {HRESULT} 
     */
    GetGlobalPriority(pOutValue) {
        pOutValueMarshal := pOutValue is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pOutValueMarshal, pOutValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
