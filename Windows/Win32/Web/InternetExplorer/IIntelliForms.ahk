#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IIntelliForms extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIntelliForms
     * @type {Guid}
     */
    static IID => Guid("{9b9f68e6-1aaa-11d2-bca5-00c04fd929db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_enabled", "put_enabled"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_enabled(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bVal 
     * @returns {HRESULT} 
     */
    put_enabled(bVal) {
        result := ComCall(8, this, "short", bVal, "HRESULT")
        return result
    }
}
