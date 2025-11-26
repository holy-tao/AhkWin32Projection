#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLIsIndexElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLIsIndexElement
     * @type {Guid}
     */
    static IID => Guid("{3050f206-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLIsIndexElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f278-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_prompt", "get_prompt", "put_action", "get_action"]

    /**
     * @type {BSTR} 
     */
    prompt {
        get => this.get_prompt()
        set => this.put_prompt(value)
    }

    /**
     * @type {BSTR} 
     */
    action {
        get => this.get_action()
        set => this.put_action(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_prompt(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_prompt() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_action(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_action() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }
}
