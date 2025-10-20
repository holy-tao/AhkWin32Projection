#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Manages the registration of user dictionaries.
 * @remarks
 * 
  * <b>IUserDictionariesRegistrar</b> allows clients to persistently register and unregister user dictionary files that exist in locations other than the usual dictionary path (<c>%AppData%\Microsoft\Spelling</c>). The dictionaries must have the same file formats as the ones located in the normal path and also should have the appropriate file extensions.
  * However, it is strongly recommended for clients to place their dictionaries under <c>%AppData%\Microsoft\Spelling</c> whenever possible—the spell checking functionality does not pick up changes in dictionaries outside that directory tree.
  * 
  * This interface is obtained through a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> in <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ispellcheckerfactory">ISpellCheckerFactory</a>.
  * 
  * The combined size of all registered dictionary files must be less than 1 MB by default. This can be increased to 2 MB by setting the registry key HKEY_CURRENT_USER\Software\Microsoft\Spelling\Dictionaries\AllowBiggerUD to the value 1. For more information about the Windows registry, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry">Registry</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-iuserdictionariesregistrar
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IUserDictionariesRegistrar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDictionariesRegistrar
     * @type {Guid}
     */
    static IID => Guid("{aa176b85-0e12-4844-8e1a-eef1da77f586}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterUserDictionary", "UnregisterUserDictionary"]

    /**
     * 
     * @param {PWSTR} dictionaryPath 
     * @param {PWSTR} languageTag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-iuserdictionariesregistrar-registeruserdictionary
     */
    RegisterUserDictionary(dictionaryPath, languageTag) {
        dictionaryPath := dictionaryPath is String ? StrPtr(dictionaryPath) : dictionaryPath
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(3, this, "ptr", dictionaryPath, "ptr", languageTag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} dictionaryPath 
     * @param {PWSTR} languageTag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-iuserdictionariesregistrar-unregisteruserdictionary
     */
    UnregisterUserDictionary(dictionaryPath, languageTag) {
        dictionaryPath := dictionaryPath is String ? StrPtr(dictionaryPath) : dictionaryPath
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(4, this, "ptr", dictionaryPath, "ptr", languageTag, "HRESULT")
        return result
    }
}
