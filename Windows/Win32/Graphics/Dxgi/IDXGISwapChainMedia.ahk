#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXGI_FRAME_STATISTICS_MEDIA.ahk" { DXGI_FRAME_STATISTICS_MEDIA }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This swap chain interface allows desktop media applications to request a seamless change to a specific refresh rate.
 * @remarks
 * Seamless changes to custom framerates can only be done on integrated panels. Custom frame rates cannot be applied to external displays. If the DXGI output adapter is attached to an external display then <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-idxgiswapchainmedia-checkpresentdurationsupport">CheckPresentDurationSupport</a> will return (0, 0) for upper and lower bounds, indicating that the device does not support seamless refresh rate changes.
 *         
 * 
 * Custom refresh rates can be used when displaying video with a dynamic framerate. However, the refresh rate change should be kept imperceptible to the user. A best practice for keeping the refresh rate transition imperceptible  is to only set the custom framerate if the app determines it can present at that rate for least 5 seconds.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgiswapchainmedia
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGISwapChainMedia extends IUnknown {
    /**
     * The interface identifier for IDXGISwapChainMedia
     * @type {Guid}
     */
    static IID := Guid("{dd95b90b-f05f-4f6a-bd65-25bfb264bd84}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGISwapChainMedia interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFrameStatisticsMedia     : IntPtr
        SetPresentDuration          : IntPtr
        CheckPresentDurationSupport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGISwapChainMedia.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries the system for a DXGI_FRAME_STATISTICS_MEDIA structure that indicates whether a custom refresh rate is currently approved by the system.
     * @returns {DXGI_FRAME_STATISTICS_MEDIA} A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ns-dxgi1_3-dxgi_frame_statistics_media">DXGI_FRAME_STATISTICS_MEDIA</a> structure indicating whether the system currently approves the custom refresh rate request.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchainmedia-getframestatisticsmedia
     */
    GetFrameStatisticsMedia() {
        pStats := DXGI_FRAME_STATISTICS_MEDIA()
        result := ComCall(3, this, DXGI_FRAME_STATISTICS_MEDIA.Ptr, pStats, "HRESULT")
        return pStats
    }

    /**
     * Requests a custom presentation duration (custom refresh rate).
     * @param {Integer} Duration The custom presentation duration, specified in hundreds of nanoseconds.
     * @returns {HRESULT} This method returns S_OK on success, or a DXGI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchainmedia-setpresentduration
     */
    SetPresentDuration(Duration) {
        result := ComCall(4, this, "uint", Duration, "HRESULT")
        return result
    }

    /**
     * Queries the graphics driver for a supported frame present duration corresponding to a custom refresh rate.
     * @remarks
     * If the DXGI output adapter does not support custom refresh rates (for example, an external display) then the display driver will set upper and lower bounds to (0, 0).
     * @param {Integer} DesiredPresentDuration Indicates the frame duration to check. This value is the duration of one frame at the desired refresh rate, specified in hundreds of nanoseconds. For example, set this field to 167777 to check for 60 Hz refresh rate support.
     * @param {Pointer<Integer>} pClosestSmallerPresentDuration A variable that will be set to the closest supported frame present duration that's smaller than the requested value, or zero if the device does not support any lower duration.
     * @param {Pointer<Integer>} pClosestLargerPresentDuration A variable that will be set to the closest supported frame present duration that's larger than the requested value, or zero if the device does not support any higher duration.
     * @returns {HRESULT} This method returns S_OK on success, or a DXGI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchainmedia-checkpresentdurationsupport
     */
    CheckPresentDurationSupport(DesiredPresentDuration, pClosestSmallerPresentDuration, pClosestLargerPresentDuration) {
        pClosestSmallerPresentDurationMarshal := pClosestSmallerPresentDuration is VarRef ? "uint*" : "ptr"
        pClosestLargerPresentDurationMarshal := pClosestLargerPresentDuration is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", DesiredPresentDuration, pClosestSmallerPresentDurationMarshal, pClosestSmallerPresentDuration, pClosestLargerPresentDurationMarshal, pClosestLargerPresentDuration, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDXGISwapChainMedia.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFrameStatisticsMedia := CallbackCreate(GetMethod(implObj, "GetFrameStatisticsMedia"), flags, 2)
        this.vtbl.SetPresentDuration := CallbackCreate(GetMethod(implObj, "SetPresentDuration"), flags, 2)
        this.vtbl.CheckPresentDurationSupport := CallbackCreate(GetMethod(implObj, "CheckPresentDurationSupport"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFrameStatisticsMedia)
        CallbackFree(this.vtbl.SetPresentDuration)
        CallbackFree(this.vtbl.CheckPresentDurationSupport)
    }
}
