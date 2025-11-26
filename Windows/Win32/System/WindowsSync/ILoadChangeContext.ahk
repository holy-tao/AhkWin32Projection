#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChange.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents information about a change to be loaded from the item store.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iloadchangecontext
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ILoadChangeContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoadChangeContext
     * @type {Guid}
     */
    static IID => Guid("{44a4aaca-ec39-46d5-b5c9-d633c0ee67e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSyncChange", "SetRecoverableErrorOnChange", "SetRecoverableErrorOnChangeUnit"]

    /**
     * Gets the change item for which the change data should be retrieved from the item store.
     * @returns {ISyncChange} Returns the change item for which the change data should be retrieved from the item store.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iloadchangecontext-getsyncchange
     */
    GetSyncChange() {
        result := ComCall(3, this, "ptr*", &ppSyncChange := 0, "HRESULT")
        return ISyncChange(ppSyncChange)
    }

    /**
     * Indicates a recoverable error on this change has occurred.
     * @param {HRESULT} hrError The error code that is associated with the error that prevented the item data from being loaded.
     * @param {IRecoverableErrorData} pErrorData Additional information about the error.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hrError</i> does not specify an error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iloadchangecontext-setrecoverableerroronchange
     */
    SetRecoverableErrorOnChange(hrError, pErrorData) {
        result := ComCall(4, this, "int", hrError, "ptr", pErrorData, "HRESULT")
        return result
    }

    /**
     * Indicates that a recoverable error occurred when data for the specified change unit was loaded from the item store.
     * @param {HRESULT} hrError The error code that is associated with the error that prevented the change unit data from being loaded.
     * @param {ISyncChangeUnit} pChangeUnit The change unit change that caused the error.
     * @param {IRecoverableErrorData} pErrorData Additional information about the error.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hrError</i> does not specify an error.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ON_CREATE_MUST_FAIL_ENTIRE_ITEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The change that contains this change unit refers to an item creation. In this case, the error must be reported on the item change by using <a href="/previous-versions/windows/desktop/api/winsync/nf-winsync-iloadchangecontext-setrecoverableerroronchange">ILoadChangeContext::SetRecoverableErrorOnChange</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  An internal error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iloadchangecontext-setrecoverableerroronchangeunit
     */
    SetRecoverableErrorOnChangeUnit(hrError, pChangeUnit, pErrorData) {
        result := ComCall(5, this, "int", hrError, "ptr", pChangeUnit, "ptr", pErrorData, "HRESULT")
        return result
    }
}
