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
     * Registers a file to be used as a user dictionary for the current user, until unregistered.
     * @param {PWSTR} dictionaryPath The path of the dictionary file to be registered.
     * @param {PWSTR} languageTag The language for which this dictionary should be used. If left empty, it will be used for any language.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is already registered for the language.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_INVALIDARG</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file doesn’t exist or isn't valid, or it doesn't have a valid extension (.dic, .exc, or .acl)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_POINTER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dictionaryPath</i> or <i>languageTag</i> is a null pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nf-spellcheck-iuserdictionariesregistrar-registeruserdictionary
     */
    RegisterUserDictionary(dictionaryPath, languageTag) {
        dictionaryPath := dictionaryPath is String ? StrPtr(dictionaryPath) : dictionaryPath
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(3, this, "ptr", dictionaryPath, "ptr", languageTag, "HRESULT")
        return result
    }

    /**
     * Unregisters a previously registered user dictionary.
     * @param {PWSTR} dictionaryPath The path of the dictionary file to be unregistered.
     * @param {PWSTR} languageTag The language for which this dictionary was used. It must match the language passed to <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nf-spellcheck-iuserdictionariesregistrar-registeruserdictionary">RegisterUserDictionary</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_POINTER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dictionaryPath</i> or <i>languageTag</i> is a null pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nf-spellcheck-iuserdictionariesregistrar-unregisteruserdictionary
     */
    UnregisterUserDictionary(dictionaryPath, languageTag) {
        dictionaryPath := dictionaryPath is String ? StrPtr(dictionaryPath) : dictionaryPath
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(4, this, "ptr", dictionaryPath, "ptr", languageTag, "HRESULT")
        return result
    }
}
