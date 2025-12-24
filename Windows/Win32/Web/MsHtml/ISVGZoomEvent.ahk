#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGRect.ahk
#Include .\ISVGPoint.ahk
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
     * @type {ISVGRect} 
     */
    zoomRectScreen {
        get => this.get_zoomRectScreen()
    }

    /**
     * @type {Float} 
     */
    previousScale {
        get => this.get_previousScale()
    }

    /**
     * @type {ISVGPoint} 
     */
    previousTranslate {
        get => this.get_previousTranslate()
    }

    /**
     * @type {Float} 
     */
    newScale {
        get => this.get_newScale()
    }

    /**
     * @type {ISVGPoint} 
     */
    newTranslate {
        get => this.get_newTranslate()
    }

    /**
     * 
     * @returns {ISVGRect} 
     */
    get_zoomRectScreen() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGRect(p)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_previousScale() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {ISVGPoint} 
     */
    get_previousTranslate() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPoint(p)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_newScale() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {ISVGPoint} 
     */
    get_newTranslate() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPoint(p)
    }
}
