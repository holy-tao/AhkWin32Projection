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
     * Loads a string that contains each of the characters that are valid or invalid in the namespace under which it is called.
     * @param {Pointer<PWSTR>} ppwszValidChars Type: <b>LPWSTR*</b>
     * 
     * A pointer to a string that contains all valid characters in the namespace. If the namespace provides <i>any</i> invalid characters in <i>ppwszInvalidChars</i>, then this value returns <b>NULL</b>. See Remarks for more details.
     * @param {Pointer<PWSTR>} ppwszInvalidChars Type: <b>LPWSTR*</b>
     * 
     * A pointer to a string that contains all invalid characters in the namespace.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iitemnamelimits-getvalidcharacters
     */
    GetValidCharacters(ppwszValidChars, ppwszInvalidChars) {
        ppwszValidCharsMarshal := ppwszValidChars is VarRef ? "ptr*" : "ptr"
        ppwszInvalidCharsMarshal := ppwszInvalidChars is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppwszValidCharsMarshal, ppwszValidChars, ppwszInvalidCharsMarshal, ppwszInvalidChars, "HRESULT")
        return result
    }

    /**
     * Returns the maximum number of characters allowed for a particular name in the namespace under which it is called.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string containing a name.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to the maximum number of characters which can be used in the name.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iitemnamelimits-getmaxlength
     */
    GetMaxLength(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "int*", &piMaxNameLen := 0, "HRESULT")
        return piMaxNameLen
    }
}
