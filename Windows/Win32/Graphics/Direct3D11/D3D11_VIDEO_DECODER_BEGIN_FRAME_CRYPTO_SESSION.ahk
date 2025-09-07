#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides data to the ID3D11VideoContext::DecoderBeginFrame method.
 * @remarks
 * This structure is passed in the <i>pContentKey</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-decoderbeginframe">ID3D11VideoContext::DecoderBeginFrame</a> function when <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-11-video-guids">D3D11_DECODER_ENCRYPTION_HW_CENC</a>  is specified in the <b>guidConfigBitstreamEncryption</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_config">D3D11_VIDEO_DECODER_CONFIG</a> structure when creating the video decoder interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_begin_frame_crypto_session
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_DECODER_BEGIN_FRAME_CRYPTO_SESSION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A pointer to the ID3D11CryptoSession interface.  To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-createcryptosession">ID3D11VideoDevice1::CreateCryptoSession</a>.
     * @type {Pointer<ID3D11CryptoSession>}
     */
    pCryptoSession {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of the memory buffer referenced by the <i>pBlob</i> member.
     * @type {Integer}
     */
    BlobSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The definition of this buffer is dependent on the implementation of the secure execution environment. It could contain a sealed key blob or any other per-key data that the secure execution environment needs to pass to the decode API.
     * 
     * The definition of this buffer is dependent on the implementation of the secure environment. It may contain data specific to the current frame.
     * @type {Pointer<Void>}
     */
    pBlob {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a GUID identifying the hardware key.
     * @type {Pointer<Guid>}
     */
    pKeyInfoId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size of the memory buffer referenced by the <i>pPrivateData</i> member.
     * @type {Integer}
     */
    PrivateDataSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * 
     * @type {Pointer<Void>}
     */
    pPrivateData {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
