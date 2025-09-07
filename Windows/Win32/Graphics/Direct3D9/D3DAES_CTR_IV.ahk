#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an initialization vector (IV) for 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher encryption.
 * @remarks
 * The **D3DAES\_CTR\_IV** structure and the [**DXVA2\_AES\_CTR\_IV**](/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_aes_ctr_iv) structure are equivalent.
  * 
  * For details, see [**DXVA2\_AES\_CTR\_IV**](/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_aes_ctr_iv).
 * @see https://learn.microsoft.com/windows/win32/medfound/d3daes-ctr-iv
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAES_CTR_IV extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

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
