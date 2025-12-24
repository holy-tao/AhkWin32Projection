#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTASK.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IEnumTASK interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-ienumtask
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IEnumTASK extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTASK
     * @type {Guid}
     */
    static IID => Guid("{338698b1-5a02-11d1-9fec-00600832db4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * The IEnumTASK::Next method enables MMC to retrieve the next task in the snap-in's list of tasks.
     * @param {Integer} celt A value that specifies the number of tasks to provide. MMC always enumerates tasks one at a time; therefore, celt is always 1.
     * @param {Pointer<MMC_TASK>} rgelt A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task">MMC_TASK</a> structure that the snap-in fills in to represent the task to add to the taskpad. Be aware that the caller (MMC) allocates the memory for the structure.
     * @param {Pointer<Integer>} pceltFetched A pointer to a value that specifies the number of tasks returned. If the snap-in successfully returned one or more tasks, set the value to the number of tasks that were successfully returned. Because MMC always requests one task at a time (celt is always 1), pceltFetched should be set to 1 if the task was successfully returned. If the snap-in has no more tasks in its list, or if the snap-in fails to fill in the 
     * MMC_TASK structure, set the value to 0.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ienumtask-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumTASK::Skip method skips the specified number of tasks in the snap-in's list of tasks. MMC does not use this method. It must be included for completeness.
     * @param {Integer} celt A value that specifies the number of tasks to skip relative to the current task in the list.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ienumtask-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumTASK::Reset method enables MMC to reset the enumeration to the beginning of the snap-in's task list.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ienumtask-reset
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
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ienumtask-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumTASK(ppenum)
    }
}
