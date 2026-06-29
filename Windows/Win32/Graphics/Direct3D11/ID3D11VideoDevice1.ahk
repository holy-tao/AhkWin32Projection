#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D11_VIDEO_DECODER_DESC.ahk" { D3D11_VIDEO_DECODER_DESC }
#Import ".\ID3D11VideoDevice.ahk" { ID3D11VideoDevice }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import ".\D3D11_VIDEO_DECODER_CONFIG.ahk" { D3D11_VIDEO_DECODER_CONFIG }
#Import ".\D3D11_VIDEO_SAMPLE_DESC.ahk" { D3D11_VIDEO_SAMPLE_DESC }

/**
 * Provides the video decoding and video processing capabilities of a Microsoft Direct3D 11 device. (ID3D11VideoDevice1)
 * @remarks
 * The Direct3D 11 device supports this interface. To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11device1">ID3D11Device1</a> interface pointer.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3d11videodevice1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11VideoDevice1 extends ID3D11VideoDevice {
    /**
     * The interface identifier for ID3D11VideoDevice1
     * @type {Guid}
     */
    static IID := Guid("{29da1d51-1321-4454-804b-f5fc9f861f0f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11VideoDevice1 interfaces
    */
    struct Vtbl extends ID3D11VideoDevice.Vtbl {
        GetCryptoSessionPrivateDataSize           : IntPtr
        GetVideoDecoderCaps                       : IntPtr
        CheckVideoDecoderDownsampling             : IntPtr
        RecommendVideoDecoderDownsampleParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11VideoDevice1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves optional sizes for private driver data.
     * @remarks
     * When <i>pKeyExchangeType</i> is <b>D3D11_KEY_EXCHANGE_HW_PROTECTION</b>, the following behavior is expected in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-negotiatecryptosessionkeyexchange">ID3D11VideoContext::NegotiateCryptoSessionKeyExchange</a> method:
     * 
     * <ul>
     * <li>The <i>DataSize</i> parameter is set to the size of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_data">D3D11_KEY_EXCHANGE_HW_PROTECTION_DATA</a> structure.</li>
     * <li><i>pData</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_data">D3D11_KEY_EXCHANGE_HW_PROTECTION_DATA</a> structure. <ul>
     * <li>The <b>pInputData</b> of this structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_input_data">D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA</a> structure where:<ul>
     * <li><b>pbInput</b>[0] – <b>pbInput</b>[N-1] contains memory reserved for use by the driver. The number of bytes (N) reserved for the driver is determined by the <b>pPrivateInputSize</b> value returned by the <b>ID3D11VideoDevice1::GetCryptoSessionPrivateDataSize</b> function.</li>
     * <li><b>pbInput</b>[N] contains the first byte of the DRM command packet.</li>
     * </ul>
     * </li>
     * <li>The <b>pOutputData</b> of this structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_output_data">D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA</a> structure where:<ul>
     * <li><b>pbOutput</b>[0] – <b>pbOutput</b>[N-1] contains memory reserved for use by the driver. The number of bytes (N) reserved for the driver is determined by the <b>pPrivateOutputSize</b> value returned by the <b>ID3D11VideoDevice1::GetCryptoSessionPrivateDataSize</b> function.</li>
     * <li><b>pbOutput</b>[N] contains the first byte of the DRM command packet.</li>
     * </ul>
     * </li>
     * </ul>
     * </li>
     * </ul>
     * @param {Pointer<Guid>} pCryptoType Type: <b>const GUID*</b>
     * 
     * Indicates the crypto type for which the private input and output size is queried.
     * @param {Pointer<Guid>} pDecoderProfile Type: <b>const GUID*</b>
     * 
     * Indicates the decoder profile for which the private input and output size is queried.
     * @param {Pointer<Guid>} pKeyExchangeType Type: <b>const GUID*</b>
     * 
     * Indicates the key exchange type for which the private input and output size is queried.
     * @param {Pointer<Integer>} pPrivateInputSize Type: <b>UINT*</b>
     * 
     * Returns the size of private data that the driver needs for input commands.
     * @param {Pointer<Integer>} pPrivateOutputSize Type: <b>UINT*</b>
     * 
     * Returns the size of private data that the driver needs for output commands.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-getcryptosessionprivatedatasize
     */
    GetCryptoSessionPrivateDataSize(pCryptoType, pDecoderProfile, pKeyExchangeType, pPrivateInputSize, pPrivateOutputSize) {
        pPrivateInputSizeMarshal := pPrivateInputSize is VarRef ? "uint*" : "ptr"
        pPrivateOutputSizeMarshal := pPrivateOutputSize is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, Guid.Ptr, pCryptoType, Guid.Ptr, pDecoderProfile, Guid.Ptr, pKeyExchangeType, pPrivateInputSizeMarshal, pPrivateInputSize, pPrivateOutputSizeMarshal, pPrivateOutputSize, "HRESULT")
        return result
    }

    /**
     * Retrieves capabilities and limitations of the video decoder.
     * @param {Pointer<Guid>} pDecoderProfile Type: <b>const GUID*</b>
     * 
     * The decode profile for which the capabilities are queried.
     * @param {Integer} SampleWidth Type: <b>UINT</b>
     * 
     * The video width for which the capabilities are queried.
     * @param {Integer} SampleHeight Type: <b>UINT</b>
     * 
     * The video height for which the capabilities are queried.
     * @param {Pointer<DXGI_RATIONAL>} pFrameRate Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a>*</b>
     * 
     * The frame rate of the video content. This information is used by the driver to determine whether the video can be decoded in real-time.
     * @param {Integer} BitRate Type: <b>UINT</b>
     * 
     * The bit rate of the video stream. A value of zero indicates that the bit rate can be ignored.
     * @param {Pointer<Guid>} pCryptoType Type: <b>const GUID*</b>
     * 
     * The type of cryptography used to encrypt the video stream. A value of NULL indicates that the video stream is not encrypted.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_video_decoder_caps">D3D11_VIDEO_DECODER_CAPS</a> values specifying the decoder capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-getvideodecodercaps
     */
    GetVideoDecoderCaps(pDecoderProfile, SampleWidth, SampleHeight, pFrameRate, BitRate, pCryptoType) {
        result := ComCall(21, this, Guid.Ptr, pDecoderProfile, "uint", SampleWidth, "uint", SampleHeight, DXGI_RATIONAL.Ptr, pFrameRate, "uint", BitRate, Guid.Ptr, pCryptoType, "uint*", &pDecoderCaps := 0, "HRESULT")
        return pDecoderCaps
    }

    /**
     * Indicates whether the video decoder supports downsampling with the specified input format, and whether real-time downsampling is supported.
     * @remarks
     * You  should call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-getvideodecodercaps">GetVideoDecoderCaps</a> to determine whether decoder downsampling is supported before checking support for a  specific configuration.
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pInputDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_desc">D3D11_VIDEO_DECODER_DESC</a>*</b>
     * 
     * An object describing the decoding profile, the resolution, and format of the input stream.  This is the resolution and format to be downsampled.
     * @param {DXGI_COLOR_SPACE_TYPE} InputColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a> value that specifies the colorspace of the reference frame data.
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pInputConfig Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_config">D3D11_VIDEO_DECODER_CONFIG</a>*</b>
     * 
     * The configuration data associated with the decode profile.
     * @param {Pointer<DXGI_RATIONAL>} pFrameRate Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a>*</b>
     * 
     * The frame rate of the video content. This is used by the driver to determine whether the video can be decoded in real-time.
     * @param {Pointer<D3D11_VIDEO_SAMPLE_DESC>} pOutputDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_sample_desc">D3D11_VIDEO_SAMPLE_DESC</a>*</b>
     * 
     * An object describing the resolution, format, and colorspace of the output frames.  This is the destination resolution and format of the downsample operation.
     * @param {Pointer<BOOL>} pSupported Type: <b>BOOL*</b>
     * 
     * Pointer to a boolean value set by the driver that indicates if downsampling is supported with the specified input data. True if the driver supports the requested downsampling;  otherwise, false.
     * @param {Pointer<BOOL>} pRealTimeHint Type: <b>BOOL*</b>
     * 
     * Pointer to a boolean value set by the driver that indicates if real-time decoding is supported with the specified input data. True if the driver supports the requested real-time decoding;  otherwise, false. Note that the returned value is based on the current configuration of the video decoder and does not guarantee that real-time decoding will be supported for future downsampling operations.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <td>S_OK</td>
     * <td>The operation completed successfully.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed or this function was called using an invalid calling pattern.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-checkvideodecoderdownsampling
     */
    CheckVideoDecoderDownsampling(pInputDesc, InputColorSpace, pInputConfig, pFrameRate, pOutputDesc, pSupported, pRealTimeHint) {
        pSupportedMarshal := pSupported is VarRef ? "int*" : "ptr"
        pRealTimeHintMarshal := pRealTimeHint is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, D3D11_VIDEO_DECODER_DESC.Ptr, pInputDesc, DXGI_COLOR_SPACE_TYPE, InputColorSpace, D3D11_VIDEO_DECODER_CONFIG.Ptr, pInputConfig, DXGI_RATIONAL.Ptr, pFrameRate, D3D11_VIDEO_SAMPLE_DESC.Ptr, pOutputDesc, pSupportedMarshal, pSupported, pRealTimeHintMarshal, pRealTimeHint, "HRESULT")
        return result
    }

    /**
     * Allows the driver to recommend optimal output downsample parameters from the input parameters.
     * @remarks
     * You  should call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-getvideodecodercaps">GetVideoDecoderCaps</a> to determine whether decoder downsampling is supported before checking support for a  specific configuration.
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pInputDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_desc">D3D11_VIDEO_DECODER_DESC</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_desc">D3D11_VIDEO_DECODER_DESC</a> object describing the decoding profile, the resolution, and format of the input stream.  This is the resolution and format to be downsampled.
     * @param {DXGI_COLOR_SPACE_TYPE} InputColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a> value that specifies the colorspace of the reference frame data.
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pInputConfig Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_config">D3D11_VIDEO_DECODER_CONFIG</a>*</b>
     * 
     * The configuration data associated with the decode profile.
     * @param {Pointer<DXGI_RATIONAL>} pFrameRate Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a>*</b>
     * 
     * The frame rate of the video content. This is used by the driver to determine whether the video can be decoded in real-time.
     * @returns {D3D11_VIDEO_SAMPLE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_sample_desc">D3D11_VIDEO_SAMPLE_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_sample_desc">D3D11_VIDEO_SAMPLE_DESC</a> structure that the driver populates with the recommended output buffer parameters for a downsample operation. The driver will attempt to recommend parameters that can support real-time decoding. If it is unable to do so, the driver will recommend values that are as close to the real-time solution as possible.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-recommendvideodecoderdownsampleparameters
     */
    RecommendVideoDecoderDownsampleParameters(pInputDesc, InputColorSpace, pInputConfig, pFrameRate) {
        pRecommendedOutputDesc := D3D11_VIDEO_SAMPLE_DESC()
        result := ComCall(23, this, D3D11_VIDEO_DECODER_DESC.Ptr, pInputDesc, DXGI_COLOR_SPACE_TYPE, InputColorSpace, D3D11_VIDEO_DECODER_CONFIG.Ptr, pInputConfig, DXGI_RATIONAL.Ptr, pFrameRate, D3D11_VIDEO_SAMPLE_DESC.Ptr, pRecommendedOutputDesc, "HRESULT")
        return pRecommendedOutputDesc
    }

    Query(iid) {
        if (ID3D11VideoDevice1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCryptoSessionPrivateDataSize := CallbackCreate(GetMethod(implObj, "GetCryptoSessionPrivateDataSize"), flags, 6)
        this.vtbl.GetVideoDecoderCaps := CallbackCreate(GetMethod(implObj, "GetVideoDecoderCaps"), flags, 8)
        this.vtbl.CheckVideoDecoderDownsampling := CallbackCreate(GetMethod(implObj, "CheckVideoDecoderDownsampling"), flags, 8)
        this.vtbl.RecommendVideoDecoderDownsampleParameters := CallbackCreate(GetMethod(implObj, "RecommendVideoDecoderDownsampleParameters"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCryptoSessionPrivateDataSize)
        CallbackFree(this.vtbl.GetVideoDecoderCaps)
        CallbackFree(this.vtbl.CheckVideoDecoderDownsampling)
        CallbackFree(this.vtbl.RecommendVideoDecoderDownsampleParameters)
    }
}
