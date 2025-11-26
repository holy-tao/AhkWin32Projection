#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTCPropertyBehavior extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTCPropertyBehavior
     * @type {Guid}
     */
    static IID => Guid("{3050f5df-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTCPropertyBehavior
     * @type {Guid}
     */
    static CLSID => Guid("{3050f5de-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["fireChange", "put_value", "get_value"]

    /**
     * @type {VARIANT} 
     */
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    fireChange() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_value() {
        p := VARIANT()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }
}
