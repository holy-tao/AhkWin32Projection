#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMVideoCompression interface sets and retrieves video compression properties.
 * @remarks
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-videocompression">PROPSETID_VIDCAP_VIDEOCOMPRESSION</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamvideocompression
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMVideoCompression extends IUnknown {
    /**
     * The interface identifier for IAMVideoCompression
     * @type {Guid}
     */
    static IID := Guid("{c6e13343-30ac-11d0-a18c-00a0c9118956}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMVideoCompression interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_KeyFrameRate       : IntPtr
        get_KeyFrameRate       : IntPtr
        put_PFramesPerKeyFrame : IntPtr
        get_PFramesPerKeyFrame : IntPtr
        put_Quality            : IntPtr
        get_Quality            : IntPtr
        put_WindowSize         : IntPtr
        get_WindowSize         : IntPtr
        GetInfo                : IntPtr
        OverrideKeyFrame       : IntPtr
        OverrideFrameSize      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMVideoCompression.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * To determine if the filter supports this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-getinfo">IAMVideoCompression::GetInfo</a> method and check for the <b>CompressionCaps_CanKeyFrame</b> flag in the <i>pCapabilities</i> parameter. The <b>GetInfo</b> method also returns the default key-frame rate.
     * @param {Integer} KeyFrameRate Desired key-frame rate. If the value is negative, the filter will use the default key-frame rate. If the value is zero, only the first frame will be a key frame.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-put_keyframerate
     */
    put_KeyFrameRate(KeyFrameRate) {
        result := ComCall(3, this, "int", KeyFrameRate, "HRESULT")
        return result
    }

    /**
     * The get_KeyFrameRate method retrieves the current key-frame rate.
     * @remarks
     * The key-frame rate is the number of frames per key frame. For example, if the rate is 15, then a key frame occurs every 15 frames.
     * 
     * To determine if the filter supports this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-getinfo">IAMVideoCompression::GetInfo</a> method and check for the <b>CompressionCaps_CanKeyFrame</b> flag in the <i>pCapabilities</i> parameter. The <b>GetInfo</b> method also returns the default key-frame rate.
     * @returns {Integer} Pointer to a variable that receives the current key-frame rate. If the value is negative, the filter will use the default key-frame rate. If the value is zero, only the first frame is a key frame.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-get_keyframerate
     */
    get_KeyFrameRate() {
        result := ComCall(4, this, "int*", &pKeyFrameRate := 0, "HRESULT")
        return pKeyFrameRate
    }

    /**
     * The put_PFramesPerKeyFrame method sets the rate of predicted (P) frames per key frame.
     * @remarks
     * To determine if the filter supports this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-getinfo">IAMVideoCompression::GetInfo</a> method and check for the <b>CompressionCaps_CanBFrame</b> flag in the <i>pCapabilities</i> parameter. The <b>GetInfo</b> method also returns the default P-frame rate.
     * @param {Integer} PFramesPerKeyFrame Specifies the number of P frames per key frame. If the value is negative, the filter will use the default rate.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-put_pframesperkeyframe
     */
    put_PFramesPerKeyFrame(PFramesPerKeyFrame) {
        result := ComCall(5, this, "int", PFramesPerKeyFrame, "HRESULT")
        return result
    }

    /**
     * The get_PFramesPerKeyFrame method retrieves the rate of predicted (P) frames per key frame.
     * @remarks
     * To determine if the filter supports this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-getinfo">IAMVideoCompression::GetInfo</a> method and check for the <b>CompressionCaps_CanBFrame</b> flag in the <i>pCapabilities</i> parameter. The <b>GetInfo</b> method also returns the default P-frame rate.
     * 
     * P frames are used in MPEG compression; in general, this property does not apply to other compression formats. For example, suppose a key frame occurs once every 10 frames, and there are three P frames per key frame. The P frames will be spaced evenly between the key frames. The remaining six frames are bidirectional (B) frames.
     * @returns {Integer} Pointer to a variable that receives the number of P frames per key frame. If the value is negative, the filter will use the default rate.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-get_pframesperkeyframe
     */
    get_PFramesPerKeyFrame() {
        result := ComCall(6, this, "int*", &pPFramesPerKeyFrame := 0, "HRESULT")
        return pPFramesPerKeyFrame
    }

    /**
     * The put_Quality method sets the compression quality.
     * @remarks
     * To determine if the filter supports this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-getinfo">IAMVideoCompression::GetInfo</a> method and check for the <b>CompressionCaps_CanQuality</b> flag in the <i>pCapabilities</i> parameter. The <b>GetInfo</b> method also returns the default quality.
     * @param {Float} _Quality Specifies the quality as a value between 0.0 and 1.0, where 1.0 indicates the best quality and 0.0 indicates the worst quality. If the value is negative, the filter will use the default quality.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-put_quality
     */
    put_Quality(_Quality) {
        result := ComCall(7, this, "double", _Quality, "HRESULT")
        return result
    }

    /**
     * The get_Quality method retrieves the current compression quality.
     * @remarks
     * The exact meaning of the quality setting depends on the filter.
     * 
     * To determine if the filter supports this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-getinfo">IAMVideoCompression::GetInfo</a> method and check for the <b>CompressionCaps_CanQuality</b> flag in the <i>pCapabilities</i> parameter. The <b>GetInfo</b> method also returns the default quality.
     * @returns {Float} Pointer to a variable that receives the relative compression quality. The quality is expressed as a value between 0.0 and 1.0, where 1.0 indicates the best quality and 0.0 indicates the worst quality. If the value is negative, the filter will use the default quality.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-get_quality
     */
    get_Quality() {
        result := ComCall(8, this, "double*", &pQuality := 0, "HRESULT")
        return pQuality
    }

    /**
     * The put_WindowSize method sets the number of frames over which the compressor must maintain an average data rate.
     * @param {Integer} WindowSize Specifies the window size, expressed as a number of frames. .
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-put_windowsize
     */
    put_WindowSize(WindowSize) {
        result := ComCall(9, this, "uint", WindowSize, "HRESULT")
        return result
    }

    /**
     * The get_WindowSize method retrieves the number of frames over which the compressor will maintain the average data rate.
     * @returns {Integer} Pointer to a variable that receives the window size, expressed as a number of frames.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-get_windowsize
     */
    get_WindowSize() {
        result := ComCall(10, this, "uint*", &pWindowSize := 0, "HRESULT")
        return pWindowSize
    }

    /**
     * The GetInfo method retrieves information about the filter's compression properties, including capabilities and default values.
     * @remarks
     * Any of the listed parameters can be <b>NULL</b>, in which case the method ignores that parameter.
     * 
     * The application must allocate the buffers for the version and description strings. To determine the required size of the buffers, call this method with <b>NULL</b> for the <i>pszVersion</i> and <i>pszDescription</i> parameters. Use the values returned in <i>pcbVersion</i> and <i>pcbDescription</i> to allocate the buffers and then call the method again, as shown in the following code:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * 
     * ```
     * // Get the size of the version and description strings, in bytes.
     * int cbVersion, cbDesc; 
     * hr = pCompress-&gt;GetInfo(NULL, &amp;cbVersion, NULL, &amp;cbDesc, 
     *     NULL, NULL, NULL, NULL);
     * if (SUCCEEDED(hr))
     * {
     *     // Allocate the buffers.
     *     WCHAR *pszVersion = new WCHAR[cbVersion / sizeof(WCHAR)];  
     *     WCHAR *pszDesc = new WCHAR[cbDesc / sizeof(WCHAR)];
     * 
     *     // Now query for the strings.
     *     hr = pCompress-&gt;GetInfo(pszVersion, &amp;cbVersion, pszDesc, &amp;cbDesc, 
     *         NULL, NULL, NULL, NULL);
     *     }
     *     delete [] pszVersion;
     *     delete [] pszDesc;
     * }
     * ```
     * </td>
     * </tr>
     * </table></span></div>
     * Note that the strings are wide-character strings, and the returned sizes are in bytes, not number of characters. Also, one or both strings might be zero-length.
     * 
     * The <i>pCapabilities</i> parameter receives a set of flags indicating which compression properties are supported, and thus which <b>IAMVideoCompression</b> methods are supported. For example, if the <b>CompressionCaps_CanKeyFrame</b> flag is returned, it the filter supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-get_keyframerate">IAMVideoCompression::get_KeyFrameRate</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-put_keyframerate">IAMVideoCompression::put_KeyFrameRate</a> methods.
     * 
     * The remaining parameters receive default values for the compression properties. For unsupported properties (as determined by the flags returned in <i>pCapabilities</i>), you should ignore the corresponding default value, as it may not be correct or meaningful.
     * @param {Integer} pszVersion Pointer to a buffer that receives a version string, such as "Version 2.1.0."
     * @param {Pointer<Integer>} pcbVersion Receives the size of the version string, in bytes.
     * @param {Integer} pszDescription Pointer to a buffer that receives a description string, such as "My Video Compressor."
     * @param {Pointer<Integer>} pcbDescription Receives the size of the description string, in bytes.
     * @param {Pointer<Integer>} pDefaultKeyFrameRate Receives the default key-frame rate.
     * @param {Pointer<Integer>} pDefaultPFramesPerKey Receives the default rate of predicted (P) frames per key frame.
     * @param {Pointer<Float>} pDefaultQuality Receives the default quality.
     * @param {Pointer<Integer>} pCapabilities Receives the compression capabilities, as a bitwise combination of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-compressioncaps">CompressionCaps</a> flags.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-getinfo
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
     * @remarks
     * If the filter supports this method, you can use it to override the normal key-frame distribution for a particular frame. After the filter creates a key frame, it might reset its count to determine when the next key frame should occur. For example, if the key-frame rate is 10, and an application uses this method to force frame 5 as a key frame, the filter might wait another 10 frames (until frame 15) before it creates the next key frame.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-overridekeyframe
     */
    OverrideKeyFrame(FrameNumber) {
        result := ComCall(12, this, "int", FrameNumber, "HRESULT")
        return result
    }

    /**
     * The OverrideFrameSize method overrides the frame size of a specified frame.
     * @remarks
     * If the filter supports this method, the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-getinfo">IAMVideoCompression::GetInfo</a> method will return the <b>CompressionCaps_CanCrunch</b> flag in the <i>pCapabilities</i> parameter. However, this flag can also indicate that the filter supports setting the bit rate, so it does not guarantee that the <c>OverrideFrameSize</c> method is supported.
     * @param {Integer} FrameNumber Specifies the frame number. The first frame that the filter delivers is numbered zero.
     * @param {Integer} _Size Specifies the maximum size of the specified frame, in bytes.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-overrideframesize
     */
    OverrideFrameSize(FrameNumber, _Size) {
        result := ComCall(13, this, "int", FrameNumber, "int", _Size, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMVideoCompression.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_KeyFrameRate := CallbackCreate(GetMethod(implObj, "put_KeyFrameRate"), flags, 2)
        this.vtbl.get_KeyFrameRate := CallbackCreate(GetMethod(implObj, "get_KeyFrameRate"), flags, 2)
        this.vtbl.put_PFramesPerKeyFrame := CallbackCreate(GetMethod(implObj, "put_PFramesPerKeyFrame"), flags, 2)
        this.vtbl.get_PFramesPerKeyFrame := CallbackCreate(GetMethod(implObj, "get_PFramesPerKeyFrame"), flags, 2)
        this.vtbl.put_Quality := CallbackCreate(GetMethod(implObj, "put_Quality"), flags, 2)
        this.vtbl.get_Quality := CallbackCreate(GetMethod(implObj, "get_Quality"), flags, 2)
        this.vtbl.put_WindowSize := CallbackCreate(GetMethod(implObj, "put_WindowSize"), flags, 2)
        this.vtbl.get_WindowSize := CallbackCreate(GetMethod(implObj, "get_WindowSize"), flags, 2)
        this.vtbl.GetInfo := CallbackCreate(GetMethod(implObj, "GetInfo"), flags, 9)
        this.vtbl.OverrideKeyFrame := CallbackCreate(GetMethod(implObj, "OverrideKeyFrame"), flags, 2)
        this.vtbl.OverrideFrameSize := CallbackCreate(GetMethod(implObj, "OverrideFrameSize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_KeyFrameRate)
        CallbackFree(this.vtbl.get_KeyFrameRate)
        CallbackFree(this.vtbl.put_PFramesPerKeyFrame)
        CallbackFree(this.vtbl.get_PFramesPerKeyFrame)
        CallbackFree(this.vtbl.put_Quality)
        CallbackFree(this.vtbl.get_Quality)
        CallbackFree(this.vtbl.put_WindowSize)
        CallbackFree(this.vtbl.get_WindowSize)
        CallbackFree(this.vtbl.GetInfo)
        CallbackFree(this.vtbl.OverrideKeyFrame)
        CallbackFree(this.vtbl.OverrideFrameSize)
    }
}
