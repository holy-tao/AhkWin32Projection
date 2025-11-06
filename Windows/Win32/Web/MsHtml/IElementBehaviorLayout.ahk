#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorLayout extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSize", "GetLayoutInfo", "GetPosition", "MapSize"]

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
        result := ComCall(3, this, "int", dwFlags, "ptr", sizeContent, "ptr", pptTranslateBy, "ptr", pptTopLeft, "ptr", psizeProposed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLayoutInfo() {
        result := ComCall(4, this, "int*", &plLayoutInfo := 0, "HRESULT")
        return plLayoutInfo
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<POINT>} pptTopLeft 
     * @returns {HRESULT} 
     */
    GetPosition(lFlags, pptTopLeft) {
        result := ComCall(5, this, "int", lFlags, "ptr", pptTopLeft, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} psizeIn 
     * @returns {RECT} 
     */
    MapSize(psizeIn) {
        prcOut := RECT()
        result := ComCall(6, this, "ptr", psizeIn, "ptr", prcOut, "HRESULT")
        return prcOut
    }
}
