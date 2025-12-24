#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Specifies when the data collector set runs.To get this interface, call the IScheduleCollection::CreateSchedule method.
 * @remarks
 * 
 * To create the object from a script, use the Pla.Schedule program identifier.
 * 
 * PLA uses the schedule when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_schedulesenabled">IDataCollectorSet::SchedulesEnabled</a> property is VARIANT_TRUE.
 * 
 * For an example that shows the XML that you can use to initialize this object if you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setxml">IDataCollectorSet::SetXml</a> method, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorset">IDataCollectorSet</a>.  When you specify the XML to create the object, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the set, the XML includes all elements.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-ischedule
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ISchedule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchedule
     * @type {Guid}
     */
    static IID => Guid("{0383753a-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartDate", "put_StartDate", "get_EndDate", "put_EndDate", "get_StartTime", "put_StartTime", "get_Days", "put_Days"]

    /**
     * @type {VARIANT} 
     */
    StartDate {
        get => this.get_StartDate()
        set => this.put_StartDate(value)
    }

    /**
     * @type {VARIANT} 
     */
    EndDate {
        get => this.get_EndDate()
        set => this.put_EndDate(value)
    }

    /**
     * @type {VARIANT} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {Integer} 
     */
    Days {
        get => this.get_Days()
        set => this.put_Days(value)
    }

    /**
     * Retrieves or sets the date when the schedule becomes valid.
     * @remarks
     * 
     * Use the start and end date to specify a date range when the schedule is valid.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedule-get_startdate
     */
    get_StartDate() {
        start := VARIANT()
        result := ComCall(7, this, "ptr", start, "HRESULT")
        return start
    }

    /**
     * Retrieves or sets the date when the schedule becomes valid.
     * @remarks
     * 
     * Use the start and end date to specify a date range when the schedule is valid.
     * 
     * 
     * @param {VARIANT} start 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedule-put_startdate
     */
    put_StartDate(start) {
        result := ComCall(8, this, "ptr", start, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the last date that the schedule is valid.
     * @remarks
     * 
     * The end date must be greater than or equal to the start date.
     * 
     * The set cannot be started after the end date, but if the set is running when the end date is reached, it continues to run.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedule-get_enddate
     */
    get_EndDate() {
        end := VARIANT()
        result := ComCall(9, this, "ptr", end, "HRESULT")
        return end
    }

    /**
     * Retrieves or sets the last date that the schedule is valid.
     * @remarks
     * 
     * The end date must be greater than or equal to the start date.
     * 
     * The set cannot be started after the end date, but if the set is running when the end date is reached, it continues to run.
     * 
     * 
     * @param {VARIANT} end 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedule-put_enddate
     */
    put_EndDate(end) {
        result := ComCall(10, this, "ptr", end, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the time of day when the data collector set runs.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedule-get_starttime
     */
    get_StartTime() {
        start := VARIANT()
        result := ComCall(11, this, "ptr", start, "HRESULT")
        return start
    }

    /**
     * Retrieves or sets the time of day when the data collector set runs.
     * @param {VARIANT} start 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedule-put_starttime
     */
    put_StartTime(start) {
        result := ComCall(12, this, "ptr", start, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the days on which the data collector set runs.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedule-get_days
     */
    get_Days() {
        result := ComCall(13, this, "int*", &days := 0, "HRESULT")
        return days
    }

    /**
     * Retrieves or sets the days on which the data collector set runs.
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedule-put_days
     */
    put_Days(days) {
        result := ComCall(14, this, "int", days, "HRESULT")
        return result
    }
}
