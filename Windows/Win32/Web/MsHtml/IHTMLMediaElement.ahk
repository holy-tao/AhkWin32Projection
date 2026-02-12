#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLMediaError.ahk
#Include .\IHTMLTimeRanges.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLMediaElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLMediaElement
     * @type {Guid}
     */
    static IID => Guid("{30510706-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLMediaElement
     * @type {Guid}
     */
    static CLSID => Guid("{3051070c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_error", "put_src", "get_src", "get_currentSrc", "get_networkState", "put_preload", "get_preload", "get_buffered", "load", "canPlayType", "get_seeking", "put_currentTime", "get_currentTime", "get_initialTime", "get_duration", "get_paused", "put_defaultPlaybackRate", "get_defaultPlaybackRate", "put_playbackRate", "get_playbackRate", "get_played", "get_seekable", "get_ended", "put_autoplay", "get_autoplay", "put_loop", "get_loop", "play", "pause", "put_controls", "get_controls", "put_volume", "get_volume", "put_muted", "get_muted", "put_autobuffer", "get_autobuffer"]

    /**
     * @type {IHTMLMediaError} 
     */
    error {
        get => this.get_error()
    }

    /**
     * @type {BSTR} 
     */
    src {
        get => this.get_src()
        set => this.put_src(value)
    }

    /**
     * @type {BSTR} 
     */
    currentSrc {
        get => this.get_currentSrc()
    }

    /**
     * @type {Integer} 
     */
    networkState {
        get => this.get_networkState()
    }

    /**
     * @type {BSTR} 
     */
    preload {
        get => this.get_preload()
        set => this.put_preload(value)
    }

    /**
     * @type {IHTMLTimeRanges} 
     */
    buffered {
        get => this.get_buffered()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    seeking {
        get => this.get_seeking()
    }

    /**
     * @type {Float} 
     */
    currentTime {
        get => this.get_currentTime()
        set => this.put_currentTime(value)
    }

    /**
     * @type {Float} 
     */
    initialTime {
        get => this.get_initialTime()
    }

    /**
     * @type {Float} 
     */
    duration {
        get => this.get_duration()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    paused {
        get => this.get_paused()
    }

    /**
     * @type {Float} 
     */
    defaultPlaybackRate {
        get => this.get_defaultPlaybackRate()
        set => this.put_defaultPlaybackRate(value)
    }

    /**
     * @type {Float} 
     */
    playbackRate {
        get => this.get_playbackRate()
        set => this.put_playbackRate(value)
    }

    /**
     * @type {IHTMLTimeRanges} 
     */
    played {
        get => this.get_played()
    }

    /**
     * @type {IHTMLTimeRanges} 
     */
    seekable {
        get => this.get_seekable()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ended {
        get => this.get_ended()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    autoplay {
        get => this.get_autoplay()
        set => this.put_autoplay(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    loop {
        get => this.get_loop()
        set => this.put_loop(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    controls {
        get => this.get_controls()
        set => this.put_controls(value)
    }

    /**
     * @type {Float} 
     */
    volume {
        get => this.get_volume()
        set => this.put_volume(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    muted {
        get => this.get_muted()
        set => this.put_muted(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    autobuffer {
        get => this.get_autobuffer()
        set => this.put_autobuffer(value)
    }

    /**
     * 
     * @returns {IHTMLMediaError} 
     */
    get_error() {
        result := ComCall(7, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLMediaError(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(8, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_currentSrc() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_networkState() {
        result := ComCall(11, this, "ushort*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_preload(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(12, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_preload() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLTimeRanges} 
     */
    get_buffered() {
        result := ComCall(14, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLTimeRanges(p)
    }

    /**
     * The load command loads a file in a device-specific format. Digital-video and video-overlay devices recognize this command.
     * @remarks
     * The "vidboard" device sends a notification message when the loading is completed.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFilePos"></span><span id="lpszfilepos"></span><span id="LPSZFILEPOS"></span>*lpszFilePos*
     * 
     * Path and filename to load. For video-overlay devices, this can also include a target rectangle for the data. To specify a target rectangle, specify "at" followed by **X1 Y1 X2 Y2**, where **X1 Y1** specify the upper left corner of the rectangle, and **X2 Y2** specify the width and height. The rectangle is relative to the video buffer origin.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/load
     */
    load() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @returns {BSTR} 
     */
    canPlayType(type) {
        if(type is String) {
            pin := BSTR.Alloc(type)
            type := pin.Value
        }

        canPlay := BSTR()
        result := ComCall(16, this, "ptr", type, "ptr", canPlay, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return canPlay
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_seeking() {
        result := ComCall(17, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_currentTime(v) {
        result := ComCall(18, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_currentTime() {
        result := ComCall(19, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_initialTime() {
        result := ComCall(20, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_duration() {
        result := ComCall(21, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_paused() {
        result := ComCall(22, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_defaultPlaybackRate(v) {
        result := ComCall(23, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_defaultPlaybackRate() {
        result := ComCall(24, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_playbackRate(v) {
        result := ComCall(25, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_playbackRate() {
        result := ComCall(26, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLTimeRanges} 
     */
    get_played() {
        result := ComCall(27, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLTimeRanges(p)
    }

    /**
     * 
     * @returns {IHTMLTimeRanges} 
     */
    get_seekable() {
        result := ComCall(28, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLTimeRanges(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ended() {
        result := ComCall(29, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_autoplay(v) {
        result := ComCall(30, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_autoplay() {
        result := ComCall(31, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_loop(v) {
        result := ComCall(32, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_loop() {
        result := ComCall(33, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * The play command starts playing a device. CD audio, digital-video, MIDI sequencer, videodisc, VCR, and waveform-audio devices recognize this command.
     * @remarks
     * Before issuing commands that use position values, you should set the desired time format by using the [set](set.md) command. This command begins playing at the current speed, as set with the set "speed" command. The direction is reverse if the "reverse" flag is specified, or if the "to" flag is specified as a value less than the "from" flag. If the "from" flag is not specified, playback begins at the current position. The "to" and "reverse" flags cannot be used together.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszPlayFlags"></span><span id="lpszplayflags"></span><span id="LPSZPLAYFLAGS"></span>*lpszPlayFlags*
     * 
     * Flag for playing a device. The following table lists device types that recognize the **play** command and the flags used by each type.
     * 
     * 
     * 
     * | Value        | Meaning                          | Meaning                           |
     * |--------------|----------------------------------|-----------------------------------|
     * | cdaudio      | from *position*                  | to *position*                     |
     * | digitalvideo | from *position*fullscreen repeat | reverse to *position*window       |
     * | sequencer    | from *position*                  | to *position*                     |
     * | vcr          | at *time*from *position*reverse  | scan to *position*                |
     * | videodisc    | fast from *position*reverse scan | slow speed *integer*to *position* |
     * | waveaudio    | from *position*                  | to *position*                     |
     * 
     * 
     * 
     *  
     * 
     * The following table lists the flags that can be specified in the **lpszPlayFlags** parameter and their meanings.
     * 
     * 
     * 
     * | Value           | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                              |
     * |-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | at *time*       | Indicates when the device should begin performing this command, or, if the device has been cued, when the cued command begins. For more information, see the [cue](cue.md) command.                                                                                                                                                                                                                                                                 |
     * | fast            | Indicates that the device should play faster than normal. To determine the exact speed on a videodisc player, use the "speed" flag of the [status](status.md) command. To specify the speed more precisely, use the "speed" flag of this command.                                                                                                                                                                                                   |
     * | from *position* | Specifies a starting position for the playback. If the "from" flag is not specified, playback begins at the current position. For **cdaudio** devices, if the "from" position is greater than the end position of the disc, or if the "from" position is greater than the "to" position, the driver returns an error. For **videodisc** devices, the default positions are in frames for CAV discs and in hours, minutes, and seconds for CLV discs. |
     * | fullscreen      | Specifies that a full-screen display should be used. Use this flag only when playing compressed files. (Uncompressed files won't play full-screen.)                                                                                                                                                                                                                                                                                                  |
     * | repeat          | Specifies that playback should restart when the end of the content is reached.                                                                                                                                                                                                                                                                                                                                                                       |
     * | reverse         | Specifies that the play direction is backward. You cannot specify an ending location with the "reverse" flag. For videodiscs, "scan" applies only to CAV format.                                                                                                                                                                                                                                                                                     |
     * | scan            | Plays as fast as possible without disabling video (although audio might be disabled). For videodiscs, "scan" applies only to CAV format.                                                                                                                                                                                                                                                                                                             |
     * | slow            | Plays slowly. To determine the exact speed on a videodisc player, use the "speed" flag of the [status](status.md) command. To specify the speed more precisely, use the "speed" flag of this command. For videodiscs, "slow" applies only to CAV format.                                                                                                                                                                                            |
     * | speed *integer* | Plays a videodisc at the specified speed, in frames per second. This flag applies only to CAV discs.                                                                                                                                                                                                                                                                                                                                                 |
     * | to *position*   | Specifies an ending position for the playback. If the "to" flag is not specified, playback stops at the end of the content. For **cdaudio** devices, if the "to" position is greater than the end position of the disc, the driver returns an error. For **videodisc** devices, the default positions are in frames for CAV discs and in hours, minutes, and seconds for CLV discs.                                                                  |
     * | window          | Specifies that playing should use the window associated with the device instance. This is the default setting.                                                                                                                                                                                                                                                                                                                                       |
     * 
     * 
     * 
     *  
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/play
     */
    play() {
        result := ComCall(34, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The pause command pauses playing or recording.
     * @remarks
     * With the MCICDA, MCISEQ, and MCIPIONR drivers, the pause command works the same as the [stop](stop.md) command.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/pause
     */
    pause() {
        result := ComCall(35, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_controls(v) {
        result := ComCall(36, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_controls() {
        result := ComCall(37, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_volume(v) {
        result := ComCall(38, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_volume() {
        result := ComCall(39, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_muted(v) {
        result := ComCall(40, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_muted() {
        result := ComCall(41, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_autobuffer(v) {
        result := ComCall(42, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_autobuffer() {
        result := ComCall(43, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }
}
