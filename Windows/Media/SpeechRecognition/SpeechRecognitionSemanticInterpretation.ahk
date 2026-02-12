#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognitionSemanticInterpretation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the semantic properties of a recognized phrase in a Speech Recognition Grammar Specification (SRGS) grammar.
 * @remarks
 * Access the [SpeechRecognitionResult.SemanticInterpretation](speechrecognitionresult_semanticinterpretation.md) property to obtain an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionsemanticinterpretation
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionSemanticInterpretation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognitionSemanticInterpretation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognitionSemanticInterpretation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a dictionary of the semantic properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionsemanticinterpretation.properties
     * @type {IMapView<HSTRING, IVectorView<HSTRING>>} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IVectorView<HSTRING>>} 
     */
    get_Properties() {
        if (!this.HasProp("__ISpeechRecognitionSemanticInterpretation")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionSemanticInterpretation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionSemanticInterpretation := ISpeechRecognitionSemanticInterpretation(outPtr)
        }

        return this.__ISpeechRecognitionSemanticInterpretation.get_Properties()
    }

;@endregion Instance Methods
}
