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
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @returns {String} Nothing - always returns an empty string
     */
    GetCryptoType(pCryptoType) {
        ComCall(7, this, "ptr", pCryptoType)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDecoderProfile(pDecoderProfile) {
        ComCall(8, this, "ptr", pDecoderProfile)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCertificateSize 
     * @returns {HRESULT} 
     */
    GetCertificateSize(pCertificateSize) {
        result := ComCall(9, this, "uint*", pCertificateSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CertificateSize 
     * @param {Pointer} pCertificate 
     * @returns {HRESULT} 
     */
    GetCertificate(CertificateSize, pCertificate) {
        result := ComCall(10, this, "uint", CertificateSize, "ptr", pCertificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} pCryptoSessionHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    GetCryptoSessionHandle(pCryptoSessionHandle) {
        ComCall(11, this, "ptr", pCryptoSessionHandle)
        return result
    }
}
