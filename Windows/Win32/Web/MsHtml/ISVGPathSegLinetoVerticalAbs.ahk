#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPathSegLinetoVerticalAbs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGPathSegLinetoVerticalAbs
     * @type {Guid}
     */
    static IID => Guid("{3051050a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathSegLinetoVerticalAbs
     * @type {Guid}
     */
    static CLSID => Guid("{305105ca-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_y", "get_y"]

    /**
     * @type {Float} 
     */
    y {
        get => this.get_y()
        set => this.put_y(value)
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_y(v) {
        result := ComCall(7, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_y() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }
}
