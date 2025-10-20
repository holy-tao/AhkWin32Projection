#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorRender extends IUnknown{
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
     * 
     * @param {HDC} hdc 
     * @param {Integer} lLayer 
     * @param {Pointer<RECT>} pRect 
     * @param {Pointer<IUnknown>} pReserved 
     * @returns {HRESULT} 
     */
    Draw(hdc, lLayer, pRect, pReserved) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(3, this, "ptr", hdc, "int", lLayer, "ptr", pRect, "ptr", pReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRenderInfo 
     * @returns {HRESULT} 
     */
    GetRenderInfo(plRenderInfo) {
        result := ComCall(4, this, "int*", plRenderInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pPoint 
     * @param {Pointer<IUnknown>} pReserved 
     * @param {Pointer<BOOL>} pbHit 
     * @returns {HRESULT} 
     */
    HitTestPoint(pPoint, pReserved, pbHit) {
        result := ComCall(5, this, "ptr", pPoint, "ptr", pReserved, "ptr", pbHit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
