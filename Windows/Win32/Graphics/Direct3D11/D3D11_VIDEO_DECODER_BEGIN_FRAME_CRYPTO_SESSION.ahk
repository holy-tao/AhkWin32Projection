#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D11CryptoSession.ahk" { ID3D11CryptoSession }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Provides data to the ID3D11VideoContext::DecoderBeginFrame method.
 * @remarks
 * This structure is passed in the <i>pContentKey</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-decoderbeginframe">ID3D11VideoContext::DecoderBeginFrame</a> function when <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-11-video-guids">D3D11_DECODER_ENCRYPTION_HW_CENC</a>  is specified in the <b>guidConfigBitstreamEncryption</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_config">D3D11_VIDEO_DECODER_CONFIG</a> structure when creating the video decoder interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_begin_frame_crypto_session
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_DECODER_BEGIN_FRAME_CRYPTO_SESSION {
    #StructPack 8

    /**
     * A pointer to the ID3D11CryptoSession interface.  To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-createcryptosession">ID3D11VideoDevice1::CreateCryptoSession</a>.
     */
    pCryptoSession : ID3D11CryptoSession

    /**
     * The size of the memory buffer referenced by the <i>pBlob</i> member.
     */
    BlobSize : UInt32

    /**
     * The definition of this buffer is dependent on the implementation of the secure execution environment. It could contain a sealed key blob or any other per-key data that the secure execution environment needs to pass to the decode API.
     * 
     * The definition of this buffer is dependent on the implementation of the secure environment. It may contain data specific to the current frame.
     */
    pBlob : IntPtr

    /**
     * A pointer to a GUID identifying the hardware key.
     */
    pKeyInfoId : Guid.Ptr

    /**
     * The size of the memory buffer referenced by the <i>pPrivateData</i> member.
     */
    PrivateDataSize : UInt32

    pPrivateData : IntPtr

}
