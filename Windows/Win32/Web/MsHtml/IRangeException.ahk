#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents an item ID range to exclude from a knowledge object.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-irangeexception
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IRangeException extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRangeException
     * @type {Guid}
     */
    static IID => Guid("{3051072d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for RangeException
     * @type {Guid}
     */
    static CLSID => Guid("{3051072e-98b5-11cf-bb82-00aa00bdce0b}")

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
     * @type {Integer} 
     */
    code {
        get => this.get_code()
        set => this.put_code(value)
    }

    /**
     * @type {BSTR} 
     */
    message {
        get => this.get_message()
    }

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
