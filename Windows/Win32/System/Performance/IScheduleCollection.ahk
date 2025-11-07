#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISchedule.ahk
#Include ..\Com\IUnknown.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {ISchedule} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &ppSchedule := 0, "HRESULT")
        return ISchedule(ppSchedule)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ienum := 0, "HRESULT")
        return IUnknown(ienum)
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
     * @returns {ISchedule} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-createschedule
     */
    CreateSchedule() {
        result := ComCall(14, this, "ptr*", &Schedule := 0, "HRESULT")
        return ISchedule(Schedule)
    }
}
