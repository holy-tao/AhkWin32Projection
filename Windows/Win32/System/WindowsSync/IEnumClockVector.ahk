#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IClockVectorElement.ahk
#Include .\IEnumClockVector.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates the clock vector elements that are stored in a clock vector.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumclockvector
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumClockVector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumClockVector
     * @type {Guid}
     */
    static IID => Guid("{525844db-2837-4799-9e80-81a66e02220c}")

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
     * Returns the next elements in the clock vector, if they are available.
     * @param {Integer} cClockVectorElements The number of clock vector elements to retrieve in the range of zero to 1000.
     * @param {Pointer<Integer>} pcFetched Returns the number of clock vector elements that were retrieved. This value can be <b>NULL</b> if <i>cClockVectorElements</i> is 1; otherwise, it cannot be <b>NULL</b>.
     * @returns {IClockVectorElement} Returns the next <i>pcFetched</i> clock vector elements.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumclockvector-next
     */
    Next(cClockVectorElements, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cClockVectorElements, "ptr*", &ppiClockVectorElements := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return IClockVectorElement(ppiClockVectorElements)
    }

    /**
     * Skips the specified number of clock vector elements.
     * @param {Integer} cSyncVersions The number of elements to skip.
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
     * The enumerator reaches the end of its list before it skips <i>cSyncVersions</i>. In this case, the enumerator skips as many elements as possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumclockvector-skip
     */
    Skip(cSyncVersions) {
        result := ComCall(4, this, "uint", cSyncVersions, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the clock vector.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumclockvector-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones the enumerator and returns a new enumerator that is in the same state as the current one.
     * @returns {IEnumClockVector} Returns the newly cloned enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumclockvector-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppiEnum := 0, "HRESULT")
        return IEnumClockVector(ppiEnum)
    }
}
