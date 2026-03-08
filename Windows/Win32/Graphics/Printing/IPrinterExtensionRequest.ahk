#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionRequest extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterExtensionRequest
     * @type {Guid}
     */
    static IID => Guid("{39843bf3-c4d2-41fd-b4b2-aedbee5e1900}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Complete"]

    /**
     * Use the Cancel-Session packet to terminate the upload session with the BITS server.
     * @remarks
     * This packet cancels an upload job if it is sent before the last fragment is sent. Cancel-Session has no effect on a file whose last fragment has already been sent. When the BITS server receives the last fragment, it writes the file to its final destination and, in the case of an upload-reply, posts the file to the server application. In the upload-reply case, the Cancel-Session packet cancels the reply portion of an upload-reply job.
     * 
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * The BITS client sends this packet when the user cancels the job.
     * @param {HRESULT} hrStatus 
     * @param {BSTR} bstrLogMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/cancel-session
     */
    Cancel(hrStatus, bstrLogMessage) {
        bstrLogMessage := bstrLogMessage is String ? BSTR.Alloc(bstrLogMessage).Value : bstrLogMessage

        result := ComCall(7, this, "int", hrStatus, "ptr", bstrLogMessage, "HRESULT")
        return result
    }

    /**
     * Completes an authentication token. (CompleteAuthToken)
     * @remarks
     * The client of a transport application calls the <b>CompleteAuthToken</b> function to allow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> to update a checksum or similar operation after all the protocol headers have been updated by the transport application. The client calls this function only if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (Digest)</a> call returned SEC_I_COMPLETE_NEEDED or SEC_I_COMPLETE_AND_CONTINUE.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 						
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle that was passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The token that was passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's security context was located, but the message number is incorrect. This return value is used with the Digest SSP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_MESSAGE_ALTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's security context was located, but the client's message has been tampered with. This return value is used with the Digest SSP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred that did not map to an SSPI error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-completeauthtoken
     */
    Complete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
