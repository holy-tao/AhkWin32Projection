#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the content protection capabilities of a display driver.
 * @see https://learn.microsoft.com/windows/win32/api/d3d9caps/ns-d3d9caps-d3dcontentprotectioncaps
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3DCONTENTPROTECTIONCAPS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Bitwise <b>OR</b> of zero or more flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCPCAPS_SOFTWARE"></a><a id="d3dcpcaps_software"></a><dl>
     * <dt><b>D3DCPCAPS_SOFTWARE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The encryption is implemented in software by the driver. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCPCAPS_HARDWARE"></a><a id="d3dcpcaps_hardware"></a><dl>
     * <dt><b>D3DCPCAPS_HARDWARE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The encryption is implemented in hardware by the GPU.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCPCAPS_PROTECTIONALWAYSON"></a><a id="d3dcpcaps_protectionalwayson"></a><dl>
     * <dt><b>D3DCPCAPS_PROTECTIONALWAYSON</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Content protection is always applied to a protected Direct3D surface, regardless of whether the application explicitly enables content protection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCPCAPS_PARTIALDECRYPTION"></a><a id="d3dcpcaps_partialdecryption"></a><dl>
     * <dt><b>D3DCPCAPS_PARTIALDECRYPTION</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver can use partially encrypted buffers. If this capability is not present, the entire buffer must be either encrypted or clear.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCPCAPS_CONTENTKEY"></a><a id="d3dcpcaps_contentkey"></a><dl>
     * <dt><b>D3DCPCAPS_CONTENTKEY</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver can encrypt data using a separate content key that is encrypted using the session key. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-decryptionblt">IDirect3DCryptoSession9::DecryptionBlt</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCPCAPS_FRESHENSESSIONKEY"></a><a id="d3dcpcaps_freshensessionkey"></a><dl>
     * <dt><b>D3DCPCAPS_FRESHENSESSIONKEY</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver can refresh the session key without renegotiating the key. To refresh the session key, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-startsessionkeyrefresh">IDirect3DCryptoSession9::StartSessionKeyRefresh</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCPCAPS_ENCRYPTEDREADBACK"></a><a id="d3dcpcaps_encryptedreadback"></a><dl>
     * <dt><b>D3DCPCAPS_ENCRYPTEDREADBACK</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver can read back encrypted data from a protected surface, using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-encryptionblt">IDirect3DCryptoSession9::EncryptionBlt</a> method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCPCAPS_ENCRYPTEDREADBACKKEY"></a><a id="d3dcpcaps_encryptedreadbackkey"></a><dl>
     * <dt><b>D3DCPCAPS_ENCRYPTEDREADBACKKEY</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver requires a separate key to read encrypted data from a protected surface. To get this second key, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcryptosession9-getencryptionbltkey">IDirect3DCryptoSession9::GetEncryptionBltKey</a>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCPCAPS_SEQUENTIAL_CTR_IV"></a><a id="d3dcpcaps_sequential_ctr_iv"></a><dl>
     * <dt><b>D3DCPCAPS_SEQUENTIAL_CTR_IV</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the encryption type is <b>D3DCRYPTOTYPE_AES128_CTR</b>, the application must use a sequential count in the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_aes_ctr_iv">DXVA2_AES_CTR_IV</a>  structure. For more information, see the remarks for <b>DXVA2_AES_CTR_IV</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Caps {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the type of key exchange required to negotiate the session key. The following GUIDs are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DKEYEXCHANGE_RSAES_OAEP"></a><a id="d3dkeyexchange_rsaes_oaep"></a><dl>
     * <dt><b>D3DKEYEXCHANGE_RSAES_OAEP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder encrypts the session key using RSA Encryption Scheme - Optimal Asymmetric Encryption Padding (RSAES-OAEP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DKEYEXCHANGE_DXVA"></a><a id="d3dkeyexchange_dxva"></a><dl>
     * <dt><b>D3DKEYEXCHANGE_DXVA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the key exchange mechanism defined for DirectX Video Acceleration 2 (DXVA-2). 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Guid>}
     */
    KeyExchangeType {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * The memory alignment required for buffers used by the GPU cryptographic engine. If the application uses a system memory buffer to pass encrypted content to the GPU, or to read back encrypted content from the GPU, the buffer's starting address must be a multiple of this value.
     * @type {Integer}
     */
    BufferAlignmentStart {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The block alignment required by the GPU cryptographic engine. The size of data to be encrypted must be a multiple of this value.
     * @type {Integer}
     */
    BlockAlignmentSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The total amount of memory that can be used to hold protected surfaces.
     * @type {Integer}
     */
    ProtectedMemorySize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
