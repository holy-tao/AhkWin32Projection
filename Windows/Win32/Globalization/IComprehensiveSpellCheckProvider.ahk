#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IEnumSpellingError.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Allows the provider to optionally support a more comprehensive spell checking functionality.
 * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nn-spellcheckprovider-icomprehensivespellcheckprovider
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IComprehensiveSpellCheckProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComprehensiveSpellCheckProvider
     * @type {Guid}
     */
    static IID => Guid("{0c58f8de-8e94-479e-9717-70c42c4ad2c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ComprehensiveCheck"]

    /**
     * Spell-check the provider text in a more thorough manner than ISpellCheckProvider::Check.
     * @remarks
     * This interface isn't required to be implemented by a spell check provider. But if the provider supports two "modes" of spell checking (a faster one and a slower but more thorough one), it should implement this interface in the same object that implements [**ISpellCheckProvider**](/windows/desktop/api/Spellcheckprovider/nn-spellcheckprovider-ispellcheckprovider) to support the more thorough checking mode. When a client calls [**ISpellChecker::ComprehensiveCheck**](/windows/desktop/api/Spellcheck/nf-spellcheck-ispellchecker-comprehensivecheck), the spell checking functionality will [**QueryInterface**](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) the provider for [**IComprehensiveSpellCheckProvider**](/windows/desktop/api/spellcheckprovider/nn-spellcheckprovider-icomprehensivespellcheckprovider), and call **IComprehensiveSpellCheckProvider.ComprehensiveCheck** if the interface is supported. If the interface isn't supported, it will silently fall back to [**ISpellCheckProvider::Check**](/windows/desktop/api/Spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-check).
     * @param {PWSTR} text The text to check.
     * @returns {IEnumSpellingError} 
     * @see https://learn.microsoft.com/windows/win32/Intl/icomprehensivespellcheckprovider-comprehensivecheck
     */
    ComprehensiveCheck(text) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(3, this, "ptr", text, "ptr*", &value := 0, "HRESULT")
        return IEnumSpellingError(value)
    }
}
