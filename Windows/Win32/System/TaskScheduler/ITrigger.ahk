#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the common properties that are inherited by all trigger objects.
 * @remarks
 * 
  * Task Scheduler provides the following individual interfaces for the different triggers that a task can use: 
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iboottrigger">IBootTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-idailytrigger">IDailyTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iidletrigger">IIdleTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ilogontrigger">ILogonTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-imonthlydowtrigger">IMonthlyDOWTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-imonthlytrigger">IMonthlyTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iregistrationtrigger">IRegistrationTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itimetrigger">ITimeTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iweeklytrigger">IWeeklyTrigger</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-isessionstatechangetrigger">ISessionStateChangeTrigger</a>
  * </li>
  * </ul>
  * 
  * 
  * When reading or writing XML, the triggers of a task are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-triggers-tasktype-element">Triggers</a> element of the Task Scheduler schema. 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITrigger extends IDispatch{
    /**
     * The interface identifier for ITrigger
     * @type {Guid}
     */
    static IID => Guid("{09941815-ea89-4b5b-89e0-2a773801fac3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        result := ComCall(7, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     */
    get_Id(pId) {
        result := ComCall(8, this, "ptr", pId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} id 
     * @returns {HRESULT} 
     */
    put_Id(id) {
        id := id is String ? BSTR.Alloc(id).Value : id

        result := ComCall(9, this, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRepetitionPattern>} ppRepeat 
     * @returns {HRESULT} 
     */
    get_Repetition(ppRepeat) {
        result := ComCall(10, this, "ptr", ppRepeat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRepetitionPattern>} pRepeat 
     * @returns {HRESULT} 
     */
    put_Repetition(pRepeat) {
        result := ComCall(11, this, "ptr", pRepeat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTimeLimit 
     * @returns {HRESULT} 
     */
    get_ExecutionTimeLimit(pTimeLimit) {
        result := ComCall(12, this, "ptr", pTimeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} timelimit 
     * @returns {HRESULT} 
     */
    put_ExecutionTimeLimit(timelimit) {
        timelimit := timelimit is String ? BSTR.Alloc(timelimit).Value : timelimit

        result := ComCall(13, this, "ptr", timelimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pStart 
     * @returns {HRESULT} 
     */
    get_StartBoundary(pStart) {
        result := ComCall(14, this, "ptr", pStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} start 
     * @returns {HRESULT} 
     */
    put_StartBoundary(start) {
        start := start is String ? BSTR.Alloc(start).Value : start

        result := ComCall(15, this, "ptr", start, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pEnd 
     * @returns {HRESULT} 
     */
    get_EndBoundary(pEnd) {
        result := ComCall(16, this, "ptr", pEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} end 
     * @returns {HRESULT} 
     */
    put_EndBoundary(end) {
        end := end is String ? BSTR.Alloc(end).Value : end

        result := ComCall(17, this, "ptr", end, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnabled 
     * @returns {HRESULT} 
     */
    get_Enabled(pEnabled) {
        result := ComCall(18, this, "ptr", pEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     */
    put_Enabled(enabled) {
        result := ComCall(19, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
