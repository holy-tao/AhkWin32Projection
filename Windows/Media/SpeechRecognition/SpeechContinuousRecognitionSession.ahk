#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechContinuousRecognitionSession.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SpeechContinuousRecognitionSession.ahk
#Include .\SpeechContinuousRecognitionCompletedEventArgs.ahk
#Include .\SpeechContinuousRecognitionResultGeneratedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Manages speech input for free-form dictation, or an arbitrary sequence of words or phrases that are defined in a local grammar file constraint.
 * @remarks
 * An app retrieves this object through the [SpeechRecognizer.ContinuousRecognitionSession](speechrecognizer_continuousrecognitionsession.md) property.
 * 
 * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in the Settings -> Privacy -> Speech, inking, and typing page. See "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionsession
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechContinuousRecognitionSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechContinuousRecognitionSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechContinuousRecognitionSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the time threshold at which the continuous recognition session ends due to lack of audio input.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionsession.autostopsilencetimeout
     * @type {TimeSpan} 
     */
    AutoStopSilenceTimeout {
        get => this.get_AutoStopSilenceTimeout()
        set => this.put_AutoStopSilenceTimeout(value)
    }

    /**
     * Occurs when a continuous recognition session ends.
     * @remarks
     * When an application suspends and resumes during a speech recognition session, it is important to check the [SpeechContinuousRecognitionCompletedEventArgs](speechcontinuousrecognitioncompletedeventargs.md) Status property for Success.  The API may give a UserCanceled result indicating that speech recognition needs to be restarted.
     * @type {TypedEventHandler<SpeechContinuousRecognitionSession, SpeechContinuousRecognitionCompletedEventArgs>}
    */
    OnCompleted {
        get {
            if(!this.HasProp("__OnCompleted")){
                this.__OnCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8103c018-7952-59f9-9f41-23b17d6e452d}"),
                    SpeechContinuousRecognitionSession,
                    SpeechContinuousRecognitionCompletedEventArgs
                )
                this.__OnCompletedToken := this.add_Completed(this.__OnCompleted.iface)
            }
            return this.__OnCompleted
        }
    }

    /**
     * Occurs when the speech recognizer returns the result from a continuous recognition session.
     * @type {TypedEventHandler<SpeechContinuousRecognitionSession, SpeechContinuousRecognitionResultGeneratedEventArgs>}
    */
    OnResultGenerated {
        get {
            if(!this.HasProp("__OnResultGenerated")){
                this.__OnResultGenerated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{26192073-a2c9-527d-9bd3-911c05e0011e}"),
                    SpeechContinuousRecognitionSession,
                    SpeechContinuousRecognitionResultGeneratedEventArgs
                )
                this.__OnResultGeneratedToken := this.add_ResultGenerated(this.__OnResultGenerated.iface)
            }
            return this.__OnResultGenerated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnResultGeneratedToken")) {
            this.remove_ResultGenerated(this.__OnResultGeneratedToken)
            this.__OnResultGenerated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AutoStopSilenceTimeout() {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.get_AutoStopSilenceTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_AutoStopSilenceTimeout(value) {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.put_AutoStopSilenceTimeout(value)
    }

    /**
     * *Overload*
     * 
     * Asynchronously begin a continuous speech recognition session with the specified [SpeechContinuousRecognitionMode](speechcontinuousrecognitionmode.md) behavior.
     * @remarks
     * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) must always be called before StartAsync, even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionsession.startasync
     */
    StartAsync() {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.StartAsync()
    }

    /**
     * *Overload*
     * 
     * Asynchronously begin a continuous speech recognition session with a [SpeechContinuousRecognitionMode](speechcontinuousrecognitionmode.md) of [Default](speechcontinuousrecognitionmode.md).
     * @remarks
     * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) must always be called before StartAsync, even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
     * @param {Integer} mode_ 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionsession.startasync
     */
    StartWithModeAsync(mode_) {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.StartWithModeAsync(mode_)
    }

    /**
     * Asynchronously end a continuous speech recognition session and pass all pending recognition results to the [ResultGenerated](speechcontinuousrecognitionsession_resultgenerated.md) event.
     * @remarks
     * [CancelAsync](speechcontinuousrecognitionsession_cancelasync_1837883523.md) discards all pending results.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionsession.stopasync
     */
    StopAsync() {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.StopAsync()
    }

    /**
     * Asynchronously cancel the continuous speech recognition session and discard all pending recognition results.
     * @remarks
     * A [ResultGenerated](speechcontinuousrecognitionsession_resultgenerated.md) event can occur after a call to CancelAsync if it exists on the stack when the call is made.
     * 
     * [StopAsync](speechcontinuousrecognitionsession_stopasync_1648475005.md) passes pending results to the [ResultGenerated](speechcontinuousrecognitionsession_resultgenerated.md) event.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionsession.cancelasync
     */
    CancelAsync() {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.CancelAsync()
    }

    /**
     * Asynchronously pause a continuous speech recognition session to update a local [grammar file](speechrecognitiongrammarfileconstraint.md) or [list constraint](speechrecognitionlistconstraint.md).
     * @remarks
     * An error is returned if [SpeechRecognizerState](speechrecognizerstate.md) is [Idle](speechrecognizerstate.md) or [Paused](speechrecognizerstate.md).
     * 
     * If the list of constraints is empty (which defaults to a [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md)), or a [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md) is present in the list of constraints, PauseAsync fails with error code COR_E_INVALIDOPERATION.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionsession.pauseasync
     */
    PauseAsync() {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.PauseAsync()
    }

    /**
     * Resumes a continuous speech recognition session, if paused.
     * @remarks
     * An error is returned if [SpeechRecognizerState](speechrecognizerstate.md) is not [Paused](speechrecognizerstate.md).
     * 
     * If a [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md) is added after [PauseAsync](speechcontinuousrecognitionsession_pauseasync_576113822.md), Resume fails with error code COR_E_INVALIDOPERATION.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionsession.resume
     */
    Resume() {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.Resume()
    }

    /**
     * 
     * @param {TypedEventHandler<SpeechContinuousRecognitionSession, SpeechContinuousRecognitionCompletedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(value) {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.add_Completed(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_Completed(value) {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.remove_Completed(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SpeechContinuousRecognitionSession, SpeechContinuousRecognitionResultGeneratedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ResultGenerated(value) {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.add_ResultGenerated(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_ResultGenerated(value) {
        if (!this.HasProp("__ISpeechContinuousRecognitionSession")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionSession := ISpeechContinuousRecognitionSession(outPtr)
        }

        return this.__ISpeechContinuousRecognitionSession.remove_ResultGenerated(value)
    }

;@endregion Instance Methods
}
