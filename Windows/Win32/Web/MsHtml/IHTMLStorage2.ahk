#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStorage2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStorage2
     * @type {Guid}
     */
    static IID => Guid("{30510799-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setItem"]

    /**
     * 
     * @param {BSTR} bstrKey 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    setItem(bstrKey, bstrValue) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(7, this, "ptr", bstrKey, "ptr", bstrValue, "HRESULT")
        return result
    }
}
