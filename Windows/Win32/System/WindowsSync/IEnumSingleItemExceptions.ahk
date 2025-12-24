#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISingleItemException.ahk
#Include .\IEnumSingleItemExceptions.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates single-item exceptions that are stored in a knowledge object.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumsingleitemexceptions
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSingleItemExceptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSingleItemExceptions
     * @type {Guid}
     */
    static IID => Guid("{e563381c-1b4d-4c66-9796-c86faccdcd40}")

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
     * Returns the next elements in the single-item exception set, if they are available.
     * @param {Integer} cExceptions The number of single-item exceptions to retrieve in the range from zero to 1000.
     * @param {Pointer<Integer>} pcFetched Returns the number of single-item exceptions returned. This value can be <b>NULL</b> only if <i>cExceptions</i> is 1.
     * @returns {ISingleItemException} Returns the next <i>pcFetched</i> single-item exceptions.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsingleitemexceptions-next
     */
    Next(cExceptions, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cExceptions, "ptr*", &ppSingleItemException := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ISingleItemException(ppSingleItemException)
    }

    /**
     * Skips the specified number of single-item exceptions.
     * @param {Integer} cExceptions The number of single-item exceptions to skip.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
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
     * The enumerator reaches the end of the list before it can skip <i>cExceptions</i> single-item exceptions. In this case, the enumerator skips as many elements as possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsingleitemexceptions-skip
     */
    Skip(cExceptions) {
        result := ComCall(4, this, "uint", cExceptions, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the single-item exception set.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsingleitemexceptions-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones the enumerator and returns a new enumerator that is in the same state as the current one.
     * @returns {IEnumSingleItemExceptions} Returns the newly cloned enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsingleitemexceptions-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSingleItemExceptions(ppEnum)
    }
}
