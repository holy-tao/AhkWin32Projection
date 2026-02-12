#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SpeechSynthesisStream.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\VoiceInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class ISpeechSynthesizer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechSynthesizer
     * @type {Guid}
     */
    static IID => Guid("{ce9f7c76-97f4-4ced-ad68-d51c458e45c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SynthesizeTextToStreamAsync", "SynthesizeSsmlToStreamAsync", "put_Voice", "get_Voice"]

    /**
     * @type {VoiceInformation} 
     */
    Voice {
        get => this.get_Voice()
        set => this.put_Voice(value)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @returns {IAsyncOperation<SpeechSynthesisStream>} 
     */
    SynthesizeTextToStreamAsync(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(6, this, "ptr", text, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpeechSynthesisStream, operation)
    }

    /**
     * 
     * @param {HSTRING} Ssml 
     * @returns {IAsyncOperation<SpeechSynthesisStream>} 
     */
    SynthesizeSsmlToStreamAsync(Ssml) {
        if(Ssml is String) {
            pin := HSTRING.Create(Ssml)
            Ssml := pin.Value
        }
        Ssml := Ssml is Win32Handle ? NumGet(Ssml, "ptr") : Ssml

        result := ComCall(7, this, "ptr", Ssml, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpeechSynthesisStream, operation)
    }

    /**
     * 
     * @param {VoiceInformation} value 
     * @returns {HRESULT} 
     */
    put_Voice(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VoiceInformation} 
     */
    get_Voice() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoiceInformation(value)
    }
}
