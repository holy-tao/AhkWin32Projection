#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The CAPTUREPARMS structure contains parameters that control the streaming video capture process. This structure is used to get and set parameters that affect the capture rate, the number of buffers to use while capturing, and how capture is terminated.
 * @remarks
 * 
  * The WM_CAP_GET_SEQUENCE_SETUP message or <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-capcapturegetsetup">capCaptureGetSetup</a> macro is used to retrieve the current capture parameters. The WM_CAP_SET_SEQUENCE_SETUP message or <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-capcapturesetsetup">capCaptureSetSetup</a> macro is used to set the capture parameters.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/Multimedia/wm-cap-get-sequence-setup">WM_CAP_GET_SEQUENCE_SETUP</a> message or <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-capcapturegetsetup">capCaptureGetSetup</a> macro is used to retrieve the current capture parameters. The <a href="https://docs.microsoft.com/windows/desktop/Multimedia/wm-cap-set-sequence-setup">WM_CAP_SET_SEQUENCE_SETUP</a> message or <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-capcapturesetsetup">capCaptureSetSetup</a> macro is used to set the capture parameters.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-captureparms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class CAPTUREPARMS extends Win32Struct
{
    static sizeof => 96

    static packingSize => 4

    /**
     * Requested frame rate, in microseconds. The default value is 66667, which corresponds to 15 frames per second.
     * @type {Integer}
     */
    dwRequestMicroSecPerFrame {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * User-initiated capture flag. If this member is <b>TRUE</b>, AVICap displays a dialog box prompting the user to initiate capture. The default value is <b>FALSE</b>.
     * @type {BOOL}
     */
    fMakeUserHitOKToCapture{
        get {
            if(!this.HasProp("__fMakeUserHitOKToCapture"))
                this.__fMakeUserHitOKToCapture := BOOL(this.ptr + 4)
            return this.__fMakeUserHitOKToCapture
        }
    }

    /**
     * Maximum allowable percentage of dropped frames during capture. Values range from 0 to 100. The default value is 10.
     * @type {Integer}
     */
    wPercentDropForError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Yield flag. If this member is <b>TRUE</b>, the capture window spawns a separate background thread to perform step and streaming capture. The default value is <b>FALSE</b>.
     * 
     * Applications that set this flag must handle potential reentry issues because the controls in the application are not disabled while capture is in progress.
     * @type {BOOL}
     */
    fYield{
        get {
            if(!this.HasProp("__fYield"))
                this.__fYield := BOOL(this.ptr + 12)
            return this.__fYield
        }
    }

    /**
     * Maximum number of index entries in an AVI file. Values range from 1800 to 324,000. If set to 0, a default value of 34,952 (32K frames plus a proportional number of audio buffers) is used.
     * 
     * Each video frame or buffer of waveform-audio data uses one index entry. The value of this entry establishes a limit for the number of frames or audio buffers that can be captured.
     * @type {Integer}
     */
    dwIndexSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Logical block size, in bytes, of an AVI file. The value 0 indicates the current sector size is used as the granularity.
     * @type {Integer}
     */
    wChunkGranularity {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Not used in Win32 applications.
     * @type {BOOL}
     */
    fUsingDOSMemory{
        get {
            if(!this.HasProp("__fUsingDOSMemory"))
                this.__fUsingDOSMemory := BOOL(this.ptr + 24)
            return this.__fUsingDOSMemory
        }
    }

    /**
     * Maximum number of video buffers to allocate. The memory area to place the buffers is specified with <b>fUsingDOSMemory</b>. The actual number of buffers allocated might be lower if memory is unavailable.
     * @type {Integer}
     */
    wNumVideoRequested {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Capture audio flag. If this member is <b>TRUE</b>, audio is captured during streaming capture. This is the default value if audio hardware is installed.
     * @type {BOOL}
     */
    fCaptureAudio{
        get {
            if(!this.HasProp("__fCaptureAudio"))
                this.__fCaptureAudio := BOOL(this.ptr + 32)
            return this.__fCaptureAudio
        }
    }

    /**
     * Maximum number of audio buffers to allocate. The maximum number of buffers is 10.
     * @type {Integer}
     */
    wNumAudioRequested {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Virtual keycode used to terminate streaming capture. The default value is VK_ESCAPE. You must call the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-registerhotkey">RegisterHotKey</a> function before specifying a keystroke that can abort a capture session.
     * 
     * You can combine keycodes that include CTRL and SHIFT keystrokes by using the logical OR operator with the keycodes for CTRL (0x8000) and SHIFT (0x4000).
     * @type {Integer}
     */
    vKeyAbort {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Abort flag for left mouse button. If this member is <b>TRUE</b>, streaming capture stops if the left mouse button is pressed. The default value is <b>TRUE</b>.
     * @type {BOOL}
     */
    fAbortLeftMouse{
        get {
            if(!this.HasProp("__fAbortLeftMouse"))
                this.__fAbortLeftMouse := BOOL(this.ptr + 44)
            return this.__fAbortLeftMouse
        }
    }

    /**
     * Abort flag for right mouse button. If this member is <b>TRUE</b>, streaming capture stops if the right mouse button is pressed. The default value is <b>TRUE</b>.
     * @type {BOOL}
     */
    fAbortRightMouse{
        get {
            if(!this.HasProp("__fAbortRightMouse"))
                this.__fAbortRightMouse := BOOL(this.ptr + 48)
            return this.__fAbortRightMouse
        }
    }

    /**
     * Time limit enabled flag. If this member is <b>TRUE</b>, streaming capture stops after the number of seconds in <b>wTimeLimit</b> has elapsed. The default value is <b>FALSE</b>.
     * @type {BOOL}
     */
    fLimitEnabled{
        get {
            if(!this.HasProp("__fLimitEnabled"))
                this.__fLimitEnabled := BOOL(this.ptr + 52)
            return this.__fLimitEnabled
        }
    }

    /**
     * Time limit for capture, in seconds. This parameter is used only if <b>fLimitEnabled</b> is <b>TRUE</b>.
     * @type {Integer}
     */
    wTimeLimit {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * MCI device capture flag. If this member is <b>TRUE</b>, AVICap controls an MCI-compatible video source during streaming capture. MCI-compatible video sources include VCRs and laserdiscs.
     * @type {BOOL}
     */
    fMCIControl{
        get {
            if(!this.HasProp("__fMCIControl"))
                this.__fMCIControl := BOOL(this.ptr + 60)
            return this.__fMCIControl
        }
    }

    /**
     * MCI device step capture flag. If this member is <b>TRUE</b>, step capture using an MCI device as a video source is enabled. If it is <b>FALSE</b>, real-time capture using an MCI device is enabled. (If <b>fMCIControl</b> is <b>FALSE</b>, this member is ignored.)
     * @type {BOOL}
     */
    fStepMCIDevice{
        get {
            if(!this.HasProp("__fStepMCIDevice"))
                this.__fStepMCIDevice := BOOL(this.ptr + 64)
            return this.__fStepMCIDevice
        }
    }

    /**
     * Starting position, in milliseconds, of the MCI device for the capture sequence. (If <b>fMCIControl</b> is <b>FALSE</b>, this member is ignored.)
     * @type {Integer}
     */
    dwMCIStartTime {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Stopping position, in milliseconds, of the MCI device for the capture sequence. When this position in the content is reached, capture ends and the MCI device stops. (If <b>fMCIControl</b> is <b>FALSE</b>, this member is ignored.)
     * @type {Integer}
     */
    dwMCIStopTime {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Double-resolution step capture flag. If this member is <b>TRUE</b>, the capture hardware captures at twice the specified resolution. (The resolution for the height and width is doubled.)
     * 
     * Enable this option if the hardware does not support hardware-based decimation and you are capturing in the RGB format.
     * @type {BOOL}
     */
    fStepCaptureAt2x{
        get {
            if(!this.HasProp("__fStepCaptureAt2x"))
                this.__fStepCaptureAt2x := BOOL(this.ptr + 76)
            return this.__fStepCaptureAt2x
        }
    }

    /**
     * Number of times a frame is sampled when creating a frame based on the average sample. A typical value for the number of averages is 5.
     * @type {Integer}
     */
    wStepCaptureAverageFrames {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Audio buffer size. If the default value of zero is used, the size of each buffer will be the maximum of 0.5 seconds of audio or 10K bytes.
     * @type {Integer}
     */
    dwAudioBufferSize {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Not used in Win32 applications.
     * @type {BOOL}
     */
    fDisableWriteCache{
        get {
            if(!this.HasProp("__fDisableWriteCache"))
                this.__fDisableWriteCache := BOOL(this.ptr + 88)
            return this.__fDisableWriteCache
        }
    }

    /**
     * Indicates whether the audio stream controls the clock when writing an AVI file. If this member is set to AVSTREAMMASTER_AUDIO, the audio stream is considered the master stream and the video stream duration is forced to match the audio duration. If this member is set to AVSTREAMMASTER_NONE, the durations of audio and video streams can differ.
     * @type {Integer}
     */
    AVStreamMaster {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}
