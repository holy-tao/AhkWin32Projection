#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAttachment.ahk

/**
 * Allows applications to read MIME-encoded attachment data from an incoming message.
 * @remarks
 * WSDAPI will provide an object implementing this interface when an attachment stream is received as part of a message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nn-wsdattachment-iwsdinboundattachment
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDInboundAttachment extends IWSDAttachment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDInboundAttachment
     * @type {Guid}
     */
    static IID => Guid("{5bd6ca65-233c-4fb8-9f7a-2641619655c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Close"]

    /**
     * Retrieves attachment data from a message sent by a remote host.
     * @remarks
     * The <b>Read</b> method allows an application to receive arbitrary data from a remote host in a MIME-encapsulated message attachment. WSDAPI will provide an object implementing this interface when an attachment stream is received as part of a message. The call to <b>Read</b> opens the inbound attachment stream and transfers the attachment data to the application's buffer. If <b>Read</b> returns S_OK or S_FALSE, <i>pdwNumberofBytesRead</i> is set to the number of bytes read, which may be less than the size of the buffer. The <b>Read</b> call may block on network traffic.
     * @param {Pointer<Integer>} pBuffer Pointer to a buffer receiving the data read from the attachment stream. The application program is responsible for allocating and freeing this data buffer.
     * @param {Integer} dwBytesToRead Size of the <i>pBuffer</i> input buffer, in bytes.
     * @param {Pointer<Integer>} pdwNumberOfBytesRead Pointer to a <b>DWORD</b> containing the number of bytes of data read from the attachment stream into the <i>pBuffer</i> input buffer.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The end of the attachment stream has been reached.  
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
     * <i>pBuffer</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pdwNumberofBytesRead</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdinboundattachment-read
     */
    Read(pBuffer, dwBytesToRead, pdwNumberOfBytesRead) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pdwNumberOfBytesReadMarshal := pdwNumberOfBytesRead is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pBufferMarshal, pBuffer, "uint", dwBytesToRead, pdwNumberOfBytesReadMarshal, pdwNumberOfBytesRead, "HRESULT")
        return result
    }

    /**
     * Closes the current attachment MIME data stream. (IWSDInboundAttachment.Close)
     * @remarks
     * This method can be used to terminate the transfer of an incoming attachment while the transfer is in progress. 
     * 
     * Usually, <b>Close</b> must be called before calling <b>Release()</b> on the <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nn-wsdattachment-iwsdinboundattachment">IWSDInboundAttachment</a>  interface. The only time a <b>Close</b> call is not required is when <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nf-wsdattachment-iwsdinboundattachment-read">Read</a> returns S_FALSE, which indicates that the end of the attachment stream has been reached. In that case, simply call  <b>Release()</b> on the <b>IWSDInboundAttachment</b>  interface.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nf-wsdattachment-iwsdinboundattachment-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
