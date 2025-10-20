#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorSiteRender extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementBehaviorSiteRender
     * @type {Guid}
     */
    static IID => Guid("{3050f4a7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invalidate", "InvalidateRenderInfo", "InvalidateStyle"]

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    Invalidate(pRect) {
        result := ComCall(3, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateRenderInfo() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateStyle() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
