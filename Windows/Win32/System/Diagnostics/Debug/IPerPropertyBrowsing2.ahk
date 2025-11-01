#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IPerPropertyBrowsing2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerPropertyBrowsing2
     * @type {Guid}
     */
    static IID => Guid("{51973c54-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDisplayString", "MapPropertyToPage", "GetPredefinedStrings", "SetPredefinedValue"]

    /**
     * 
     * @param {Integer} dispid 
     * @param {Pointer<BSTR>} pBstr 
     * @returns {HRESULT} 
     */
    GetDisplayString(dispid, pBstr) {
        result := ComCall(3, this, "int", dispid, "ptr", pBstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispid 
     * @param {Pointer<Guid>} pClsidPropPage 
     * @returns {HRESULT} 
     */
    MapPropertyToPage(dispid, pClsidPropPage) {
        result := ComCall(4, this, "int", dispid, "ptr", pClsidPropPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispid 
     * @param {Pointer<CALPOLESTR>} pCaStrings 
     * @param {Pointer<CADWORD>} pCaCookies 
     * @returns {HRESULT} 
     */
    GetPredefinedStrings(dispid, pCaStrings, pCaCookies) {
        result := ComCall(5, this, "int", dispid, "ptr", pCaStrings, "ptr", pCaCookies, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispid 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    SetPredefinedValue(dispid, dwCookie) {
        result := ComCall(6, this, "int", dispid, "uint", dwCookie, "HRESULT")
        return result
    }
}
