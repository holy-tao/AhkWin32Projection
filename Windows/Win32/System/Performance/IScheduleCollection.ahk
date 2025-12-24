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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves the number of schedules in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedulecollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the requested schedule from the collection.
     * @remarks
     * 
     * This property is the object's default property.
     * 
     * 
     * @param {VARIANT} index 
     * @returns {ISchedule} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedulecollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &ppSchedule := 0, "HRESULT")
        return ISchedule(ppSchedule)
    }

    /**
     * Retrieves an interface to the enumeration.
     * @remarks
     * 
     *  C++ programmers use this property.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN. To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ischedule">ISchedule</a> interface, use the <b>punkVal</b> member of the variant.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedulecollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ienum := 0, "HRESULT")
        return IUnknown(ienum)
    }

    /**
     * Adds a schedule to the collection.
     * @param {ISchedule} pSchedule An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ischedule">ISchedule</a> interface of the schedule to add to the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedulecollection-add
     */
    Add(pSchedule) {
        result := ComCall(10, this, "ptr", pSchedule, "HRESULT")
        return result
    }

    /**
     * Removes a schedule from the collection.
     * @param {VARIANT} vSchedule The zero-based index of the schedule to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedulecollection-remove
     */
    Remove(vSchedule) {
        result := ComCall(11, this, "ptr", vSchedule, "HRESULT")
        return result
    }

    /**
     * Removes all schedules from the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedulecollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Adds one or more schedules to the collection.
     * @param {IScheduleCollection} pSchedules An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ischedulecollection">IScheduleCollection</a> interface to a collection of one or more schedules to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedulecollection-addrange
     */
    AddRange(pSchedules) {
        result := ComCall(13, this, "ptr", pSchedules, "HRESULT")
        return result
    }

    /**
     * Creates a schedule object.
     * @returns {ISchedule} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ischedule">ISchedule</a> interface that you use to specify when the data collector set runs.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ischedulecollection-createschedule
     */
    CreateSchedule() {
        result := ComCall(14, this, "ptr*", &Schedule := 0, "HRESULT")
        return ISchedule(Schedule)
    }
}
