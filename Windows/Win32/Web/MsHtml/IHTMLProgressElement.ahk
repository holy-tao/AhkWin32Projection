#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLFormElement.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLProgressElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLProgressElement
     * @type {Guid}
     */
    static IID => Guid("{3050f2d6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLProgressElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f2d5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_value", "get_value", "put_max", "get_max", "get_position", "get_form"]

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        result := ComCall(7, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_value() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_max(v) {
        result := ComCall(9, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_max() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_position() {
        result := ComCall(11, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }
}
