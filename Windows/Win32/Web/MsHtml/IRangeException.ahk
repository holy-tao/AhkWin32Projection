#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents an item ID range to exclude from a knowledge object.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-irangeexception
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IRangeException extends IDispatch{
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
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_code(v) {
        result := ComCall(7, this, "int", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_code(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_message(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
