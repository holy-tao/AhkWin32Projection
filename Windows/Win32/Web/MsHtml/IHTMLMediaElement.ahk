#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IHTMLMediaError>} p 
     * @returns {HRESULT} 
     */
    get_error(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_src(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_currentSrc(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_networkState(p) {
        pMarshal := p is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, pMarshal, p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_preload(p) {
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTimeRanges>} p 
     * @returns {HRESULT} 
     */
    get_buffered(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} canPlay 
     * @returns {HRESULT} 
     */
    canPlayType(type, canPlay) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(16, this, "ptr", type, "ptr", canPlay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_seeking(p) {
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_currentTime(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(19, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_initialTime(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(20, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_duration(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(21, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_paused(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_defaultPlaybackRate(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(24, this, pMarshal, p, "HRESULT")
        return result
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
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_playbackRate(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(26, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTimeRanges>} p 
     * @returns {HRESULT} 
     */
    get_played(p) {
        result := ComCall(27, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTimeRanges>} p 
     * @returns {HRESULT} 
     */
    get_seekable(p) {
        result := ComCall(28, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_ended(p) {
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_autoplay(p) {
        result := ComCall(31, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_loop(p) {
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_controls(p) {
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_volume(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(39, this, pMarshal, p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_muted(p) {
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_autobuffer(p) {
        result := ComCall(43, this, "ptr", p, "HRESULT")
        return result
    }
}
