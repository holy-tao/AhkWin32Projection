#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLScreen extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLScreen
     * @type {Guid}
     */
    static IID => Guid("{3050f35c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLScreen
     * @type {Guid}
     */
    static CLSID => Guid("{3050f35d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_colorDepth", "put_bufferDepth", "get_bufferDepth", "get_width", "get_height", "put_updateInterval", "get_updateInterval", "get_availHeight", "get_availWidth", "get_fontSmoothingEnabled"]

    /**
     * 
     * @returns {Integer} 
     */
    get_colorDepth() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_bufferDepth(v) {
        result := ComCall(8, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_bufferDepth() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_updateInterval(v) {
        result := ComCall(12, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_updateInterval() {
        result := ComCall(13, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_availHeight() {
        result := ComCall(14, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_availWidth() {
        result := ComCall(15, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_fontSmoothingEnabled() {
        result := ComCall(16, this, "short*", &p := 0, "HRESULT")
        return p
    }
}
