#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an initialization vector (IV) for 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher encryption. (D3D11_AES_CTR_IV)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_aes_ctr_iv
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AES_CTR_IV {
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
