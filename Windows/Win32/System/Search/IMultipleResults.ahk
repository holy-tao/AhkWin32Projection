#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IMultipleResults extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultipleResults
     * @type {Guid}
     */
    static IID => Guid("{0c733a90-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResult"]

    /**
     * Retrieves a list of properties the recognizer can return for a result range.
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} lResultFlag 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer>} pcRowsAffected 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
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
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pPropertyGuid</i> buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getresultpropertylist
     */
    GetResult(pUnkOuter, lResultFlag, riid, pcRowsAffected, ppRowset) {
        pcRowsAffectedMarshal := pcRowsAffected is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", lResultFlag, "ptr", riid, pcRowsAffectedMarshal, pcRowsAffected, "ptr*", ppRowset, "HRESULT")
        return result
    }
}
