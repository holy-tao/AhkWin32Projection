#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFNetProxyLocator.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Determines the proxy to use when connecting to a server.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetproxylocator
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetProxyLocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFNetProxyLocator
     * @type {Guid}
     */
    static IID => Guid("{e9cd0383-a268-4bb4-82de-658d53574d41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFirstProxy", "FindNextProxy", "RegisterProxyResult", "GetCurrentProxy", "Clone"]

    /**
     * Initializes the proxy locator object.
     * @param {PWSTR} pszHost Null-terminated wide-character string containing the hostname of the destination server.
     * @param {PWSTR} pszUrl Null-terminated wide-character string containing the destination URL.
     * @param {BOOL} fReserved Reserved. Set to <b>FALSE</b>.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetproxylocator-findfirstproxy
     */
    FindFirstProxy(pszHost, pszUrl, fReserved) {
        pszHost := pszHost is String ? StrPtr(pszHost) : pszHost
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(3, this, "ptr", pszHost, "ptr", pszUrl, "int", fReserved, "HRESULT")
        return result
    }

    /**
     * Determines the next proxy to use.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more proxy objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetproxylocator-findnextproxy
     */
    FindNextProxy() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Keeps a record of the success or failure of using the current proxy.
     * @param {HRESULT} hrOp <b>HRESULT</b> specifying the result of using the current proxy for connection.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetproxylocator-registerproxyresult
     */
    RegisterProxyResult(hrOp) {
        result := ComCall(5, this, "int", hrOp, "HRESULT")
        return result
    }

    /**
     * Retrieves the current proxy information including hostname and port.
     * @param {PWSTR} pszStr Pointer to a buffer that receives a null-terminated string containing the proxy hostname and port. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pcchStr On input, specifies the number of elements in the <i>pszStr</i> array. On output, receives the required size of the buffer.
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
     * <dt><b>E_NOT_SUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified in <i>pszStr</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetproxylocator-getcurrentproxy
     */
    GetCurrentProxy(pszStr, pcchStr) {
        pszStr := pszStr is String ? StrPtr(pszStr) : pszStr

        pcchStrMarshal := pcchStr is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pszStr, pcchStrMarshal, pcchStr, "HRESULT")
        return result
    }

    /**
     * Creates a new instance of the default proxy locator.
     * @returns {IMFNetProxyLocator} Receives a pointer to the new proxy locator object's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetproxylocator">IMFNetProxyLocator</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetproxylocator-clone
     */
    Clone() {
        result := ComCall(7, this, "ptr*", &ppProxyLocator := 0, "HRESULT")
        return IMFNetProxyLocator(ppProxyLocator)
    }
}
