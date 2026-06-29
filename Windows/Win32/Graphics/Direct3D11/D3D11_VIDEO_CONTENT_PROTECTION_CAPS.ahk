#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the content-protection capabilities of a graphics driver.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_content_protection_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_CONTENT_PROTECTION_CAPS {
    #StructPack 8

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_content_protection_caps">D3D11_CONTENT_PROTECTION_CAPS</a> enumeration.
     */
    Caps : UInt32

    /**
     * The number of cryptographic key-exchange types that are supported by the driver. To get the list of key-exchange types, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-checkcryptokeyexchange">ID3D11VideoDevice::CheckCryptoKeyExchange</a> method.
     */
    KeyExchangeTypeCount : UInt32

    /**
     * The encryption block size, in bytes. The size of data to be encrypted must be a multiple of this value.
     */
    BlockAlignmentSize : UInt32

    /**
     * The total amount of memory, in bytes, that can be used to hold protected surfaces.
     */
    ProtectedMemorySize : Int64

}
