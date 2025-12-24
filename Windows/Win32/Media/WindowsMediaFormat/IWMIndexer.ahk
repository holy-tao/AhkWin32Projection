#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMIndexer interface is used to create an index for ASF files to enable seeking.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmindexer
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMIndexer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMIndexer
     * @type {Guid}
     */
    static IID => Guid("{6d7cdc71-9888-11d3-8edc-00c04f6109cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartIndexing", "Cancel"]

    /**
     * The StartIndexing method initiates indexing.
     * @param {PWSTR} pwszURL Pointer to a wide-character <b>null</b>-terminated string containing the URL or file name.
     * @param {IWMStatusCallback} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The parameter <i>pwszURL</i> or <i>pCallback</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method cannot start indexing in the current state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmindexer-startindexing
     */
    StartIndexing(pwszURL, pCallback, pvContext) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pwszURL, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The Cancel method cancels the current indexing operation.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmindexer-cancel
     */
    Cancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
