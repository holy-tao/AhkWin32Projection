#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UNSIGNED_RATIO.ahk

/**
 * Specifies Desktop Window Manager (DWM) video frame parameters for frame composition. Used by the DwmSetPresentParameters function.
 * @remarks
 * 
  * The <b>rateSource</b> member is expressed as a ratio so that content (like that using NTSC standards, which has a rate of 60000/1001) can be accurately expressed. DWM determines how long to display each frame by resampling between the source rate and the composition rate in use each time the desktop is composed.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ns-dwmapi-dwm_present_parameters
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_PRESENT_PARAMETERS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size of the <b>DWM_PRESENT_PARAMETERS</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>TRUE</b> if the caller is requesting queued presents; otherwise, <b>FALSE</b>. If <b>TRUE</b>, the remaining parameters must be specified. If <b>FALSE</b>, queued presentation is disabled for this window and present behavior returns to the default behavior.
     * @type {Integer}
     */
    fQueue {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <b>ULONGLONG</b> value that provides the refresh number that the next presented frame should begin to display.
     * @type {Integer}
     */
    cRefreshStart {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of frames the application is instructing DWM to queue. The valid range is 2-8.
     * @type {Integer}
     */
    cBuffer {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <b>TRUE</b> if the application wants DWM to schedule presentation based on source rate. <b>FALSE</b> if the application will decide how many refreshes to display for each frame. If <b>TRUE</b>, <b>rateSource</b> must be specified. If <b>FALSE</b>, <b>cRefreshesPerFrame</b> must be specified.
     * @type {Integer}
     */
    fUseSourceRate {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The rate, in frames per second, of the source material being displayed.
     * @type {UNSIGNED_RATIO}
     */
    rateSource{
        get {
            if(!this.HasProp("__rateSource"))
                this.__rateSource := UNSIGNED_RATIO(this.ptr + 24)
            return this.__rateSource
        }
    }

    /**
     * The number of monitor refreshes through which each frame should be displayed on the screen.
     * @type {Integer}
     */
    cRefreshesPerFrame {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The frame sampling type to use for composition.
     * @type {Integer}
     */
    eSampling {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
