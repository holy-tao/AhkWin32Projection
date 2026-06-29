#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UNSIGNED_RATIO.ahk" { UNSIGNED_RATIO }

/**
 * Specifies Desktop Window Manager (DWM) composition timing information. Used by the DwmGetCompositionTimingInfo function.
 * @remarks
 * Both DWM_FRAME_COUNT and QPC_TIME are defined in Dwmapi.h as <b>ULONGLONG</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_timing_info
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWM_TIMING_INFO {
    #StructPack 8

    /**
     * The size of this <b>DWM_TIMING_INFO</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The monitor refresh rate.
     */
    rateRefresh : UNSIGNED_RATIO

    /**
     * The monitor refresh period.
     */
    qpcRefreshPeriod : Int64

    /**
     * The composition rate.
     */
    rateCompose : UNSIGNED_RATIO

    /**
     * The query performance counter value before the vertical blank.
     */
    qpcVBlank : Int64

    /**
     * The DWM refresh counter.
     */
    cRefresh : Int64

    /**
     * The DirectX refresh counter.
     */
    cDXRefresh : UInt32

    /**
     * The query performance counter value for a frame composition.
     */
    qpcCompose : Int64

    /**
     * The frame number that was composed at <b>qpcCompose</b>.
     */
    cFrame : Int64

    /**
     * The DirectX present number used to identify rendering frames.
     */
    cDXPresent : UInt32

    /**
     * The refresh count of the frame that was composed at <b>qpcCompose</b>.
     */
    cRefreshFrame : Int64

    /**
     * The DWM frame number that was last submitted.
     */
    cFrameSubmitted : Int64

    /**
     * The DirectX present number that was last submitted.
     */
    cDXPresentSubmitted : UInt32

    /**
     * The DWM frame number that was last confirmed as presented.
     */
    cFrameConfirmed : Int64

    /**
     * The DirectX present number that was last confirmed as presented.
     */
    cDXPresentConfirmed : UInt32

    /**
     * The target refresh count of the last frame confirmed as completed by the GPU.
     */
    cRefreshConfirmed : Int64

    /**
     * The DirectX refresh count when the frame was confirmed as presented.
     */
    cDXRefreshConfirmed : UInt32

    /**
     * The number of frames the DWM presented late.
     */
    cFramesLate : Int64

    /**
     * The number of composition frames that have been issued but have not been confirmed as completed.
     */
    cFramesOutstanding : UInt32

    /**
     * The last frame displayed.
     */
    cFrameDisplayed : Int64

    /**
     * The QPC time of the composition pass when the frame was displayed.
     */
    qpcFrameDisplayed : Int64

    /**
     * The vertical refresh count when the frame should have become visible.
     */
    cRefreshFrameDisplayed : Int64

    /**
     * The ID of the last frame marked as completed.
     */
    cFrameComplete : Int64

    /**
     * The QPC time when the last frame was marked as completed.
     */
    qpcFrameComplete : Int64

    /**
     * The ID of the last frame marked as pending.
     */
    cFramePending : Int64

    /**
     * The QPC time when the last frame was marked as pending.
     */
    qpcFramePending : Int64

    /**
     * The number of unique frames displayed. This value is valid only after a second call to the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo">DwmGetCompositionTimingInfo</a> function.
     */
    cFramesDisplayed : Int64

    /**
     * The number of new completed frames that have been received.
     */
    cFramesComplete : Int64

    /**
     * The number of new frames submitted to DirectX but not yet completed.
     */
    cFramesPending : Int64

    /**
     * The number of frames available but not displayed, used, or dropped. This value is valid only after a second call to <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo">DwmGetCompositionTimingInfo</a>.
     */
    cFramesAvailable : Int64

    /**
     * The number of rendered frames that were never displayed because composition occurred too late. This value is valid only after a second call to <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo">DwmGetCompositionTimingInfo</a>.
     */
    cFramesDropped : Int64

    /**
     * The number of times an old frame was composed when a new frame should have been used but was not available.
     */
    cFramesMissed : Int64

    /**
     * The frame count at which the next frame is scheduled to be displayed.
     */
    cRefreshNextDisplayed : Int64

    /**
     * The frame count at which the next DirectX present is scheduled to be displayed.
     */
    cRefreshNextPresented : Int64

    /**
     * The total number of refreshes that have been displayed for the application since the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetpresentparameters">DwmSetPresentParameters</a> function was last called.
     */
    cRefreshesDisplayed : Int64

    /**
     * The total number of refreshes that have been presented by the application since <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetpresentparameters">DwmSetPresentParameters</a> was last called.
     */
    cRefreshesPresented : Int64

    /**
     * The refresh number when content for this window started to be displayed.
     */
    cRefreshStarted : Int64

    /**
     * The total number of pixels DirectX redirected to the DWM.
     */
    cPixelsReceived : Int64

    /**
     * The number of pixels drawn.
     */
    cPixelsDrawn : Int64

    /**
     * The number of empty buffers in the flip chain.
     */
    cBuffersEmpty : Int64

}
