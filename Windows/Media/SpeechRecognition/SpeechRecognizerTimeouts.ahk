#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognizerTimeouts.ahk
#Include ..\..\..\Guid.ahk

/**
 * The timespan that a speech recognizer ignores silence or unrecognizable sounds (babble) and continues listening for speech input.
 * @remarks
 * An app retrieves this object through the [SpeechRecognizer.Timeouts](speechrecognizer_timeouts.md) property.
 * 
 * The recognizer finalizes each operation when the specified time span elapses.
 * 
 * [InitialSilenceTimeout](speechrecognizertimeouts_initialsilencetimeout.md) and [EndSilenceTimeout](speechrecognizertimeouts_endsilencetimeout.md) both relate to silence, but have different uses. While [EndSilenceTimeout](speechrecognizertimeouts_endsilencetimeout.md) applies if speech input has already occurred, [InitialSilenceTimeout](speechrecognizertimeouts_initialsilencetimeout.md) applies if no speech input is received at all.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizertimeouts
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognizerTimeouts extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognizerTimeouts

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognizerTimeouts.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the length of time, before any recognition results have been generated, that a [SpeechRecognizer](speechrecognizer.md) detects silence and assumes speech input has ended.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizertimeouts.initialsilencetimeout
     * @type {TimeSpan} 
     */
    InitialSilenceTimeout {
        get => this.get_InitialSilenceTimeout()
        set => this.put_InitialSilenceTimeout(value)
    }

    /**
     * Gets and sets the length of time, after recognition results have been generated, that a [SpeechRecognizer](speechrecognizer.md) detects silence and assumes speech input has ended.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizertimeouts.endsilencetimeout
     * @type {TimeSpan} 
     */
    EndSilenceTimeout {
        get => this.get_EndSilenceTimeout()
        set => this.put_EndSilenceTimeout(value)
    }

    /**
     * Gets and sets the length of time that a [SpeechRecognizer](speechrecognizer.md) continues to listen while receiving unrecognizable sounds (babble) before it assumes speech input has ended and finalizes the recognition operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizertimeouts.babbletimeout
     * @type {TimeSpan} 
     */
    BabbleTimeout {
        get => this.get_BabbleTimeout()
        set => this.put_BabbleTimeout(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_InitialSilenceTimeout() {
        if (!this.HasProp("__ISpeechRecognizerTimeouts")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerTimeouts := ISpeechRecognizerTimeouts(outPtr)
        }

        return this.__ISpeechRecognizerTimeouts.get_InitialSilenceTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_InitialSilenceTimeout(value) {
        if (!this.HasProp("__ISpeechRecognizerTimeouts")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerTimeouts := ISpeechRecognizerTimeouts(outPtr)
        }

        return this.__ISpeechRecognizerTimeouts.put_InitialSilenceTimeout(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_EndSilenceTimeout() {
        if (!this.HasProp("__ISpeechRecognizerTimeouts")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerTimeouts := ISpeechRecognizerTimeouts(outPtr)
        }

        return this.__ISpeechRecognizerTimeouts.get_EndSilenceTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_EndSilenceTimeout(value) {
        if (!this.HasProp("__ISpeechRecognizerTimeouts")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerTimeouts := ISpeechRecognizerTimeouts(outPtr)
        }

        return this.__ISpeechRecognizerTimeouts.put_EndSilenceTimeout(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BabbleTimeout() {
        if (!this.HasProp("__ISpeechRecognizerTimeouts")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerTimeouts := ISpeechRecognizerTimeouts(outPtr)
        }

        return this.__ISpeechRecognizerTimeouts.get_BabbleTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_BabbleTimeout(value) {
        if (!this.HasProp("__ISpeechRecognizerTimeouts")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerTimeouts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerTimeouts := ISpeechRecognizerTimeouts(outPtr)
        }

        return this.__ISpeechRecognizerTimeouts.put_BabbleTimeout(value)
    }

;@endregion Instance Methods
}
