#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITrigger.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods that are used to add to, remove from, and get the triggers of a task.
 * @remarks
 * 
 * When reading or writing XML for a task, the triggers for the task are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-triggers-tasktype-element">Triggers</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itriggercollection
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITriggerCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITriggerCollection
     * @type {Guid}
     */
    static IID => Guid("{85df5081-1b24-4f32-878a-d9d14df4cb77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Create", "Remove", "Clear"]

    /**
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Gets the number of triggers in the collection.
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itriggercollection-get_count
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * Gets the specified trigger from the collection.
     * @remarks
     * 
     * Collections are 1-based. That is, the index for the first item in the collection is 1.
     * 
     * 
     * @param {Integer} index 
     * @returns {ITrigger} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itriggercollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "int", index, "ptr*", &ppTrigger := 0, "HRESULT")
        return ITrigger(ppTrigger)
    }

    /**
     * Gets the collection enumerator for the trigger collection.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itriggercollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    /**
     * Creates a new trigger for the task.
     * @param {Integer} type This parameter is set to one of the following  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/ne-taskschd-task_trigger_type2">TASK_TRIGGER_TYPE2</a> enumeration constants.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_EVENT"></a><a id="task_trigger_event"></a><dl>
     * <dt><b>TASK_TRIGGER_EVENT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task when a specific event occurs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_TIME"></a><a id="task_trigger_time"></a><dl>
     * <dt><b>TASK_TRIGGER_TIME</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task at a specific time of day.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_DAILY"></a><a id="task_trigger_daily"></a><dl>
     * <dt><b>TASK_TRIGGER_DAILY</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task on a daily schedule. For example, the task starts at a specific time every day, every-other day, every third day, and so on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_WEEKLY"></a><a id="task_trigger_weekly"></a><dl>
     * <dt><b>TASK_TRIGGER_WEEKLY</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task on a weekly schedule. For example, the task starts at 8:00 AM on a specific day every week or other week.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_MONTHLY"></a><a id="task_trigger_monthly"></a><dl>
     * <dt><b>TASK_TRIGGER_MONTHLY</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task on a monthly schedule. For example, the task starts on specific days of specific months.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_MONTHLYDOW"></a><a id="task_trigger_monthlydow"></a><dl>
     * <dt><b>TASK_TRIGGER_MONTHLYDOW</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task on a monthly day-of-week schedule. For example, the task starts on a specific   days of the week, weeks of the  month, and months of the year.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_IDLE"></a><a id="task_trigger_idle"></a><dl>
     * <dt><b>TASK_TRIGGER_IDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task when the computer goes into an idle state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_REGISTRATION"></a><a id="task_trigger_registration"></a><dl>
     * <dt><b>TASK_TRIGGER_REGISTRATION</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task when the task is registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_BOOT"></a><a id="task_trigger_boot"></a><dl>
     * <dt><b>TASK_TRIGGER_BOOT</b></dt>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task when the computer boots.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_LOGON"></a><a id="task_trigger_logon"></a><dl>
     * <dt><b>TASK_TRIGGER_LOGON</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task when a specific user logs on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TRIGGER_SESSION_STATE_CHANGE"></a><a id="task_trigger_session_state_change"></a><dl>
     * <dt><b>TASK_TRIGGER_SESSION_STATE_CHANGE</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triggers the task when a specific session state changes.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {ITrigger} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itrigger">ITrigger</a> interface that represents the new trigger.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itrigger">ITrigger</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itriggercollection-create
     */
    Create(type) {
        result := ComCall(10, this, "int", type, "ptr*", &ppTrigger := 0, "HRESULT")
        return ITrigger(ppTrigger)
    }

    /**
     * Removes the specified trigger from the collection of triggers used by the task.
     * @param {VARIANT} index The index of the trigger to be removed. Use a LONG value for the index number.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itriggercollection-remove
     */
    Remove(index) {
        result := ComCall(11, this, "ptr", index, "HRESULT")
        return result
    }

    /**
     * Clears all triggers from the collection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itriggercollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
