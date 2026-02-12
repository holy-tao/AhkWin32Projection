#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognizerStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [SpeechRecognizer.StateChangedEvent](speechrecognizer_statechanged.md) event.
 * @remarks
 * Handle the [SpeechRecognizer.StateChanged](speechrecognizer_statechanged.md) event to obtain an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizerstatechangedeventargs
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognizerStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognizerStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognizerStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the audio capture state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizerstatechangedeventargs.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__ISpeechRecognizerStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerStateChangedEventArgs := ISpeechRecognizerStateChangedEventArgs(outPtr)
        }

        return this.__ISpeechRecognizerStateChangedEventArgs.get_State()
    }

;@endregion Instance Methods
}
