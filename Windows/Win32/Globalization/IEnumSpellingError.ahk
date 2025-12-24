#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ISpellingError.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * An enumeration of the spelling errors.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-ienumspellingerror
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IEnumSpellingError extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next"]

    /**
     * Gets the next spelling error.
     * @returns {ISpellingError} The spelling error (<a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ispellingerror">ISpellingError</a>) returned.
     * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nf-spellcheck-ienumspellingerror-next
     */
    Next() {
        result := ComCall(3, this, "ptr*", &value := 0, "int")
        return ISpellingError(value)
    }
}
