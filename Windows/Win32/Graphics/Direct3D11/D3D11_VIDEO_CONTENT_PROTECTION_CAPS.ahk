#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the content-protection capabilities of a graphics driver.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_content_protection_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_CONTENT_PROTECTION_CAPS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_content_protection_caps">D3D11_CONTENT_PROTECTION_CAPS</a> enumeration.
     * @type {Integer}
     */
    Caps {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of cryptographic key-exchange types that are supported by the driver. To get the list of key-exchange types, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-checkcryptokeyexchange">ID3D11VideoDevice::CheckCryptoKeyExchange</a> method.
     * @type {Integer}
     */
    KeyExchangeTypeCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The encryption block size, in bytes. The size of data to be encrypted must be a multiple of this value.
     * @type {Integer}
     */
    BlockAlignmentSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The total amount of memory, in bytes, that can be used to hold protected surfaces.
     * @type {Integer}
     */
    ProtectedMemorySize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
