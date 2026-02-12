#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk

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
     * @type {IDispatch} 
     */
    constructor {
        get => this.get_constructor()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_constructor() {
        result := ComCall(7, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} propname 
     * @returns {VARIANT} 
     */
    LookupGetter(propname) {
        if(propname is String) {
            pin := BSTR.Alloc(propname)
            propname := pin.Value
        }

        ppDispHandler := VARIANT()
        result := ComCall(8, this, "ptr", propname, "ptr", ppDispHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppDispHandler
    }

    /**
     * 
     * @param {BSTR} propname 
     * @returns {VARIANT} 
     */
    LookupSetter(propname) {
        if(propname is String) {
            pin := BSTR.Alloc(propname)
            propname := pin.Value
        }

        ppDispHandler := VARIANT()
        result := ComCall(9, this, "ptr", propname, "ptr", ppDispHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppDispHandler
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT>} pdispHandler 
     * @returns {HRESULT} 
     */
    DefineGetter(propname, pdispHandler) {
        if(propname is String) {
            pin := BSTR.Alloc(propname)
            propname := pin.Value
        }

        result := ComCall(10, this, "ptr", propname, "ptr", pdispHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT>} pdispHandler 
     * @returns {HRESULT} 
     */
    DefineSetter(propname, pdispHandler) {
        if(propname is String) {
            pin := BSTR.Alloc(propname)
            propname := pin.Value
        }

        result := ComCall(11, this, "ptr", propname, "ptr", pdispHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
