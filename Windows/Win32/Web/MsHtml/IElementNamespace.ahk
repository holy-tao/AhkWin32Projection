#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementNamespace extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementNamespace
     * @type {Guid}
     */
    static IID => Guid("{3050f671-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTag"]

    /**
     * 
     * @param {BSTR} bstrTagName 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    AddTag(bstrTagName, lFlags) {
        bstrTagName := bstrTagName is String ? BSTR.Alloc(bstrTagName).Value : bstrTagName

        result := ComCall(3, this, "ptr", bstrTagName, "int", lFlags, "HRESULT")
        return result
    }
}
