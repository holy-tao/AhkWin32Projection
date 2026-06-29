#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISchedule.ahk" { ISchedule }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Manages a collection of Schedule objects.To get this interface, access the IDataCollectorSet::Schedules property.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ischedulecollection
 * @namespace Windows.Win32.System.Performance
 */
export default struct IScheduleCollection extends IDispatch {
    /**
     * The interface identifier for IScheduleCollection
     * @type {Guid}
     */
    static IID := Guid("{0383753d-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScheduleCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count      : IntPtr
        get_Item       : IntPtr
        get__NewEnum   : IntPtr
        Add            : IntPtr
        Remove         : IntPtr
        Clear          : IntPtr
        AddRange       : IntPtr
        CreateSchedule : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScheduleCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the requested schedule from the collection.
     * @remarks
     * This property is the object's default property.
     * @param {VARIANT} index 
     * @returns {ISchedule} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, VARIANT, index, "ptr*", &ppSchedule := 0, "HRESULT")
        return ISchedule(ppSchedule)
    }

    /**
     * Retrieves an interface to the enumeration. (IScheduleCollection.get__NewEnum)
     * @remarks
     * C++ programmers use this property.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN. To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ischedule">ISchedule</a> interface, use the <b>punkVal</b> member of the variant.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ienum := 0, "HRESULT")
        return IUnknown(ienum)
    }

    /**
     * Adds a schedule to the collection.
     * @param {ISchedule} pSchedule An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ischedule">ISchedule</a> interface of the schedule to add to the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-add
     */
    Add(pSchedule) {
        result := ComCall(10, this, "ptr", pSchedule, "HRESULT")
        return result
    }

    /**
     * Removes a schedule from the collection.
     * @remarks
     * If the variant type is VT_DISPATCH, pass the <b>IDispatch</b> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ischedule">ISchedule</a> interface to be removed.
     * @param {VARIANT} vSchedule The zero-based index of the schedule to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-remove
     */
    Remove(vSchedule) {
        result := ComCall(11, this, VARIANT, vSchedule, "HRESULT")
        return result
    }

    /**
     * Removes all schedules from the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Adds one or more schedules to the collection.
     * @param {IScheduleCollection} pSchedules An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ischedulecollection">IScheduleCollection</a> interface to a collection of one or more schedules to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-addrange
     */
    AddRange(pSchedules) {
        result := ComCall(13, this, "ptr", pSchedules, "HRESULT")
        return result
    }

    /**
     * Creates a schedule object.
     * @returns {ISchedule} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ischedule">ISchedule</a> interface that you use to specify when the data collector set runs.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ischedulecollection-createschedule
     */
    CreateSchedule() {
        result := ComCall(14, this, "ptr*", &_Schedule := 0, "HRESULT")
        return ISchedule(_Schedule)
    }

    Query(iid) {
        if (IScheduleCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.AddRange := CallbackCreate(GetMethod(implObj, "AddRange"), flags, 2)
        this.vtbl.CreateSchedule := CallbackCreate(GetMethod(implObj, "CreateSchedule"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.AddRange)
        CallbackFree(this.vtbl.CreateSchedule)
    }
}
