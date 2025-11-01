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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Add", "Remove", "Clear", "AddRange", "CreateSchedule"]

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-get_count
     */
    get_Count(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<ISchedule>} ppSchedule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-get_item
     */
    get_Item(index, ppSchedule) {
        result := ComCall(8, this, "ptr", index, "ptr*", ppSchedule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ienum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-get__newenum
     */
    get__NewEnum(ienum) {
        result := ComCall(9, this, "ptr*", ienum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISchedule} pSchedule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-add
     */
    Add(pSchedule) {
        result := ComCall(10, this, "ptr", pSchedule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vSchedule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-remove
     */
    Remove(vSchedule) {
        result := ComCall(11, this, "ptr", vSchedule, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IScheduleCollection} pSchedules 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-addrange
     */
    AddRange(pSchedules) {
        result := ComCall(13, this, "ptr", pSchedules, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchedule>} Schedule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-createschedule
     */
    CreateSchedule(Schedule) {
        result := ComCall(14, this, "ptr*", Schedule, "HRESULT")
        return result
    }
}
