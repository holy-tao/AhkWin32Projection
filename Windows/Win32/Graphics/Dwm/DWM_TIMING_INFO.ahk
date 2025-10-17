#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UNSIGNED_RATIO.ahk

/**
 * Specifies Desktop Window Manager (DWM) composition timing information. Used by the DwmGetCompositionTimingInfo function.
 * @remarks
 * 
  * Both DWM_FRAME_COUNT and QPC_TIME are defined in Dwmapi.h as <b>ULONGLONG</b>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ns-dwmapi-dwm_timing_info
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_TIMING_INFO extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * The size of this <b>DWM_TIMING_INFO</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The monitor refresh rate.
     * @type {UNSIGNED_RATIO}
     */
    rateRefresh{
        get {
            if(!this.HasProp("__rateRefresh"))
                this.__rateRefresh := UNSIGNED_RATIO(8, this)
            return this.__rateRefresh
        }
    }

    /**
     * The monitor refresh period.
     * @type {Integer}
     */
    qpcRefreshPeriod {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The composition rate.
     * @type {UNSIGNED_RATIO}
     */
    rateCompose{
        get {
            if(!this.HasProp("__rateCompose"))
                this.__rateCompose := UNSIGNED_RATIO(24, this)
            return this.__rateCompose
        }
    }

    /**
     * The query performance counter value before the vertical blank.
     * @type {Integer}
     */
    qpcVBlank {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The DWM refresh counter.
     * @type {Integer}
     */
    cRefresh {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The DirectX refresh counter.
     * @type {Integer}
     */
    cDXRefresh {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The query performance counter value for a frame composition.
     * @type {Integer}
     */
    qpcCompose {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The frame number that was composed at <b>qpcCompose</b>.
     * @type {Integer}
     */
    cFrame {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The DirectX present number used to identify rendering frames.
     * @type {Integer}
     */
    cDXPresent {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The refresh count of the frame that was composed at <b>qpcCompose</b>.
     * @type {Integer}
     */
    cRefreshFrame {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The DWM frame number that was last submitted.
     * @type {Integer}
     */
    cFrameSubmitted {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The DirectX present number that was last submitted.
     * @type {Integer}
     */
    cDXPresentSubmitted {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The DWM frame number that was last confirmed as presented.
     * @type {Integer}
     */
    cFrameConfirmed {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The DirectX present number that was last confirmed as presented.
     * @type {Integer}
     */
    cDXPresentConfirmed {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The target refresh count of the last frame confirmed as completed by the GPU.
     * @type {Integer}
     */
    cRefreshConfirmed {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The DirectX refresh count when the frame was confirmed as presented.
     * @type {Integer}
     */
    cDXRefreshConfirmed {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The number of frames the DWM presented late.
     * @type {Integer}
     */
    cFramesLate {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * The number of composition frames that have been issued but have not been confirmed as completed.
     * @type {Integer}
     */
    cFramesOutstanding {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * The last frame displayed.
     * @type {Integer}
     */
    cFrameDisplayed {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * The QPC time of the composition pass when the frame was displayed.
     * @type {Integer}
     */
    qpcFrameDisplayed {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * The vertical refresh count when the frame should have become visible.
     * @type {Integer}
     */
    cRefreshFrameDisplayed {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * The ID of the last frame marked as completed.
     * @type {Integer}
     */
    cFrameComplete {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * The QPC time when the last frame was marked as completed.
     * @type {Integer}
     */
    qpcFrameComplete {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * The ID of the last frame marked as pending.
     * @type {Integer}
     */
    cFramePending {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * The QPC time when the last frame was marked as pending.
     * @type {Integer}
     */
    qpcFramePending {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * The number of unique frames displayed. This value is valid only after a second call to the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo">DwmGetCompositionTimingInfo</a> function.
     * @type {Integer}
     */
    cFramesDisplayed {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * The number of new completed frames that have been received.
     * @type {Integer}
     */
    cFramesComplete {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * The number of new frames submitted to DirectX but not yet completed.
     * @type {Integer}
     */
    cFramesPending {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * The number of frames available but not displayed, used, or dropped. This value is valid only after a second call to <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo">DwmGetCompositionTimingInfo</a>.
     * @type {Integer}
     */
    cFramesAvailable {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * The number of rendered frames that were never displayed because composition occurred too late. This value is valid only after a second call to <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo">DwmGetCompositionTimingInfo</a>.
     * @type {Integer}
     */
    cFramesDropped {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * The number of times an old frame was composed when a new frame should have been used but was not available.
     * @type {Integer}
     */
    cFramesMissed {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * The frame count at which the next frame is scheduled to be displayed.
     * @type {Integer}
     */
    cRefreshNextDisplayed {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * The frame count at which the next DirectX present is scheduled to be displayed.
     * @type {Integer}
     */
    cRefreshNextPresented {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * The total number of refreshes that have been displayed for the application since the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetpresentparameters">DwmSetPresentParameters</a> function was last called.
     * @type {Integer}
     */
    cRefreshesDisplayed {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * The total number of refreshes that have been presented by the application since <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetpresentparameters">DwmSetPresentParameters</a> was last called.
     * @type {Integer}
     */
    cRefreshesPresented {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * The refresh number when content for this window started to be displayed.
     * @type {Integer}
     */
    cRefreshStarted {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * The total number of pixels DirectX redirected to the DWM.
     * @type {Integer}
     */
    cPixelsReceived {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * The number of pixels drawn.
     * @type {Integer}
     */
    cPixelsDrawn {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * The number of empty buffers in the flip chain.
     * @type {Integer}
     */
    cBuffersEmpty {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 320
    }
}
