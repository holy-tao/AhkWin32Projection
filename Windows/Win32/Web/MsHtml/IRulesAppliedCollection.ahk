#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IRulesApplied>} ppRulesApplied 
     * @returns {HRESULT} 
     */
    item(index, ppRulesApplied) {
        result := ComCall(7, this, "int", index, "ptr*", ppRulesApplied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(8, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_element(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IRulesApplied>} ppRulesApplied 
     * @returns {HRESULT} 
     */
    propertyInheritedFrom(name, ppRulesApplied) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "ptr*", ppRulesApplied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_propertyCount(p) {
        result := ComCall(11, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pbstrProperty 
     * @returns {HRESULT} 
     */
    property(index, pbstrProperty) {
        result := ComCall(12, this, "int", index, "ptr", pbstrProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Integer} index 
     * @param {Pointer<IRulesApplied>} ppRulesApplied 
     * @returns {HRESULT} 
     */
    propertyInheritedTrace(name, index, ppRulesApplied) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "int", index, "ptr*", ppRulesApplied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<Integer>} pLength 
     * @returns {HRESULT} 
     */
    propertyInheritedTraceLength(name, pLength) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(14, this, "ptr", name, "int*", pLength, "HRESULT")
        return result
    }
}
