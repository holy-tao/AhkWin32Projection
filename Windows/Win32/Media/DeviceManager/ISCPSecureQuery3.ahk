#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureQuery2.ahk

/**
 * The ISCPSecureQuery3 interface extends ISCPSecureQuery2 by providing a set of new methods for retrieving the rights and making decision on a clear channel.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecurequery3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureQuery3 extends ISCPSecureQuery2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureQuery3
     * @type {Guid}
     */
    static IID => Guid("{b7edd1a2-4dab-484b-b3c5-ad39b8b4c0b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRightsOnClearChannel", "MakeDecisionOnClearChannel"]

    /**
     * The GetRightsOnClearChannel method retrieves rights information for the current piece of content on a clear channel.
     * @param {Pointer<Integer>} pData Pointer to data object.
     * @param {Integer} dwSize Number of bytes of data in the <i>pData</i> buffer.
     * @param {Pointer<Integer>} pbSPSessionKey Pointer to an array of bytes containing the session key for securing communication with the service provider to which <i>pStgGlobals</i> points.
     * @param {Integer} dwSessionKeyLen Length of the byte array to which <i>pbSPSessionKey</i> points.
     * @param {IMDSPStorageGlobals} pStgGlobals Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorageglobals">IWMDMStorageGlobals</a> interface on the root storage of the media or device to or from which the file is being transferred.
     * @param {IWMDMProgress3} pProgressCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress3">IWMDMProgress3</a> interface.
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmrights">WMDMRIGHTS</a> structures containing the rights information for this object. The array is allocated by this method and must be freed using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pnRightsCount Number of <b>WMDMRIGHTS</b> structures in the <i>ppRights</i> array.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the method fails, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_CALL_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called out of sequence. <a href="/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecurequery-getdatademands">ISCPSecureQuery::GetDataDemands</a> and then <a href="/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecurequery-examinedata">ISCPSecureQuery::ExamineData</a>must be called, in that order.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_MAC_CHECK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message authentication code is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NORIGHTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the rights required to perform the requested operation.
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
     * A parameter is invalid or is a <b>NULL</b> pointer.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsecurequery3-getrightsonclearchannel
     */
    GetRightsOnClearChannel(pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, pProgressCallback, ppRights, pnRightsCount) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        ppRightsMarshal := ppRights is VarRef ? "ptr*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pDataMarshal, pData, "uint", dwSize, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStgGlobals, "ptr", pProgressCallback, ppRightsMarshal, ppRights, pnRightsCountMarshal, pnRightsCount, "HRESULT")
        return result
    }

    /**
     * The MakeDecisionOnClearChannel method determines whether access to the content is allowed on a clear channel. If access is allowed, this method returns the interface used to access the content.
     * @param {Integer} fuFlags Flags describing the data offered to the content provider for making decisions. The following flags can be present.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_DECIDE_DATA</td>
     * <td>The <i>pData</i> parameter points to data to be examined.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_TRANSFER_PROTECTED</td>
     * <td>The output object data from the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iscpsecureexchange">ISCPSecureExchange</a> interface must be protected. If Windows Media Device Manager sets neither or both mode flags, digital rights management (DRM) decides whether the output object data from the <b>ISCPSecureExchange</b> interface must be protected or unprotected.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_TRANSFER_UNPROTECTED</td>
     * <td>The output object data from the <b>ISCPSecureExchange</b> interface must be unprotected. If Windows Media Device Manager sets neither or both mode flags, digital rights management (DRM) decides whether the output object data from the <b>ISCPSecureExchange</b> interface must be protected or unprotected.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pData Pointer to a data object containing the data to be examined.
     * @param {Integer} dwSize <b>DWORD</b> that contains the length, in bytes, of the data to be examined.
     * @param {Integer} dwAppSec <b>DWORD</b> that indicates the current level of security of Windows Media Device Manager. This is the smaller of the current security levels of the application and the target service provider.
     * @param {Pointer<Integer>} pbSPSessionKey Pointer to an array of bytes containing the session key for securing communication with the service provider to which <i>pStgGlobals</i> points.
     * @param {Integer} dwSessionKeyLen Length of the byte array to which <i>pbSPSessionKey</i> points.
     * @param {IMDSPStorageGlobals} pStorageGlobals Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorageglobals">IWMDMStorageGlobals</a> interface on the root storage of the media or device to or from which the file is being transferred.
     * @param {IWMDMProgress3} pProgressCallback Pointer to a progress callback object.
     * @param {Pointer<Integer>} pAppCertApp Pointer to an application certificate of the application object.
     * @param {Integer} dwAppCertAppLen <b>DWORD</b> containing the length, in bytes, of the application certificate.
     * @param {Pointer<Integer>} pAppCertSP Pointer to the application certificate of the service provider object.
     * @param {Integer} dwAppCertSPLen <b>DWORD</b> containing the length, in bytes, of the application certificate.
     * @param {Pointer<PWSTR>} pszRevocationURL Pointer to a buffer to hold the revocation URL.
     * @param {Pointer<Integer>} pdwRevocationURLLen Pointer to a <b>DWORD</b> containing the size of the <i>rpszRevocationURL</i> buffer in bytes.
     * @param {Pointer<Integer>} pdwRevocationBitFlag Pointer to a <b>DWORD</b> containing the revocation bit flag. The flag value will be either zero or one or more of the following flag names combined by using a bitwise <b>OR</b>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_WMDM_REVOKED</td>
     * <td>Windows Media Device Manager itself has been revoked.</td>
     * </tr>
     * <tr>
     * <td>WMDM_APP_REVOKED</td>
     * <td>The application has been revoked and needs to be updated before any DRM-protected content can be transferred.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SP_REVOKED</td>
     * <td>The service provider has been revoked and needs to be updated before any DRM-protected content can be transferred to it.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_REVOKED</td>
     * <td>The content provider has been revoked and needs to be updated before any DRM-protected content can be transferred.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pqwFileSize Pointer to a <b>QWORD</b> containing the file size. The content provider is responsible for updating this value or setting it to zero if the size of the destination file cannot be determined at this point.
     * @param {IUnknown} pUnknown Pointer to an unknown interface from the application.
     * @param {Pointer<ISCPSecureExchange>} ppExchange Pointer to an exchange object that receives the exchange interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the method fails, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_CALL_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called out of sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_MAC_CHECK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message authentication code is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_MOREDATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Device Manager must call this method again with another packet of data. The size of the packet is determined by the <i>pdwMinDecisionData</i> parameter in the <a href="/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecurequery-getdatademands">ISCPSecureQuery::GetDataDemands</a> method.
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
     * The caller does not have the rights required to perform the requested transfer.
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
     * A parameter is invalid or is a <b>NULL</b> pointer.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsecurequery3-makedecisiononclearchannel
     */
    MakeDecisionOnClearChannel(fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, pProgressCallback, pAppCertApp, dwAppCertAppLen, pAppCertSP, dwAppCertSPLen, pszRevocationURL, pdwRevocationURLLen, pdwRevocationBitFlag, pqwFileSize, pUnknown, ppExchange) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        pAppCertAppMarshal := pAppCertApp is VarRef ? "char*" : "ptr"
        pAppCertSPMarshal := pAppCertSP is VarRef ? "char*" : "ptr"
        pszRevocationURLMarshal := pszRevocationURL is VarRef ? "ptr*" : "ptr"
        pdwRevocationURLLenMarshal := pdwRevocationURLLen is VarRef ? "uint*" : "ptr"
        pdwRevocationBitFlagMarshal := pdwRevocationBitFlag is VarRef ? "uint*" : "ptr"
        pqwFileSizeMarshal := pqwFileSize is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", fuFlags, pDataMarshal, pData, "uint", dwSize, "uint", dwAppSec, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStorageGlobals, "ptr", pProgressCallback, pAppCertAppMarshal, pAppCertApp, "uint", dwAppCertAppLen, pAppCertSPMarshal, pAppCertSP, "uint", dwAppCertSPLen, pszRevocationURLMarshal, pszRevocationURL, pdwRevocationURLLenMarshal, pdwRevocationURLLen, pdwRevocationBitFlagMarshal, pdwRevocationBitFlag, pqwFileSizeMarshal, pqwFileSize, "ptr", pUnknown, "ptr*", ppExchange, "HRESULT")
        return result
    }
}
