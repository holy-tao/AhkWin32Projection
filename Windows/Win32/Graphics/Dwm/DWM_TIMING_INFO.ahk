#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UNSIGNED_RATIO.ahk

/**
 * Specifies Desktop Window Manager (DWM) composition timing information. Used by the DwmGetCompositionTimingInfo function.
 * @remarks
 * Both DWM_FRAME_COUNT and QPC_TIME are defined in Dwmapi.h as <b>ULONGLONG</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_timing_info
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_TIMING_INFO extends Win32Struct
{
    static sizeof => 292

    static packingSize => 1

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
                this.__rateRefresh := UNSIGNED_RATIO(this.ptr + 4)
            return this.__rateRefresh
        }
    }

    /**
     * The monitor refresh period.
     * @type {Integer}
     */
    qpcRefreshPeriod {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The composition rate.
     * @type {UNSIGNED_RATIO}
     */
    rateCompose{
        get {
            if(!this.HasProp("__rateCompose"))
                this.__rateCompose := UNSIGNED_RATIO(this.ptr + 20)
            return this.__rateCompose
        }
    }

    /**
     * The query performance counter value before the vertical blank.
     * @type {Integer}
     */
    qpcVBlank {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The DWM refresh counter.
     * @type {Integer}
     */
    cRefresh {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The DirectX refresh counter.
     * @type {Integer}
     */
    cDXRefresh {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The query performance counter value for a frame composition.
     * @type {Integer}
     */
    qpcCompose {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The frame number that was composed at <b>qpcCompose</b>.
     * @type {Integer}
     */
    cFrame {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The DirectX present number used to identify rendering frames.
     * @type {Integer}
     */
    cDXPresent {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The refresh count of the frame that was composed at <b>qpcCompose</b>.
     * @type {Integer}
     */
    cRefreshFrame {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The DWM frame number that was last submitted.
     * @type {Integer}
     */
    cFrameSubmitted {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The DirectX present number that was last submitted.
     * @type {Integer}
     */
    cDXPresentSubmitted {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * The DWM frame number that was last confirmed as presented.
     * @type {Integer}
     */
    cFrameConfirmed {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The DirectX present number that was last confirmed as presented.
     * @type {Integer}
     */
    cDXPresentConfirmed {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The target refresh count of the last frame confirmed as completed by the GPU.
     * @type {Integer}
     */
    cRefreshConfirmed {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * The DirectX refresh count when the frame was confirmed as presented.
     * @type {Integer}
     */
    cDXRefreshConfirmed {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * The number of frames the DWM presented late.
     * @type {Integer}
     */
    cFramesLate {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The number of composition frames that have been issued but have not been confirmed as completed.
     * @type {Integer}
     */
    cFramesOutstanding {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The last frame displayed.
     * @type {Integer}
     */
    cFrameDisplayed {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * The QPC time of the composition pass when the frame was displayed.
     * @type {Integer}
     */
    qpcFrameDisplayed {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * The vertical refresh count when the frame should have become visible.
     * @type {Integer}
     */
    cRefreshFrameDisplayed {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * The ID of the last frame marked as completed.
     * @type {Integer}
     */
    cFrameComplete {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * The QPC time when the last frame was marked as completed.
     * @type {Integer}
     */
    qpcFrameComplete {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * The ID of the last frame marked as pending.
     * @type {Integer}
     */
    cFramePending {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * The QPC time when the last frame was marked as pending.
     * @type {Integer}
     */
    qpcFramePending {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * The number of unique frames displayed. This value is valid only after a second call to the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo">DwmGetCompositionTimingInfo</a> function.
     * @type {Integer}
     */
    cFramesDisplayed {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * The number of new completed frames that have been received.
     * @type {Integer}
     */
    cFramesComplete {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * The number of new frames submitted to DirectX but not yet completed.
     * @type {Integer}
     */
    cFramesPending {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * The number of frames available but not displayed, used, or dropped. This value is valid only after a second call to <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo">DwmGetCompositionTimingInfo</a>.
     * @type {Integer}
     */
    cFramesAvailable {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * The number of rendered frames that were never displayed because composition occurred too late. This value is valid only after a second call to <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo">DwmGetCompositionTimingInfo</a>.
     * @type {Integer}
     */
    cFramesDropped {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * The number of times an old frame was composed when a new frame should have been used but was not available.
     * @type {Integer}
     */
    cFramesMissed {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * The frame count at which the next frame is scheduled to be displayed.
     * @type {Integer}
     */
    cRefreshNextDisplayed {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * The frame count at which the next DirectX present is scheduled to be displayed.
     * @type {Integer}
     */
    cRefreshNextPresented {
        get => NumGet(this, 236, "uint")
        set => NumPut("uint", value, this, 236)
    }

    /**
     * The total number of refreshes that have been displayed for the application since the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetpresentparameters">DwmSetPresentParameters</a> function was last called.
     * @type {Integer}
     */
    cRefreshesDisplayed {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * The total number of refreshes that have been presented by the application since <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetpresentparameters">DwmSetPresentParameters</a> was last called.
     * @type {Integer}
     */
    cRefreshesPresented {
        get => NumGet(this, 252, "uint")
        set => NumPut("uint", value, this, 252)
    }

    /**
     * The refresh number when content for this window started to be displayed.
     * @type {Integer}
     */
    cRefreshStarted {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * The total number of pixels DirectX redirected to the DWM.
     * @type {Integer}
     */
    cPixelsReceived {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * The number of pixels drawn.
     * @type {Integer}
     */
    cPixelsDrawn {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * The number of empty buffers in the flip chain.
     * @type {Integer}
     */
    cBuffersEmpty {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 292
    }
}
