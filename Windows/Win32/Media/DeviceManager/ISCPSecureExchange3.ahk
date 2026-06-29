#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISCPSecureExchange2.ahk" { ISCPSecureExchange2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMDSPDevice.ahk" { IMDSPDevice }
#Import ".\IWMDMProgress3.ahk" { IWMDMProgress3 }

/**
 * The ISCPSecureExchange3 interface extends ISCPSecureExchange2 by providing improved data exchange performance, and a transfer-complete callback method.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iscpsecureexchange3
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct ISCPSecureExchange3 extends ISCPSecureExchange2 {
    /**
     * The interface identifier for ISCPSecureExchange3
     * @type {Guid}
     */
    static IID := Guid("{ab4e77e4-8908-4b17-bd2a-b1dbe6dd69e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISCPSecureExchange3 interfaces
    */
    struct Vtbl extends ISCPSecureExchange2.Vtbl {
        TransferContainerDataOnClearChannel : IntPtr
        GetObjectDataOnClearChannel         : IntPtr
        TransferCompleteForDevice           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISCPSecureExchange3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange3-transfercontainerdataonclearchannel
     */
    TransferContainerDataOnClearChannel(pDevice, pData, dwSize, pProgressCallback) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pDevice, pDataMarshal, pData, "uint", dwSize, "ptr", pProgressCallback, "uint*", &pfuReadyFlags := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/WMDM/iscpsecureexchange3--getobjectdataonclearchannel
     */
    GetObjectDataOnClearChannel(pDevice, pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pDevice, "char*", &pData := 0, pdwSizeMarshal, pdwSize, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange3-transfercompletefordevice
     */
    TransferCompleteForDevice(pDevice) {
        result := ComCall(9, this, "ptr", pDevice, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISCPSecureExchange3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TransferContainerDataOnClearChannel := CallbackCreate(GetMethod(implObj, "TransferContainerDataOnClearChannel"), flags, 6)
        this.vtbl.GetObjectDataOnClearChannel := CallbackCreate(GetMethod(implObj, "GetObjectDataOnClearChannel"), flags, 4)
        this.vtbl.TransferCompleteForDevice := CallbackCreate(GetMethod(implObj, "TransferCompleteForDevice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TransferContainerDataOnClearChannel)
        CallbackFree(this.vtbl.GetObjectDataOnClearChannel)
        CallbackFree(this.vtbl.TransferCompleteForDevice)
    }
}
