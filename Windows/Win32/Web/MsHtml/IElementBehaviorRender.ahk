#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorRender extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementBehaviorRender
     * @type {Guid}
     */
    static IID => Guid("{3050f4aa-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Draw", "GetRenderInfo", "HitTestPoint"]

    /**
     * Animates the caption of a window to indicate the opening of an icon or the minimizing or maximizing of a window.
     * @param {HDC} hdc_ 
     * @param {Integer} lLayer 
     * @param {Pointer<RECT>} pRect 
     * @param {IUnknown} pReserved 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-drawanimatedrects
     */
    Draw(hdc_, lLayer, pRect, pReserved) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_

        result := ComCall(3, this, "ptr", hdc_, "int", lLayer, "ptr", pRect, "ptr", pReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRenderInfo() {
        result := ComCall(4, this, "int*", &plRenderInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plRenderInfo
    }

    /**
     * 
     * @param {Pointer<POINT>} pPoint 
     * @param {IUnknown} pReserved 
     * @returns {BOOL} 
     */
    HitTestPoint(pPoint, pReserved) {
        result := ComCall(5, this, "ptr", pPoint, "ptr", pReserved, "int*", &pbHit := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbHit
    }
}
