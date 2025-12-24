#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGElement.ahk
#Include .\ISVGRect.ahk
#Include .\ISVGMatrix.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGLocatable extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGLocatable
     * @type {Guid}
     */
    static IID => Guid("{305104db-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_nearestViewportElement", "get_farthestViewportElement", "getBBox", "getCTM", "getScreenCTM", "getTransformToElement"]

    /**
     * @type {ISVGElement} 
     */
    nearestViewportElement {
        get => this.get_nearestViewportElement()
    }

    /**
     * @type {ISVGElement} 
     */
    farthestViewportElement {
        get => this.get_farthestViewportElement()
    }

    /**
     * 
     * @returns {ISVGElement} 
     */
    get_nearestViewportElement() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElement(p)
    }

    /**
     * 
     * @returns {ISVGElement} 
     */
    get_farthestViewportElement() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElement(p)
    }

    /**
     * 
     * @returns {ISVGRect} 
     */
    getBBox() {
        result := ComCall(9, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGRect(ppResult)
    }

    /**
     * 
     * @returns {ISVGMatrix} 
     */
    getCTM() {
        result := ComCall(10, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @returns {ISVGMatrix} 
     */
    getScreenCTM() {
        result := ComCall(11, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @param {ISVGElement} pElement 
     * @returns {ISVGMatrix} 
     */
    getTransformToElement(pElement) {
        result := ComCall(12, this, "ptr", pElement, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }
}
