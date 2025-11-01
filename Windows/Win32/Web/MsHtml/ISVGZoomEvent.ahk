#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGZoomEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGZoomEvent
     * @type {Guid}
     */
    static IID => Guid("{3051054e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGZoomEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305105d9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_zoomRectScreen", "get_previousScale", "get_previousTranslate", "get_newScale", "get_newTranslate"]

    /**
     * 
     * @param {Pointer<ISVGRect>} p 
     * @returns {HRESULT} 
     */
    get_zoomRectScreen(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_previousScale(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPoint>} p 
     * @returns {HRESULT} 
     */
    get_previousTranslate(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_newScale(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(10, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPoint>} p 
     * @returns {HRESULT} 
     */
    get_newTranslate(p) {
        result := ComCall(11, this, "ptr*", p, "HRESULT")
        return result
    }
}
