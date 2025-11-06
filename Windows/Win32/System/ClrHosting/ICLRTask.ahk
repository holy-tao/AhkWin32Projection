#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\COR_GC_THREAD_STATS.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRTask extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRTask
     * @type {Guid}
     */
    static IID => Guid("{28e66a4a-9906-4225-b231-9187c3eb8611}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SwitchIn", "SwitchOut", "GetMemStats", "Reset", "ExitTask", "Abort", "RudeAbort", "NeedsPriorityScheduling", "YieldTask", "LocksHeld", "SetTaskIdentifier"]

    /**
     * 
     * @param {HANDLE} threadHandle 
     * @returns {HRESULT} 
     */
    SwitchIn(threadHandle) {
        threadHandle := threadHandle is Win32Handle ? NumGet(threadHandle, "ptr") : threadHandle

        result := ComCall(3, this, "ptr", threadHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchOut() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {COR_GC_THREAD_STATS} 
     */
    GetMemStats() {
        memUsage := COR_GC_THREAD_STATS()
        result := ComCall(5, this, "ptr", memUsage, "HRESULT")
        return memUsage
    }

    /**
     * 
     * @param {BOOL} fFull 
     * @returns {HRESULT} 
     */
    Reset(fFull) {
        result := ComCall(6, this, "int", fFull, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExitTask() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RudeAbort() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    NeedsPriorityScheduling() {
        result := ComCall(10, this, "int*", &pbNeedsPriorityScheduling := 0, "HRESULT")
        return pbNeedsPriorityScheduling
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    YieldTask() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    LocksHeld() {
        result := ComCall(12, this, "ptr*", &pLockCount := 0, "HRESULT")
        return pLockCount
    }

    /**
     * 
     * @param {Integer} asked 
     * @returns {HRESULT} 
     */
    SetTaskIdentifier(asked) {
        result := ComCall(13, this, "uint", asked, "HRESULT")
        return result
    }
}
