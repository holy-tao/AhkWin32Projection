#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGLocatable extends IDispatch{
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
     * 
     * @param {Pointer<ISVGElement>} p 
     * @returns {HRESULT} 
     */
    get_nearestViewportElement(p) {
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGElement>} p 
     * @returns {HRESULT} 
     */
    get_farthestViewportElement(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGRect>} ppResult 
     * @returns {HRESULT} 
     */
    getBBox(ppResult) {
        result := ComCall(9, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    getCTM(ppResult) {
        result := ComCall(10, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    getScreenCTM(ppResult) {
        result := ComCall(11, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGElement>} pElement 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    getTransformToElement(pElement, ppResult) {
        result := ComCall(12, this, "ptr", pElement, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
