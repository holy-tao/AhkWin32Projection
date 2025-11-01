#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMTextNode extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMTextNode
     * @type {Guid}
     */
    static IID => Guid("{3050f4b1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDOMTextNode
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4ba-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_data", "get_data", "toString", "get_length", "splitText"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_data(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_data(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} String 
     * @returns {HRESULT} 
     */
    toString(String) {
        result := ComCall(9, this, "ptr", String, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(10, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Pointer<IHTMLDOMNode>} pRetNode 
     * @returns {HRESULT} 
     */
    splitText(offset, pRetNode) {
        result := ComCall(11, this, "int", offset, "ptr*", pRetNode, "HRESULT")
        return result
    }
}
