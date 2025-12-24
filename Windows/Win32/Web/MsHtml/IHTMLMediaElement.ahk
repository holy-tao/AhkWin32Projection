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
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLMediaError(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_currentSrc() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_networkState() {
        result := ComCall(11, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_preload(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_preload() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLTimeRanges} 
     */
    get_buffered() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTimeRanges(p)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    load() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @returns {BSTR} 
     */
    canPlayType(type) {
        type := type is String ? BSTR.Alloc(type).Value : type

        canPlay := BSTR()
        result := ComCall(16, this, "ptr", type, "ptr", canPlay, "HRESULT")
        return canPlay
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_seeking() {
        result := ComCall(17, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_currentTime(v) {
        result := ComCall(18, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_currentTime() {
        result := ComCall(19, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_initialTime() {
        result := ComCall(20, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_duration() {
        result := ComCall(21, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_paused() {
        result := ComCall(22, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_defaultPlaybackRate(v) {
        result := ComCall(23, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_defaultPlaybackRate() {
        result := ComCall(24, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_playbackRate(v) {
        result := ComCall(25, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_playbackRate() {
        result := ComCall(26, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLTimeRanges} 
     */
    get_played() {
        result := ComCall(27, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTimeRanges(p)
    }

    /**
     * 
     * @returns {IHTMLTimeRanges} 
     */
    get_seekable() {
        result := ComCall(28, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTimeRanges(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ended() {
        result := ComCall(29, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_autoplay(v) {
        result := ComCall(30, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_autoplay() {
        result := ComCall(31, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_loop(v) {
        result := ComCall(32, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_loop() {
        result := ComCall(33, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    play() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pause() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_controls(v) {
        result := ComCall(36, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_controls() {
        result := ComCall(37, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_volume(v) {
        result := ComCall(38, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_volume() {
        result := ComCall(39, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_muted(v) {
        result := ComCall(40, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_muted() {
        result := ComCall(41, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_autobuffer(v) {
        result := ComCall(42, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_autobuffer() {
        result := ComCall(43, this, "short*", &p := 0, "HRESULT")
        return p
    }
}
