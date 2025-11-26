#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Establishes a one-way secure channel between two objects.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsecurechannel
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSecureChannel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSecureChannel
     * @type {Guid}
     */
    static IID => Guid("{d0ae555d-3b12-4d97-b060-0990bc5aeb67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCertificate", "SetupSession"]

    /**
     * Retrieves the client's certificate.
     * @param {Pointer<Pointer<Integer>>} ppCert Receives a pointer to a buffer allocated by the object. The buffer contains the client's certificate. The caller must release the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcbCert Receives the size of the <i>ppCert</i> buffer, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsecurechannel-getcertificate
     */
    GetCertificate(ppCert, pcbCert) {
        ppCertMarshal := ppCert is VarRef ? "ptr*" : "ptr"
        pcbCertMarshal := pcbCert is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppCertMarshal, ppCert, pcbCertMarshal, pcbCert, "HRESULT")
        return result
    }

    /**
     * Passes the encrypted session key to the client.
     * @param {Pointer} pbEncryptedSessionKey Pointer to a buffer that contains the encrypted session key. This parameter can be <b>NULL</b>.
     * @param {Integer} cbSessionKey Size of the <i>pbEncryptedSessionKey</i> buffer, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsecurechannel-setupsession
     */
    SetupSession(pbEncryptedSessionKey, cbSessionKey) {
        result := ComCall(4, this, "ptr", pbEncryptedSessionKey, "uint", cbSessionKey, "HRESULT")
        return result
    }
}
