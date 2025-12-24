#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVideoCompression interface sets and retrieves video compression properties.
 * @remarks
 * 
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-videocompression">PROPSETID_VIDCAP_VIDEOCOMPRESSION</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamvideocompression
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMVideoCompression extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMVideoCompression
     * @type {Guid}
     */
    static IID => Guid("{c6e13343-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_KeyFrameRate", "get_KeyFrameRate", "put_PFramesPerKeyFrame", "get_PFramesPerKeyFrame", "put_Quality", "get_Quality", "put_WindowSize", "get_WindowSize", "GetInfo", "OverrideKeyFrame", "OverrideFrameSize"]

    /**
     * @type {Integer} 
     */
    KeyFrameRate {
        get => this.get_KeyFrameRate()
        set => this.put_KeyFrameRate(value)
    }

    /**
     * @type {Integer} 
     */
    PFramesPerKeyFrame {
        get => this.get_PFramesPerKeyFrame()
        set => this.put_PFramesPerKeyFrame(value)
    }

    /**
     * @type {Float} 
     */
    Quality {
        get => this.get_Quality()
        set => this.put_Quality(value)
    }

    /**
     * @type {Integer} 
     */
    WindowSize {
        get => this.get_WindowSize()
        set => this.put_WindowSize(value)
    }

    /**
     * The put_KeyFrameRate method sets the key-frame rate.
     * @param {Integer} KeyFrameRate Desired key-frame rate. If the value is negative, the filter will use the default key-frame rate. If the value is zero, only the first frame will be a key frame.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-put_keyframerate
     */
    put_KeyFrameRate(KeyFrameRate) {
        result := ComCall(3, this, "int", KeyFrameRate, "HRESULT")
        return result
    }

    /**
     * The get_KeyFrameRate method retrieves the current key-frame rate.
     * @returns {Integer} Pointer to a variable that receives the current key-frame rate. If the value is negative, the filter will use the default key-frame rate. If the value is zero, only the first frame is a key frame.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-get_keyframerate
     */
    get_KeyFrameRate() {
        result := ComCall(4, this, "int*", &pKeyFrameRate := 0, "HRESULT")
        return pKeyFrameRate
    }

    /**
     * The put_PFramesPerKeyFrame method sets the rate of predicted (P) frames per key frame.
     * @param {Integer} PFramesPerKeyFrame Specifies the number of P frames per key frame. If the value is negative, the filter will use the default rate.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-put_pframesperkeyframe
     */
    put_PFramesPerKeyFrame(PFramesPerKeyFrame) {
        result := ComCall(5, this, "int", PFramesPerKeyFrame, "HRESULT")
        return result
    }

    /**
     * The get_PFramesPerKeyFrame method retrieves the rate of predicted (P) frames per key frame.
     * @returns {Integer} Pointer to a variable that receives the number of P frames per key frame. If the value is negative, the filter will use the default rate.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-get_pframesperkeyframe
     */
    get_PFramesPerKeyFrame() {
        result := ComCall(6, this, "int*", &pPFramesPerKeyFrame := 0, "HRESULT")
        return pPFramesPerKeyFrame
    }

    /**
     * The put_Quality method sets the compression quality.
     * @param {Float} Quality Specifies the quality as a value between 0.0 and 1.0, where 1.0 indicates the best quality and 0.0 indicates the worst quality. If the value is negative, the filter will use the default quality.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-put_quality
     */
    put_Quality(Quality) {
        result := ComCall(7, this, "double", Quality, "HRESULT")
        return result
    }

    /**
     * The get_Quality method retrieves the current compression quality.
     * @returns {Float} Pointer to a variable that receives the relative compression quality. The quality is expressed as a value between 0.0 and 1.0, where 1.0 indicates the best quality and 0.0 indicates the worst quality. If the value is negative, the filter will use the default quality.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-get_quality
     */
    get_Quality() {
        result := ComCall(8, this, "double*", &pQuality := 0, "HRESULT")
        return pQuality
    }

    /**
     * The put_WindowSize method sets the number of frames over which the compressor must maintain an average data rate.
     * @param {Integer} WindowSize Specifies the window size, expressed as a number of frames. .
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-put_windowsize
     */
    put_WindowSize(WindowSize) {
        result := ComCall(9, this, "uint", WindowSize, "HRESULT")
        return result
    }

    /**
     * The get_WindowSize method retrieves the number of frames over which the compressor will maintain the average data rate.
     * @returns {Integer} Pointer to a variable that receives the window size, expressed as a number of frames.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-get_windowsize
     */
    get_WindowSize() {
        result := ComCall(10, this, "uint*", &pWindowSize := 0, "HRESULT")
        return pWindowSize
    }

    /**
     * The GetInfo method retrieves information about the filter's compression properties, including capabilities and default values.
     * @param {Pointer} pszVersion Pointer to a buffer that receives a version string, such as "Version 2.1.0."
     * @param {Pointer<Integer>} pcbVersion Receives the size of the version string, in bytes.
     * @param {Pointer} pszDescription Pointer to a buffer that receives a description string, such as "My Video Compressor."
     * @param {Pointer<Integer>} pcbDescription Receives the size of the description string, in bytes.
     * @param {Pointer<Integer>} pDefaultKeyFrameRate Receives the default key-frame rate.
     * @param {Pointer<Integer>} pDefaultPFramesPerKey Receives the default rate of predicted (P) frames per key frame.
     * @param {Pointer<Float>} pDefaultQuality Receives the default quality.
     * @param {Pointer<Integer>} pCapabilities Receives the compression capabilities, as a bitwise combination of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-compressioncaps">CompressionCaps</a> flags.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-getinfo
     */
    GetInfo(pszVersion, pcbVersion, pszDescription, pcbDescription, pDefaultKeyFrameRate, pDefaultPFramesPerKey, pDefaultQuality, pCapabilities) {
        pcbVersionMarshal := pcbVersion is VarRef ? "int*" : "ptr"
        pcbDescriptionMarshal := pcbDescription is VarRef ? "int*" : "ptr"
        pDefaultKeyFrameRateMarshal := pDefaultKeyFrameRate is VarRef ? "int*" : "ptr"
        pDefaultPFramesPerKeyMarshal := pDefaultPFramesPerKey is VarRef ? "int*" : "ptr"
        pDefaultQualityMarshal := pDefaultQuality is VarRef ? "double*" : "ptr"
        pCapabilitiesMarshal := pCapabilities is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", pszVersion, pcbVersionMarshal, pcbVersion, "ptr", pszDescription, pcbDescriptionMarshal, pcbDescription, pDefaultKeyFrameRateMarshal, pDefaultKeyFrameRate, pDefaultPFramesPerKeyMarshal, pDefaultPFramesPerKey, pDefaultQualityMarshal, pDefaultQuality, pCapabilitiesMarshal, pCapabilities, "HRESULT")
        return result
    }

    /**
     * The OverrideKeyFrame method instructs the filter to compress a particular frame as a key frame.
     * @param {Integer} FrameNumber Specifies the frame number. The first frame that the filter delivers is numbered zero.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-overridekeyframe
     */
    OverrideKeyFrame(FrameNumber) {
        result := ComCall(12, this, "int", FrameNumber, "HRESULT")
        return result
    }

    /**
     * The OverrideFrameSize method overrides the frame size of a specified frame.
     * @param {Integer} FrameNumber Specifies the frame number. The first frame that the filter delivers is numbered zero.
     * @param {Integer} Size Specifies the maximum size of the specified frame, in bytes.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocompression-overrideframesize
     */
    OverrideFrameSize(FrameNumber, Size) {
        result := ComCall(13, this, "int", FrameNumber, "int", Size, "HRESULT")
        return result
    }
}
