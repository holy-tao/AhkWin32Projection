#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WeekDays.ahk" { WeekDays }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Specifies when the data collector set runs.To get this interface, call the IScheduleCollection::CreateSchedule method.
 * @remarks
 * To create the object from a script, use the Pla.Schedule program identifier.
 * 
 * PLA uses the schedule when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_schedulesenabled">IDataCollectorSet::SchedulesEnabled</a> property is VARIANT_TRUE.
 * 
 * For an example that shows the XML that you can use to initialize this object if you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setxml">IDataCollectorSet::SetXml</a> method, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorset">IDataCollectorSet</a>.  When you specify the XML to create the object, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the set, the XML includes all elements.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ischedule
 * @namespace Windows.Win32.System.Performance
 */
export default struct ISchedule extends IDispatch {
    /**
     * The interface identifier for ISchedule
     * @type {Guid}
     */
    static IID := Guid("{0383753a-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchedule interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StartDate : IntPtr
        put_StartDate : IntPtr
        get_EndDate   : IntPtr
        put_EndDate   : IntPtr
        get_StartTime : IntPtr
        put_StartTime : IntPtr
        get_Days      : IntPtr
        put_Days      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchedule.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {WeekDays} 
     */
    Days {
        get => this.get_Days()
        set => this.put_Days(value)
    }

    /**
     * Retrieves or sets the date when the schedule becomes valid. (Get)
     * @remarks
     * Use the start and end date to specify a date range when the schedule is valid.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedule-get_startdate
     */
    get_StartDate() {
        start := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, start, "HRESULT")
        return start
    }

    /**
     * Retrieves or sets the date when the schedule becomes valid. (Put)
     * @remarks
     * Use the start and end date to specify a date range when the schedule is valid.
     * @param {VARIANT} start 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedule-put_startdate
     */
    put_StartDate(start) {
        result := ComCall(8, this, VARIANT, start, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the last date that the schedule is valid. (Get)
     * @remarks
     * The end date must be greater than or equal to the start date.
     * 
     * The set cannot be started after the end date, but if the set is running when the end date is reached, it continues to run.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedule-get_enddate
     */
    get_EndDate() {
        end := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, end, "HRESULT")
        return end
    }

    /**
     * Retrieves or sets the last date that the schedule is valid. (Put)
     * @remarks
     * The end date must be greater than or equal to the start date.
     * 
     * The set cannot be started after the end date, but if the set is running when the end date is reached, it continues to run.
     * @param {VARIANT} end 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedule-put_enddate
     */
    put_EndDate(end) {
        result := ComCall(10, this, VARIANT, end, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the time of day when the data collector set runs. (Get)
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedule-get_starttime
     */
    get_StartTime() {
        start := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, start, "HRESULT")
        return start
    }

    /**
     * Retrieves or sets the time of day when the data collector set runs. (Put)
     * @param {VARIANT} start 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedule-put_starttime
     */
    put_StartTime(start) {
        result := ComCall(12, this, VARIANT, start, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the days on which the data collector set runs. (Get)
     * @returns {WeekDays} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedule-get_days
     */
    get_Days() {
        result := ComCall(13, this, "int*", &days := 0, "HRESULT")
        return days
    }

    /**
     * Retrieves or sets the days on which the data collector set runs. (Put)
     * @param {WeekDays} days 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedule-put_days
     */
    put_Days(days) {
        result := ComCall(14, this, WeekDays, days, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISchedule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StartDate := CallbackCreate(GetMethod(implObj, "get_StartDate"), flags, 2)
        this.vtbl.put_StartDate := CallbackCreate(GetMethod(implObj, "put_StartDate"), flags, 2)
        this.vtbl.get_EndDate := CallbackCreate(GetMethod(implObj, "get_EndDate"), flags, 2)
        this.vtbl.put_EndDate := CallbackCreate(GetMethod(implObj, "put_EndDate"), flags, 2)
        this.vtbl.get_StartTime := CallbackCreate(GetMethod(implObj, "get_StartTime"), flags, 2)
        this.vtbl.put_StartTime := CallbackCreate(GetMethod(implObj, "put_StartTime"), flags, 2)
        this.vtbl.get_Days := CallbackCreate(GetMethod(implObj, "get_Days"), flags, 2)
        this.vtbl.put_Days := CallbackCreate(GetMethod(implObj, "put_Days"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StartDate)
        CallbackFree(this.vtbl.put_StartDate)
        CallbackFree(this.vtbl.get_EndDate)
        CallbackFree(this.vtbl.put_EndDate)
        CallbackFree(this.vtbl.get_StartTime)
        CallbackFree(this.vtbl.put_StartTime)
        CallbackFree(this.vtbl.get_Days)
        CallbackFree(this.vtbl.put_Days)
    }
}
