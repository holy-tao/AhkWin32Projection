#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLElement2.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLAreasCollection4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLAreasCollection4
     * @type {Guid}
     */
    static IID => Guid("{30510492-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "item", "namedItem"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IHTMLElement2} 
     */
    item(index) {
        result := ComCall(8, this, "int", index, "ptr*", &pNode := 0, "HRESULT")
        return IHTMLElement2(pNode)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IHTMLElement2} 
     */
    namedItem(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "ptr*", &pNode := 0, "HRESULT")
        return IHTMLElement2(pNode)
    }
}
