#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HTML_PAINTER_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPainter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLPainter
     * @type {Guid}
     */
    static IID => Guid("{3050f6a6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Draw", "OnResize", "GetPainterInfo", "HitTestPoint"]

    /**
     * 
     * @param {RECT} rcBounds 
     * @param {RECT} rcUpdate 
     * @param {Integer} lDrawFlags 
     * @param {HDC} hdc 
     * @param {Pointer<Void>} pvDrawObject 
     * @returns {HRESULT} 
     */
    Draw(rcBounds, rcUpdate, lDrawFlags, hdc, pvDrawObject) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pvDrawObjectMarshal := pvDrawObject is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", rcBounds, "ptr", rcUpdate, "int", lDrawFlags, "ptr", hdc, pvDrawObjectMarshal, pvDrawObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SIZE} size 
     * @returns {HRESULT} 
     */
    OnResize(size) {
        result := ComCall(4, this, "ptr", size, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HTML_PAINTER_INFO} 
     */
    GetPainterInfo() {
        pInfo := HTML_PAINTER_INFO()
        result := ComCall(5, this, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<BOOL>} pbHit 
     * @param {Pointer<Integer>} plPartID 
     * @returns {HRESULT} 
     */
    HitTestPoint(pt, pbHit, plPartID) {
        pbHitMarshal := pbHit is VarRef ? "int*" : "ptr"
        plPartIDMarshal := plPartID is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pt, pbHitMarshal, pbHit, plPartIDMarshal, plPartID, "HRESULT")
        return result
    }
}
