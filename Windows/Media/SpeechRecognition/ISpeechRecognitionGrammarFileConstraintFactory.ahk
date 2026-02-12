#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpeechRecognitionGrammarFileConstraint.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognitionGrammarFileConstraintFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognitionGrammarFileConstraintFactory
     * @type {Guid}
     */
    static IID => Guid("{3da770eb-c479-4c27-9f19-89974ef392d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithTag"]

    /**
     * Create Extended Stored Procedures
     * @param {StorageFile} file_ 
     * @returns {SpeechRecognitionGrammarFileConstraint} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &constraint := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognitionGrammarFileConstraint(constraint)
    }

    /**
     * 
     * @param {StorageFile} file_ 
     * @param {HSTRING} tag 
     * @returns {SpeechRecognitionGrammarFileConstraint} 
     */
    CreateWithTag(file_, tag) {
        if(tag is String) {
            pin := HSTRING.Create(tag)
            tag := pin.Value
        }
        tag := tag is Win32Handle ? NumGet(tag, "ptr") : tag

        result := ComCall(7, this, "ptr", file_, "ptr", tag, "ptr*", &constraint := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognitionGrammarFileConstraint(constraint)
    }
}
