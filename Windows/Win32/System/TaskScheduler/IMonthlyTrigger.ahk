#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a job based on a monthly schedule.
 * @remarks
 * 
 * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
 * 
 * When reading or writing your own XML for a task, a monthly trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebymonth-calendartriggertype-element">ScheduleByMonth </a> element of the Task Scheduler schema.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-imonthlytrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IMonthlyTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMonthlyTrigger
     * @type {Guid}
     */
    static IID => Guid("{97c45ef1-6b02-4a1a-9c0e-1ebfba1500ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DaysOfMonth", "put_DaysOfMonth", "get_MonthsOfYear", "put_MonthsOfYear", "get_RunOnLastDayOfMonth", "put_RunOnLastDayOfMonth", "get_RandomDelay", "put_RandomDelay"]

    /**
     */
    DaysOfMonth {
        get => this.get_DaysOfMonth()
        set => this.put_DaysOfMonth(value)
    }

    /**
     */
    MonthsOfYear {
        get => this.get_MonthsOfYear()
        set => this.put_MonthsOfYear(value)
    }

    /**
     */
    RunOnLastDayOfMonth {
        get => this.get_RunOnLastDayOfMonth()
        set => this.put_RunOnLastDayOfMonth(value)
    }

    /**
     */
    RandomDelay {
        get => this.get_RandomDelay()
        set => this.put_RandomDelay(value)
    }

    /**
     * Gets or sets the days of the month during which the task runs.
     * @remarks
     * 
     * <table>
     * <tr>
     * <th>Day of month</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>0x01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>0x04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>0x08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>0x10</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>0x20</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>0x40</td>
     * <td>64</td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>0x80</td>
     * <td>128</td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>0x100</td>
     * <td>256</td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>0x200</td>
     * <td>512</td>
     * </tr>
     * <tr>
     * <td>11</td>
     * <td>0x400</td>
     * <td>1024</td>
     * </tr>
     * <tr>
     * <td>12</td>
     * <td>0x800</td>
     * <td>2048</td>
     * </tr>
     * <tr>
     * <td>13</td>
     * <td>0x1000</td>
     * <td>4096</td>
     * </tr>
     * <tr>
     * <td>14</td>
     * <td>0x2000</td>
     * <td>8192</td>
     * </tr>
     * <tr>
     * <td>15</td>
     * <td>0x4000</td>
     * <td>16384</td>
     * </tr>
     * <tr>
     * <td>16</td>
     * <td>0x8000</td>
     * <td>32768</td>
     * </tr>
     * <tr>
     * <td>17</td>
     * <td>0x10000</td>
     * <td>65536</td>
     * </tr>
     * <tr>
     * <td>18</td>
     * <td>0x20000</td>
     * <td>131072</td>
     * </tr>
     * <tr>
     * <td>19</td>
     * <td>0x40000</td>
     * <td>262144</td>
     * </tr>
     * <tr>
     * <td>20</td>
     * <td>0x80000</td>
     * <td>524288</td>
     * </tr>
     * <tr>
     * <td>21</td>
     * <td>0x100000</td>
     * <td>1048576</td>
     * </tr>
     * <tr>
     * <td>22</td>
     * <td>0x200000</td>
     * <td>2097152</td>
     * </tr>
     * <tr>
     * <td>23</td>
     * <td>0x400000</td>
     * <td>4194304</td>
     * </tr>
     * <tr>
     * <td>24</td>
     * <td>0x800000</td>
     * <td>8388608</td>
     * </tr>
     * <tr>
     * <td>25</td>
     * <td>0x1000000</td>
     * <td>16777216</td>
     * </tr>
     * <tr>
     * <td>26</td>
     * <td>0x2000000</td>
     * <td>33554432</td>
     * </tr>
     * <tr>
     * <td>27</td>
     * <td>0x4000000</td>
     * <td>67108864</td>
     * </tr>
     * <tr>
     * <td>28</td>
     * <td>0x8000000</td>
     * <td>134217728</td>
     * </tr>
     * <tr>
     * <td>29</td>
     * <td>0x10000000</td>
     * <td>268435456</td>
     * </tr>
     * <tr>
     * <td>30</td>
     * <td>0x20000000</td>
     * <td>536870912</td>
     * </tr>
     * <tr>
     * <td>31</td>
     * <td>0x40000000</td>
     * <td>1073741824</td>
     * </tr>
     * <tr>
     * <td>Last</td>
     * <td>0x80000000</td>
     * <td>2147483648</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing your own XML for a task, the days of the month are specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-daysofmonth-monthlyscheduletype-element">DaysOfMonth</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<Integer>} pDays 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlytrigger-get_daysofmonth
     */
    get_DaysOfMonth(pDays) {
        pDaysMarshal := pDays is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pDaysMarshal, pDays, "HRESULT")
        return result
    }

    /**
     * Gets or sets the days of the month during which the task runs.
     * @remarks
     * 
     * <table>
     * <tr>
     * <th>Day of month</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>0x01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>0x04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>0x08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>0x10</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>0x20</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>0x40</td>
     * <td>64</td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>0x80</td>
     * <td>128</td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>0x100</td>
     * <td>256</td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>0x200</td>
     * <td>512</td>
     * </tr>
     * <tr>
     * <td>11</td>
     * <td>0x400</td>
     * <td>1024</td>
     * </tr>
     * <tr>
     * <td>12</td>
     * <td>0x800</td>
     * <td>2048</td>
     * </tr>
     * <tr>
     * <td>13</td>
     * <td>0x1000</td>
     * <td>4096</td>
     * </tr>
     * <tr>
     * <td>14</td>
     * <td>0x2000</td>
     * <td>8192</td>
     * </tr>
     * <tr>
     * <td>15</td>
     * <td>0x4000</td>
     * <td>16384</td>
     * </tr>
     * <tr>
     * <td>16</td>
     * <td>0x8000</td>
     * <td>32768</td>
     * </tr>
     * <tr>
     * <td>17</td>
     * <td>0x10000</td>
     * <td>65536</td>
     * </tr>
     * <tr>
     * <td>18</td>
     * <td>0x20000</td>
     * <td>131072</td>
     * </tr>
     * <tr>
     * <td>19</td>
     * <td>0x40000</td>
     * <td>262144</td>
     * </tr>
     * <tr>
     * <td>20</td>
     * <td>0x80000</td>
     * <td>524288</td>
     * </tr>
     * <tr>
     * <td>21</td>
     * <td>0x100000</td>
     * <td>1048576</td>
     * </tr>
     * <tr>
     * <td>22</td>
     * <td>0x200000</td>
     * <td>2097152</td>
     * </tr>
     * <tr>
     * <td>23</td>
     * <td>0x400000</td>
     * <td>4194304</td>
     * </tr>
     * <tr>
     * <td>24</td>
     * <td>0x800000</td>
     * <td>8388608</td>
     * </tr>
     * <tr>
     * <td>25</td>
     * <td>0x1000000</td>
     * <td>16777216</td>
     * </tr>
     * <tr>
     * <td>26</td>
     * <td>0x2000000</td>
     * <td>33554432</td>
     * </tr>
     * <tr>
     * <td>27</td>
     * <td>0x4000000</td>
     * <td>67108864</td>
     * </tr>
     * <tr>
     * <td>28</td>
     * <td>0x8000000</td>
     * <td>134217728</td>
     * </tr>
     * <tr>
     * <td>29</td>
     * <td>0x10000000</td>
     * <td>268435456</td>
     * </tr>
     * <tr>
     * <td>30</td>
     * <td>0x20000000</td>
     * <td>536870912</td>
     * </tr>
     * <tr>
     * <td>31</td>
     * <td>0x40000000</td>
     * <td>1073741824</td>
     * </tr>
     * <tr>
     * <td>Last</td>
     * <td>0x80000000</td>
     * <td>2147483648</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing your own XML for a task, the days of the month are specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-daysofmonth-monthlyscheduletype-element">DaysOfMonth</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlytrigger-put_daysofmonth
     */
    put_DaysOfMonth(days) {
        result := ComCall(21, this, "int", days, "HRESULT")
        return result
    }

    /**
     * Gets or sets the months of the year during which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask that is used by this property.<table>
     * <tr>
     * <th>Month</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>January</td>
     * <td>0X001</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>February</td>
     * <td>0x002</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>March</td>
     * <td>0X004</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>April</td>
     * <td>0x008</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>May</td>
     * <td>0X010</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>June</td>
     * <td>0X020</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>July</td>
     * <td>0x040</td>
     * <td>64</td>
     * </tr>
     * <tr>
     * <td>August</td>
     * <td>0X080</td>
     * <td>128</td>
     * </tr>
     * <tr>
     * <td>September</td>
     * <td>0X100</td>
     * <td>256</td>
     * </tr>
     * <tr>
     * <td>October</td>
     * <td>0X200</td>
     * <td>512</td>
     * </tr>
     * <tr>
     * <td>November</td>
     * <td>0X400</td>
     * <td>1024</td>
     * </tr>
     * <tr>
     * <td>December</td>
     * <td>0X800</td>
     * <td>2048</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing your own XML for a task, the months of the year are specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-months-monthlyscheduletype-element">Months </a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<Integer>} pMonths 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlytrigger-get_monthsofyear
     */
    get_MonthsOfYear(pMonths) {
        pMonthsMarshal := pMonths is VarRef ? "short*" : "ptr"

        result := ComCall(22, this, pMonthsMarshal, pMonths, "HRESULT")
        return result
    }

    /**
     * Gets or sets the months of the year during which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask that is used by this property.<table>
     * <tr>
     * <th>Month</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>January</td>
     * <td>0X001</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>February</td>
     * <td>0x002</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>March</td>
     * <td>0X004</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>April</td>
     * <td>0x008</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>May</td>
     * <td>0X010</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>June</td>
     * <td>0X020</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>July</td>
     * <td>0x040</td>
     * <td>64</td>
     * </tr>
     * <tr>
     * <td>August</td>
     * <td>0X080</td>
     * <td>128</td>
     * </tr>
     * <tr>
     * <td>September</td>
     * <td>0X100</td>
     * <td>256</td>
     * </tr>
     * <tr>
     * <td>October</td>
     * <td>0X200</td>
     * <td>512</td>
     * </tr>
     * <tr>
     * <td>November</td>
     * <td>0X400</td>
     * <td>1024</td>
     * </tr>
     * <tr>
     * <td>December</td>
     * <td>0X800</td>
     * <td>2048</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing your own XML for a task, the months of the year are specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-months-monthlyscheduletype-element">Months </a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Integer} months 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlytrigger-put_monthsofyear
     */
    put_MonthsOfYear(months) {
        result := ComCall(23, this, "short", months, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task runs on the last day of the month.
     * @param {Pointer<VARIANT_BOOL>} pLastDay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlytrigger-get_runonlastdayofmonth
     */
    get_RunOnLastDayOfMonth(pLastDay) {
        pLastDayMarshal := pLastDay is VarRef ? "short*" : "ptr"

        result := ComCall(24, this, pLastDayMarshal, pLastDay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task runs on the last day of the month.
     * @param {VARIANT_BOOL} lastDay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlytrigger-put_runonlastdayofmonth
     */
    put_RunOnLastDayOfMonth(lastDay) {
        result := ComCall(25, this, "short", lastDay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger.
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlytrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(26, this, "ptr", pRandomDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger.
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlytrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(27, this, "ptr", randomDelay, "HRESULT")
        return result
    }
}
