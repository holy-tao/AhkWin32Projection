#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * An enumeration of the spelling errors.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-ienumspellingerror
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IEnumSpellingError extends IUnknown{
    /**
     * The interface identifier for IEnumSpellingError
     * @type {Guid}
     */
    static IID => Guid("{803e3bd4-2828-4410-8290-418d1d73c762}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISpellingError>} value 
     * @returns {HRESULT} 
     */
    Next(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
