#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPerformanceNavigation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLPerformanceNavigation
     * @type {Guid}
     */
    static IID => Guid("{30510750-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPerformanceNavigation
     * @type {Guid}
     */
    static CLSID => Guid("{30510751-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "get_redirectCount", "toString", "toJSON"]

    /**
     * @type {Integer} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {Integer} 
     */
    redirectCount {
        get => this.get_redirectCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_type() {
        result := ComCall(7, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_redirectCount() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        string := BSTR()
        result := ComCall(9, this, "ptr", string, "HRESULT")
        return string
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    toJSON() {
        pVar := VARIANT()
        result := ComCall(10, this, "ptr", pVar, "HRESULT")
        return pVar
    }
}
