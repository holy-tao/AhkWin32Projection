#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IEventException extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventException
     * @type {Guid}
     */
    static IID => Guid("{3051073a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for EventException
     * @type {Guid}
     */
    static CLSID => Guid("{3051073b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_code", "get_code", "get_message"]

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_code(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_code() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_message() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }
}
