#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves the information in the property pages offered by an object.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iperpropertybrowsing
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPerPropertyBrowsing extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerPropertyBrowsing
     * @type {Guid}
     */
    static IID => Guid("{376bd3aa-3845-101b-84ed-08002b2ec713}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDisplayString", "MapPropertyToPage", "GetPredefinedStrings", "GetPredefinedValue"]

    /**
     * 
     * @param {Integer} dispID 
     * @param {Pointer<BSTR>} pBstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iperpropertybrowsing-getdisplaystring
     */
    GetDisplayString(dispID, pBstr) {
        result := ComCall(3, this, "int", dispID, "ptr", pBstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispID 
     * @param {Pointer<Guid>} pClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iperpropertybrowsing-mappropertytopage
     */
    MapPropertyToPage(dispID, pClsid) {
        result := ComCall(4, this, "int", dispID, "ptr", pClsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispID 
     * @param {Pointer<CALPOLESTR>} pCaStringsOut 
     * @param {Pointer<CADWORD>} pCaCookiesOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedstrings
     */
    GetPredefinedStrings(dispID, pCaStringsOut, pCaCookiesOut) {
        result := ComCall(5, this, "int", dispID, "ptr", pCaStringsOut, "ptr", pCaCookiesOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispID 
     * @param {Integer} dwCookie 
     * @param {Pointer<VARIANT>} pVarOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue
     */
    GetPredefinedValue(dispID, dwCookie, pVarOut) {
        result := ComCall(6, this, "int", dispID, "uint", dwCookie, "ptr", pVarOut, "HRESULT")
        return result
    }
}
