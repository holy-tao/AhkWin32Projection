#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MMC_TASK.ahk" { MMC_TASK }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumTASK interface is introduced in MMC 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-ienumtask
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IEnumTASK extends IUnknown {
    /**
     * The interface identifier for IEnumTASK
     * @type {Guid}
     */
    static IID := Guid("{338698b1-5a02-11d1-9fec-00600832db4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumTASK interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumTASK.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IEnumTASK::Next method enables MMC to retrieve the next task in the snap-in's list of tasks.
     * @remarks
     * MMC calls this method to enumerate the list of tasks that the snap-in must add to the taskpad. MMC calls this method until it returns S_FALSE to indicate there are no more tasks for the snap-in to add to the taskpad.
     * @param {Integer} celt A value that specifies the number of tasks to provide. MMC always enumerates tasks one at a time; therefore, celt is always 1.
     * @param {Pointer<MMC_TASK>} rgelt A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task">MMC_TASK</a> structure that the snap-in fills in to represent the task to add to the taskpad. Be aware that the caller (MMC) allocates the memory for the structure.
     * @param {Pointer<Integer>} pceltFetched A pointer to a value that specifies the number of tasks returned. If the snap-in successfully returned one or more tasks, set the value to the number of tasks that were successfully returned. Because MMC always requests one task at a time (celt is always 1), pceltFetched should be set to 1 if the task was successfully returned. If the snap-in has no more tasks in its list, or if the snap-in fails to fill in the 
     * MMC_TASK structure, set the value to 0.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ienumtask-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, MMC_TASK.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumTASK::Skip method skips the specified number of tasks in the snap-in's list of tasks. MMC does not use this method. It must be included for completeness.
     * @param {Integer} celt A value that specifies the number of tasks to skip relative to the current task in the list.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ienumtask-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumTASK::Reset method enables MMC to reset the enumeration to the beginning of the snap-in's task list.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ienumtask-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumTASK::Clone method creates a new IEnumTASK object that has the same state as this IEnumTASK object. MMC does not use this method. It must be included for completeness.
     * @returns {IEnumTASK} A pointer to address of 
     * IEnumTASK interface pointer for the cloned 
     * IEnumTASK object.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ienumtask-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumTASK(ppenum)
    }

    Query(iid) {
        if (IEnumTASK.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
