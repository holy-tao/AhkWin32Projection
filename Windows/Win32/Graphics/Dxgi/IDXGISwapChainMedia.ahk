#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_FRAME_STATISTICS_MEDIA.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This swap chain interface allows desktop media applications to request a seamless change to a specific refresh rate.
 * @remarks
 * 
 * Seamless changes to custom framerates can only be done on integrated panels. Custom frame rates cannot be applied to external displays. If the DXGI output adapter is attached to an external display then <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-idxgiswapchainmedia-checkpresentdurationsupport">CheckPresentDurationSupport</a> will return (0, 0) for upper and lower bounds, indicating that the device does not support seamless refresh rate changes.
 *         
 * 
 * Custom refresh rates can be used when displaying video with a dynamic framerate. However, the refresh rate change should be kept imperceptible to the user. A best practice for keeping the refresh rate transition imperceptible  is to only set the custom framerate if the app determines it can present at that rate for least 5 seconds.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nn-dxgi1_3-idxgiswapchainmedia
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISwapChainMedia extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISwapChainMedia
     * @type {Guid}
     */
    static IID => Guid("{dd95b90b-f05f-4f6a-bd65-25bfb264bd84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrameStatisticsMedia", "SetPresentDuration", "CheckPresentDurationSupport"]

    /**
     * Queries the system for a DXGI_FRAME_STATISTICS_MEDIA structure that indicates whether a custom refresh rate is currently approved by the system.
     * @returns {DXGI_FRAME_STATISTICS_MEDIA} A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ns-dxgi1_3-dxgi_frame_statistics_media">DXGI_FRAME_STATISTICS_MEDIA</a> structure indicating whether the system currently approves the custom refresh rate request.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchainmedia-getframestatisticsmedia
     */
    GetFrameStatisticsMedia() {
        pStats := DXGI_FRAME_STATISTICS_MEDIA()
        result := ComCall(3, this, "ptr", pStats, "HRESULT")
        return pStats
    }

    /**
     * Requests a custom presentation duration (custom refresh rate).
     * @param {Integer} Duration The custom presentation duration, specified in hundreds of nanoseconds.
     * @returns {HRESULT} This method returns S_OK on success, or a DXGI error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchainmedia-setpresentduration
     */
    SetPresentDuration(Duration) {
        result := ComCall(4, this, "uint", Duration, "HRESULT")
        return result
    }

    /**
     * Queries the graphics driver for a supported frame present duration corresponding to a custom refresh rate.
     * @param {Integer} DesiredPresentDuration Indicates the frame duration to check. This value is the duration of one frame at the desired refresh rate, specified in hundreds of nanoseconds. For example, set this field to 167777 to check for 60 Hz refresh rate support.
     * @param {Pointer<Integer>} pClosestSmallerPresentDuration A variable that will be set to the closest supported frame present duration that's smaller than the requested value, or zero if the device does not support any lower duration.
     * @param {Pointer<Integer>} pClosestLargerPresentDuration A variable that will be set to the closest supported frame present duration that's larger than the requested value, or zero if the device does not support any higher duration.
     * @returns {HRESULT} This method returns S_OK on success, or a DXGI error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchainmedia-checkpresentdurationsupport
     */
    CheckPresentDurationSupport(DesiredPresentDuration, pClosestSmallerPresentDuration, pClosestLargerPresentDuration) {
        pClosestSmallerPresentDurationMarshal := pClosestSmallerPresentDuration is VarRef ? "uint*" : "ptr"
        pClosestLargerPresentDurationMarshal := pClosestLargerPresentDuration is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", DesiredPresentDuration, pClosestSmallerPresentDurationMarshal, pClosestSmallerPresentDuration, pClosestLargerPresentDurationMarshal, pClosestLargerPresentDuration, "HRESULT")
        return result
    }
}
