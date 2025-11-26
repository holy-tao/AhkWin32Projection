#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides encryption for media data inside the protected media path (PMP).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsampleprotection
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSampleProtection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSampleProtection
     * @type {Guid}
     */
    static IID => Guid("{8e36395f-c7b9-43c4-a54d-512b4af63c95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputProtectionVersion", "GetOutputProtectionVersion", "GetProtectionCertificate", "InitOutputProtection", "InitInputProtection"]

    /**
     * Retrieves the version of sample protection that the component implements on input.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-sample_protection_version">SAMPLE_PROTECTION_VERSION</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsampleprotection-getinputprotectionversion
     */
    GetInputProtectionVersion() {
        result := ComCall(3, this, "uint*", &pdwVersion := 0, "HRESULT")
        return pdwVersion
    }

    /**
     * Retrieves the version of sample protection that the component implements on output.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-sample_protection_version">SAMPLE_PROTECTION_VERSION</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsampleprotection-getoutputprotectionversion
     */
    GetOutputProtectionVersion() {
        result := ComCall(4, this, "uint*", &pdwVersion := 0, "HRESULT")
        return pdwVersion
    }

    /**
     * Retrieves the sample protection certificate.
     * @param {Integer} dwVersion Specifies the version number of the sample protection scheme for which to receive a certificate. The version number is specified as a <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-sample_protection_version">SAMPLE_PROTECTION_VERSION</a> enumeration value.
     * @param {Pointer<Pointer<Integer>>} ppCert Receives a pointer to a buffer containing the certificate. The caller must free the memory for the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsampleprotection-getprotectioncertificate
     */
    GetProtectionCertificate(dwVersion, ppCert, pcbCert) {
        ppCertMarshal := ppCert is VarRef ? "ptr*" : "ptr"
        pcbCertMarshal := pcbCert is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwVersion, ppCertMarshal, ppCert, pcbCertMarshal, pcbCert, "HRESULT")
        return result
    }

    /**
     * Retrieves initialization information for sample protection from the upstream component.
     * @param {Integer} dwVersion Specifies the version number of the sample protection scheme. The version number is specified as a <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-sample_protection_version">SAMPLE_PROTECTION_VERSION</a> enumeration value.
     * @param {Integer} dwOutputId Identifier of the output stream. The identifier corresponds to the output stream identifier returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.
     * @param {Pointer<Integer>} pbCert Pointer to a certificate provided by the downstream component.
     * @param {Integer} cbCert Size of the certificate, in bytes.
     * @param {Pointer<Pointer<Integer>>} ppbSeed Receives a pointer to a buffer that contains the initialization information for downstream component. The caller must free the memory for the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcbSeed Receives the size of the <i>ppbSeed</i> buffer, in bytes.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsampleprotection-initoutputprotection
     */
    InitOutputProtection(dwVersion, dwOutputId, pbCert, cbCert, ppbSeed, pcbSeed) {
        pbCertMarshal := pbCert is VarRef ? "char*" : "ptr"
        ppbSeedMarshal := ppbSeed is VarRef ? "ptr*" : "ptr"
        pcbSeedMarshal := pcbSeed is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwVersion, "uint", dwOutputId, pbCertMarshal, pbCert, "uint", cbCert, ppbSeedMarshal, ppbSeed, pcbSeedMarshal, pcbSeed, "HRESULT")
        return result
    }

    /**
     * Initializes sample protection on the downstream component.
     * @param {Integer} dwVersion Specifies the version number of the sample protection scheme. The version number is specified as a <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-sample_protection_version">SAMPLE_PROTECTION_VERSION</a> enumeration value.
     * @param {Integer} dwInputId Identifier of the input stream. The identifier corresponds to the output stream identifier returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.
     * @param {Pointer<Integer>} pbSeed Pointer to a buffer that contains the initialization data provided by the upstream component. To retrieve this buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsampleprotection-initoutputprotection">IMFSampleProtection::InitOutputProtection</a>.
     * @param {Integer} cbSeed Size of the <i>pbSeed</i> buffer, in bytes.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsampleprotection-initinputprotection
     */
    InitInputProtection(dwVersion, dwInputId, pbSeed, cbSeed) {
        pbSeedMarshal := pbSeed is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", dwVersion, "uint", dwInputId, pbSeedMarshal, pbSeed, "uint", cbSeed, "HRESULT")
        return result
    }
}
