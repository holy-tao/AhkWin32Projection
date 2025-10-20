#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLSubmitData extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLSubmitData
     * @type {Guid}
     */
    static IID => Guid("{3050f645-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["appendNameValuePair", "appendNameFilePair", "appendItemSeparator"]

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    appendNameValuePair(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(7, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} filename 
     * @returns {HRESULT} 
     */
    appendNameFilePair(name, filename) {
        name := name is String ? BSTR.Alloc(name).Value : name
        filename := filename is String ? BSTR.Alloc(filename).Value : filename

        result := ComCall(8, this, "ptr", name, "ptr", filename, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    appendItemSeparator() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
