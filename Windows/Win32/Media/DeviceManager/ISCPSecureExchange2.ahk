#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureExchange.ahk

/**
 * The ISCPSecureExchange2 interface extends ISCPSecureExchange by providing a new version of the TransferContainerData method.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-iscpsecureexchange2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureExchange2 extends ISCPSecureExchange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureExchange2
     * @type {Guid}
     */
    static IID => Guid("{6c62fc7b-2690-483f-9d44-0a20cb35577c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferContainerData2"]

    /**
     * The TransferContainerData2 method transfers container file data to the secure content provider.
     * @remarks
     * Windows Media Device Manager calls this method repeatedly, transferring data from the container file to the secure content provider. Windows Media Device Manager eventually calls this method with <i>dwSize</i> set to zero to indicate that it has no more data to transfer. As the secure content provider collects the data and extracts the various objects from it, it reports back to Windows Media Device Manager which objects, if any, are available after each call. If no objects are available, the secure content provider returns S_OK with the <i>pfuReadyFlags</i> parameter set to zero. When the secure content provider has determined that it requires no further processing and/or modification of the file being transferred, the flag WMDM_SCP_NO_MORE_CHANGES is returned. Windows Media Device Manager can then directly transfer the remainder of the file to the device.
     * 
     * Object data is transferred from the secure content provider by calling the <b>ObjectData</b> method. Windows Media Device Manager calls <b>ObjectData</b> repeatedly until it returns zero in the second parameter, <i>dwBytesWrite</i>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercomplete">TransferComplete</a> method is called by Windows Media Device Manager to signal the end of a secure transfer of data.
     * 
     * Windows Media Device Manager passes the application-provided progress callback to the secure content provider in the <i>pProgressCallback</i> parameter. The secure content provider can use this parameter to provide progress notification for any steps that it needs to carry out. The step itself is identified by <i>EventId</i>, which is the first parameter of the methods of <b>IWMDMProgress3</b>. A specific secure content provider implementation will define <i>EventId</i> values for applications to use.
     * @param {Pointer<Integer>} pData Pointer to a buffer holding the current data being transferred from the container file. This parameter must be included in the input message authentication code and must be encrypted.
     * @param {Integer} dwSize <b>DWORD</b> that contains the number of bytes in the buffer. This parameter must be included in the input message authentication code.
     * @param {IWMDMProgress3} pProgressCallback Progress callback on which the secure content provider can report progress of any steps that it might need to carry out. The step will be identified by the <i>EventId</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress3">IWMDMProgress3</a> methods.
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
     * <td>The secure content provider has determined that it requires no further processing and/or modification of the file being transferred. Windows Media Device Manager can directly transfer the remainder of the file to the device.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iscpsecureexchange2-transfercontainerdata2
     */
    TransferContainerData2(pData, dwSize, pProgressCallback, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pDataMarshal, pData, "uint", dwSize, "ptr", pProgressCallback, "uint*", &pfuReadyFlags := 0, abMacMarshal, abMac, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfuReadyFlags
    }
}
