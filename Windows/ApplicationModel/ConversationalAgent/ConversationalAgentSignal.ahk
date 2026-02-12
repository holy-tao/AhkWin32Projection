#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConversationalAgentSignal.ahk
#Include .\IConversationalAgentSignal2.ahk
#Include ..\..\..\Guid.ahk

/**
 * A signal detected by an agent that corresponds to an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md). This signal indicates that the matching agent should be activated to handle an interaction.
 * @remarks
 * This signal can include audio events such as a keyword, a hardware signal sent via Bluetooth or a keyboard accelerator, in-app speech recognition, or another appropriate detection.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsignal
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentSignal extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConversationalAgentSignal

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConversationalAgentSignal.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether the [ConversationalAgentSignal](conversationalagentsignal.md) needs to be verified.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsignal.issignalverificationrequired
     * @type {Boolean} 
     */
    IsSignalVerificationRequired {
        get => this.get_IsSignalVerificationRequired()
        set => this.put_IsSignalVerificationRequired(value)
    }

    /**
     * Gets or sets a unique identifier for the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsignal.signalid
     * @type {HSTRING} 
     */
    SignalId {
        get => this.get_SignalId()
        set => this.put_SignalId(value)
    }

    /**
     * Gets or sets the name of the [ConversationalAgentSignal](conversationalagentsignal.md) (for example, "Cortana" or "Alexa").
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsignal.signalname
     * @type {HSTRING} 
     */
    SignalName {
        get => this.get_SignalName()
        set => this.put_SignalName(value)
    }

    /**
     * Gets or sets the context for the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @remarks
     * The Windows Conversational Agent platform can detect other [ConversationalAgentSignal](conversationalagentsignal.md) during an active [ConversationalAgentSession](conversationalagentsession.md) (see [ConversationalAgentState](conversationalagentstate.md)). As a session is already in progress, the [ConversationalAgent](windows_applicationmodel_conversationalagent.md) can decide to use it in the context of the current session, or ignore it.
     * 
     * An example of this behavior is when the user utters "Hey Cortana, set a reminder", Cortana begins to respond with “What would you like... [to be reminded of?]”, and the user interrupts the response with additional instructions like "pick up flowers for mom". Cortana gets this new signal and stops speaking to process the new input in the context of the original intent detection.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsignal.signalcontext
     * @type {IInspectable} 
     */
    SignalContext {
        get => this.get_SignalContext()
        set => this.put_SignalContext(value)
    }

    /**
     * Gets or sets the time span of the [ConversationalAgentSignal](conversationalagentsignal.md) start.
     * @remarks
     * If the SignalStart and [SignalEnd](conversationalagentsignal_signalend.md) time spans are the same, this indicates that the signal is not a voice activation (for example, a keyboard press or Bluetooth activation).
     * 
     * If the SignalStart and [SignalEnd](conversationalagentsignal_signalend.md) time spans are different, they indicate the position of the keyword utterance in the audio stream.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsignal.signalstart
     * @type {TimeSpan} 
     */
    SignalStart {
        get => this.get_SignalStart()
        set => this.put_SignalStart(value)
    }

    /**
     * Gets or sets the time span of the [ConversationalAgentSignal](conversationalagentsignal.md) end.
     * @remarks
     * If the [SignalStart](conversationalagentsignal_signalstart.md) and SignalEnd time spans are the same, the signal is not a speech activation (for example, a keyboard press or Bluetooth activation).
     * 
     * If the [SignalStart](conversationalagentsignal_signalstart.md) and SignalEnd time spans are different, the values indicate the position of the keyword utterance in the audio stream.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsignal.signalend
     * @type {TimeSpan} 
     */
    SignalEnd {
        get => this.get_SignalEnd()
        set => this.put_SignalEnd(value)
    }

    /**
     * Gets the unique identifier of the [ActivationSignalDetector](activationsignaldetector.md) associated with the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @remarks
     * A possible use for this property includes logging statistics on detectors being used for signal detection.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsignal.detectorid
     * @type {HSTRING} 
     */
    DetectorId {
        get => this.get_DetectorId()
    }

    /**
     * Gets the type of the [ActivationSignalDetector](activationsignaldetector.md) associated with the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @remarks
     * This property can be used to determine how to handle a [SignalDetected](conversationalagentsession_signaldetected.md) event. Examples include:
     * 
     * - Signals generated by a [HardwareEvent:2](/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectorkind) (such as a keyboard button press or bluetooth headset) do not have the keyword audio in their payload.
     * - Signals generated by an [AudioPattern:0](/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectorkind) where the [ConversationalAgentSignal.IsSignalVerificationRequired] (conversationalagentsignal_issignalverificationrequired.md) is set to true need a secondary verification pass by the client to identify the keyword.
     * - Signals generated by an [AudioPattern:0](/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectorkind) where the [ConversationalAgentSignal.IsSignalVerificationRequired] (conversationalagentsignal_issignalverificationrequired.md) is set to false do not need secondary verification, but do include the keyword.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsignal.detectorkind
     * @type {Integer} 
     */
    DetectorKind {
        get => this.get_DetectorKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSignalVerificationRequired() {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.get_IsSignalVerificationRequired()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSignalVerificationRequired(value) {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.put_IsSignalVerificationRequired(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignalId() {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.get_SignalId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SignalId(value) {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.put_SignalId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignalName() {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.get_SignalName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SignalName(value) {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.put_SignalName(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SignalContext() {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.get_SignalContext()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SignalContext(value) {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.put_SignalContext(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SignalStart() {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.get_SignalStart()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_SignalStart(value) {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.put_SignalStart(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SignalEnd() {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.get_SignalEnd()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_SignalEnd(value) {
        if (!this.HasProp("__IConversationalAgentSignal")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal := IConversationalAgentSignal(outPtr)
        }

        return this.__IConversationalAgentSignal.put_SignalEnd(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DetectorId() {
        if (!this.HasProp("__IConversationalAgentSignal2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal2 := IConversationalAgentSignal2(outPtr)
        }

        return this.__IConversationalAgentSignal2.get_DetectorId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DetectorKind() {
        if (!this.HasProp("__IConversationalAgentSignal2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSignal2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSignal2 := IConversationalAgentSignal2(outPtr)
        }

        return this.__IConversationalAgentSignal2.get_DetectorKind()
    }

;@endregion Instance Methods
}
