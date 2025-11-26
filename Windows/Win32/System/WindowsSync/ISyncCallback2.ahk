#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncCallback.ahk

/**
 * Represents additional application callbacks that are used to notify the application of synchronization events.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isynccallback2
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncCallback2 extends ISyncCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncCallback2
     * @type {Guid}
     */
    static IID => Guid("{47ce84af-7442-4ead-8630-12015e030ad7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChangeApplied", "OnChangeFailed"]

    /**
     * Occurs after a change is successfully applied.
     * @param {Integer} dwChangesApplied The number of changes that have been successfully applied during the synchronization session. This value is the sum of item changes plus change unit changes.
     * @param {Integer} dwChangesFailed The number of changes that have failed to apply during the synchronization session. This value is the sum of item changes plus change unit changes.
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
     * <dt><b>Application-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isynccallback2-onchangeapplied
     */
    OnChangeApplied(dwChangesApplied, dwChangesFailed) {
        result := ComCall(8, this, "uint", dwChangesApplied, "uint", dwChangesFailed, "HRESULT")
        return result
    }

    /**
     * Occurs after a change fails to apply.
     * @param {Integer} dwChangesApplied The number of changes that have been successfully applied during the synchronization session. This value is the sum of item changes plus change unit changes.
     * @param {Integer} dwChangesFailed The number of changes that have failed to apply during the synchronization session. This value is the sum of item changes plus change unit changes.
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
     * <dt><b>Application-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isynccallback2-onchangefailed
     */
    OnChangeFailed(dwChangesApplied, dwChangesFailed) {
        result := ComCall(9, this, "uint", dwChangesApplied, "uint", dwChangesFailed, "HRESULT")
        return result
    }
}
