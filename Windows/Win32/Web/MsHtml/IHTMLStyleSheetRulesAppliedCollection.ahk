#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLStyleSheetRule.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleSheetRulesAppliedCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleSheetRulesAppliedCollection
     * @type {Guid}
     */
    static IID => Guid("{305104c0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleSheetRulesAppliedCollection
     * @type {Guid}
     */
    static CLSID => Guid("{eb36f845-2395-4719-b85c-d0d80e184bd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["item", "get_length", "propertyAppliedBy", "propertyAppliedTrace", "propertyAppliedTraceLength"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IHTMLStyleSheetRule} 
     */
    item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &ppHTMLStyleSheetRule := 0, "HRESULT")
        return IHTMLStyleSheetRule(ppHTMLStyleSheetRule)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IHTMLStyleSheetRule} 
     */
    propertyAppliedBy(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "ptr*", &ppRule := 0, "HRESULT")
        return IHTMLStyleSheetRule(ppRule)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Integer} index 
     * @returns {IHTMLStyleSheetRule} 
     */
    propertyAppliedTrace(name, index) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "int", index, "ptr*", &ppRule := 0, "HRESULT")
        return IHTMLStyleSheetRule(ppRule)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {Integer} 
     */
    propertyAppliedTraceLength(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "int*", &pLength := 0, "HRESULT")
        return pLength
    }
}
