#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ISpellingError.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * An enumeration of the spelling errors.
 * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nn-spellcheck-ienumspellingerror
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
     * @remarks
     * If there are no spelling errors, this will return <b>S_FALSE</b>.
     * This provides a way for a provider to implement spell checking lazily if desired—instead of doing the spell checking work on <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nf-spellcheck-ispellchecker-check">ISpellCheckProvider::Check</a> and getting all the errors at once, you can do it only as needed when this method is called, getting one error per call.
     * @returns {ISpellingError} The spelling error (<a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ispellingerror">ISpellingError</a>) returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ienumspellingerror-next
     */
    Next() {
        result := ComCall(3, this, "ptr*", &value := 0, "int")
        return ISpellingError(value)
    }
}
