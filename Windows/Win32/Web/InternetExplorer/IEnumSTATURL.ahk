#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IEnumSTATURL extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSTATURL
     * @type {Guid}
     */
    static IID => Guid("{3c374a42-bae4-11cf-bf7d-00aa006946ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "SetFilter"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<STATURL>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgelt, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATURL>} ppenum 
     * @returns {HRESULT} 
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} poszFilter 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetFilter(poszFilter, dwFlags) {
        poszFilter := poszFilter is String ? StrPtr(poszFilter) : poszFilter

        result := ComCall(7, this, "ptr", poszFilter, "uint", dwFlags, "HRESULT")
        return result
    }
}
