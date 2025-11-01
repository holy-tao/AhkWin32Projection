#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for accessing and setting triggers for a task. Triggers specify task start times, repetition criteria, and other parameters that control when a task is run.
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-itasktrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskTrigger extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskTrigger
     * @type {Guid}
     */
    static IID => Guid("{148bd52b-a2ab-11ce-b11f-00aa00530503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTrigger", "GetTrigger", "GetTriggerString"]

    /**
     * 
     * @param {Pointer<TASK_TRIGGER>} pTrigger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itasktrigger-settrigger
     */
    SetTrigger(pTrigger) {
        result := ComCall(3, this, "ptr", pTrigger, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TASK_TRIGGER>} pTrigger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itasktrigger-gettrigger
     */
    GetTrigger(pTrigger) {
        result := ComCall(4, this, "ptr", pTrigger, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszTrigger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itasktrigger-gettriggerstring
     */
    GetTriggerString(ppwszTrigger) {
        result := ComCall(5, this, "ptr", ppwszTrigger, "HRESULT")
        return result
    }
}
