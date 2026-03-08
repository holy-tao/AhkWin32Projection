#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMediaProps.ahk

/**
 * With this interface, the application can specify additional video-specific parameters not available on the IWMMediaProps interface.To get access to the methods of this interface, call QueryInterface on a stream configuration object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmvideomediaprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMVideoMediaProps extends IWMMediaProps{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMVideoMediaProps
     * @type {Guid}
     */
    static IID => Guid("{96406bcf-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxKeyFrameSpacing", "SetMaxKeyFrameSpacing", "GetQuality", "SetQuality"]

    /**
     * The GetMaxKeyFrameSpacing method retrieves the maximum interval between key frames.
     * @remarks
     * This method retrieves the value set by <b>SetMaxKeyFrameSpacing</b>, or the default value for the key frame spacing, during the encoding process only. If called for a file that is open in the reader, the method always returns zero.
     * 
     * For more information, see the Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-setmaxkeyframespacing">SetMaxKeyFrameSpacing</a>.
     * @returns {Integer} Pointer to a variable that receives the interval in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-getmaxkeyframespacing
     */
    GetMaxKeyFrameSpacing() {
        result := ComCall(6, this, "int64*", &pllTime := 0, "HRESULT")
        return pllTime
    }

    /**
     * The SetMaxKeyFrameSpacing method specifies the maximum interval between key frames.
     * @remarks
     * A key frame is a video frame that can be rendered without any information being required from any previous frame. A delta frame is a frame that is dependent on a previous frame. The application can seek to a key frame, but not to a delta frame. The SDK does not enforce any limit on the time between key frames. In general, times longer than 30 seconds can adversely affect seek times both when the content is streamed over a network, and when it is played back locally. For recommended values, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/configuring-video-streams-for-seeking-performance">Configuring Video Streams for Seeking Performance</a>.
     * @param {Integer} llTime Maximum key-frame spacing in 100-nanosecond units.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-setmaxkeyframespacing
     */
    SetMaxKeyFrameSpacing(llTime) {
        result := ComCall(7, this, "int64", llTime, "HRESULT")
        return result
    }

    /**
     * The GetQuality method retrieves the quality setting for the video stream.
     * @remarks
     * For more information, see the Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-setquality">SetQuality</a>.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the quality setting.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-getquality
     */
    GetQuality() {
        result := ComCall(8, this, "uint*", &pdwQuality := 0, "HRESULT")
        return pdwQuality
    }

    /**
     * The SetQuality method specifies the quality setting for the video stream.
     * @param {Integer} dwQuality <b>DWORD</b> specifying the quality setting, in the range from zero (maximum <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">frame rate</a>) to 100 (maximum image quality).
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-setquality
     */
    SetQuality(dwQuality) {
        result := ComCall(9, this, "uint", dwQuality, "HRESULT")
        return result
    }
}
