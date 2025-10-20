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
     * 
     * @param {HDC} hdc 
     * @param {Integer} lLayer 
     * @param {Pointer<RECT>} pRect 
     * @param {IUnknown} pReserved 
     * @returns {HRESULT} 
     */
    Draw(hdc, lLayer, pRect, pReserved) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(3, this, "ptr", hdc, "int", lLayer, "ptr", pRect, "ptr", pReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRenderInfo 
     * @returns {HRESULT} 
     */
    GetRenderInfo(plRenderInfo) {
        result := ComCall(4, this, "int*", plRenderInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pPoint 
     * @param {IUnknown} pReserved 
     * @param {Pointer<BOOL>} pbHit 
     * @returns {HRESULT} 
     */
    HitTestPoint(pPoint, pReserved, pbHit) {
        result := ComCall(5, this, "ptr", pPoint, "ptr", pReserved, "ptr", pbHit, "HRESULT")
        return result
    }
}
