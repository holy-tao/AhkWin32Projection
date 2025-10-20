#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLMediaError extends IDispatch{
    /**
     * The interface identifier for IHTMLMediaError
     * @type {Guid}
     */
    static IID => Guid("{30510704-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLMediaError
     * @type {Guid}
     */
    static CLSID => Guid("{3051070a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int16>} p 
     * @returns {HRESULT} 
     */
    get_code(p) {
        result := ComCall(7, this, "short*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
