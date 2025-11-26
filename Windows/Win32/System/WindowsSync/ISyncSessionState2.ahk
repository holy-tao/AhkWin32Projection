#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncSessionState.ahk

/**
 * Represents additional information about the current synchronization session.
 * @remarks
 * 
 * An <b>ISyncSessionState2</b> object can be obtained by passing <b>IID_ISyncSessionState2</b> to the <b>QueryInterface</b> method of an <b>ISyncSessionState</b> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncsessionstate2
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncSessionState2 extends ISyncSessionState{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncSessionState2
     * @type {Guid}
     */
    static IID => Guid("{9e37cfa3-9e38-4c61-9ca3-ffe810b45ca2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProviderWithError", "GetSessionErrorStatus"]

    /**
     * Indicates which provider caused synchronization to fail.
     * @param {BOOL} fSelf <b>TRUE</b> when the provider that calls this method is the provider that caused the error. Otherwise,<b> FALSE</b>.
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
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A synchronization session does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionstate2-setproviderwitherror
     */
    SetProviderWithError(fSelf) {
        result := ComCall(10, this, "int", fSelf, "HRESULT")
        return result
    }

    /**
     * Gets the error value that indicates why the synchronization session failed.
     * @param {Pointer<HRESULT>} phrSessionError The error value that indicates why the synchronization session failed.
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
     * <dt><b>E_POINTER
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionstate2-getsessionerrorstatus
     */
    GetSessionErrorStatus(phrSessionError) {
        phrSessionErrorMarshal := phrSessionError is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, phrSessionErrorMarshal, phrSessionError, "HRESULT")
        return result
    }
}
