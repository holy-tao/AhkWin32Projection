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
     * Enables the user to remove a single name and all associated data from the name cache.
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} Returns <b>TRUE</b> if the name and associated data are removed from the name cache; otherwise, it returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/filehc/nf-filehc-invalidatename
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
