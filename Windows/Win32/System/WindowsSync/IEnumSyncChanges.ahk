#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChange.ahk
#Include .\IEnumSyncChanges.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates a list of item changes.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumsyncchanges
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSyncChanges extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSyncChanges
     * @type {Guid}
     */
    static IID => Guid("{5f86be4a-5e78-4e32-ac1c-c24fd223ef85}")

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
     * Returns the next item change.
     * @param {Integer} cChanges The number of changes to fetch. The only valid value is 1.
     * @param {Pointer<Integer>} pcFetched Returns the number of changes that are fetched.
     * @returns {ISyncChange} Returns the next item change.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsyncchanges-next
     */
    Next(cChanges, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cChanges, "ptr*", &ppChange := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ISyncChange(ppChange)
    }

    /**
     * This method is not implemented.
     * @param {Integer} cChanges The number of changes to skip.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsyncchanges-skip
     */
    Skip(cChanges) {
        result := ComCall(4, this, "uint", cChanges, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the list.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsyncchanges-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * This method is not implemented.
     * @returns {IEnumSyncChanges} Returns the cloned enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsyncchanges-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncChanges(ppEnum)
    }
}
