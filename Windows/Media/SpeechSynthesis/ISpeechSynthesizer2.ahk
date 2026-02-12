#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpeechSynthesizerOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class ISpeechSynthesizer2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechSynthesizer2
     * @type {Guid}
     */
    static IID => Guid("{a7c5ecb2-4339-4d6a-bbf8-c7a4f1544c2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Options"]

    /**
     * @type {SpeechSynthesizerOptions} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * 
     * @returns {SpeechSynthesizerOptions} 
     */
    get_Options() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechSynthesizerOptions(value)
    }
}
