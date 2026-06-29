#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRegisteredTask.ahk" { IRegisteredTask }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Contains all the tasks that are registered.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iregisteredtaskcollection
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IRegisteredTaskCollection extends IDispatch {
    /**
     * The interface identifier for IRegisteredTaskCollection
     * @type {Guid}
     */
    static IID := Guid("{86627eb4-42a7-41e4-a4d9-ac33a72f2d52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRegisteredTaskCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get_Item     : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRegisteredTaskCollection.Vtbl()
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
     * Gets the number of registered tasks in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtaskcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the specified registered task from the collection.
     * @remarks
     * Collections are 1-based. That is, the index for the first item in the collection is 1.
     * @param {VARIANT} index 
     * @returns {IRegisteredTask} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtaskcollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, VARIANT, index, "ptr*", &ppRegisteredTask := 0, "HRESULT")
        return IRegisteredTask(ppRegisteredTask)
    }

    /**
     * Gets the collection enumerator for the register task collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtaskcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    Query(iid) {
        if (IRegisteredTaskCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
