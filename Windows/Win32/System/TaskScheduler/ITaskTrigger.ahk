#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TASK_TRIGGER.ahk" { TASK_TRIGGER }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the methods for accessing and setting triggers for a task. Triggers specify task start times, repetition criteria, and other parameters that control when a task is run.
 * @see https://learn.microsoft.com/windows/win32/api/mstask/nn-mstask-itasktrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskTrigger extends IUnknown {
    /**
     * The interface identifier for ITaskTrigger
     * @type {Guid}
     */
    static IID := Guid("{148bd52b-a2ab-11ce-b11f-00aa00530503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskTrigger interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTrigger       : IntPtr
        GetTrigger       : IntPtr
        GetTriggerString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskTrigger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetTrigger method sets the trigger criteria for a task trigger.
     * @remarks
     * The <b>wBeginDay</b>, <b>wBeginMonth</b>, and <b>wBeginYear</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure must be set to a valid day, month, and year respectively.
     * 
     * A task can have any number of triggers associated with it. The times that the task will run are the union of all the triggers defined for that task.
     * 
     * To update the task with these new trigger settings, applications must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-save">IPersistFile::Save</a> method after calling 
     * <b>SetTrigger</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itasktrigger-settrigger
     */
    SetTrigger(pTrigger) {
        result := ComCall(3, this, TASK_TRIGGER.Ptr, pTrigger, "HRESULT")
        return result
    }

    /**
     * The GetTrigger method retrieves the current task trigger.
     * @remarks
     * A scheduled work item can have one or more triggers defined. The times that the work item will run are the union of all the triggers defined for that item.
     * @returns {TASK_TRIGGER} A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure that contains the current task trigger. You must set the <b>cbTriggerSize</b> member of the 
     * <b>TASK_TRIGGER</b> structure to the size of the task trigger structure before passing the structure to this method.
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itasktrigger-gettrigger
     */
    GetTrigger() {
        pTrigger := TASK_TRIGGER()
        result := ComCall(4, this, TASK_TRIGGER.Ptr, pTrigger, "HRESULT")
        return pTrigger
    }

    /**
     * The GetTriggerString method retrieves the current task trigger in the form of a string. This string appears in the Task Scheduler user interface in a form similar to &quot;At 2PM every day, starting 5/11/97.&quot;.
     * @returns {PWSTR} A pointer to a pointer to a null-terminated string that describes the current task trigger. The method that invokes 
     * <b>GetTriggerString</b> is responsible for freeing this string using the <b>CoTaskMemFree</b> function.
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itasktrigger-gettriggerstring
     */
    GetTriggerString() {
        result := ComCall(5, this, PWSTR.Ptr, &ppwszTrigger := 0, "HRESULT")
        return ppwszTrigger
    }

    Query(iid) {
        if (ITaskTrigger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTrigger := CallbackCreate(GetMethod(implObj, "SetTrigger"), flags, 2)
        this.vtbl.GetTrigger := CallbackCreate(GetMethod(implObj, "GetTrigger"), flags, 2)
        this.vtbl.GetTriggerString := CallbackCreate(GetMethod(implObj, "GetTriggerString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTrigger)
        CallbackFree(this.vtbl.GetTrigger)
        CallbackFree(this.vtbl.GetTriggerString)
    }
}
