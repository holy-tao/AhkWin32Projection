#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Provides information about a spelling error.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-ispellingerror
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ISpellingError extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpellingError
     * @type {Guid}
     */
    static IID => Guid("{b7c82d61-fbe8-4b47-9b27-6c0d2e0de0a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartIndex", "get_Length", "get_CorrectiveAction", "get_Replacement"]

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellingerror-get_startindex
     */
    get_StartIndex(value) {
        result := ComCall(3, this, "uint*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellingerror-get_length
     */
    get_Length(value) {
        result := ComCall(4, this, "uint*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellingerror-get_correctiveaction
     */
    get_CorrectiveAction(value) {
        result := ComCall(5, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellingerror-get_replacement
     */
    get_Replacement(value) {
        result := ComCall(6, this, "ptr", value, "HRESULT")
        return result
    }
}
