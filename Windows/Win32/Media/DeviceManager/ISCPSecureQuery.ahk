#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureExchange.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISCPSecureQuery interface is queried by Windows Media Device Manager to determine ownership of secured content.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecurequery
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureQuery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureQuery
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a0d-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDataDemands", "ExamineData", "MakeDecision", "GetRights"]

    /**
     * The GetDataDemands method reports which data the secure content provider needs to determine the rights and responsibility for a specified piece of content.
     * @param {Pointer<Integer>} pfuFlags Flags describing the data required by the secure content provider to make decisions. This parameter is included in the output message authentication code. At least one of the following flags must be used.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_RIGHTS_DATA</td>
     * <td>The secure content provider needs data to determine rights for the content.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_EXAMINE_DATA</td>
     * <td>The secure content provider needs data to determine whether it is responsible for the content.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_DECIDE_DATA</td>
     * <td>The secure content provider needs data to determine whether to allow the content to be downloaded.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_EXAMINE_EXTENSION</td>
     * <td>The secure content provider needs to examine the file name extension to determine whether to allow the content to be downloaded.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_PROTECTED_OUTPUT</td>
     * <td>The secure content provider needs protected output.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_UNPROTECTED_OUTPUT</td>
     * <td>The secure content provider needs unprotected output.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwMinRightsData Pointer to a <b>DWORD</b> specifying the minimum amount of data needed to determine rights for this content. This parameter is included in the output message authentication code.
     * @param {Pointer<Integer>} pdwMinExamineData Pointer to a <b>DWORD</b> containing the minimum number of bytes of data that the secure content provider needs to determine whether it is responsible for the content. This parameter is included in the output message authentication code.
     * @param {Pointer<Integer>} pdwMinDecideData Pointer to a <b>DWORD</b> containing the minimum number of bytes of data that the secure content provider needs to determine whether to allow the content to be downloaded. This parameter is included in the output message authentication code.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is an invalid or <b>NULL</b> pointer.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsecurequery-getdatademands
     */
    GetDataDemands(pfuFlags, pdwMinRightsData, pdwMinExamineData, pdwMinDecideData, abMac) {
        pfuFlagsMarshal := pfuFlags is VarRef ? "uint*" : "ptr"
        pdwMinRightsDataMarshal := pdwMinRightsData is VarRef ? "uint*" : "ptr"
        pdwMinExamineDataMarshal := pdwMinExamineData is VarRef ? "uint*" : "ptr"
        pdwMinDecideDataMarshal := pdwMinDecideData is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pfuFlagsMarshal, pfuFlags, pdwMinRightsDataMarshal, pdwMinRightsData, pdwMinExamineDataMarshal, pdwMinExamineData, pdwMinDecideDataMarshal, pdwMinDecideData, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * The ExamineData method determines rights and responsibility for the content by examining data that Windows Media Device Manager passes to this method.
     * @param {Integer} fuFlags Flags describing the data offered to the secure content provider to make decisions. The following flags can be present.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_EXAMINE_DATA</td>
     * <td>The <i>pData</i> parameter points to data to be examined.</td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszExtension Pointer to the file name extension to be examined if the secure content provider asks for an extension in the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecurequery-getdatademands">GetDataDemands</a> call.
     * @param {Pointer<Integer>} pData Pointer to the data at the beginning of the file to be examined. This parameter must be included in the input message authentication code and must be encrypted.
     * @param {Integer} dwSize <b>DWORD</b> that contains the length, in bytes, of the data to be examined. This parameter must be included in the input message authentication code.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
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
     * The method succeeded. The secure content provider is responsible for this content.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_CALL_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called out of sequence. <b>GetDataDemands</b> must be called first.
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
     * Windows Media Device Manager must call this method again with another packet of data. The size of the packet is determined by the <i>pdwMinExamineData</i> parameter in the <b>GetDataDemands</b> method.
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
     * The secure content provider is not responsible for this content. Terminate interaction with the secure content provider.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsecurequery-examinedata
     */
    ExamineData(fuFlags, pwszExtension, pData, dwSize, abMac) {
        pwszExtension := pwszExtension is String ? StrPtr(pwszExtension) : pwszExtension

        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", fuFlags, "ptr", pwszExtension, pDataMarshal, pData, "uint", dwSize, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * The MakeDecision method determines whether access to the content is allowed. If access is allowed, this method returns the interface that will be used to access the content.
     * @param {Integer} fuFlags Flags describing the data offered to the secure content provider for making decisions. This parameter must be included in the input message authentication code. The following flags can be present.
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
     * <td>The output object data from the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iscpsecureexchange">ISCPSecureExchange</a> interface must be protected. If Windows Media Device Manager sets neither or both mode flags, DRM decides whether the output object data from the <b>ISCPSecureExchange</b> interface must be protected or unprotected.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_TRANSFER_UNPROTECTED</td>
     * <td>The output object data from the <b>ISCPSecureExchange</b> interface must be unprotected. If Windows Media Device Manager sets neither or both mode flags, DRM decides whether the output object data from the <b>ISCPSecureExchange</b> interface must be protected or unprotected.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pData Pointer to a data object containing the data to be examined. This parameter must be included in the input message authentication code and must be encrypted.
     * @param {Integer} dwSize <b>DWORD</b> that contains the length, in bytes, of the data to be examined. This parameter must be included in the input message authentication code.
     * @param {Integer} dwAppSec <b>DWORD</b> that indicates the current level of security of Windows Media Device Manager. This is the smaller of the current security levels of the application and the target service provider. This parameter must be included in the input message authentication code.
     * @param {Pointer<Integer>} pbSPSessionKey Pointer to an array of bytes containing the session key for securing communication with the service provider to which <i>pStgGlobals</i> points. This parameter must be included in the input message authentication code and must be encrypted.
     * @param {Integer} dwSessionKeyLen Length of the byte array to which <i>pbSPSessionKey</i> points. This parameter must be included in the input message authentication code.
     * @param {IMDSPStorageGlobals} pStorageGlobals Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorageglobals">IWMDMStorageGlobals</a> interface on the root storage of the media or device to or from which the file is being transferred. This parameter must be included in the input message authentication code.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {ISCPSecureExchange} Pointer to an exchange object that receives the exchange interface.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsecurequery-makedecision
     */
    MakeDecision(fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", fuFlags, pDataMarshal, pData, "uint", dwSize, "uint", dwAppSec, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStorageGlobals, "ptr*", &ppExchange := 0, abMacMarshal, abMac, "HRESULT")
        return ISCPSecureExchange(ppExchange)
    }

    /**
     * The GetRights method retrieves rights information for the current piece of content. Rights are file-specific.
     * @param {Pointer<Integer>} pData Pointer to data requested by <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecurequery-getdatademands">GetDataDemands</a>. This parameter must be included in the input message authentication code and must be encrypted.
     * @param {Integer} dwSize Number of bytes of data in the <i>pData</i> buffer. This parameter must be included in the input message authentication code.
     * @param {Pointer<Integer>} pbSPSessionKey Pointer to an array of bytes containing the session key for securing communication with the service provider to which <i>pStgGlobals</i> points. This parameter must be included in the input message authentication code and must be encrypted.
     * @param {Integer} dwSessionKeyLen Length of the byte array to which <i>pbSPSessionKey</i> points. This parameter must be included in the input message authentication code.
     * @param {IMDSPStorageGlobals} pStgGlobals Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorageglobals">IWMDMStorageGlobals</a> interface on the root storage of the media or device to or from which the file is being transferred.
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmrights">WMDMRIGHTS</a> structures containing the rights information for this object. The array is allocated by this method and must be freed using <b>CoTaskMemFree</b>. This parameter is included in the output message authentication code.
     * @param {Pointer<Integer>} pnRightsCount Number of <b>WMDMRIGHTS</b> structures in the <i>ppRights</i> array. This parameter is included in the output message authentication code.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
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
     * This method was called out of sequence. <b>GetDataDemands</b> and then <a href="/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecurequery-examinedata">ExamineData</a> must be called first, in that order.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsecurequery-getrights
     */
    GetRights(pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, ppRights, pnRightsCount, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        ppRightsMarshal := ppRights is VarRef ? "ptr*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pDataMarshal, pData, "uint", dwSize, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStgGlobals, ppRightsMarshal, ppRights, pnRightsCountMarshal, pnRightsCount, abMacMarshal, abMac, "HRESULT")
        return result
    }
}
