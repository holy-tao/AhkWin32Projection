#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureExchange2.ahk

/**
 * The ISCPSecureExchange3 interface extends ISCPSecureExchange2 by providing improved data exchange performance, and a transfer-complete callback method.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecureexchange3
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsecureexchange3-transfercontainerdataonclearchannel
     */
    TransferContainerDataOnClearChannel(pDevice, pData, dwSize, pProgressCallback) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pDevice, pDataMarshal, pData, "uint", dwSize, "ptr", pProgressCallback, "uint*", &pfuReadyFlags := 0, "HRESULT")
        return pfuReadyFlags
    }

    /**
     * 
     * @param {IMDSPDevice} pDevice 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {Integer} 
     */
    GetObjectDataOnClearChannel(pDevice, pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pDevice, "char*", &pData := 0, pdwSizeMarshal, pdwSize, "HRESULT")
        return pData
    }

    /**
     * The TransferCompleteForDevice method is called by Windows Media Device Manager to signal the end of a data transfer for a specific device.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsecureexchange3-transfercompletefordevice
     */
    TransferCompleteForDevice(pDevice) {
        result := ComCall(9, this, "ptr", pDevice, "HRESULT")
        return result
    }
}
