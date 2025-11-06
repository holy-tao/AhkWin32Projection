#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRulesApplied.ahk
#Include .\IHTMLElement.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IRulesAppliedCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRulesAppliedCollection
     * @type {Guid}
     */
    static IID => Guid("{305104be-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for RulesAppliedCollection
     * @type {Guid}
     */
    static CLSID => Guid("{671926ee-c3cf-40af-be8f-1cbaee6486e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["item", "get_length", "get_element", "propertyInheritedFrom", "get_propertyCount", "property", "propertyInheritedTrace", "propertyInheritedTraceLength"]

    /**
     * 
     * @param {Integer} index 
     * @returns {IRulesApplied} 
     */
    item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &ppRulesApplied := 0, "HRESULT")
        return IRulesApplied(ppRulesApplied)
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
     * @returns {IHTMLElement} 
     */
    get_element() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IRulesApplied} 
     */
    propertyInheritedFrom(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "ptr*", &ppRulesApplied := 0, "HRESULT")
        return IRulesApplied(ppRulesApplied)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_propertyCount() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    property(index) {
        pbstrProperty := BSTR()
        result := ComCall(12, this, "int", index, "ptr", pbstrProperty, "HRESULT")
        return pbstrProperty
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Integer} index 
     * @returns {IRulesApplied} 
     */
    propertyInheritedTrace(name, index) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "int", index, "ptr*", &ppRulesApplied := 0, "HRESULT")
        return IRulesApplied(ppRulesApplied)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {Integer} 
     */
    propertyInheritedTraceLength(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(14, this, "ptr", name, "int*", &pLength := 0, "HRESULT")
        return pLength
    }
}
