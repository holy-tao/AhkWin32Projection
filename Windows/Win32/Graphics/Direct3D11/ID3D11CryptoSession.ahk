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
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getcryptotype
     */
    GetCryptoType(pCryptoType) {
        ComCall(7, this, "ptr", pCryptoType)
    }

    /**
     * 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getdecoderprofile
     */
    GetDecoderProfile(pDecoderProfile) {
        ComCall(8, this, "ptr", pDecoderProfile)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getcertificatesize
     */
    GetCertificateSize() {
        result := ComCall(9, this, "uint*", &pCertificateSize := 0, "HRESULT")
        return pCertificateSize
    }

    /**
     * 
     * @param {Integer} CertificateSize 
     * @param {Pointer} pCertificate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getcertificate
     */
    GetCertificate(CertificateSize, pCertificate) {
        result := ComCall(10, this, "uint", CertificateSize, "ptr", pCertificate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} pCryptoSessionHandle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11cryptosession-getcryptosessionhandle
     */
    GetCryptoSessionHandle(pCryptoSessionHandle) {
        ComCall(11, this, "ptr", pCryptoSessionHandle)
    }
}
