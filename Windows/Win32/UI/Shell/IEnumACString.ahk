#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumString.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumACString extends IEnumString{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumACString
     * @type {Guid}
     */
    static IID => Guid("{8e74c210-cf9d-4eaf-a403-7356428f0a5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NextItem", "SetEnumOptions", "GetEnumOptions"]

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @param {Integer} cchMax 
     * @returns {Integer} 
     */
    NextItem(pszUrl, cchMax) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(7, this, "ptr", pszUrl, "uint", cchMax, "uint*", &pulSortIndex := 0, "HRESULT")
        return pulSortIndex
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    SetEnumOptions(dwOptions) {
        result := ComCall(8, this, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEnumOptions() {
        result := ComCall(9, this, "uint*", &pdwOptions := 0, "HRESULT")
        return pdwOptions
    }
}
