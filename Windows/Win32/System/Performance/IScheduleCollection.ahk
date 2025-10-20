#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages a collection of Schedule objects.To get this interface, access the IDataCollectorSet::Schedules property.
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-ischedulecollection
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IScheduleCollection extends IDispatch{
    /**
     * The interface identifier for IScheduleCollection
     * @type {Guid}
     */
    static IID => Guid("{0383753d-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_Count(retVal) {
        result := ComCall(7, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<ISchedule>} ppSchedule 
     * @returns {HRESULT} 
     */
    get_Item(index, ppSchedule) {
        result := ComCall(8, this, "ptr", index, "ptr", ppSchedule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ienum 
     * @returns {HRESULT} 
     */
    get__NewEnum(ienum) {
        result := ComCall(9, this, "ptr", ienum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISchedule>} pSchedule 
     * @returns {HRESULT} 
     */
    Add(pSchedule) {
        result := ComCall(10, this, "ptr", pSchedule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vSchedule 
     * @returns {HRESULT} 
     */
    Remove(vSchedule) {
        result := ComCall(11, this, "ptr", vSchedule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IScheduleCollection>} pSchedules 
     * @returns {HRESULT} 
     */
    AddRange(pSchedules) {
        result := ComCall(13, this, "ptr", pSchedules, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISchedule>} Schedule 
     * @returns {HRESULT} 
     */
    CreateSchedule(Schedule) {
        result := ComCall(14, this, "ptr", Schedule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
