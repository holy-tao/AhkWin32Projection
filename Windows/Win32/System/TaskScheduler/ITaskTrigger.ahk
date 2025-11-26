#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TASK_TRIGGER.ahk
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
     * The SetTrigger method sets the trigger criteria for a task trigger.
     * @param {Pointer<TASK_TRIGGER>} pTrigger A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure that contains the values that define the new task trigger.
     * @returns {HRESULT} The 
     * <b>SetTrigger</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itasktrigger-settrigger
     */
    SetTrigger(pTrigger) {
        result := ComCall(3, this, "ptr", pTrigger, "HRESULT")
        return result
    }

    /**
     * The GetTrigger method retrieves the current task trigger.
     * @returns {TASK_TRIGGER} A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure that contains the current task trigger. You must set the <b>cbTriggerSize</b> member of the 
     * <b>TASK_TRIGGER</b> structure to the size of the task trigger structure before passing the structure to this method.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itasktrigger-gettrigger
     */
    GetTrigger() {
        pTrigger := TASK_TRIGGER()
        result := ComCall(4, this, "ptr", pTrigger, "HRESULT")
        return pTrigger
    }

    /**
     * The GetTriggerString method retrieves the current task trigger in the form of a string. This string appears in the Task Scheduler user interface in a form similar to &quot;At 2PM every day, starting 5/11/97.&quot;.
     * @returns {PWSTR} A pointer to a pointer to a null-terminated string that describes the current task trigger. The method that invokes 
     * <b>GetTriggerString</b> is responsible for freeing this string using the <b>CoTaskMemFree</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itasktrigger-gettriggerstring
     */
    GetTriggerString() {
        result := ComCall(5, this, "ptr*", &ppwszTrigger := 0, "HRESULT")
        return ppwszTrigger
    }
}
