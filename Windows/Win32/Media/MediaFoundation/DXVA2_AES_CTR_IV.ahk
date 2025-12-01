#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an initialization vector (IV) for 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher encryption. (DXVA2_AES_CTR_IV)
 * @remarks
 * For AES-CTR encryption, the <b>pvPVPState</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_decodebufferdesc">DXVA2_DecodeBufferDesc</a> structure points to a <b>DXVA2_AES_CTR_IV</b> structure.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/medfound/d3daes-ctr-iv">D3DAES_CTR_IV</a> structure and the <b>DXVA2_AES_CTR_IV</b> structure are equivalent.
 * 
 * <h3><a id="Sequential_Counts"></a><a id="sequential_counts"></a><a id="SEQUENTIAL_COUNTS"></a>Sequential Counts</h3>
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps">IDirect3DDevice9Video::GetContentProtectionCaps</a> method returns the <b>D3DCPCAPS_SEQUENTIAL_CTR_IV</b> flag, the caller should keep <b>IV</b> unchanged when submitting multiple buffers for the same video frame, and <b>Count</b> should be in sequential order of the previous submission for the frame.
 * 
 * Example: Suppose the software decoder submits three buffers for a single frame, and that each buffer contains three 128-bit blocks.  For the first buffer, <b>IV</b> can be any value. For the next two buffers, the same value of <b>IV</b>  must be used. The value of  <b>Count</b> starts at 1. For the second buffer, <b>Count</b> equals 4 (1 + 3 blocks from the first submission). For the third buffer, <b>Count</b> equals 7 (4 + 3 blocks from the second submission).
 * 
 * When the <b>D3DCPCAPS_SEQUENTIAL_CTR_IV</b> capability is present, it is recommended to submit data in 128-bit blocks.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_aes_ctr_iv
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_AES_CTR_IV extends Win32Struct
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
