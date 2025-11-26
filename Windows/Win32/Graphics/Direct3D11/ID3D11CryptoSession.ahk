#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * Represents a cryptographic session.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createcryptosession">ID3D11VideoDevice::CreateCryptoSession</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11cryptosession
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11CryptoSession extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11CryptoSession
     * @type {Guid}
     */
    static IID => Guid("{9b32f9ad-bdcc-40a6-a39d-d5c865845720}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCryptoType", "GetDecoderProfile", "GetCertificateSize", "GetCertificate", "GetCryptoSessionHandle"]

    /**
     * Gets the type of encryption that is supported by this session.
     * @remarks
     * 
     * The application specifies the encryption type when it creates the session.
     * 
     * 
     * @param {Pointer<Guid>} pCryptoType Receives a GUID that specifies the encryption type. The following GUIDs are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_CRYPTO_TYPE_AES128_CTR"></a><a id="d3d11_crypto_type_aes128_ctr"></a><dl>
     * <dt><b>D3D11_CRYPTO_TYPE_AES128_CTR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11cryptosession-getcryptotype
     */
    GetCryptoType(pCryptoType) {
        ComCall(7, this, "ptr", pCryptoType)
    }

    /**
     * Gets the decoding profile of the session.
     * @remarks
     * 
     * The application specifies the profile when it creates the session.
     * 
     * 
     * @param {Pointer<Guid>} pDecoderProfile Receives the decoding profile. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11cryptosession-getdecoderprofile
     */
    GetDecoderProfile(pDecoderProfile) {
        ComCall(8, this, "ptr", pDecoderProfile)
    }

    /**
     * Gets the size of the driver's certificate chain.
     * @returns {Integer} Receives the size of the certificate chain, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11cryptosession-getcertificatesize
     */
    GetCertificateSize() {
        result := ComCall(9, this, "uint*", &pCertificateSize := 0, "HRESULT")
        return pCertificateSize
    }

    /**
     * Gets the driver's certificate chain.
     * @param {Integer} CertificateSize The size of the <i>pCertificate</i> array, in bytes. To get the size of the certificate chain, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11cryptosession-getcertificatesize">ID3D11CryptoSession::GetCertificateSize</a>.
     * @param {Pointer} pCertificate A pointer to a byte array that receives the driver's certificate chain. The caller must allocate the array.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11cryptosession-getcertificate
     */
    GetCertificate(CertificateSize, pCertificate) {
        result := ComCall(10, this, "uint", CertificateSize, "ptr", pCertificate, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the cryptographic session.
     * @remarks
     * 
     * You can use this handle to associate the session with a decoder. This enables the decoder to decrypt data that is encrypted using this session.
     * 
     * 
     * @param {Pointer<HANDLE>} pCryptoSessionHandle Receives a handle to the session.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11cryptosession-getcryptosessionhandle
     */
    GetCryptoSessionHandle(pCryptoSessionHandle) {
        ComCall(11, this, "ptr", pCryptoSessionHandle)
    }
}
