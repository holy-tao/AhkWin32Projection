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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCertificateSize", "GetCertificate", "NegotiateKeyExchange", "EncryptionBlt", "DecryptionBlt", "GetSurfacePitch", "StartSessionKeyRefresh", "FinishSessionKeyRefresh", "GetEncryptionBltKey"]

    /**
     * 
     * @param {Pointer<Integer>} pCertificateSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-getcertificatesize
     */
    GetCertificateSize(pCertificateSize) {
        result := ComCall(3, this, "uint*", pCertificateSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CertifacteSize 
     * @param {Pointer<Integer>} ppCertificate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-getcertificate
     */
    GetCertificate(CertifacteSize, ppCertificate) {
        result := ComCall(4, this, "uint", CertifacteSize, "char*", ppCertificate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DataSize 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-negotiatekeyexchange
     */
    NegotiateKeyExchange(DataSize, pData) {
        result := ComCall(5, this, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pSrcSurface 
     * @param {IDirect3DSurface9} pDstSurface 
     * @param {Integer} DstSurfaceSize 
     * @param {Pointer<Void>} pIV 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-encryptionblt
     */
    EncryptionBlt(pSrcSurface, pDstSurface, DstSurfaceSize, pIV) {
        result := ComCall(6, this, "ptr", pSrcSurface, "ptr", pDstSurface, "uint", DstSurfaceSize, "ptr", pIV, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pSrcSurface 
     * @param {IDirect3DSurface9} pDstSurface 
     * @param {Integer} SrcSurfaceSize 
     * @param {Pointer<D3DENCRYPTED_BLOCK_INFO>} pEncryptedBlockInfo 
     * @param {Pointer<Void>} pContentKey 
     * @param {Pointer<Void>} pIV 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-decryptionblt
     */
    DecryptionBlt(pSrcSurface, pDstSurface, SrcSurfaceSize, pEncryptedBlockInfo, pContentKey, pIV) {
        result := ComCall(7, this, "ptr", pSrcSurface, "ptr", pDstSurface, "uint", SrcSurfaceSize, "ptr", pEncryptedBlockInfo, "ptr", pContentKey, "ptr", pIV, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pSrcSurface 
     * @param {Pointer<Integer>} pSurfacePitch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-getsurfacepitch
     */
    GetSurfacePitch(pSrcSurface, pSurfacePitch) {
        result := ComCall(8, this, "ptr", pSrcSurface, "uint*", pSurfacePitch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRandomNumber 
     * @param {Integer} RandomNumberSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-startsessionkeyrefresh
     */
    StartSessionKeyRefresh(pRandomNumber, RandomNumberSize) {
        result := ComCall(9, this, "ptr", pRandomNumber, "uint", RandomNumberSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-finishsessionkeyrefresh
     */
    FinishSessionKeyRefresh() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pReadbackKey 
     * @param {Integer} KeySize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-getencryptionbltkey
     */
    GetEncryptionBltKey(pReadbackKey, KeySize) {
        result := ComCall(11, this, "ptr", pReadbackKey, "uint", KeySize, "HRESULT")
        return result
    }
}
