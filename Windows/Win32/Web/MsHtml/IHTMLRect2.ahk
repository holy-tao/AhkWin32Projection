#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLRect2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLRect2
     * @type {Guid}
     */
    static IID => Guid("{3051076c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_width", "get_height"]

    /**
     * @type {Float} 
     */
    width {
        get => this.get_width()
    }

    /**
     * @type {Float} 
     */
    height {
        get => this.get_height()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_width() {
        result := ComCall(7, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_height() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }
}
