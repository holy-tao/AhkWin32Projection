#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMConstructor extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMConstructor
     * @type {Guid}
     */
    static IID => Guid("{3051049b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_constructor", "LookupGetter", "LookupSetter", "DefineGetter", "DefineSetter"]

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_constructor(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT>} ppDispHandler 
     * @returns {HRESULT} 
     */
    LookupGetter(propname, ppDispHandler) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(8, this, "ptr", propname, "ptr", ppDispHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT>} ppDispHandler 
     * @returns {HRESULT} 
     */
    LookupSetter(propname, ppDispHandler) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(9, this, "ptr", propname, "ptr", ppDispHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT>} pdispHandler 
     * @returns {HRESULT} 
     */
    DefineGetter(propname, pdispHandler) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(10, this, "ptr", propname, "ptr", pdispHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT>} pdispHandler 
     * @returns {HRESULT} 
     */
    DefineSetter(propname, pdispHandler) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(11, this, "ptr", propname, "ptr", pdispHandler, "HRESULT")
        return result
    }
}
