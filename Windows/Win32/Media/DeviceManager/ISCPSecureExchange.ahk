#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISCPSecureExchange interface is used to exchange secured content and rights associated with content. The secure content provider implements this interface and secure Windows Media Device Manager implementations call its methods.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iscpsecureexchange
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureExchange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureExchange
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a0e-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferContainerData", "ObjectData", "TransferComplete"]

    /**
     * The TransferContainerData method transfers container file data to the secure content provider. The secure content provider breaks down the container internally and reports which parts of the content are available as they are extracted from the container.
     * @remarks
     * Windows Media Device Manager calls this method repeatedly, transferring data from the container file to the secure content provider. Windows Media Device Manager eventually calls this method with <i>dwSize</i> set to zero to indicate that it has no more data to transfer. As the secure content provider collects the data and extracts the various objects from it, it reports back to Windows Media Device Manager which objects, if any, are available after each call. If no objects are available, the secure content provider returns S_OK with the <i>pfuReadyFlags</i> parameter set to zero. When the secure content provider has determined that it requires no further processing and/or modification of the file being transferred, the flag WMDM_SCP_NO_MORE_CHANGES is returned. Windows Media Device Manager can then directly transfer the remainder of the file to the device.
     * 
     * Object data is transferred from the secure content provider by calling the <b>ObjectData</b> method. Windows Media Device Manager calls <b>ObjectData</b> repeatedly until it returns zero in the second parameter, <i>dwBytesWrite</i>.
     * 
     * The <b>TransferComplete</b> method is called by Windows Media Device Manager to signal the end of a secure transfer of data.
     * @param {Pointer<Integer>} pData Pointer to a buffer holding the current data being transferred from the container file. This parameter must be included in the input message authentication code and must be encrypted.
     * @param {Integer} dwSize <b>DWORD</b> that contains the number of bytes in the buffer. This parameter must be included in the input message authentication code.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {Integer} Flag indicating which parts of the container file are ready to be read. This parameter is included in the output message authentication code. The following flags indicate what is ready.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_TRANSFER_OBJECTDATA</td>
     * <td>Data of the object is available by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecureexchange-objectdata">ObjectData</a> method.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_NO_MORE_CHANGES</td>
     * <td>Set when the secure content provider has determined that it requires no further processing and/or modification of the file being transferred. Windows Media Device Manager can directly transfer the remainder of the file to the device.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercontainerdata
     */
    TransferContainerData(pData, dwSize, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pDataMarshal, pData, "uint", dwSize, "uint*", &pfuReadyFlags := 0, abMacMarshal, abMac, "HRESULT")
        return pfuReadyFlags
    }

    /**
     * The ObjectData method transfers a block of object data back to Windows Media Device Manager.
     * @remarks
     * To transfer data, Windows Media Device Manager calls the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercontainerdata">TransferContainerData</a> method to obtain the container data. <b>ObjectData</b> is then called to transfer blocks of object data from the secure content provider to Windows Media Device Manager. If S_OK is returned with <i>pdwSize</i> set to zero, Windows Media Device Manager will request no further data.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> containing the transfer size. This parameter must be included in both the input and output message authentication codes.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {Integer} Pointer to a buffer to receive data. This parameter is included in the output message authentication code and is encrypted.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange-objectdata
     */
    ObjectData(pdwSize, abMac) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "char*", &pData := 0, pdwSizeMarshal, pdwSize, abMacMarshal, abMac, "HRESULT")
        return pData
    }

    /**
     * The TransferComplete method is called by Windows Media Device Manager to signal the end of a secure transfer of data. In this method, the secure content provider can perform any additional processing required to enable the content on the target device.
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercomplete
     */
    TransferComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
