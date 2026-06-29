#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a cryptographic session.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createcryptosession">ID3D11VideoDevice::CreateCryptoSession</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11cryptosession
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11CryptoSession extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11CryptoSession
     * @type {Guid}
     */
    static IID := Guid("{9b32f9ad-bdcc-40a6-a39d-d5c865845720}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11CryptoSession interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetCryptoType          : IntPtr
        GetDecoderProfile      : IntPtr
        GetCertificateSize     : IntPtr
        GetCertificate         : IntPtr
        GetCryptoSessionHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11CryptoSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the type of encryption that is supported by this session.
     * @remarks
     * The application specifies the encryption type when it creates the session.
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getcryptotype
     */
    GetCryptoType(pCryptoType) {
        ComCall(7, this, Guid.Ptr, pCryptoType)
    }

    /**
     * Gets the decoding profile of the session.
     * @remarks
     * The application specifies the profile when it creates the session.
     * @param {Pointer<Guid>} pDecoderProfile Receives the decoding profile. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getdecoderprofile
     */
    GetDecoderProfile(pDecoderProfile) {
        ComCall(8, this, Guid.Ptr, pDecoderProfile)
    }

    /**
     * Gets the size of the driver's certificate chain. (ID3D11CryptoSession.GetCertificateSize)
     * @remarks
     * To get the certificate, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11cryptosession-getcertificate">ID3D11CryptoSession::GetCertificate</a>.
     * @returns {Integer} Receives the size of the certificate chain, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getcertificatesize
     */
    GetCertificateSize() {
        result := ComCall(9, this, "uint*", &pCertificateSize := 0, "HRESULT")
        return pCertificateSize
    }

    /**
     * Gets the driver's certificate chain. (ID3D11CryptoSession.GetCertificate)
     * @param {Integer} CertificateSize The size of the <i>pCertificate</i> array, in bytes. To get the size of the certificate chain, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11cryptosession-getcertificatesize">ID3D11CryptoSession::GetCertificateSize</a>.
     * @param {Integer} pCertificate A pointer to a byte array that receives the driver's certificate chain. The caller must allocate the array.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getcertificate
     */
    GetCertificate(CertificateSize, pCertificate) {
        result := ComCall(10, this, "uint", CertificateSize, "ptr", pCertificate, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the cryptographic session.
     * @remarks
     * You can use this handle to associate the session with a decoder. This enables the decoder to decrypt data that is encrypted using this session.
     * @param {Pointer<HANDLE>} pCryptoSessionHandle Receives a handle to the session.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getcryptosessionhandle
     */
    GetCryptoSessionHandle(pCryptoSessionHandle) {
        ComCall(11, this, HANDLE.Ptr, pCryptoSessionHandle)
    }

    Query(iid) {
        if (ID3D11CryptoSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCryptoType := CallbackCreate(GetMethod(implObj, "GetCryptoType"), flags, 2)
        this.vtbl.GetDecoderProfile := CallbackCreate(GetMethod(implObj, "GetDecoderProfile"), flags, 2)
        this.vtbl.GetCertificateSize := CallbackCreate(GetMethod(implObj, "GetCertificateSize"), flags, 2)
        this.vtbl.GetCertificate := CallbackCreate(GetMethod(implObj, "GetCertificate"), flags, 3)
        this.vtbl.GetCryptoSessionHandle := CallbackCreate(GetMethod(implObj, "GetCryptoSessionHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCryptoType)
        CallbackFree(this.vtbl.GetDecoderProfile)
        CallbackFree(this.vtbl.GetCertificateSize)
        CallbackFree(this.vtbl.GetCertificate)
        CallbackFree(this.vtbl.GetCryptoSessionHandle)
    }
}
