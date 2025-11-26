#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChange.ahk
#Include .\IRecoverableErrorData.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a recoverable error that occurred when an item was loaded or when an item was saved.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-irecoverableerror
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IRecoverableError extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRecoverableError
     * @type {Guid}
     */
    static IID => Guid("{0f5625e8-0a7b-45ee-9637-1ce13645909e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStage", "GetProvider", "GetChangeWithRecoverableError", "GetRecoverableErrorDataForChange", "GetRecoverableErrorDataForChangeUnit"]

    /**
     * Gets the stage in the synchronization session when the error occurred.
     * @param {Pointer<Integer>} pStage Returns the stage in the synchronization session when the error occurred.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-irecoverableerror-getstage
     */
    GetStage(pStage) {
        pStageMarshal := pStage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pStageMarshal, pStage, "HRESULT")
        return result
    }

    /**
     * Gets the role of the provider that skipped the item change.
     * @param {Pointer<Integer>} pProviderRole Returns the role of the provider that skipped the item change.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-irecoverableerror-getprovider
     */
    GetProvider(pProviderRole) {
        pProviderRoleMarshal := pProviderRole is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pProviderRoleMarshal, pProviderRole, "HRESULT")
        return result
    }

    /**
     * Gets the item change that caused the error.
     * @returns {ISyncChange} Returns the item change that caused the error.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-irecoverableerror-getchangewithrecoverableerror
     */
    GetChangeWithRecoverableError() {
        result := ComCall(5, this, "ptr*", &ppChangeWithRecoverableError := 0, "HRESULT")
        return ISyncChange(ppChangeWithRecoverableError)
    }

    /**
     * Gets additional data about the recoverable error.
     * @param {Pointer<HRESULT>} phrError Returns the error code that is associated with the error that prevented the change unit data from being applied.
     * @returns {IRecoverableErrorData} Returns additional information about the error.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-irecoverableerror-getrecoverableerrordataforchange
     */
    GetRecoverableErrorDataForChange(phrError) {
        phrErrorMarshal := phrError is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, phrErrorMarshal, phrError, "ptr*", &ppErrorData := 0, "HRESULT")
        return IRecoverableErrorData(ppErrorData)
    }

    /**
     * Gets additional data about the recoverable error for a specified change unit.
     * @param {ISyncChangeUnit} pChangeUnit The change unit that is associated with the error.
     * @param {Pointer<HRESULT>} phrError Returns the error code that is associated with the error that prevented the change unit data from being applied.
     * @returns {IRecoverableErrorData} Returns additional information about the error.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-irecoverableerror-getrecoverableerrordataforchangeunit
     */
    GetRecoverableErrorDataForChangeUnit(pChangeUnit, phrError) {
        phrErrorMarshal := phrError is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pChangeUnit, phrErrorMarshal, phrError, "ptr*", &ppErrorData := 0, "HRESULT")
        return IRecoverableErrorData(ppErrorData)
    }
}
