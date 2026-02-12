#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SpeechRecognitionTopicConstraint.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognitionTopicConstraintFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognitionTopicConstraintFactory
     * @type {Guid}
     */
    static IID => Guid("{6e6863df-ec05-47d7-a5df-56a3431e58d2}")

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
     * @param {Integer} scenario 
     * @param {HSTRING} topicHint 
     * @returns {SpeechRecognitionTopicConstraint} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(scenario, topicHint) {
        if(topicHint is String) {
            pin := HSTRING.Create(topicHint)
            topicHint := pin.Value
        }
        topicHint := topicHint is Win32Handle ? NumGet(topicHint, "ptr") : topicHint

        result := ComCall(6, this, "int", scenario, "ptr", topicHint, "ptr*", &constraint := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognitionTopicConstraint(constraint)
    }

    /**
     * 
     * @param {Integer} scenario 
     * @param {HSTRING} topicHint 
     * @param {HSTRING} tag 
     * @returns {SpeechRecognitionTopicConstraint} 
     */
    CreateWithTag(scenario, topicHint, tag) {
        if(topicHint is String) {
            pin := HSTRING.Create(topicHint)
            topicHint := pin.Value
        }
        topicHint := topicHint is Win32Handle ? NumGet(topicHint, "ptr") : topicHint
        if(tag is String) {
            pin := HSTRING.Create(tag)
            tag := pin.Value
        }
        tag := tag is Win32Handle ? NumGet(tag, "ptr") : tag

        result := ComCall(7, this, "int", scenario, "ptr", topicHint, "ptr", tag, "ptr*", &constraint := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognitionTopicConstraint(constraint)
    }
}
