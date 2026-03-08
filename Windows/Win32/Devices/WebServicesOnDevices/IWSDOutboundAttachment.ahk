#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAttachment.ahk

/**
 * Enables applications to send attachment data in a message using a MIME container.
 * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nn-wsdattachment-iwsdoutboundattachment
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
     * @remarks
     * The <b>Write</b> method allows an application program to send arbitrary data to a remote host as a MIME-encapsulated message attachment. The first call to  <b>Write</b> opens the outbound attachment stream and initiates transmission of the HTTP headers, envelope data, and the MIME-encoded application data. Subsequent calls to <b>Write</b> will send additional blocks of MIME-encoded application data until the application makes a call to <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-close">Close</a>, which closes the attachment stream and finishes the transmission of the message envelope data and headers.
     * 
     *  The <b>Write</b> operation may block under several conditions. On the initial operation, <b>Write</b> will block until the HTTP headers and XML content have been transmitted. When sending multiple attachments in a single message, the first call to <b>Write</b> on any attachment may block until any prior attachment streams have been completely transmitted.
     * <b>Write</b> may block for up to 30 seconds (per HTTP transmission timeouts) if the remote host does not reply.
     * 
     * If an error occurs in establishing a connection or transmitting headers, <b>Write</b> will return the error code immediately. If a data transfer error occurs, the error may be delayed to a future call of <b>Write</b> or <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-close">Close</a>.
     * 
     *  The <b>Write</b> method may return successfully after a failed  <b>Write</b> attempt that returned <b>STG_S_BLOCK</b>.  A subsequent success indicates that the internal buffers were freed for use after the initial failed attempt. When <b>STG_S_BLOCK</b> is received by an application, the application can either resend the same data using the <b>Write</b> method or terminate  the data transfer using the <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-abort">Abort</a> method.
     * @param {Pointer<Integer>} pBuffer Pointer to a buffer containing the output data. The application program is responsible for allocating and freeing this data buffer.
     * @param {Integer} dwBytesToWrite Number of bytes to send to the remote host from <i>pBuffer</i>.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the number of bytes of data actually sent to the remote host.
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-write
     */
    Write(pBuffer, dwBytesToWrite) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pBufferMarshal, pBuffer, "uint", dwBytesToWrite, "uint*", &pdwNumberOfBytesWritten := 0, "HRESULT")
        return pdwNumberOfBytesWritten
    }

    /**
     * Closes the current attachment MIME data stream. (IWSDOutboundAttachment.Close)
     * @remarks
     * <b>Close</b> is used to indicate that the application has no more data to transmit in the current attachment stream. The return value can indicate an error in a previous Write operation or an issue closing the connection.
     * 
     * <b>Close</b> may block while waiting for a previous <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-write">Write</a> operation to complete.
     * <b>Close</b> may block for up to 30 seconds (per HTTP transmission timeouts) while waiting for a  previous <b>Write</b> operation to complete.
     * 
     * 
     *  The <b>Close</b> method may return successfully after a failed  <b>Close</b> attempt that returned <b>STG_S_BLOCK</b>.  A subsequent success indicates that the internal buffers were freed for use after the initial failed attempt. When <b>STG_S_BLOCK</b> is received by an application, the application can either call <b>Close</b> again or terminate  the data transfer using the <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-abort">Abort</a> method.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-close">Close</a> was called before <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-write">Write</a> was called. You must call <b>Write</b> before closing the attachment stream.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Aborts the transfer of data on the attachment MIME data stream.
     * @remarks
     * The <b>Abort</b> method may be called when a <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-close">Close</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-write">Write</a> method call failed with the error <b>STG_S_BLOCK</b>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-close">Close</a> must not be called once <b>Abort</b> has been called on an attachment stream.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-abort">Abort</a> was called before <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-write">Write</a> was called. You must call <b>Write</b> before terminating the attachment stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdoutboundattachment-abort
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
