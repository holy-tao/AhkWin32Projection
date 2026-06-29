#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IQualProp interface provides methods for retrieving performance information from video renderers.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/nn-amvideo-iqualprop
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IQualProp extends IUnknown {
    /**
     * The interface identifier for IQualProp
     * @type {Guid}
     */
    static IID := Guid("{1bd0ecb0-f8e2-11ce-aac6-0020af0b99a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQualProp interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_FramesDroppedInRenderer : IntPtr
        get_FramesDrawn             : IntPtr
        get_AvgFrameRate            : IntPtr
        get_Jitter                  : IntPtr
        get_AvgSyncOffset           : IntPtr
        get_DevSyncOffset           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQualProp.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * The property page uses this method to retrieve data from the renderer.
     * @returns {Integer} Pointer to the number of frames dropped by the renderer.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_framesdroppedinrenderer
     */
    get_FramesDroppedInRenderer() {
        result := ComCall(3, this, "int*", &pcFrames := 0, "HRESULT")
        return pcFrames
    }

    /**
     * The get_FramesDrawn method retrieves the number of frames actually drawn since streaming started.
     * @returns {Integer} Pointer to the number of frames drawn since streaming started.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_framesdrawn
     */
    get_FramesDrawn() {
        result := ComCall(4, this, "int*", &pcFramesDrawn := 0, "HRESULT")
        return pcFramesDrawn
    }

    /**
     * The get_AvgFrameRate method retrieves the actual average frame rate since streaming started.
     * @remarks
     * The actual frame rate during playback might be less than the authored frame rate. For more information on actual versus authored frame rates, see the Remarks section for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure.
     * @returns {Integer} Pointer to a variable that receives the actual number of frames per second, multiplied by 100. For example, an average frame rate of 30 frames per second will be represented as 3000.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_avgframerate
     */
    get_AvgFrameRate() {
        result := ComCall(5, this, "int*", &piAvgFrameRate := 0, "HRESULT")
        return piAvgFrameRate
    }

    /**
     * The get_Jitter method gets the jitter (variation in time) between successive frames delivered to the video renderer.
     * @returns {Integer} Receives the standard deviation of the interframe time, in milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_jitter
     */
    get_Jitter() {
        result := ComCall(6, this, "int*", &iJitter := 0, "HRESULT")
        return iJitter
    }

    /**
     * The get_AvgSyncOffset method retrieves the average time difference between when the video frames should have been displayed and when they actually were.
     * @returns {Integer} Pointer to the time difference, expressed in milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_avgsyncoffset
     */
    get_AvgSyncOffset() {
        result := ComCall(7, this, "int*", &piAvg := 0, "HRESULT")
        return piAvg
    }

    /**
     * The get_DevSyncOffset method retrieves the average time difference between when the video frames should have been displayed and when they actually were.
     * @remarks
     * When playing video from networks, the presentation can often be disrupted by network glitches. For this reason, expressing the accuracy of video frames by a simple average is inappropriate. Looking at a standard deviation provides a better idea of the overall accuracy.
     * @returns {Integer} Pointer to a value denoting the accuracy of the video frames displayed.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_devsyncoffset
     */
    get_DevSyncOffset() {
        result := ComCall(8, this, "int*", &piDev := 0, "HRESULT")
        return piDev
    }

    Query(iid) {
        if (IQualProp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FramesDroppedInRenderer := CallbackCreate(GetMethod(implObj, "get_FramesDroppedInRenderer"), flags, 2)
        this.vtbl.get_FramesDrawn := CallbackCreate(GetMethod(implObj, "get_FramesDrawn"), flags, 2)
        this.vtbl.get_AvgFrameRate := CallbackCreate(GetMethod(implObj, "get_AvgFrameRate"), flags, 2)
        this.vtbl.get_Jitter := CallbackCreate(GetMethod(implObj, "get_Jitter"), flags, 2)
        this.vtbl.get_AvgSyncOffset := CallbackCreate(GetMethod(implObj, "get_AvgSyncOffset"), flags, 2)
        this.vtbl.get_DevSyncOffset := CallbackCreate(GetMethod(implObj, "get_DevSyncOffset"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FramesDroppedInRenderer)
        CallbackFree(this.vtbl.get_FramesDrawn)
        CallbackFree(this.vtbl.get_AvgFrameRate)
        CallbackFree(this.vtbl.get_Jitter)
        CallbackFree(this.vtbl.get_AvgSyncOffset)
        CallbackFree(this.vtbl.get_DevSyncOffset)
    }
}
