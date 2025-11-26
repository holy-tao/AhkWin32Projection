#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumWorkItems.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for enumerating the tasks in the Scheduled Tasks folder.
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-ienumworkitems
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IEnumWorkItems extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWorkItems
     * @type {Guid}
     */
    static IID => Guid("{148bd528-a2ab-11ce-b11f-00aa00530503}")

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
     * Retrieves the next specified number of tasks in the enumeration sequence.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ienumworkitems-next
     */
    Next(celt, rgpwszNames, pceltFetched) {
        rgpwszNamesMarshal := rgpwszNames is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, rgpwszNamesMarshal, rgpwszNames, pceltFetchedMarshal, pceltFetched, "int")
        return result
    }

    /**
     * Skips the next specified number of tasks in the enumeration sequence.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ienumworkitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ienumworkitems-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new enumeration object that contains the same enumeration state as the current enumeration.
     * @returns {IEnumWorkItems} A pointer to a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-ienumworkitems">IEnumWorkItems</a> interface. This pointer will point to the newly created enumeration. If the method fails, this parameter is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ienumworkitems-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumWorkItems := 0, "HRESULT")
        return IEnumWorkItems(ppEnumWorkItems)
    }
}
