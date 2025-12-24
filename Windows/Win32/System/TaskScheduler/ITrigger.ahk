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
     */
    Type {
        get => this.get_Type()
    }

    /**
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * @type {IRepetitionPattern} 
     */
    Repetition {
        get => this.get_Repetition()
        set => this.put_Repetition(value)
    }

    /**
     */
    ExecutionTimeLimit {
        get => this.get_ExecutionTimeLimit()
        set => this.put_ExecutionTimeLimit(value)
    }

    /**
     */
    StartBoundary {
        get => this.get_StartBoundary()
        set => this.put_StartBoundary(value)
    }

    /**
     */
    EndBoundary {
        get => this.get_EndBoundary()
        set => this.put_EndBoundary(value)
    }

    /**
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Gets the type of the trigger.
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-get_type
     */
    get_Type(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier for the trigger.
     * @remarks
     * 
     * When reading or writing XML for a task, the trigger identifier is specified in the Id attribute of the individual trigger elements (for example, the Id attribute of the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-boottrigger-triggergroup-element">BootTrigger</a> element) of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-get_id
     */
    get_Id(pId) {
        result := ComCall(8, this, "ptr", pId, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier for the trigger.
     * @remarks
     * 
     * When reading or writing XML for a task, the trigger identifier is specified in the Id attribute of the individual trigger elements (for example, the Id attribute of the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-boottrigger-triggergroup-element">BootTrigger</a> element) of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} id 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-put_id
     */
    put_Id(id) {
        id := id is String ? BSTR.Alloc(id).Value : id

        result := ComCall(9, this, "ptr", id, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates how often the task is run and how long the repetition pattern is repeated after the task is started.
     * @remarks
     * 
     * When reading or writing your own XML for a task, the repetition pattern for a trigger is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-repetition-triggerbasetype-element">Repetition</a> element of the Task Scheduler schema.
     * 
     * 
     * 
     * @returns {IRepetitionPattern} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-get_repetition
     */
    get_Repetition() {
        result := ComCall(10, this, "ptr*", &ppRepeat := 0, "HRESULT")
        return IRepetitionPattern(ppRepeat)
    }

    /**
     * Gets or sets a value that indicates how often the task is run and how long the repetition pattern is repeated after the task is started.
     * @remarks
     * 
     * When reading or writing your own XML for a task, the repetition pattern for a trigger is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-repetition-triggerbasetype-element">Repetition</a> element of the Task Scheduler schema.
     * 
     * 
     * 
     * @param {IRepetitionPattern} pRepeat 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-put_repetition
     */
    put_Repetition(pRepeat) {
        result := ComCall(11, this, "ptr", pRepeat, "HRESULT")
        return result
    }

    /**
     * Gets or sets the maximum amount of time that the task launched by this trigger is allowed to run.
     * @remarks
     * 
     * The format for this string is PnYnMnDTnHnMnS, where nY is the number of years, nM is the number of months, nD is the number of days, 'T' is the date/time separator, nH is the number of hours, nM is the number of minutes, and nS is the number of seconds (for example, PT5M specifies 5 minutes and P1M4DT2H5M specifies one month, four days, two hours, and five minutes).
     * 
     * When reading or writing XML for a task, the execution time limit is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-executiontimelimit-triggerbasetype-element">ExecutionTimeLimit</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pTimeLimit 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-get_executiontimelimit
     */
    get_ExecutionTimeLimit(pTimeLimit) {
        result := ComCall(12, this, "ptr", pTimeLimit, "HRESULT")
        return result
    }

    /**
     * Gets or sets the maximum amount of time that the task launched by this trigger is allowed to run.
     * @remarks
     * 
     * The format for this string is PnYnMnDTnHnMnS, where nY is the number of years, nM is the number of months, nD is the number of days, 'T' is the date/time separator, nH is the number of hours, nM is the number of minutes, and nS is the number of seconds (for example, PT5M specifies 5 minutes and P1M4DT2H5M specifies one month, four days, two hours, and five minutes).
     * 
     * When reading or writing XML for a task, the execution time limit is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-executiontimelimit-triggerbasetype-element">ExecutionTimeLimit</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} timelimit 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-put_executiontimelimit
     */
    put_ExecutionTimeLimit(timelimit) {
        timelimit := timelimit is String ? BSTR.Alloc(timelimit).Value : timelimit

        result := ComCall(13, this, "ptr", timelimit, "HRESULT")
        return result
    }

    /**
     * Gets or sets the date and time when the trigger is activated.
     * @remarks
     * 
     * The date and time must be in the following format: YYYY-MM-DDTHH:MM:SS(+-)HH:MM. The (+-)HH:MM section of the format defines a certain number of hours and minutes ahead or behind Coordinated Universal Time (UTC). For example the date October 11th, 2005 at 1:21:17 with an offset of eight hours behind UTC would be written as 2005-10-11T13:21:17-08:00. If Z is specified for the UTC offset (for example, 2005-10-11T13:21:17Z), then the no offset from UTC will be used. If you do not specify any offset time or Z for the offset (for example, 2005-10-11T13:21:17), then the time zone and daylight saving information that is set on the local computer will be used.  When an offset is specified (using hours and minutes or Z), then the time and offset are always used regardless of the time zone and daylight saving settings on the local computer.
     * 
     * When reading or writing XML for a task, the trigger start boundary is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element">StartBoundary</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pStart 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-get_startboundary
     */
    get_StartBoundary(pStart) {
        result := ComCall(14, this, "ptr", pStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets the date and time when the trigger is activated.
     * @remarks
     * 
     * The date and time must be in the following format: YYYY-MM-DDTHH:MM:SS(+-)HH:MM. The (+-)HH:MM section of the format defines a certain number of hours and minutes ahead or behind Coordinated Universal Time (UTC). For example the date October 11th, 2005 at 1:21:17 with an offset of eight hours behind UTC would be written as 2005-10-11T13:21:17-08:00. If Z is specified for the UTC offset (for example, 2005-10-11T13:21:17Z), then the no offset from UTC will be used. If you do not specify any offset time or Z for the offset (for example, 2005-10-11T13:21:17), then the time zone and daylight saving information that is set on the local computer will be used.  When an offset is specified (using hours and minutes or Z), then the time and offset are always used regardless of the time zone and daylight saving settings on the local computer.
     * 
     * When reading or writing XML for a task, the trigger start boundary is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element">StartBoundary</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} start 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-put_startboundary
     */
    put_StartBoundary(start) {
        start := start is String ? BSTR.Alloc(start).Value : start

        result := ComCall(15, this, "ptr", start, "HRESULT")
        return result
    }

    /**
     * Gets or sets the date and time when the trigger is deactivated.
     * @remarks
     * 
     * The date and time must be in the following format: YYYY-MM-DDTHH:MM:SS(+-)HH:MM. The (+-)HH:MM section of the format defines a certain number of hours and minutes ahead or behind Coordinated Universal Time (UTC). For example the date October 11th, 2005 at 1:21:17 with an offset of eight hours behind UTC would be written as 2005-10-11T13:21:17-08:00. If Z is specified for the UTC offset (for example, 2005-10-11T13:21:17Z), then the no offset from UTC will be used. If you do not specify any offset time or Z for the offset (for example, 2005-10-11T13:21:17), then the time zone and daylight saving information that is set on the local computer will be used.  When an offset is specified (using hours and minutes or Z), then the time and offset are always used regardless of the time zone and daylight saving settings on the local computer.
     * 
     * When reading or writing XML for a task, the trigger end boundary is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-endboundary-triggerbasetype-element">EndBoundary</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pEnd 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-get_endboundary
     */
    get_EndBoundary(pEnd) {
        result := ComCall(16, this, "ptr", pEnd, "HRESULT")
        return result
    }

    /**
     * Gets or sets the date and time when the trigger is deactivated.
     * @remarks
     * 
     * The date and time must be in the following format: YYYY-MM-DDTHH:MM:SS(+-)HH:MM. The (+-)HH:MM section of the format defines a certain number of hours and minutes ahead or behind Coordinated Universal Time (UTC). For example the date October 11th, 2005 at 1:21:17 with an offset of eight hours behind UTC would be written as 2005-10-11T13:21:17-08:00. If Z is specified for the UTC offset (for example, 2005-10-11T13:21:17Z), then the no offset from UTC will be used. If you do not specify any offset time or Z for the offset (for example, 2005-10-11T13:21:17), then the time zone and daylight saving information that is set on the local computer will be used.  When an offset is specified (using hours and minutes or Z), then the time and offset are always used regardless of the time zone and daylight saving settings on the local computer.
     * 
     * When reading or writing XML for a task, the trigger end boundary is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-endboundary-triggerbasetype-element">EndBoundary</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} end 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-put_endboundary
     */
    put_EndBoundary(end) {
        end := end is String ? BSTR.Alloc(end).Value : end

        result := ComCall(17, this, "ptr", end, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates whether the trigger is enabled.
     * @remarks
     * 
     * When reading or writing XML for a task, the enabled property is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-enabled-triggerbasetype-element">Enabled</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-get_enabled
     */
    get_Enabled(pEnabled) {
        pEnabledMarshal := pEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(18, this, pEnabledMarshal, pEnabled, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates whether the trigger is enabled.
     * @remarks
     * 
     * When reading or writing XML for a task, the enabled property is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-enabled-triggerbasetype-element">Enabled</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itrigger-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(19, this, "short", enabled, "HRESULT")
        return result
    }
}
