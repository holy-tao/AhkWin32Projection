#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a cryptographic session.To get a pointer to this interface, call IDirect3DDevice9Video::CreateCryptoSession.
 * @see https://docs.microsoft.com/windows/win32/api//d3d9/nn-d3d9-idirect3dcryptosession9
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirect3DCryptoSession9 extends IUnknown{
    /**
     * The interface identifier for IDirect3DCryptoSession9
     * @type {Guid}
     */
    static IID => Guid("{fa0ab799-7a9c-48ca-8c5b-237e71a54434}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pCertificateSize 
     * @returns {HRESULT} 
     */
    GetCertificateSize(pCertificateSize) {
        result := ComCall(3, this, "uint*", pCertificateSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CertifacteSize 
     * @param {Pointer<Byte>} ppCertificate 
     * @returns {HRESULT} 
     */
    GetCertificate(CertifacteSize, ppCertificate) {
        result := ComCall(4, this, "uint", CertifacteSize, "char*", ppCertificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DataSize 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    NegotiateKeyExchange(DataSize, pData) {
        result := ComCall(5, this, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pSrcSurface 
     * @param {Pointer<IDirect3DSurface9>} pDstSurface 
     * @param {Integer} DstSurfaceSize 
     * @param {Pointer<Void>} pIV 
     * @returns {HRESULT} 
     */
    EncryptionBlt(pSrcSurface, pDstSurface, DstSurfaceSize, pIV) {
        result := ComCall(6, this, "ptr", pSrcSurface, "ptr", pDstSurface, "uint", DstSurfaceSize, "ptr", pIV, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pSrcSurface 
     * @param {Pointer<IDirect3DSurface9>} pDstSurface 
     * @param {Integer} SrcSurfaceSize 
     * @param {Pointer<D3DENCRYPTED_BLOCK_INFO>} pEncryptedBlockInfo 
     * @param {Pointer<Void>} pContentKey 
     * @param {Pointer<Void>} pIV 
     * @returns {HRESULT} 
     */
    DecryptionBlt(pSrcSurface, pDstSurface, SrcSurfaceSize, pEncryptedBlockInfo, pContentKey, pIV) {
        result := ComCall(7, this, "ptr", pSrcSurface, "ptr", pDstSurface, "uint", SrcSurfaceSize, "ptr", pEncryptedBlockInfo, "ptr", pContentKey, "ptr", pIV, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pSrcSurface 
     * @param {Pointer<UInt32>} pSurfacePitch 
     * @returns {HRESULT} 
     */
    GetSurfacePitch(pSrcSurface, pSurfacePitch) {
        result := ComCall(8, this, "ptr", pSrcSurface, "uint*", pSurfacePitch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRandomNumber 
     * @param {Integer} RandomNumberSize 
     * @returns {HRESULT} 
     */
    StartSessionKeyRefresh(pRandomNumber, RandomNumberSize) {
        result := ComCall(9, this, "ptr", pRandomNumber, "uint", RandomNumberSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FinishSessionKeyRefresh() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pReadbackKey 
     * @param {Integer} KeySize 
     * @returns {HRESULT} 
     */
    GetEncryptionBltKey(pReadbackKey, KeySize) {
        result := ComCall(11, this, "ptr", pReadbackKey, "uint", KeySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
