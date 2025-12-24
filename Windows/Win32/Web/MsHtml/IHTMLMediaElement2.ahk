#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLMediaElement2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLMediaElement2
     * @type {Guid}
     */
    static IID => Guid("{30510809-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_currentTimeDouble", "get_currentTimeDouble", "get_initialTimeDouble", "get_durationDouble", "put_defaultPlaybackRateDouble", "get_defaultPlaybackRateDouble", "put_playbackRateDouble", "get_playbackRateDouble", "put_volumeDouble", "get_volumeDouble"]

    /**
     * @type {Float} 
     */
    currentTimeDouble {
        get => this.get_currentTimeDouble()
        set => this.put_currentTimeDouble(value)
    }

    /**
     * @type {Float} 
     */
    initialTimeDouble {
        get => this.get_initialTimeDouble()
    }

    /**
     * @type {Float} 
     */
    durationDouble {
        get => this.get_durationDouble()
    }

    /**
     * @type {Float} 
     */
    defaultPlaybackRateDouble {
        get => this.get_defaultPlaybackRateDouble()
        set => this.put_defaultPlaybackRateDouble(value)
    }

    /**
     * @type {Float} 
     */
    playbackRateDouble {
        get => this.get_playbackRateDouble()
        set => this.put_playbackRateDouble(value)
    }

    /**
     * @type {Float} 
     */
    volumeDouble {
        get => this.get_volumeDouble()
        set => this.put_volumeDouble(value)
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_currentTimeDouble(v) {
        result := ComCall(7, this, "double", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_currentTimeDouble() {
        result := ComCall(8, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_initialTimeDouble() {
        result := ComCall(9, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_durationDouble() {
        result := ComCall(10, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_defaultPlaybackRateDouble(v) {
        result := ComCall(11, this, "double", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_defaultPlaybackRateDouble() {
        result := ComCall(12, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_playbackRateDouble(v) {
        result := ComCall(13, this, "double", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_playbackRateDouble() {
        result := ComCall(14, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_volumeDouble(v) {
        result := ComCall(15, this, "double", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_volumeDouble() {
        result := ComCall(16, this, "double*", &p := 0, "HRESULT")
        return p
    }
}
