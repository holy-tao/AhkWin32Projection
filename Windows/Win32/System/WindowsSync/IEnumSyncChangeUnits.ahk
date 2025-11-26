#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChangeUnit.ahk
#Include .\IEnumSyncChangeUnits.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates a list of change units.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumsyncchangeunits
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSyncChangeUnits extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSyncChangeUnits
     * @type {Guid}
     */
    static IID => Guid("{346b35f1-8703-4c6d-ab1a-4dbca2cff97f}")

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
     * Returns the next change unit.
     * @param {Integer} cChanges The number of change units to fetch. The only valid value is 1.
     * @param {Pointer<Integer>} pcFetched Returns the number of change units that are fetched.
     * @returns {ISyncChangeUnit} Returns the next change unit object.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsyncchangeunits-next
     */
    Next(cChanges, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cChanges, "ptr*", &ppChangeUnit := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ISyncChangeUnit(ppChangeUnit)
    }

    /**
     * This method is not implemented.
     * @param {Integer} cChanges The number of change units to skip.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsyncchangeunits-skip
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsyncchangeunits-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * This method is not implemented.
     * @returns {IEnumSyncChangeUnits} Returns the cloned enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ienumsyncchangeunits-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncChangeUnits(ppEnum)
    }
}
