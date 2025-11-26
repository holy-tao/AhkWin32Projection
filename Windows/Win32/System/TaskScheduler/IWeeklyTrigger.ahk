#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task based on a weekly schedule.
 * @remarks
 * 
 * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
 * 
 * When reading or writing your own XML for a task, a weekly trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebyweek-calendartriggertype-element">ScheduleByWeek</a> element of the Task Scheduler schema.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iweeklytrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IWeeklyTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWeeklyTrigger
     * @type {Guid}
     */
    static IID => Guid("{5038fc98-82ff-436d-8728-a512a57c9dc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DaysOfWeek", "put_DaysOfWeek", "get_WeeksInterval", "put_WeeksInterval", "get_RandomDelay", "put_RandomDelay"]

    /**
     */
    DaysOfWeek {
        get => this.get_DaysOfWeek()
        set => this.put_DaysOfWeek(value)
    }

    /**
     */
    WeeksInterval {
        get => this.get_WeeksInterval()
        set => this.put_WeeksInterval(value)
    }

    /**
     */
    RandomDelay {
        get => this.get_RandomDelay()
        set => this.put_RandomDelay(value)
    }

    /**
     * Gets or sets the days of the week in which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask used by this property.<table>
     * <tr>
     * <th>Month</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>Sunday</td>
     * <td>0X01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>Monday</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>Tuesday</td>
     * <td>0X04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>Wednesday</td>
     * <td>0X08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>Thursday</td>
     * <td>0X10</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>Friday</td>
     * <td>0x20</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>Saturday</td>
     * <td>0X40</td>
     * <td>64</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing your own XML for a task, the days of the week are specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-daysofweek-weeklyscheduletype-element">DaysOfWeek</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<Integer>} pDays 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iweeklytrigger-get_daysofweek
     */
    get_DaysOfWeek(pDays) {
        pDaysMarshal := pDays is VarRef ? "short*" : "ptr"

        result := ComCall(20, this, pDaysMarshal, pDays, "HRESULT")
        return result
    }

    /**
     * Gets or sets the days of the week in which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask used by this property.<table>
     * <tr>
     * <th>Month</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>Sunday</td>
     * <td>0X01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>Monday</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>Tuesday</td>
     * <td>0X04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>Wednesday</td>
     * <td>0X08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>Thursday</td>
     * <td>0X10</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>Friday</td>
     * <td>0x20</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>Saturday</td>
     * <td>0X40</td>
     * <td>64</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing your own XML for a task, the days of the week are specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-daysofweek-weeklyscheduletype-element">DaysOfWeek</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iweeklytrigger-put_daysofweek
     */
    put_DaysOfWeek(days) {
        result := ComCall(21, this, "short", days, "HRESULT")
        return result
    }

    /**
     * Gets or sets the interval between the weeks in the schedule.
     * @remarks
     * 
     * An interval of 1 produces a weekly schedule. An interval of 2 produces an every-other week schedule.
     * 
     * When reading or writing your own XML for a task, the interval for a weekly schedule is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-weeksinterval-weeklyscheduletype-element">WeeksInterval</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<Integer>} pWeeks 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iweeklytrigger-get_weeksinterval
     */
    get_WeeksInterval(pWeeks) {
        pWeeksMarshal := pWeeks is VarRef ? "short*" : "ptr"

        result := ComCall(22, this, pWeeksMarshal, pWeeks, "HRESULT")
        return result
    }

    /**
     * Gets or sets the interval between the weeks in the schedule.
     * @remarks
     * 
     * An interval of 1 produces a weekly schedule. An interval of 2 produces an every-other week schedule.
     * 
     * When reading or writing your own XML for a task, the interval for a weekly schedule is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-weeksinterval-weeklyscheduletype-element">WeeksInterval</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Integer} weeks 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iweeklytrigger-put_weeksinterval
     */
    put_WeeksInterval(weeks) {
        result := ComCall(23, this, "short", weeks, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger.
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iweeklytrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(24, this, "ptr", pRandomDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger.
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iweeklytrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(25, this, "ptr", randomDelay, "HRESULT")
        return result
    }
}
