#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGAnimatedEnumeration extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGAnimatedEnumeration
     * @type {Guid}
     */
    static IID => Guid("{305104c9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAnimatedEnumeration
     * @type {Guid}
     */
    static CLSID => Guid("{3051058e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_baseVal", "get_baseVal", "put_animVal", "get_animVal"]

    /**
     * @type {Integer} 
     */
    baseVal {
        get => this.get_baseVal()
        set => this.put_baseVal(value)
    }

    /**
     * @type {Integer} 
     */
    animVal {
        get => this.get_animVal()
        set => this.put_animVal(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_baseVal(v) {
        result := ComCall(7, this, "ushort", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_baseVal() {
        result := ComCall(8, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_animVal(v) {
        result := ComCall(9, this, "ushort", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_animVal() {
        result := ComCall(10, this, "ushort*", &p := 0, "HRESULT")
        return p
    }
}
