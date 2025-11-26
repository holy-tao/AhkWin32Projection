#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMOpenProgress interface reports the progress of a file-open operation and enables the application to cancel the operation.Filters that open files over a network can expose this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamopenprogress
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMOpenProgress extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMOpenProgress
     * @type {Guid}
     */
    static IID => Guid("{8e1c39a1-de53-11cf-aa63-0080c744528d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryProgress", "AbortOperation"]

    /**
     * The QueryProgress method retrieves the progress of the file-open operation.
     * @param {Pointer<Integer>} pllTotal Pointer to a variable that receives the length of the entire file, in bytes.
     * @param {Pointer<Integer>} pllCurrent Pointer to a variable that receives the length of the downloaded portion of the file, in bytes.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * <dt><b>VFW_S_ESTIMATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned values are estimates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamopenprogress-queryprogress
     */
    QueryProgress(pllTotal, pllCurrent) {
        pllTotalMarshal := pllTotal is VarRef ? "int64*" : "ptr"
        pllCurrentMarshal := pllCurrent is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, pllTotalMarshal, pllTotal, pllCurrentMarshal, pllCurrent, "HRESULT")
        return result
    }

    /**
     * The AbortOperation method cancels the file-open operation.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamopenprogress-abortoperation
     */
    AbortOperation() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
