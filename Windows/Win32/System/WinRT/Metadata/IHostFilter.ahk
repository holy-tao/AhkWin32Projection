#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IHostFilter extends IUnknown{
    /**
     * The interface identifier for IHostFilter
     * @type {Guid}
     */
    static IID => Guid("{d0e80dd3-12d4-11d3-b39d-00c04ff81795}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} tk 
     * @returns {HRESULT} 
     */
    MarkToken(tk) {
        result := ComCall(3, this, "uint", tk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
