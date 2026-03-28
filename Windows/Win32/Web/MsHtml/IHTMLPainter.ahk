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
     * Animates the caption of a window to indicate the opening of an icon or the minimizing or maximizing of a window.
     * @param {RECT} rcBounds 
     * @param {RECT} rcUpdate 
     * @param {Integer} lDrawFlags 
     * @param {HDC} _hdc 
     * @param {Pointer<Void>} pvDrawObject 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-drawanimatedrects
     */
    Draw(rcBounds, rcUpdate, lDrawFlags, _hdc, pvDrawObject) {
        _hdc := _hdc is Win32Handle ? NumGet(_hdc, "ptr") : _hdc

        pvDrawObjectMarshal := pvDrawObject is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", rcBounds, "ptr", rcUpdate, "int", lDrawFlags, "ptr", _hdc, pvDrawObjectMarshal, pvDrawObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SIZE} _size 
     * @returns {HRESULT} 
     */
    OnResize(_size) {
        result := ComCall(4, this, "ptr", _size, "HRESULT")
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
