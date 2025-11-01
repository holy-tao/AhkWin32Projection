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
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_currentTimeDouble(p) {
        pMarshal := p is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_initialTimeDouble(p) {
        pMarshal := p is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_durationDouble(p) {
        pMarshal := p is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, pMarshal, p, "HRESULT")
        return result
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
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_defaultPlaybackRateDouble(p) {
        pMarshal := p is VarRef ? "double*" : "ptr"

        result := ComCall(12, this, pMarshal, p, "HRESULT")
        return result
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
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_playbackRateDouble(p) {
        pMarshal := p is VarRef ? "double*" : "ptr"

        result := ComCall(14, this, pMarshal, p, "HRESULT")
        return result
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
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_volumeDouble(p) {
        pMarshal := p is VarRef ? "double*" : "ptr"

        result := ComCall(16, this, pMarshal, p, "HRESULT")
        return result
    }
}
