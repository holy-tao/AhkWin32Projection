#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognitionTopicConstraint extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognitionTopicConstraint
     * @type {Guid}
     */
    static IID => Guid("{bf6fdf19-825d-4e69-a681-36e48cf1c93e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Scenario", "get_TopicHint"]

    /**
     * @type {Integer} 
     */
    Scenario {
        get => this.get_Scenario()
    }

    /**
     * @type {HSTRING} 
     */
    TopicHint {
        get => this.get_TopicHint()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Scenario() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TopicHint() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
