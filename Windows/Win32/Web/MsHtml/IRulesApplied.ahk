#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IRulesApplied extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRulesApplied
     * @type {Guid}
     */
    static IID => Guid("{305104bf-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for RulesApplied
     * @type {Guid}
     */
    static CLSID => Guid("{7c803920-7a53-4d26-98ac-fdd23e6b9e01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_element", "get_inlineStyles", "get_appliedRules", "propertyIsInline", "propertyIsInheritable", "hasInheritableProperty"]

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_element(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStyle>} p 
     * @returns {HRESULT} 
     */
    get_inlineStyles(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStyleSheetRulesAppliedCollection>} p 
     * @returns {HRESULT} 
     */
    get_appliedRules(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    propertyIsInline(name, p) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    propertyIsInheritable(name, p) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    hasInheritableProperty(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }
}
