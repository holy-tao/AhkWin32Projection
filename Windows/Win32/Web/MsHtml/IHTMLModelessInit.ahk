#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLModelessInit extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLModelessInit
     * @type {Guid}
     */
    static IID => Guid("{3050f5e4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_parameters", "get_optionString", "get_moniker", "get_document"]

    /**
     * @type {VARIANT} 
     */
    parameters {
        get => this.get_parameters()
    }

    /**
     * @type {VARIANT} 
     */
    optionString {
        get => this.get_optionString()
    }

    /**
     * @type {IUnknown} 
     */
    moniker {
        get => this.get_moniker()
    }

    /**
     * @type {IUnknown} 
     */
    document {
        get => this.get_document()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_parameters() {
        p := VARIANT()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_optionString() {
        p := VARIANT()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_moniker() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_document() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }
}
