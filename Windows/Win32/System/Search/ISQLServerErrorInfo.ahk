#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISQLServerErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISQLServerErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{5cf4ca12-ef21-11d0-97e7-00c04fc2ad98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetErrorInfo"]

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @param {Pointer<Pointer<SSERRORINFO>>} ppErrorInfo 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was no error object to return.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-geterrorinfo
     */
    GetErrorInfo(ppErrorInfo, ppStringsBuffer) {
        ppErrorInfoMarshal := ppErrorInfo is VarRef ? "ptr*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppErrorInfoMarshal, ppErrorInfo, ppStringsBufferMarshal, ppStringsBuffer, "HRESULT")
        return result
    }
}
