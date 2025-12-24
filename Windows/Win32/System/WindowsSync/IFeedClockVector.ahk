#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IClockVector.ahk

/**
 * Represents a clock vector that contains FeedSync information.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ifeedclockvector
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFeedClockVector extends IClockVector{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedClockVector
     * @type {Guid}
     */
    static IID => Guid("{8d1d98d1-9fb8-4ec9-a553-54dd924e0f67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUpdateCount", "IsNoConflictsSpecified"]

    /**
     * Gets the number of updates that have been made to the FeedSync item.
     * @param {Pointer<Integer>} pdwUpdateCount Returns the number of updates that have been made to the FeedSync item. This value corresponds to the <b>updates</b> attribute of the FeedSync item.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ifeedclockvector-getupdatecount
     */
    GetUpdateCount(pdwUpdateCount) {
        pdwUpdateCountMarshal := pdwUpdateCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwUpdateCountMarshal, pdwUpdateCount, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether conflicts are preserved for the FeedSync item.
     * @param {Pointer<BOOL>} pfIsNoConflictsSpecified TRUE if conflicts are not preserved for the item; otherwise, <b>FALSE</b>. This value corresponds to the <b>noconflicts</b> attribute of the FeedSync item.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ifeedclockvector-isnoconflictsspecified
     */
    IsNoConflictsSpecified(pfIsNoConflictsSpecified) {
        pfIsNoConflictsSpecifiedMarshal := pfIsNoConflictsSpecified is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pfIsNoConflictsSpecifiedMarshal, pfIsNoConflictsSpecified, "HRESULT")
        return result
    }
}
