#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the methods for enumerating the tasks in the Scheduled Tasks folder.
 * @see https://learn.microsoft.com/windows/win32/api/mstask/nn-mstask-ienumworkitems
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IEnumWorkItems extends IUnknown {
    /**
     * The interface identifier for IEnumWorkItems
     * @type {Guid}
     */
    static IID := Guid("{148bd528-a2ab-11ce-b11f-00aa00530503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumWorkItems interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumWorkItems.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the next specified number of tasks in the enumeration sequence.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-ienumworkitems">IEnumWorkItems</a> interface also provides methods for resetting the enumeration, skipping tasks, and making a copy of the current state of the enumeration.
     * @param {Integer} celt The number of tasks to retrieve.
     * @param {Pointer<Pointer<PWSTR>>} rgpwszNames A pointer to an array of pointers (<b>LPWSTR</b>) to <b>null</b>-terminated character strings containing the file names of the tasks returned from the enumeration sequence. These file names are taken from the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/s">Scheduled Tasks folder</a> and have the ".job" extension.
     * 
     * After processing the names returned in <i>rgpwszNames</i>, you must first free each character string in the array and then the array itself using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pceltFetched A pointer to the number of tasks returned in <i>rgpwszNames</i>. If the <i>celt</i> parameter is 1, this parameter may be <b>NULL</b>.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of tasks retrieved equals the number requested.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number returned is less than the number requested. (Thus, there are no more tasks to enumerate.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ienumworkitems-next
     */
    Next(celt, rgpwszNames, pceltFetched) {
        rgpwszNamesMarshal := rgpwszNames is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, rgpwszNamesMarshal, rgpwszNames, pceltFetchedMarshal, pceltFetched, Int32)
        return result
    }

    /**
     * Skips the next specified number of tasks in the enumeration sequence.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-ienumworkitems">IEnumWorkItems</a> interface also provides methods for retrieving sets of tasks, resetting the enumeration sequence, and making a copy of the current state of the enumeration.
     * @param {Integer} celt The number of tasks to be skipped.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of elements skipped equals <i>celt</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of elements remaining in the sequence is less than the value specified in <i>celt</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>celt</i> is less than or equal to zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ienumworkitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, Int32)
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning. (IEnumWorkItems.Reset)
     * @remarks
     * A call to this method does not guarantee that the same set of tasks will be enumerated after the enumeration sequence is reset. Tasks may have been added to or deleted from the collection while you were enumerating the list.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-ienumworkitems">IEnumWorkItems</a> interface also provides methods for retrieving sets of tasks, skipping sets of tasks, and making a copy of the current state of the enumeration.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration sequence is reset to the beginning of the list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough available memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ienumworkitems-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new enumeration object that contains the same enumeration state as the current enumeration.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-ienumworkitems">IEnumWorkItems</a> interface also provides methods for retrieving sets of tasks, skipping sets of tasks, and resetting the enumeration sequence.
     * @returns {IEnumWorkItems} A pointer to a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-ienumworkitems">IEnumWorkItems</a> interface. This pointer will point to the newly created enumeration. If the method fails, this parameter is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ienumworkitems-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumWorkItems := 0, "HRESULT")
        return IEnumWorkItems(ppEnumWorkItems)
    }

    Query(iid) {
        if (IEnumWorkItems.IID.Equals(iid)) {
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
