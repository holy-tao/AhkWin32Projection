#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IQualProp interface provides methods for retrieving performance information from video renderers.
 * @see https://docs.microsoft.com/windows/win32/api//amvideo/nn-amvideo-iqualprop
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IQualProp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQualProp
     * @type {Guid}
     */
    static IID => Guid("{1bd0ecb0-f8e2-11ce-aac6-0020af0b99a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FramesDroppedInRenderer", "get_FramesDrawn", "get_AvgFrameRate", "get_Jitter", "get_AvgSyncOffset", "get_DevSyncOffset"]

    /**
     * @type {Integer} 
     */
    FramesDroppedInRenderer {
        get => this.get_FramesDroppedInRenderer()
    }

    /**
     * @type {Integer} 
     */
    FramesDrawn {
        get => this.get_FramesDrawn()
    }

    /**
     * @type {Integer} 
     */
    AvgFrameRate {
        get => this.get_AvgFrameRate()
    }

    /**
     * @type {Integer} 
     */
    Jitter {
        get => this.get_Jitter()
    }

    /**
     * @type {Integer} 
     */
    AvgSyncOffset {
        get => this.get_AvgSyncOffset()
    }

    /**
     * @type {Integer} 
     */
    DevSyncOffset {
        get => this.get_DevSyncOffset()
    }

    /**
     * The get_FramesDroppedInRenderer method retrieves the number of frames dropped by the renderer.
     * @returns {Integer} Pointer to the number of frames dropped by the renderer.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-iqualprop-get_framesdroppedinrenderer
     */
    get_FramesDroppedInRenderer() {
        result := ComCall(3, this, "int*", &pcFrames := 0, "HRESULT")
        return pcFrames
    }

    /**
     * The get_FramesDrawn method retrieves the number of frames actually drawn since streaming started.
     * @returns {Integer} Pointer to the number of frames drawn since streaming started.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-iqualprop-get_framesdrawn
     */
    get_FramesDrawn() {
        result := ComCall(4, this, "int*", &pcFramesDrawn := 0, "HRESULT")
        return pcFramesDrawn
    }

    /**
     * The get_AvgFrameRate method retrieves the actual average frame rate since streaming started.
     * @returns {Integer} Pointer to a variable that receives the actual number of frames per second, multiplied by 100. For example, an average frame rate of 30 frames per second will be represented as 3000.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-iqualprop-get_avgframerate
     */
    get_AvgFrameRate() {
        result := ComCall(5, this, "int*", &piAvgFrameRate := 0, "HRESULT")
        return piAvgFrameRate
    }

    /**
     * The get_Jitter method gets the jitter (variation in time) between successive frames delivered to the video renderer.
     * @returns {Integer} Receives the standard deviation of the interframe time, in milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-iqualprop-get_jitter
     */
    get_Jitter() {
        result := ComCall(6, this, "int*", &iJitter := 0, "HRESULT")
        return iJitter
    }

    /**
     * The get_AvgSyncOffset method retrieves the average time difference between when the video frames should have been displayed and when they actually were.
     * @returns {Integer} Pointer to the time difference, expressed in milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-iqualprop-get_avgsyncoffset
     */
    get_AvgSyncOffset() {
        result := ComCall(7, this, "int*", &piAvg := 0, "HRESULT")
        return piAvg
    }

    /**
     * The get_DevSyncOffset method retrieves the average time difference between when the video frames should have been displayed and when they actually were.
     * @returns {Integer} Pointer to a value denoting the accuracy of the video frames displayed.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-iqualprop-get_devsyncoffset
     */
    get_DevSyncOffset() {
        result := ComCall(8, this, "int*", &piDev := 0, "HRESULT")
        return piDev
    }
}
