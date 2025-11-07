#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGAnimatedNumber.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGStopElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGStopElement
     * @type {Guid}
     */
    static IID => Guid("{3051052b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGStopElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105d5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_offset", "get_offset"]

    /**
     * 
     * @param {ISVGAnimatedNumber} v 
     * @returns {HRESULT} 
     */
    putref_offset(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedNumber} 
     */
    get_offset() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedNumber(p)
    }
}
