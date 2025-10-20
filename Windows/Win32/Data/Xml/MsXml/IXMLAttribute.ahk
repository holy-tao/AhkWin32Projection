#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLAttribute extends IDispatch{
    /**
     * The interface identifier for IXMLAttribute
     * @type {Guid}
     */
    static IID => Guid("{d4d4a0fc-3b73-11d1-b2b4-00c04fb92596}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} n 
     * @returns {HRESULT} 
     */
    get_name(n) {
        result := ComCall(7, this, "ptr", n, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} v 
     * @returns {HRESULT} 
     */
    get_value(v) {
        result := ComCall(8, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
