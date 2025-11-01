#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IWPCBlockedUrls extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetUrl"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIdx 
     * @param {Pointer<BSTR>} pbstrUrl 
     * @returns {HRESULT} 
     */
    GetUrl(dwIdx, pbstrUrl) {
        result := ComCall(4, this, "uint", dwIdx, "ptr", pbstrUrl, "HRESULT")
        return result
    }
}
