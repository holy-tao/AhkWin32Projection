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
     * 
     * @param {Pointer<TASK_TRIGGER>} pTrigger 
     * @returns {HRESULT} 
     */
    SetTrigger(pTrigger) {
        result := ComCall(3, this, "ptr", pTrigger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TASK_TRIGGER>} pTrigger 
     * @returns {HRESULT} 
     */
    GetTrigger(pTrigger) {
        result := ComCall(4, this, "ptr", pTrigger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszTrigger 
     * @returns {HRESULT} 
     */
    GetTriggerString(ppwszTrigger) {
        result := ComCall(5, this, "ptr", ppwszTrigger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
