#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Defines how often the task is run and how long the repetition pattern is repeated after the task is started.
 * @remarks
 * 
 * If you specify a repetition duration for a task, you must also specify the repetition interval.
 * 
 * If you register a task that contains a  trigger with a repetition interval equal to one minute and a repetition duration equal to four minutes, the task will be launched five times. The five repetitions can be defined by the following pattern.
 * 
 * <ol>
 * <li>A task  starts at the beginning of the first minute.</li>
 * <li>The next task starts at the end of the first minute.</li>
 * <li>The next task starts at the end of the second minute.</li>
 * <li>The next task starts at the end of the third minute.</li>
 * <li>The next task starts at the end of the fourth minute.</li>
 * </ol>
 * <b>Windows Server 2003, Windows XP and Windows 2000:  </b>If you register a task that contains a trigger with a repetition interval equal to one minute and a repetition duration equal to four minutes, the task will be launched four times.
 * 
 * When reading or writing  XML for a task, the repetition pattern is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-repetition-triggerbasetype-element">Repetition</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-irepetitionpattern
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IRepetitionPattern extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRepetitionPattern
     * @type {Guid}
     */
    static IID => Guid("{7fb9acf1-26be-400e-85b5-294b9c75dfd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Interval", "put_Interval", "get_Duration", "put_Duration", "get_StopAtDurationEnd", "put_StopAtDurationEnd"]

    /**
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     */
    StopAtDurationEnd {
        get => this.get_StopAtDurationEnd()
        set => this.put_StopAtDurationEnd(value)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_interval
     */
    get_Interval(pInterval) {
        result := ComCall(7, this, "ptr", pInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} interval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-put_interval
     */
    put_Interval(interval) {
        interval := interval is String ? BSTR.Alloc(interval).Value : interval

        result := ComCall(8, this, "ptr", interval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_duration
     */
    get_Duration(pDuration) {
        result := ComCall(9, this, "ptr", pDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} duration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-put_duration
     */
    put_Duration(duration) {
        duration := duration is String ? BSTR.Alloc(duration).Value : duration

        result := ComCall(10, this, "ptr", duration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend
     */
    get_StopAtDurationEnd(pStop) {
        pStopMarshal := pStop is VarRef ? "short*" : "ptr"

        result := ComCall(11, this, pStopMarshal, pStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} stop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-put_stopatdurationend
     */
    put_StopAtDurationEnd(stop) {
        result := ComCall(12, this, "short", stop, "HRESULT")
        return result
    }
}
