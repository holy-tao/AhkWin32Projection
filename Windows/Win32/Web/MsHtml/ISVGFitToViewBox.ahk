#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGAnimatedRect.ahk
#Include .\ISVGAnimatedPreserveAspectRatio.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGFitToViewBox extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGFitToViewBox
     * @type {Guid}
     */
    static IID => Guid("{305104e0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_viewBox", "putref_preserveAspectRatio", "get_preserveAspectRatio"]

    /**
     * @type {ISVGAnimatedRect} 
     */
    viewBox {
        get => this.get_viewBox()
    }

    /**
     * @type {ISVGAnimatedPreserveAspectRatio} 
     */
    preserveAspectRatio {
        get => this.get_preserveAspectRatio()
    }

    /**
     * 
     * @returns {ISVGAnimatedRect} 
     */
    get_viewBox() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedRect(p)
    }

    /**
     * 
     * @param {ISVGAnimatedPreserveAspectRatio} v 
     * @returns {HRESULT} 
     */
    putref_preserveAspectRatio(v) {
        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedPreserveAspectRatio} 
     */
    get_preserveAspectRatio() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedPreserveAspectRatio(p)
    }
}
