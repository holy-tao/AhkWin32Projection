#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Globalization\Language.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognizerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognizerStatics
     * @type {Guid}
     */
    static IID => Guid("{87a35eac-a7dc-4b0b-bcc9-24f47c0b7ebf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SystemSpeechLanguage", "get_SupportedTopicLanguages", "get_SupportedGrammarLanguages"]

    /**
     * @type {Language} 
     */
    SystemSpeechLanguage {
        get => this.get_SystemSpeechLanguage()
    }

    /**
     * @type {IVectorView<Language>} 
     */
    SupportedTopicLanguages {
        get => this.get_SupportedTopicLanguages()
    }

    /**
     * @type {IVectorView<Language>} 
     */
    SupportedGrammarLanguages {
        get => this.get_SupportedGrammarLanguages()
    }

    /**
     * 
     * @returns {Language} 
     */
    get_SystemSpeechLanguage() {
        result := ComCall(6, this, "ptr*", &language_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Language(language_)
    }

    /**
     * 
     * @returns {IVectorView<Language>} 
     */
    get_SupportedTopicLanguages() {
        result := ComCall(7, this, "ptr*", &languages := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Language, languages)
    }

    /**
     * 
     * @returns {IVectorView<Language>} 
     */
    get_SupportedGrammarLanguages() {
        result := ComCall(8, this, "ptr*", &languages := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Language, languages)
    }
}
