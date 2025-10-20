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
     * 
     * @param {Integer} dispID 
     * @param {Pointer<BSTR>} pBstr 
     * @returns {HRESULT} 
     */
    GetDisplayString(dispID, pBstr) {
        result := ComCall(3, this, "int", dispID, "ptr", pBstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dispID 
     * @param {Pointer<Guid>} pClsid 
     * @returns {HRESULT} 
     */
    MapPropertyToPage(dispID, pClsid) {
        result := ComCall(4, this, "int", dispID, "ptr", pClsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dispID 
     * @param {Pointer<CALPOLESTR>} pCaStringsOut 
     * @param {Pointer<CADWORD>} pCaCookiesOut 
     * @returns {HRESULT} 
     */
    GetPredefinedStrings(dispID, pCaStringsOut, pCaCookiesOut) {
        result := ComCall(5, this, "int", dispID, "ptr", pCaStringsOut, "ptr", pCaCookiesOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dispID 
     * @param {Integer} dwCookie 
     * @param {Pointer<VARIANT>} pVarOut 
     * @returns {HRESULT} 
     */
    GetPredefinedValue(dispID, dwCookie, pVarOut) {
        result := ComCall(6, this, "int", dispID, "uint", dwCookie, "ptr", pVarOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
