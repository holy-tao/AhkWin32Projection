#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IHTMLUserDataOM extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLUserDataOM
     * @type {Guid}
     */
    static IID => Guid("{3050f48f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XMLDocument", "save", "load", "getAttribute", "setAttribute", "removeAttribute", "put_expires", "get_expires"]

    /**
     * 
     * @returns {IDispatch} 
     */
    get_XMLDocument() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} strName 
     * @returns {HRESULT} 
     */
    save(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @returns {HRESULT} 
     */
    load(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(9, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT} 
     */
    getAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        pValue := VARIANT()
        result := ComCall(10, this, "ptr", name, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setAttribute(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    removeAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(12, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    put_expires(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(13, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_expires() {
        pbstr := BSTR()
        result := ComCall(14, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }
}
