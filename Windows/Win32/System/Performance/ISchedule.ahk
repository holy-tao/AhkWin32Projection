#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<VARIANT>} start 
     * @returns {HRESULT} 
     */
    get_StartDate(start) {
        result := ComCall(7, this, "ptr", start, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} start 
     * @returns {HRESULT} 
     */
    put_StartDate(start) {
        result := ComCall(8, this, "ptr", start, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} end 
     * @returns {HRESULT} 
     */
    get_EndDate(end) {
        result := ComCall(9, this, "ptr", end, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} end 
     * @returns {HRESULT} 
     */
    put_EndDate(end) {
        result := ComCall(10, this, "ptr", end, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} start 
     * @returns {HRESULT} 
     */
    get_StartTime(start) {
        result := ComCall(11, this, "ptr", start, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} start 
     * @returns {HRESULT} 
     */
    put_StartTime(start) {
        result := ComCall(12, this, "ptr", start, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} days 
     * @returns {HRESULT} 
     */
    get_Days(days) {
        result := ComCall(13, this, "int*", days, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     */
    put_Days(days) {
        result := ComCall(14, this, "int", days, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
