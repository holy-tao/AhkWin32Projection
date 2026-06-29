#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an initialization vector (IV) for 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher encryption.
 * @remarks
 * The **D3DAES\_CTR\_IV** structure and the [**DXVA2\_AES\_CTR\_IV**](/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_aes_ctr_iv) structure are equivalent.
 * 
 * For details, see [**DXVA2\_AES\_CTR\_IV**](/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_aes_ctr_iv).
 * @see https://learn.microsoft.com/windows/win32/medfound/d3daes-ctr-iv
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @architecture X64, Arm64
 */
export default struct D3DAES_CTR_IV {
    #StructPack 8

    /**
     * The IV, in big-endian format.
     */
    IV : Int64

    /**
     * The block count, in big-endian format.
     */
    Count : Int64

}
