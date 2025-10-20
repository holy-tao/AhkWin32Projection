#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorLayout extends IUnknown{
    /**
     * The interface identifier for IElementBehaviorLayout
     * @type {Guid}
     */
    static IID => Guid("{3050f6ba-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {SIZE} sizeContent 
     * @param {Pointer<POINT>} pptTranslateBy 
     * @param {Pointer<POINT>} pptTopLeft 
     * @param {Pointer<SIZE>} psizeProposed 
     * @returns {HRESULT} 
     */
    GetSize(dwFlags, sizeContent, pptTranslateBy, pptTopLeft, psizeProposed) {
        result := ComCall(3, this, "int", dwFlags, "ptr", sizeContent, "ptr", pptTranslateBy, "ptr", pptTopLeft, "ptr", psizeProposed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plLayoutInfo 
     * @returns {HRESULT} 
     */
    GetLayoutInfo(plLayoutInfo) {
        result := ComCall(4, this, "int*", plLayoutInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<POINT>} pptTopLeft 
     * @returns {HRESULT} 
     */
    GetPosition(lFlags, pptTopLeft) {
        result := ComCall(5, this, "int", lFlags, "ptr", pptTopLeft, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} psizeIn 
     * @param {Pointer<RECT>} prcOut 
     * @returns {HRESULT} 
     */
    MapSize(psizeIn, prcOut) {
        result := ComCall(6, this, "ptr", psizeIn, "ptr", prcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
