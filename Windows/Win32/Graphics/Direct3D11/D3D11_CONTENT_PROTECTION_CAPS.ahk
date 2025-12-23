#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that describe content-protection capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_content_protection_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CONTENT_PROTECTION_CAPS extends Win32Enum{

    /**
     * The content protection is implemented in software by the driver.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_SOFTWARE => 1

    /**
     * The content protection is implemented in hardware by the GPU.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_HARDWARE => 2

    /**
     * Content protection is always applied to a protected surface, regardless of whether the application explicitly enables protection.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_PROTECTION_ALWAYS_ON => 4

    /**
     * The driver can use partially encrypted buffers. If this capability is not present, the entire buffer must be either encrypted or clear.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_PARTIAL_DECRYPTION => 8

    /**
     * The driver can encrypt data using a separate content key that is encrypted using the session key.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_CONTENT_KEY => 16

    /**
     * The driver can refresh the session key without renegotiating the key.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_FRESHEN_SESSION_KEY => 32

    /**
     * The driver can read back encrypted data from a protected surface. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-encryptionblt">ID3D11VideoContext::EncryptionBlt</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_ENCRYPTED_READ_BACK => 64

    /**
     * The driver requires a separate key to read encrypted data from a protected surface.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_ENCRYPTED_READ_BACK_KEY => 128

    /**
     * If the encryption type is <b>D3DCRYPTOTYPE_AES128_CTR</b>, the application must use a sequential count in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_aes_ctr_iv">D3D11_AES_CTR_IV</a>  structure.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_SEQUENTIAL_CTR_IV => 256

    /**
     * The driver supports encrypted slice data, but does not support any other encrypted data in the compressed buffer.  The caller should not encrypt any data within the buffer other than the slice data.
     * 
     * <div class="alert"><b>Note</b>  The driver should only report this flag for the specific profiles that have this limitation.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_ENCRYPT_SLICEDATA_ONLY => 512

    /**
     * The driver can copy encrypted data from one resource to another, decrypting the data as part of the process.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_DECRYPTION_BLT => 1024

    /**
     * The hardware supports the protection of specific resources. This means that:
     * 
     * <ul>
     * <li>The contents of a protected allocation can never be read by the CPU.</li>
     * <li>The hardware can ensure a protected resource cannot be copied to an unprotected resource.</li>
     * </ul>
     * <b>Note</b>  This enumeration value is supported starting with Windows 10.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_HARDWARE_PROTECT_UNCOMPRESSED => 2048

    /**
     * Physical pages of a protected resource can be evicted and potentially paged to disk in low memory conditions without losing the contents of the resource when paged back in. 
     * 
     * <b>Note</b>  This enumeration value is supported starting with Windows 10.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_HARDWARE_PROTECTED_MEMORY_PAGEABLE => 4096

    /**
     * The hardware supports an automatic teardown mechanism that could trigger hardware keys or protected content to become lost in some conditions.  The application can register to be notified when these events occur.
     * 
     * <b>Note</b>  This enumeration value is supported starting with Windows 10.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_HARDWARE_TEARDOWN => 8192

    /**
     * The secure environment is tightly coupled with the GPU and an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> should be used for communication between the user mode DRM component and the secure execution environment.
     * 
     * <b>Note</b>  This enumeration value is supported starting with Windows 10.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_HARDWARE_DRM_COMMUNICATION => 16384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_CONTENT_PROTECTION_CAPS_HARDWARE_DRM_COMMUNICATION_MULTI_THREADED => 32768
}
