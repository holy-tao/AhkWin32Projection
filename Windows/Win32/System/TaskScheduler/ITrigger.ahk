#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRepetitionPattern.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Id", "put_Id", "get_Repetition", "put_Repetition", "get_ExecutionTimeLimit", "put_ExecutionTimeLimit", "get_StartBoundary", "put_StartBoundary", "get_EndBoundary", "put_EndBoundary", "get_Enabled", "put_Enabled"]

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-get_type
     */
    get_Type(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-get_id
     */
    get_Id(pId) {
        result := ComCall(8, this, "ptr", pId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-put_id
     */
    put_Id(id) {
        id := id is String ? BSTR.Alloc(id).Value : id

        result := ComCall(9, this, "ptr", id, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRepetitionPattern} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-get_repetition
     */
    get_Repetition() {
        result := ComCall(10, this, "ptr*", &ppRepeat := 0, "HRESULT")
        return IRepetitionPattern(ppRepeat)
    }

    /**
     * 
     * @param {IRepetitionPattern} pRepeat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-put_repetition
     */
    put_Repetition(pRepeat) {
        result := ComCall(11, this, "ptr", pRepeat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTimeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-get_executiontimelimit
     */
    get_ExecutionTimeLimit(pTimeLimit) {
        result := ComCall(12, this, "ptr", pTimeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} timelimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-put_executiontimelimit
     */
    put_ExecutionTimeLimit(timelimit) {
        timelimit := timelimit is String ? BSTR.Alloc(timelimit).Value : timelimit

        result := ComCall(13, this, "ptr", timelimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-get_startboundary
     */
    get_StartBoundary(pStart) {
        result := ComCall(14, this, "ptr", pStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} start 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-put_startboundary
     */
    put_StartBoundary(start) {
        start := start is String ? BSTR.Alloc(start).Value : start

        result := ComCall(15, this, "ptr", start, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-get_endboundary
     */
    get_EndBoundary(pEnd) {
        result := ComCall(16, this, "ptr", pEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} end 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-put_endboundary
     */
    put_EndBoundary(end) {
        end := end is String ? BSTR.Alloc(end).Value : end

        result := ComCall(17, this, "ptr", end, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-get_enabled
     */
    get_Enabled(pEnabled) {
        pEnabledMarshal := pEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(18, this, pEnabledMarshal, pEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itrigger-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(19, this, "short", enabled, "HRESULT")
        return result
    }
}
