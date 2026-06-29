#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ITrigger.ahk" { ITrigger }

/**
 * Represents a trigger that starts a job based on a monthly schedule.
 * @remarks
 * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
 * 
 * When reading or writing your own XML for a task, a monthly trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebymonth-calendartriggertype-element">ScheduleByMonth </a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-imonthlytrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IMonthlyTrigger extends ITrigger {
    /**
     * The interface identifier for IMonthlyTrigger
     * @type {Guid}
     */
    static IID := Guid("{97c45ef1-6b02-4a1a-9c0e-1ebfba1500ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMonthlyTrigger interfaces
    */
    struct Vtbl extends ITrigger.Vtbl {
        get_DaysOfMonth         : IntPtr
        put_DaysOfMonth         : IntPtr
        get_MonthsOfYear        : IntPtr
        put_MonthsOfYear        : IntPtr
        get_RunOnLastDayOfMonth : IntPtr
        put_RunOnLastDayOfMonth : IntPtr
        get_RandomDelay         : IntPtr
        put_RandomDelay         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMonthlyTrigger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    DaysOfMonth {
        get => this.get_DaysOfMonth()
        set => this.put_DaysOfMonth(value)
    }

    /**
     * @type {Integer} 
     */
    MonthsOfYear {
        get => this.get_MonthsOfYear()
        set => this.put_MonthsOfYear(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RunOnLastDayOfMonth {
        get => this.get_RunOnLastDayOfMonth()
        set => this.put_RunOnLastDayOfMonth(value)
    }

    /**
     * @type {BSTR} 
     */
    RandomDelay {
        get => this.get_RandomDelay()
        set => this.put_RandomDelay(value)
    }

    /**
     * Gets or sets the days of the month during which the task runs. (Get)
     * @remarks
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
     * @param {Pointer<Integer>} pDays 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-get_daysofmonth
     */
    get_DaysOfMonth(pDays) {
        pDaysMarshal := pDays is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pDaysMarshal, pDays, "HRESULT")
        return result
    }

    /**
     * Gets or sets the days of the month during which the task runs. (Put)
     * @remarks
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
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-put_daysofmonth
     */
    put_DaysOfMonth(days) {
        result := ComCall(21, this, "int", days, "HRESULT")
        return result
    }

    /**
     * Gets or sets the months of the year during which the task runs. (IMonthlyTrigger.get_MonthsOfYear)
     * @remarks
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
     * @param {Pointer<Integer>} pMonths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-get_monthsofyear
     */
    get_MonthsOfYear(pMonths) {
        pMonthsMarshal := pMonths is VarRef ? "short*" : "ptr"

        result := ComCall(22, this, pMonthsMarshal, pMonths, "HRESULT")
        return result
    }

    /**
     * Gets or sets the months of the year during which the task runs. (IMonthlyTrigger.put_MonthsOfYear)
     * @remarks
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
     * @param {Integer} months 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-put_monthsofyear
     */
    put_MonthsOfYear(months) {
        result := ComCall(23, this, "short", months, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task runs on the last day of the month. (Get)
     * @param {Pointer<VARIANT_BOOL>} pLastDay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-get_runonlastdayofmonth
     */
    get_RunOnLastDayOfMonth(pLastDay) {
        pLastDayMarshal := pLastDay is VarRef ? "short*" : "ptr"

        result := ComCall(24, this, pLastDayMarshal, pLastDay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task runs on the last day of the month. (Put)
     * @param {VARIANT_BOOL} lastDay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-put_runonlastdayofmonth
     */
    put_RunOnLastDayOfMonth(lastDay) {
        result := ComCall(25, this, VARIANT_BOOL, lastDay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (IMonthlyTrigger.get_RandomDelay)
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(26, this, BSTR.Ptr, pRandomDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (IMonthlyTrigger.put_RandomDelay)
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(27, this, BSTR, randomDelay, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMonthlyTrigger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DaysOfMonth := CallbackCreate(GetMethod(implObj, "get_DaysOfMonth"), flags, 2)
        this.vtbl.put_DaysOfMonth := CallbackCreate(GetMethod(implObj, "put_DaysOfMonth"), flags, 2)
        this.vtbl.get_MonthsOfYear := CallbackCreate(GetMethod(implObj, "get_MonthsOfYear"), flags, 2)
        this.vtbl.put_MonthsOfYear := CallbackCreate(GetMethod(implObj, "put_MonthsOfYear"), flags, 2)
        this.vtbl.get_RunOnLastDayOfMonth := CallbackCreate(GetMethod(implObj, "get_RunOnLastDayOfMonth"), flags, 2)
        this.vtbl.put_RunOnLastDayOfMonth := CallbackCreate(GetMethod(implObj, "put_RunOnLastDayOfMonth"), flags, 2)
        this.vtbl.get_RandomDelay := CallbackCreate(GetMethod(implObj, "get_RandomDelay"), flags, 2)
        this.vtbl.put_RandomDelay := CallbackCreate(GetMethod(implObj, "put_RandomDelay"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DaysOfMonth)
        CallbackFree(this.vtbl.put_DaysOfMonth)
        CallbackFree(this.vtbl.get_MonthsOfYear)
        CallbackFree(this.vtbl.put_MonthsOfYear)
        CallbackFree(this.vtbl.get_RunOnLastDayOfMonth)
        CallbackFree(this.vtbl.put_RunOnLastDayOfMonth)
        CallbackFree(this.vtbl.get_RandomDelay)
        CallbackFree(this.vtbl.put_RandomDelay)
    }
}
