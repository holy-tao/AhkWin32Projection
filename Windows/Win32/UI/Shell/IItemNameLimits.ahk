#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves a list of valid and invalid characters or the maximum length of a name in the namespace. Use this interface for validation parsing and translation.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iitemnamelimits
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IItemNameLimits extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemNameLimits
     * @type {Guid}
     */
    static IID => Guid("{1df0d7f1-b267-4d28-8b10-12e23202a5c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValidCharacters", "GetMaxLength"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszValidChars 
     * @param {Pointer<PWSTR>} ppwszInvalidChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iitemnamelimits-getvalidcharacters
     */
    GetValidCharacters(ppwszValidChars, ppwszInvalidChars) {
        result := ComCall(3, this, "ptr", ppwszValidChars, "ptr", ppwszInvalidChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} piMaxNameLen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iitemnamelimits-getmaxlength
     */
    GetMaxLength(pszName, piMaxNameLen) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "int*", piMaxNameLen, "HRESULT")
        return result
    }
}
