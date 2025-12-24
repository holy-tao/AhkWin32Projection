#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAttachment.ahk

/**
 * Enables applications to send attachment data in a message using a MIME container.
 * @see https://docs.microsoft.com/windows/win32/api//wsdattachment/nn-wsdattachment-iwsdoutboundattachment
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDOutboundAttachment extends IWSDAttachment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDOutboundAttachment
     * @type {Guid}
     */
    static IID => Guid("{aa302f8d-5a22-4ba5-b392-aa8486f4c15d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Write", "Close", "Abort"]

    /**
     * Sends attachment data to the remote host using a MIME container.
     * @param {Pointer<Integer>} pBuffer Pointer to a buffer containing the output data. The application program is responsible for allocating and freeing this data buffer.
     * @param {Integer} dwBytesToWrite Number of bytes to send to the remote host from <i>pBuffer</i>.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the number of bytes of data actually sent to the remote host.
     * @see https://docs.microsoft.com/windows/win32/api//wsdattachment/nf-wsdattachment-iwsdoutboundattachment-write
     */
    Write(pBuffer, dwBytesToWrite) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pBufferMarshal, pBuffer, "uint", dwBytesToWrite, "uint*", &pdwNumberOfBytesWritten := 0, "HRESULT")
        return pdwNumberOfBytesWritten
    }

    /**
     * Closes the current attachment MIME data stream.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * Method completed successfully. All data in the attachment stream was successfully transferred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_OPERATION)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-close">Close</a> was called before <a href="/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-write">Write</a> was called. You must call <b>Write</b> before closing the attachment stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_S_BLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal buffers were not available. The data in the attachment stream was not successfully transferred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdattachment/nf-wsdattachment-iwsdoutboundattachment-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Aborts the transfer of data on the attachment MIME data stream.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_OPERATION)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-abort">Abort</a> was called before <a href="/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-write">Write</a> was called. You must call <b>Write</b> before terminating the attachment stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdattachment/nf-wsdattachment-iwsdoutboundattachment-abort
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
