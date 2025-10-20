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
     * 
     * @param {Integer} index 
     * @param {Pointer<IRulesApplied>} ppRulesApplied 
     * @returns {HRESULT} 
     */
    item(index, ppRulesApplied) {
        result := ComCall(7, this, "int", index, "ptr", ppRulesApplied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_element(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(10, this, "ptr", name, "ptr", ppRulesApplied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_propertyCount(p) {
        result := ComCall(11, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pbstrProperty 
     * @returns {HRESULT} 
     */
    property(index, pbstrProperty) {
        result := ComCall(12, this, "int", index, "ptr", pbstrProperty, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(13, this, "ptr", name, "int", index, "ptr", ppRulesApplied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<Int32>} pLength 
     * @returns {HRESULT} 
     */
    propertyInheritedTraceLength(name, pLength) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(14, this, "ptr", name, "int*", pLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
