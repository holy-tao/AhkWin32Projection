#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<DXGI_FRAME_STATISTICS_MEDIA>} pStats 
     * @returns {HRESULT} 
     */
    GetFrameStatisticsMedia(pStats) {
        result := ComCall(3, this, "ptr", pStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Duration 
     * @returns {HRESULT} 
     */
    SetPresentDuration(Duration) {
        result := ComCall(4, this, "uint", Duration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DesiredPresentDuration 
     * @param {Pointer<UInt32>} pClosestSmallerPresentDuration 
     * @param {Pointer<UInt32>} pClosestLargerPresentDuration 
     * @returns {HRESULT} 
     */
    CheckPresentDurationSupport(DesiredPresentDuration, pClosestSmallerPresentDuration, pClosestLargerPresentDuration) {
        result := ComCall(5, this, "uint", DesiredPresentDuration, "uint*", pClosestSmallerPresentDuration, "uint*", pClosestLargerPresentDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
