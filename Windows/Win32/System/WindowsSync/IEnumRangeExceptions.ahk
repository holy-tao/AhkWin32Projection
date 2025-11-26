#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRangeException.ahk
#Include .\IEnumRangeExceptions.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates range exceptions that are stored in a knowledge object.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumrangeexceptions
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumRangeExceptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumRangeExceptions
     * @type {Guid}
     */
    static IID => Guid("{0944439f-ddb1-4176-b703-046ff22a2386}")

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
     * Returns the next elements in the change unit exception set, if they are available.
     * @param {Integer} cExceptions The number of range exception elements to retrieve in the range from zero to 1000.
     * @param {Pointer<Integer>} pcFetched Returns the number of range exceptions returned. This value can be <b>NULL</b> only if <i>cExceptions</i> is 1.
     * @returns {IRangeException} Returns the next <i>pcFetched</i> range exceptions.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumrangeexceptions-next
     */
    Next(cExceptions, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cExceptions, "ptr*", &ppRangeException := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return IRangeException(ppRangeException)
    }

    /**
     * Skips the specified number of range exceptions.
     * @param {Integer} cExceptions The number of range exceptions to skip.
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
     * The enumerator reaches the end of the list before it can skip <i>cExceptions</i> range exceptions. In this case, the enumerator skips as many elements as possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumrangeexceptions-skip
     */
    Skip(cExceptions) {
        result := ComCall(4, this, "uint", cExceptions, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the range exception set.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumrangeexceptions-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones the enumerator and returns a new enumerator that is in the same state as the current one.
     * @returns {IEnumRangeExceptions} Returns the newly cloned enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumrangeexceptions-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumRangeExceptions(ppEnum)
    }
}
