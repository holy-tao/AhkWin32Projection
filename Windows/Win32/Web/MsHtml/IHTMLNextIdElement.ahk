#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLNextIdElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLNextIdElement
     * @type {Guid}
     */
    static IID => Guid("{3050f207-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLNextIdElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f279-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_n", "get_n"]

    /**
     * @type {BSTR} 
     */
    n {
        get => this.get_n()
        set => this.put_n(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_n(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_n() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }
}
