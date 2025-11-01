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
     * 
     * @param {Integer} KeyFrameRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-put_keyframerate
     */
    put_KeyFrameRate(KeyFrameRate) {
        result := ComCall(3, this, "int", KeyFrameRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pKeyFrameRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-get_keyframerate
     */
    get_KeyFrameRate(pKeyFrameRate) {
        pKeyFrameRateMarshal := pKeyFrameRate is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pKeyFrameRateMarshal, pKeyFrameRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PFramesPerKeyFrame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-put_pframesperkeyframe
     */
    put_PFramesPerKeyFrame(PFramesPerKeyFrame) {
        result := ComCall(5, this, "int", PFramesPerKeyFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPFramesPerKeyFrame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-get_pframesperkeyframe
     */
    get_PFramesPerKeyFrame(pPFramesPerKeyFrame) {
        pPFramesPerKeyFrameMarshal := pPFramesPerKeyFrame is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pPFramesPerKeyFrameMarshal, pPFramesPerKeyFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Quality 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-put_quality
     */
    put_Quality(Quality) {
        result := ComCall(7, this, "double", Quality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pQuality 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-get_quality
     */
    get_Quality(pQuality) {
        pQualityMarshal := pQuality is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, pQualityMarshal, pQuality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} WindowSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-put_windowsize
     */
    put_WindowSize(WindowSize) {
        result := ComCall(9, this, "uint", WindowSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWindowSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-get_windowsize
     */
    get_WindowSize(pWindowSize) {
        pWindowSizeMarshal := pWindowSize is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pWindowSizeMarshal, pWindowSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pszVersion 
     * @param {Pointer<Integer>} pcbVersion 
     * @param {Pointer} pszDescription 
     * @param {Pointer<Integer>} pcbDescription 
     * @param {Pointer<Integer>} pDefaultKeyFrameRate 
     * @param {Pointer<Integer>} pDefaultPFramesPerKey 
     * @param {Pointer<Float>} pDefaultQuality 
     * @param {Pointer<Integer>} pCapabilities 
     * @returns {HRESULT} 
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
     * 
     * @param {Integer} FrameNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-overridekeyframe
     */
    OverrideKeyFrame(FrameNumber) {
        result := ComCall(12, this, "int", FrameNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FrameNumber 
     * @param {Integer} Size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocompression-overrideframesize
     */
    OverrideFrameSize(FrameNumber, Size) {
        result := ComCall(13, this, "int", FrameNumber, "int", Size, "HRESULT")
        return result
    }
}
