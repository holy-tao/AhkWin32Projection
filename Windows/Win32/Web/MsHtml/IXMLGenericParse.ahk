#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IXMLGenericParse extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLGenericParse
     * @type {Guid}
     */
    static IID => Guid("{e4e23071-4d07-11d2-ae76-0080c73bc199}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGenericParse"]

    /**
     * 
     * @param {VARIANT_BOOL} fDoGeneric 
     * @returns {HRESULT} 
     */
    SetGenericParse(fDoGeneric) {
        result := ComCall(3, this, "short", fDoGeneric, "HRESULT")
        return result
    }
}
