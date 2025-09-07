#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an initialization vector (IV) for 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher encryption. (D3D11_AES_CTR_IV)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_aes_ctr_iv
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AES_CTR_IV extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The IV, in big-endian format.
     * @type {Integer}
     */
    IV {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The block count, in big-endian format.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
