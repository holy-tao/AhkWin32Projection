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
     * 
     * @param {Pointer<BSTR>} pInterval 
     * @returns {HRESULT} 
     */
    get_Interval(pInterval) {
        result := ComCall(7, this, "ptr", pInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} interval 
     * @returns {HRESULT} 
     */
    put_Interval(interval) {
        interval := interval is String ? BSTR.Alloc(interval).Value : interval

        result := ComCall(8, this, "ptr", interval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDuration 
     * @returns {HRESULT} 
     */
    get_Duration(pDuration) {
        result := ComCall(9, this, "ptr", pDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} duration 
     * @returns {HRESULT} 
     */
    put_Duration(duration) {
        duration := duration is String ? BSTR.Alloc(duration).Value : duration

        result := ComCall(10, this, "ptr", duration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pStop 
     * @returns {HRESULT} 
     */
    get_StopAtDurationEnd(pStop) {
        result := ComCall(11, this, "ptr", pStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} stop 
     * @returns {HRESULT} 
     */
    put_StopAtDurationEnd(stop) {
        result := ComCall(12, this, "short", stop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
