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
     * 
     * @param {Integer} KeyFrameRate 
     * @returns {HRESULT} 
     */
    put_KeyFrameRate(KeyFrameRate) {
        result := ComCall(3, this, "int", KeyFrameRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pKeyFrameRate 
     * @returns {HRESULT} 
     */
    get_KeyFrameRate(pKeyFrameRate) {
        result := ComCall(4, this, "int*", pKeyFrameRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PFramesPerKeyFrame 
     * @returns {HRESULT} 
     */
    put_PFramesPerKeyFrame(PFramesPerKeyFrame) {
        result := ComCall(5, this, "int", PFramesPerKeyFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPFramesPerKeyFrame 
     * @returns {HRESULT} 
     */
    get_PFramesPerKeyFrame(pPFramesPerKeyFrame) {
        result := ComCall(6, this, "int*", pPFramesPerKeyFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Quality 
     * @returns {HRESULT} 
     */
    put_Quality(Quality) {
        result := ComCall(7, this, "double", Quality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pQuality 
     * @returns {HRESULT} 
     */
    get_Quality(pQuality) {
        result := ComCall(8, this, "double*", pQuality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WindowSize 
     * @returns {HRESULT} 
     */
    put_WindowSize(WindowSize) {
        result := ComCall(9, this, "uint", WindowSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pWindowSize 
     * @returns {HRESULT} 
     */
    get_WindowSize(pWindowSize) {
        result := ComCall(10, this, "uint*", pWindowSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pszVersion 
     * @param {Pointer<Int32>} pcbVersion 
     * @param {Pointer} pszDescription 
     * @param {Pointer<Int32>} pcbDescription 
     * @param {Pointer<Int32>} pDefaultKeyFrameRate 
     * @param {Pointer<Int32>} pDefaultPFramesPerKey 
     * @param {Pointer<Double>} pDefaultQuality 
     * @param {Pointer<Int32>} pCapabilities 
     * @returns {HRESULT} 
     */
    GetInfo(pszVersion, pcbVersion, pszDescription, pcbDescription, pDefaultKeyFrameRate, pDefaultPFramesPerKey, pDefaultQuality, pCapabilities) {
        result := ComCall(11, this, "ptr", pszVersion, "int*", pcbVersion, "ptr", pszDescription, "int*", pcbDescription, "int*", pDefaultKeyFrameRate, "int*", pDefaultPFramesPerKey, "double*", pDefaultQuality, "int*", pCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FrameNumber 
     * @returns {HRESULT} 
     */
    OverrideKeyFrame(FrameNumber) {
        result := ComCall(12, this, "int", FrameNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FrameNumber 
     * @param {Integer} Size 
     * @returns {HRESULT} 
     */
    OverrideFrameSize(FrameNumber, Size) {
        result := ComCall(13, this, "int", FrameNumber, "int", Size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
