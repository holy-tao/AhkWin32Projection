#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureExchange2.ahk

/**
 * The ISCPSecureExchange3 interface extends ISCPSecureExchange2 by providing improved data exchange performance, and a transfer-complete callback method.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-iscpsecureexchange3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureExchange3 extends ISCPSecureExchange2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureExchange3
     * @type {Guid}
     */
    static IID => Guid("{ab4e77e4-8908-4b17-bd2a-b1dbe6dd69e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferContainerDataOnClearChannel", "GetObjectDataOnClearChannel", "TransferCompleteForDevice"]

    /**
     * The TransferContainerDataOnClearChannel method transfers container file data to the content provider through the clear channel.
     * @remarks
     * Windows Media Device Manager calls this method repeatedly, transferring data from the container file to the content provider. Windows Media Device Manager eventually calls this method with <i>dwSize</i> set to zero to indicate that it has no more data to transfer. As the content provider collects the data and extracts the various objects from it, it reports back to Windows Media Device Manager which objects, if any, are available after each call. If no objects are available, the content provider returns S_OK with the <i>pfuReadyFlags</i> parameter set to zero. When the content provider has determined that it requires no further processing and/or modification of the file being transferred, the flag WMDM_SCP_NO_MORE_CHANGES is returned. Windows Media Device Manager can then directly transfer the remainder of the file to the device.
     * 
     * Object data is transferred from the content provider by calling the <b>GetObjectDataOnClearChannel</b> method. Windows Media Device Manager calls <b>GetObjectDataOnClearChannel</b> repeatedly until it returns zero in the third parameter, <i>pdwsize</i>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercomplete">ISCPSecureExchange::TransferComplete</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecureexchange3-transfercompletefordevice">TransferCompleteForDevice</a> if a session is active) method is called by Windows Media Device Manager to signal the end of a data transfer.
     * 
     * Windows Media Device Manager passes the application-provided progress callback to the content provider in the <i>pProgressCallback</i> parameter. The content provider can use this parameter to provide progress notification for any steps that it needs to carry out. The step itself is identified by <i>EventId</i>, which is the first parameter of the methods of <b>IWMDMProgress3</b>. A specific content provider implementation will define <i>EventId</i> values for applications to use.
     * 
     * This method is identical to <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercontainerdata">ISCPSecureExchange::TransferContainerData</a> except that the parameters passed to this method are not encrypted. Consequently this method is more efficient.
     * @param {IMDSPDevice} pDevice Pointer to a device object.
     * @param {Pointer<Integer>} pData Pointer to a buffer holding the current data being transferred from the container file.
     * @param {Integer} dwSize Contains the number of bytes in the buffer.
     * @param {IWMDMProgress3} pProgressCallback Progress callback on which the content provider can report progress of any steps that it might need to carry out. The step will be identified by the <i>EventId</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress3">IWMDMProgress3</a> methods.
     * @returns {Integer} Flag indicating which parts of the container file are ready to be read. This parameter is included in the output message authentication code. The following flags indicate what is ready.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WMDM_SCP_TRANSFER_OBJECTDATA"></a><a id="wmdm_scp_transfer_objectdata"></a><dl>
     * <dt><b>WMDM_SCP_TRANSFER_OBJECTDATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data of the object is available by calling the <a href="https://docs.microsoft.com/windows/desktop/WMDM/iscpsecureexchange3--getobjectdataonclearchannel">GetObjectDataOnClearChannel</a> method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WMDM_SCP_NO_MORE_CHANGES"></a><a id="wmdm_scp_no_more_changes"></a><dl>
     * <dt><b>WMDM_SCP_NO_MORE_CHANGES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The content provider has determined that it requires no further processing and/or modification of the file being transferred. Windows Media Device Manager can directly transfer the remainder of the file to the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iscpsecureexchange3-transfercontainerdataonclearchannel
     */
    TransferContainerDataOnClearChannel(pDevice, pData, dwSize, pProgressCallback) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pDevice, pDataMarshal, pData, "uint", dwSize, "ptr", pProgressCallback, "uint*", &pfuReadyFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfuReadyFlags
    }

    /**
     * The GetObjectDataOnClearChannel method transfers a block of object data on a clear channel back to Windows Media Device Manager.
     * @remarks
     * To transfer data, Windows Media Device Manager calls the [TransferContainerDataOnClearChannel](/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecureexchange3-transfercontainerdataonclearchannel) method to obtain the container data. **GetObjectDataOnClearChannel** is then called to transfer blocks of object data from the content provider to Windows Media Device Manager. If S\_OK is returned with *pdwSize* set to zero, Windows Media Device Manager will request no further data.
     * 
     * This method is identical to [**ISCPSecureExchange::ObjectData**](/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecureexchange-objectdata) except that the data returned by this method is not encrypted. Consequently this method is more efficient.
     * @param {IMDSPDevice} pDevice Pointer to the device object.
     * @param {Pointer<Integer>} pdwSize Pointer to a **DWORD** containing the transfer size.
     * @returns {Integer} Pointer to a buffer to receive data.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMDM/iscpsecureexchange3--getobjectdataonclearchannel
     */
    GetObjectDataOnClearChannel(pDevice, pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pDevice, "char*", &pData := 0, pdwSizeMarshal, pdwSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pData
    }

    /**
     * The TransferCompleteForDevice method is called by Windows Media Device Manager to signal the end of a data transfer for a specific device.
     * @remarks
     * This method is identical to <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercomplete">ISCPSecureExchange::TransferComplete</a> except that this method is called when transfer is completed within a transfer session.
     * 
     * In that case, the secure content provider needs to know which device the transfer was completed for, so this method accepts a <i>pDevice</i> parameter.
     * @param {IMDSPDevice} pDevice Pointer to a device object.
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
     * <dt><b>WMDM_E_NOT_CERTIFIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not authorized to use this interface.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iscpsecureexchange3-transfercompletefordevice
     */
    TransferCompleteForDevice(pDevice) {
        result := ComCall(9, this, "ptr", pDevice, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
