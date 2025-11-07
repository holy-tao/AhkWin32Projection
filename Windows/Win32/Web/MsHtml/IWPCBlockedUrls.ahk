#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {Integer} dwIdx 
     * @returns {BSTR} 
     */
    GetUrl(dwIdx) {
        pbstrUrl := BSTR()
        result := ComCall(4, this, "uint", dwIdx, "ptr", pbstrUrl, "HRESULT")
        return pbstrUrl
    }
}
