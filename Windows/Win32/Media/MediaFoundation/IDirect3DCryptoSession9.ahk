#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a cryptographic session.To get a pointer to this interface, call IDirect3DDevice9Video::CreateCryptoSession.
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dcryptosession9
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
     * Gets the size of the driver's certificate chain. (IDirect3DCryptoSession9.GetCertificateSize)
     * @remarks
     * To get the certificate, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-getcertificate">IDirect3DCryptoSession9::GetCertificate</a>.
     * @param {Pointer<Integer>} pCertificateSize Receives the size of the certificate chain, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-getcertificatesize
     */
    GetCertificateSize(pCertificateSize) {
        pCertificateSizeMarshal := pCertificateSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCertificateSizeMarshal, pCertificateSize, "HRESULT")
        return result
    }

    /**
     * Gets the driver's certificate chain. (IDirect3DCryptoSession9.GetCertificate)
     * @remarks
     * The standard key-exchange mechanism uses the driver's Output Protection Manager (OPM) certificate, which is an X.509 certificate. The type of key exchange is given in the capabilities information returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">IDirect3DDevice9Video::GetContentProtectionCaps</a>  method. The key-exchange mechanism is specified by the <b>KeyExchangeType</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcontentprotectioncaps">D3DCONTENTPROTECTIONCAPS</a> structure. If the value is <b>D3DKEYEXCHANGE_RSAES_OAEP</b>, an X.509 certificate is used.
     * 
     * For other types of key exchange, the driver might use some other type of certificate, or might not provide a certificate.
     * @param {Integer} CertifacteSize The size of the <i>ppCertificate</i> array, in bytes. To get the size of the certificate chain, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-getcertificatesize">IDirect3DCryptoSession9::GetCertificateSize</a>.
     * @param {Pointer<Integer>} ppCertificate A pointer to a byte array that receives the driver's certificate chain. The caller must allocate the array.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-getcertificate
     */
    GetCertificate(CertifacteSize, ppCertificate) {
        ppCertificateMarshal := ppCertificate is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", CertifacteSize, ppCertificateMarshal, ppCertificate, "HRESULT")
        return result
    }

    /**
     * Establishes the session key for the cryptographic session.
     * @remarks
     * To find out which key-exchange mechanism to use, call  the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">IDirect3DDevice9Video::GetContentProtectionCaps</a>  method. The key-exchange mechanism is specified in the <b>KeyExchangeType</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcontentprotectioncaps">D3DCONTENTPROTECTIONCAPS</a> structure. If the value is <b>D3DKEYEXCHANGE_RSAES_OAEP</b>, use RSA Encryption Scheme - Optimal Asymmetric Encryption Padding (RSAES-OAEP) to encrypt the session key. Pass this encrypted cyphertext in the <i>pData</i> parameter.
     * 
     * If the key-exchange type is <b>D3DKEYEXCHANGE_DXVA</b>, do not call this method to establish the session key. Instead, use the key-exchange mechanism that is defined for DirectX Video Acceleration 2 (DXVA-2) decoding.
     * 
     * The driver might also use a proprietary key-exchange mechanism.
     * @param {Integer} DataSize The size of the <i>pData</i> byte array, in bytes.
     * @param {Pointer<Void>} pData A pointer to a byte array that contains the encrypted session key.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-negotiatekeyexchange
     */
    NegotiateKeyExchange(DataSize, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "uint", DataSize, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Reads encrypted data from a protected surface. (IDirect3DCryptoSession9.EncryptionBlt)
     * @remarks
     * If the driver supports this method, it sets the <b>D3DCPCAPS_ENCRYPTEDREADBACK</b> flag in the capabilities structure returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">IDirect3DDevice9Video::GetContentProtectionCaps</a> method.
     * 
     * If the driver sets the <b>D3DCPCAPS_ENCRYPTEDREADBACKKEY</b> capabilities flag, it means the driver uses a separate key to encrypt the data. To get this key, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-getencryptionbltkey">IDirect3DCryptoSession9::GetEncryptionBltKey</a> method. Otherwise, the driver uses the session key to encrypt the data.
     * 
     * Allocate the destination surface (<i>pDstSurface</i>) as follows:
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-getsurfacepitch">IDirect3DCryptoSession9::GetSurfacePitch</a> to get the stride of the protected surface.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">GetContentProtectionCaps</a> method to get the value of the <b>BufferAlignmentStart</b>  and <b>BlockAlignmentSize</b>  members in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcontentprotectioncaps">D3DCONTENTPROTECTIONCAPS</a>  structure. </li>
     * <li>Calculate the minimum size of the surface memory as <i>SysMemSize</i> = protected surface stride × protected surface height.</li>
     * <li>Add padding to accommodate the values of <b>BufferAlignmentStart</b>  and <b>BlockAlignmentSize</b>.</li>
     * <li>Allocate a buffer in system memory, with size equal to <i>SysMemSize</i> (including padding). </li>
     * <li>If the address of the system memory buffer is not aligned to the value of <b>BufferAlignmentStart</b>, calculate a memory-aligned pointer that is an offset from the start of the buffer.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-createoffscreenplainsurfaceex">IDirect3DDevice9Ex::CreateOffscreenPlainSurfaceEx</a> to create the destination surface. Pass the memory-aligned pointer as the shared-resource handle (<i>pSharedHandle</i>).</li>
     * </ol>
     * This method has the following limitations:
     * 
     * <ul>
     * <li>The method cannot read back  subrectangles or partially encrypted surfaces.</li>
     * <li>The protected surface must be either an offscreen plain surface or a render target.</li>
     * <li>The destination surface must be a system-memory surface, created with the proper alignment, as described earlier.</li>
     * <li>The protected surface cannot be multisampled.</li>
     * <li>The method does not support stretching or colorspace conversion.</li>
     * </ul>
     * If you lock the destination surface, the stride reported in the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-rect">D3DLOCKED_RECT</a> structure might not match the stride of the protected surface. When you interpret the data, however, always use the stride of the protected surface.
     * @param {IDirect3DSurface9} pSrcSurface Pointer to the protected surface.
     * @param {IDirect3DSurface9} pDstSurface Pointer to a surface that receives the encrypted data.
     * @param {Integer} DstSurfaceSize The size of the surface memory that <i>pDstSurface</i> points to, in bytes. The size must be aligned to the value of <b>BlockAlignmentSize</b> in the driver capabilities structure; see Remarks.
     * @param {Pointer<Void>} pIV Pointer to a buffer that receives the initialization vector (IV). The caller allocates this buffer, but the driver generates the IV.
     * 
     * If the encryption type is <b>D3DCRYPTOTYPE_AES128_CTR</b> (128-bit AES-CTR), <i>pIV</i> points to a <a href="https://docs.microsoft.com/windows/desktop/medfound/d3daes-ctr-iv">D3DAES_CTR_IV</a> structure. When the driver generates the first IV, it initializes the structure to a random number. For each subsequent IV, the driver simply increments the <b>IV</b> member of the structure, ensuring that the value always increases. This procedure enables the application to validate that the same IV is never used more than once with the same key pair.
     * 
     * For other encryption types, a different structure might be used, or the encryption might not use an IV.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-encryptionblt
     */
    EncryptionBlt(pSrcSurface, pDstSurface, DstSurfaceSize, pIV) {
        pIVMarshal := pIV is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", pSrcSurface, "ptr", pDstSurface, "uint", DstSurfaceSize, pIVMarshal, pIV, "HRESULT")
        return result
    }

    /**
     * Writes encrypted data to a protected surface. (IDirect3DCryptoSession9.DecryptionBlt)
     * @remarks
     * Not all hardware or drivers support this functionality for all cryptographic types.
     * 
     * The source surface must be a system memory surface created with the proper alignment restrictions.  The buffer must be large enough to accommodate the pitch and height of the protected surface, plus padding to accommodate the starting alignment restrictions and block transfer size.
     * 
     * Specifically, you should allocate the source surface as follows:
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-getsurfacepitch">IDirect3DCryptoSession9::GetSurfacePitch</a> to get the stride of the protected surface.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">IDirect3DDevice9Video::GetContentProtectionCaps</a> method to get the value of the <b>BufferAlignmentStart</b>  and <b>BlockAlignmentSize</b>  members in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcontentprotectioncaps">D3DCONTENTPROTECTIONCAPS</a>  structure. </li>
     * <li>Calculate the minimum size of the surface memory as <i>SysMemSize</i> = protected surface stride × protected surface height.</li>
     * <li>Add padding to accommodate the values of <b>BufferAlignmentStart</b>  and <b>BlockAlignmentSize</b>.</li>
     * <li>Allocate a buffer in system memory, with size equal to <i>SysMemSize</i> (including padding). </li>
     * <li>If the address of the system memory buffer is not aligned to the value of <b>BufferAlignmentStart</b>, calculate a memory-aligned pointer that is an offset from the start of the buffer.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-createoffscreenplainsurfaceex">IDirect3DDevice9Ex::CreateOffscreenPlainSurfaceEx</a> to create the source surface. Pass the memory-aligned pointer as the shared-resource handle (<i>pSharedHandle</i>).</li>
     * </ol>
     * If you lock the surface, the stride reported in the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-rect">D3DLOCKED_RECT</a> structure might not match the stride of the protected surface. When you interpret the data, however, always use the stride of the protected surface.
     * 
     * This method does not support writing to subrectangles of the surface.
     * @param {IDirect3DSurface9} pSrcSurface A pointer to the surface that contains the source data.
     * @param {IDirect3DSurface9} pDstSurface A pointer to the protected surface where the encrypted data is written.
     * @param {Integer} SrcSurfaceSize The size of the surface memory that <i>pSrcSurface</i> points to, in bytes. The size must be aligned to the value of <b>BlockAlignmentSize</b> in the driver capabilities structure; see Remarks.
     * @param {Pointer<D3DENCRYPTED_BLOCK_INFO>} pEncryptedBlockInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/medfound/d3dencrypted-block-info">D3DENCRYPTED_BLOCK_INFO</a> structure, or <b>NULL</b>.
     * 
     * If the driver supports partially encrypted buffers,  <i>pEncryptedBlockInfo</i> indicates which portions of the buffer are encrypted.  If the entire surface is encrypted, set this parameter to <b>NULL</b>. 
     * 
     * To check whether the driver supports partially encrypted buffers, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">IDirect3DDevice9Video::GetContentProtectionCaps</a> and check for the <b>D3DCPCAPS_PARTIALDECRYPTION</b> capabilities flag. If the driver does not support partially encrypted buffers, set this parameter to <b>NULL</b>.
     * @param {Pointer<Void>} pContentKey A pointer to a buffer that contains a content encryption key, or <b>NULL</b>. To query whether the driver supports the use of content keys, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">IDirect3DDevice9Video::GetContentProtectionCaps</a> and check for the <b>D3DCPCAPS_CONTENTKEY</b> capabilities flag. 
     * 
     * If the driver supports content keys, use the content key to encrypt the surface. Encrypt the content key using the session key, and place the  resulting cipher text in <i>pContentKey</i>. If the driver does not support content keys, use the session key to encrypt the surface and set <i>pContentKey</i> to <b>NULL</b>.
     * @param {Pointer<Void>} pIV A pointer to a buffer that contains the initialization vector (IV). 
     * 
     * If the encryption type is <b>D3DCRYPTOTYPE_AES128_CTR</b>, the buffer is a <a href="https://docs.microsoft.com/windows/desktop/medfound/d3daes-ctr-iv">D3DAES_CTR_IV</a> structure. The caller allocates the structure and generates the IV. When you generate the first IV, initialize the structure to a random number. For each subsequent IV, simply increment the <b>IV</b> member of the structure, ensuring that the value always increases.  This procedure enables the driver to validate that the same IV is never used more than once with the same key pair.
     * 
     * For other encryption types, a different structure might be used, or the encryption might not use an IV.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-decryptionblt
     */
    DecryptionBlt(pSrcSurface, pDstSurface, SrcSurfaceSize, pEncryptedBlockInfo, pContentKey, pIV) {
        pContentKeyMarshal := pContentKey is VarRef ? "ptr" : "ptr"
        pIVMarshal := pIV is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", pSrcSurface, "ptr", pDstSurface, "uint", SrcSurfaceSize, "ptr", pEncryptedBlockInfo, pContentKeyMarshal, pContentKey, pIVMarshal, pIV, "HRESULT")
        return result
    }

    /**
     * Gets the stride of a protected surface.
     * @remarks
     * A protected surface cannot be locked, so this method provides a way to get the surface stride without locking the surface.
     * @param {IDirect3DSurface9} pSrcSurface Pointer to the protected surface.
     * @param {Pointer<Integer>} pSurfacePitch Receives the stride, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-getsurfacepitch
     */
    GetSurfacePitch(pSrcSurface, pSurfacePitch) {
        pSurfacePitchMarshal := pSurfacePitch is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pSrcSurface, pSurfacePitchMarshal, pSurfacePitch, "HRESULT")
        return result
    }

    /**
     * Gets a random number that can be used to refresh the session key. (IDirect3DCryptoSession9.StartSessionKeyRefresh)
     * @remarks
     * To generate a new session key, perform a bitwise <b>XOR</b> between the previous session key and the random number. The new session key does not take affect until the application calls <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-finishsessionkeyrefresh">IDirect3DCryptoSession9::FinishSessionKeyRefresh</a>.
     * 
     * If the driver supports this method, the driver sets the <b>D3DCPCAPS_FRESHENSESSIONKEY</b> capabilities flag in  the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">IDirect3DDevice9Video::GetContentProtectionCaps</a> method.
     * @param {Pointer<Void>} pRandomNumber A pointer to a byte array that receives a random number.
     * @param {Integer} RandomNumberSize The size of the <i>pRandomNumber</i> array, in bytes. The size should match the size of the session key.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-startsessionkeyrefresh
     */
    StartSessionKeyRefresh(pRandomNumber, RandomNumberSize) {
        pRandomNumberMarshal := pRandomNumber is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pRandomNumberMarshal, pRandomNumber, "uint", RandomNumberSize, "HRESULT")
        return result
    }

    /**
     * Switches to a new session key. (IDirect3DCryptoSession9.FinishSessionKeyRefresh)
     * @remarks
     * Before calling this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-startsessionkeyrefresh">IDirect3DCryptoSession9::StartSessionKeyRefresh</a> method. The <b>StartSessionKeyRefresh</b> method gets a random number from the driver, which is used to create a new session key. The new session key does not become active until the application calls  <b>FinishSessionKeyRefresh</b>. After the application calls <b>FinishSessionKeyRefresh</b>, all protected surfaces are encrypted using the new session key.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-finishsessionkeyrefresh
     */
    FinishSessionKeyRefresh() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Gets the cryptographic key used to decrypt the data returned by the IDirect3DCryptoSession9::EncryptionBlt method.
     * @remarks
     * This method applies only when the driver requires a separate content key for the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-encryptionblt">EncryptionBlt</a> method. If the driver requires a content key, it sets the <b>D3DCPCAPS_ENCRYPTEDREADBACKKEY</b> flag in the capabilities structure returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">IDirect3DDevice9Video::GetContentProtectionCaps</a> method. Otherwise, the driver uses the session key to encrypt the data.
     * 
     * Each time this method is called, the driver generates a new key.
     * @param {Pointer<Void>} pReadbackKey A pointer to a byte array that receives the key. The key is encrypted using the session key.
     * @param {Integer} KeySize The size of the <i>pReadbackKey</i> array, in bytes. The size should match the size of the session key.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcryptosession9-getencryptionbltkey
     */
    GetEncryptionBltKey(pReadbackKey, KeySize) {
        pReadbackKeyMarshal := pReadbackKey is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, pReadbackKeyMarshal, pReadbackKey, "uint", KeySize, "HRESULT")
        return result
    }
}
