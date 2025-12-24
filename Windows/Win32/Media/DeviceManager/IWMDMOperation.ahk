#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This optional, application-implemented IWMDMOperation interface allows the application to control how data is read from or written to the computer during a file transfer.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmoperation
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMOperation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMOperation
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a0b-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginRead", "BeginWrite", "GetObjectName", "SetObjectName", "GetObjectAttributes", "SetObjectAttributes", "GetObjectTotalSize", "SetObjectTotalSize", "TransferObjectData", "End"]

    /**
     * The BeginRead method indicates that a &quot;read from device&quot; action is beginning. Windows Media Device Manager only calls this method if the application calls IWMDMStorageControl::Read and passes in this IWMDMOperation interface.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
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
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-beginread
     */
    BeginRead() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The BeginWrite method indicates that a &quot;write to device&quot; action is beginning. Windows Media Device Manager only calls this method if the application calls IWMDMStorageControl/2/3::Insert/2/3 and passes in this interface.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
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
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-beginwrite
     */
    BeginWrite() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Windows Media Device Manager calls GetObjectName before an object is written to the device in order to know what it should be named on the device.
     * @param {PWSTR} pwszName Pointer to a wide-character null-terminated string that specifies the object name. The name should include a file extension, if required. Windows Media Device Manager allocates and releases this buffer. <i>nMaxChars</i> specifies the maximum number of characters, including the terminating null character.
     * @param {Integer} nMaxChars Integer specifying the number of characters in <i>pwszName</i>, including the terminating null character.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
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
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-getobjectname
     */
    GetObjectName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(5, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * The SetObjectName method assigns a name to the content being read or written. This method is currently not called by Windows Media Device Manager.
     * @param {PWSTR} pwszName Pointer to a wide-character null-terminated string specifying the object name.
     * @param {Integer} nMaxChars Integer specifying the maximum number of characters that this string can hold.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
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
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-setobjectname
     */
    SetObjectName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * The GetObjectAttributes method allows the application to specify attributes for an object being written to a device. Windows Media Device Manager calls this method before a file is written to the device in order to learn the file's attributes.
     * @param {Pointer<WAVEFORMATEX>} pFormat Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structure that specifies the audio format for files with audio data attributes.
     * @returns {Integer} Pointer to a <b>DWORD</b> that specifies the attributes defined in the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-getattributes">IWMDMStorage::GetAttributes</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-getobjectattributes
     */
    GetObjectAttributes(pFormat) {
        result := ComCall(7, this, "uint*", &pdwAttributes := 0, "ptr", pFormat, "HRESULT")
        return pdwAttributes
    }

    /**
     * The SetObjectAttributes method specifies the file attributes. This method is currently not called by Windows Media Device Manager.
     * @param {Integer} dwAttributes <b>DWORD</b> specifying the object attributes as defined in the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-setattributes">IWMDMStorage::SetAttributes</a> method.
     * @param {Pointer<WAVEFORMATEX>} pFormat Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structure specifying the format for files with audio data attributes. If the file contains audio data, this parameter should be filled.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
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
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-setobjectattributes
     */
    SetObjectAttributes(dwAttributes, pFormat) {
        result := ComCall(8, this, "uint", dwAttributes, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * Windows Media Device Manager calls GetObjectTotalSize before a file is written to the device in order to retrieve the total size of the object, in bytes.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> that, on return, specifies the low-order bits of the object size in bytes.
     * @param {Pointer<Integer>} pdwSizeHigh Pointer to a <b>DWORD</b> that, on return, specifies the high-order bits of the object size in bytes.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
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
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-getobjecttotalsize
     */
    GetObjectTotalSize(pdwSize, pdwSizeHigh) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        pdwSizeHighMarshal := pdwSizeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwSizeMarshal, pdwSize, pdwSizeHighMarshal, pdwSizeHigh, "HRESULT")
        return result
    }

    /**
     * The SetObjectTotalSize method assigns the total size in bytes of an object. This method is currently not called by Windows Media Device Manager.
     * @param {Integer} dwSize <b>DWORD</b> specifying the low-order bits of the object size, in bytes.
     * @param {Integer} dwSizeHigh <b>DWORD</b> specifying the high-order bits of the object size, in bytes.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
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
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-setobjecttotalsize
     */
    SetObjectTotalSize(dwSize, dwSizeHigh) {
        result := ComCall(10, this, "uint", dwSize, "uint", dwSizeHigh, "HRESULT")
        return result
    }

    /**
     * The TransferObjectData method is called to allow the application to transfer a block of data to or from the computer.
     * @param {Pointer<Integer>} pData Pointer to a buffer containing the data. This buffer is always allocated and freed by Windows Media Device Manager. Your application should never allocate or free this buffer.
     * 
     * <b>BeginRead</b>[in] During a read from device, incoming data that must be decrypted using the <a href="https://docs.microsoft.com/previous-versions/bb231586(v=vs.85)">CSecureChannelClient::DecryptParam</a> method. The application does not need to deallocate the buffer.
     * 
     * <b>BeginWrite</b>[in, out] During a write to device, on input is a memory buffer <i>pdwSize</i> bytes long, allocated by Windows Media Device Manager. The application should fill this buffer with data that has been encrypted using the <a href="https://docs.microsoft.com/previous-versions/bb231587(v=vs.85)">CSecureChannelClient::EncryptParam</a> method.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> that specifies the transfer buffer size.
     * 
     * <b>BeginRead</b>[in, out] On input, the size of the incoming data in <i>pData</i>. On output, the amount of data the application has actually actually read.
     * 
     * <b>BeginWriteOn</b> input, the size of the <i>pData</i> buffer. On output, the actual size of the data sent out.
     * @param {Pointer<Integer>} abMac Array of bytes specifying the message authentication code for the parameter data of this method.
     * 
     * <b>BeginRead</b>[in] A MAC generated from <i>pData</i> and <i>pdwSize</i> that the application should check after <i>pData</i> is decrypted, to verify that the data has not been modified.
     * 
     * <b>BeginWrite</b>[out] A MAC generated from <i>pData</i> and <i>pdwSize</i> before <i>pData</i> is encrypted.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
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
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-transferobjectdata
     */
    TransferObjectData(pData, pdwSize, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, pDataMarshal, pData, pdwSizeMarshal, pdwSize, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * The End method indicates that a read or write operation is finished, whether successful or not, and it returns a completion code.
     * @param {Pointer<HRESULT>} phCompletionCode Completion code for the operation.
     * @param {IUnknown} pNewObject When sending to a device, a pointer to a new <b>IWMDMStorage</b> object representing the new object that has been sent to the device. When reading from a device, a pointer to the <b>IWMDMStorage</b> object that was read from the device.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmoperation-end
     */
    End(phCompletionCode, pNewObject) {
        phCompletionCodeMarshal := phCompletionCode is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, phCompletionCodeMarshal, phCompletionCode, "ptr", pNewObject, "HRESULT")
        return result
    }
}
