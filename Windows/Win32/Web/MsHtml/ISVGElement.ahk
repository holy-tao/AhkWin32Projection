#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISVGSVGElement.ahk
#Include .\ISVGElement.ahk
#Include .\ISVGAnimatedEnumeration.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGElement
     * @type {Guid}
     */
    static IID => Guid("{305104c5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGElement
     * @type {Guid}
     */
    static CLSID => Guid("{30510564-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_xmlbase", "get_xmlbase", "putref_ownerSVGElement", "get_ownerSVGElement", "putref_viewportElement", "get_viewportElement", "putref_focusable", "get_focusable"]

    /**
     * @type {BSTR} 
     */
    xmlbase {
        get => this.get_xmlbase()
        set => this.put_xmlbase(value)
    }

    /**
     * @type {ISVGSVGElement} 
     */
    ownerSVGElement {
        get => this.get_ownerSVGElement()
    }

    /**
     * @type {ISVGElement} 
     */
    viewportElement {
        get => this.get_viewportElement()
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    focusable {
        get => this.get_focusable()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_xmlbase(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xmlbase() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {ISVGSVGElement} v 
     * @returns {HRESULT} 
     */
    putref_ownerSVGElement(v) {
        result := ComCall(9, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISVGSVGElement} 
     */
    get_ownerSVGElement() {
        result := ComCall(10, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISVGSVGElement(p)
    }

    /**
     * 
     * @param {ISVGElement} v 
     * @returns {HRESULT} 
     */
    putref_viewportElement(v) {
        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISVGElement} 
     */
    get_viewportElement() {
        result := ComCall(12, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISVGElement(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_focusable(v) {
        result := ComCall(13, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_focusable() {
        result := ComCall(14, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISVGAnimatedEnumeration(p)
    }
}
