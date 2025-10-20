#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IWPCBlockedUrls extends IUnknown{
    /**
     * The interface identifier for IWPCBlockedUrls
     * @type {Guid}
     */
    static IID => Guid("{30510413-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIdx 
     * @param {Pointer<BSTR>} pbstrUrl 
     * @returns {HRESULT} 
     */
    GetUrl(dwIdx, pbstrUrl) {
        result := ComCall(4, this, "uint", dwIdx, "ptr", pbstrUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
