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
     * 
     * @param {Pointer<UInt32>} value 
     * @returns {HRESULT} 
     */
    get_StartIndex(value) {
        result := ComCall(3, this, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} value 
     * @returns {HRESULT} 
     */
    get_Length(value) {
        result := ComCall(4, this, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_CorrectiveAction(value) {
        result := ComCall(5, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    get_Replacement(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
