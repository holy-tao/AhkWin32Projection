#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConversationalAgentSession.ahk
#Include .\IConversationalAgentSession2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IConversationalAgentSessionStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ConversationalAgentSession.ahk
#Include .\ConversationalAgentSessionInterruptedEventArgs.ahk
#Include .\ConversationalAgentSignalDetectedEventArgs.ahk
#Include .\ConversationalAgentSystemStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * The communication channel between the digital assistant and the Windows Conversational Agent platform.
 * @remarks
 * The ConversationalAgentSession is typically created through voice activation when a keyword utterance such as "Hey Cortana" or "Alexa" is recognized.
 * 
 * A ConversationalAgentSession can be created in various other ways, including Bluetooth (when a keyword utterance is transmitted through a headset or microphone), system keyboard accelerators (such as Win+C for Cortana), and initiation of speech interactions from within your app (perhaps through some kind of press-to-talk UI).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConversationalAgentSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConversationalAgentSession.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously retrieves a reference to the current [ConversationalAgentSession](conversationalagentsession.md).
     * @returns {IAsyncOperation<ConversationalAgentSession>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getcurrentsessionasync
     */
    static GetCurrentSessionAsync() {
        if (!ConversationalAgentSession.HasProp("__IConversationalAgentSessionStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.ConversationalAgent.ConversationalAgentSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IConversationalAgentSessionStatics.IID)
            ConversationalAgentSession.__IConversationalAgentSessionStatics := IConversationalAgentSessionStatics(factoryPtr)
        }

        return ConversationalAgentSession.__IConversationalAgentSessionStatics.GetCurrentSessionAsync()
    }

    /**
     * Synchronously retrieves a reference to the current [ConversationalAgentSession](conversationalagentsession.md).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetCurrentSessionAsync](conversationalagentsession_getcurrentsessionasync_1431188224.md) instead.
     * @returns {ConversationalAgentSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getcurrentsessionsync
     */
    static GetCurrentSessionSync() {
        if (!ConversationalAgentSession.HasProp("__IConversationalAgentSessionStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.ConversationalAgent.ConversationalAgentSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IConversationalAgentSessionStatics.IID)
            ConversationalAgentSession.__IConversationalAgentSessionStatics := IConversationalAgentSessionStatics(factoryPtr)
        }

        return ConversationalAgentSession.__IConversationalAgentSessionStatics.GetCurrentSessionSync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the state of the digital assistant.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.agentstate
     * @type {Integer} 
     */
    AgentState {
        get => this.get_AgentState()
    }

    /**
     * The [Signal](conversationalagentsignal.md) that activated the digital assistant, such as a keyword utterance, Bluetooth transmission, system keyboard accelerator, in-app speech recognition, or other sounds (door slam, smoke detector).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.signal
     * @type {ConversationalAgentSignal} 
     */
    Signal {
        get => this.get_Signal()
    }

    /**
     * Gets whether the indicator light is available.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.isindicatorlightavailable
     * @type {Boolean} 
     */
    IsIndicatorLightAvailable {
        get => this.get_IsIndicatorLightAvailable()
    }

    /**
     * Gets whether the screen can be turned on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.isscreenavailable
     * @type {Boolean} 
     */
    IsScreenAvailable {
        get => this.get_IsScreenAvailable()
    }

    /**
     * Gets whether the user is authenticated (for example, the device is locked).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.isuserauthenticated
     * @type {Boolean} 
     */
    IsUserAuthenticated {
        get => this.get_IsUserAuthenticated()
    }

    /**
     * Gets whether the digital assistant can be activated by speech input.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.isvoiceactivationavailable
     * @type {Boolean} 
     */
    IsVoiceActivationAvailable {
        get => this.get_IsVoiceActivationAvailable()
    }

    /**
     * Gets whether the [ConversationalAgentSession](conversationalagentsession.md) can be interrupted.
     * @remarks
     * Some digital assistant sessions cannot be interrupted by another signal. For example, Cortana requires the user to issue a cancel or stop command to end the current session (the user cannot be in a Cortana session and issue commands to Alexa).
     * 
     * If a session can be interrupted, the Windows Conversational Agent platform raises the [SessionInterrupted](conversationalagentsession_sessioninterrupted.md) event to indicate that the digital assistant app should set itself to inactive and stop processing input.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.isinterruptible
     * @type {Boolean} 
     */
    IsInterruptible {
        get => this.get_IsInterruptible()
    }

    /**
     * Gets whether the [ConversationalAgentSession](conversationalagentsession.md) is being interrupted.
     * @remarks
     * Some digital assistant sessions cannot be interrupted by another signal. For example, Cortana requires the user to issue a cancel or stop command to end the current session (the user cannot be in a Cortana session and issue commands to Alexa).
     * 
     * If a session can be interrupted, the Windows Conversational Agent platform raises the [SessionInterrupted](conversationalagentsession_sessioninterrupted.md) event to indicate that the digital assistant app should set itself to inactive and stop processing input.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.isinterrupted
     * @type {Boolean} 
     */
    IsInterrupted {
        get => this.get_IsInterrupted()
    }

    /**
     * Occurs when another digital assistant activation [signal](conversationalagentsignal.md) has been detected.
     * @remarks
     * Some digital assistant sessions cannot be interrupted by another signal. For example, Cortana requires the user to issue a cancel or stop command to end the current session (the user cannot be in a Cortana session and issue commands to Alexa).
     * 
     * If a session can be interrupted, the Windows Conversational Agent platform raises the SessionInterrupted event to indicate that the digital assistant app should set itself to inactive and stop processing input.
     * @type {TypedEventHandler<ConversationalAgentSession, ConversationalAgentSessionInterruptedEventArgs>}
    */
    OnSessionInterrupted {
        get {
            if(!this.HasProp("__OnSessionInterrupted")){
                this.__OnSessionInterrupted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e1c093f2-c2f4-58c6-9fd1-3beb13b18ec8}"),
                    ConversationalAgentSession,
                    ConversationalAgentSessionInterruptedEventArgs
                )
                this.__OnSessionInterruptedToken := this.add_SessionInterrupted(this.__OnSessionInterrupted.iface)
            }
            return this.__OnSessionInterrupted
        }
    }

    /**
     * Occurs when a [Signal](conversationalagentsignal.md) for activating a digital assistant is detected.
     * @remarks
     * Examples of activation [Signals](conversationalagentsignal.md) can include a keyword utterance, Bluetooth transmission, system keyboard accelerator, in-app speech recognition, or other sounds (door slam, smoke detector).
     * @type {TypedEventHandler<ConversationalAgentSession, ConversationalAgentSignalDetectedEventArgs>}
    */
    OnSignalDetected {
        get {
            if(!this.HasProp("__OnSignalDetected")){
                this.__OnSignalDetected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d4b78ffb-98b2-5004-9cb4-24dd755734fb}"),
                    ConversationalAgentSession,
                    ConversationalAgentSignalDetectedEventArgs
                )
                this.__OnSignalDetectedToken := this.add_SignalDetected(this.__OnSignalDetected.iface)
            }
            return this.__OnSignalDetected
        }
    }

    /**
     * Occurs when either the system or the user changes a setting that restricts the ability of the digital assistant to perform one or more actions.
     * @remarks
     * Typical triggers for this event include changes to policies on voice activation, privacy, screen/display, privacy, and Windows Conversational Agent platform capabilities.
     * @type {TypedEventHandler<ConversationalAgentSession, ConversationalAgentSystemStateChangedEventArgs>}
    */
    OnSystemStateChanged {
        get {
            if(!this.HasProp("__OnSystemStateChanged")){
                this.__OnSystemStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ac7da0c7-d0d3-5bac-bbc9-52ad49131f1f}"),
                    ConversationalAgentSession,
                    ConversationalAgentSystemStateChangedEventArgs
                )
                this.__OnSystemStateChangedToken := this.add_SystemStateChanged(this.__OnSystemStateChanged.iface)
            }
            return this.__OnSystemStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSessionInterruptedToken")) {
            this.remove_SessionInterrupted(this.__OnSessionInterruptedToken)
            this.__OnSessionInterrupted.iface.Dispose()
        }

        if(this.HasProp("__OnSignalDetectedToken")) {
            this.remove_SignalDetected(this.__OnSignalDetectedToken)
            this.__OnSignalDetected.iface.Dispose()
        }

        if(this.HasProp("__OnSystemStateChangedToken")) {
            this.remove_SystemStateChanged(this.__OnSystemStateChangedToken)
            this.__OnSystemStateChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<ConversationalAgentSession, ConversationalAgentSessionInterruptedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionInterrupted(handler) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.add_SessionInterrupted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionInterrupted(token) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.remove_SessionInterrupted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ConversationalAgentSession, ConversationalAgentSignalDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SignalDetected(handler) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.add_SignalDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SignalDetected(token) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.remove_SignalDetected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ConversationalAgentSession, ConversationalAgentSystemStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SystemStateChanged(handler) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.add_SystemStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SystemStateChanged(token) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.remove_SystemStateChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AgentState() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.get_AgentState()
    }

    /**
     * 
     * @returns {ConversationalAgentSignal} 
     */
    get_Signal() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.get_Signal()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIndicatorLightAvailable() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.get_IsIndicatorLightAvailable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScreenAvailable() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.get_IsScreenAvailable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserAuthenticated() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.get_IsUserAuthenticated()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVoiceActivationAvailable() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.get_IsVoiceActivationAvailable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInterruptible() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.get_IsInterruptible()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInterrupted() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.get_IsInterrupted()
    }

    /**
     * Asynchronously requests that this [ConversationalAgentSession](conversationalagentsession.md) be interruptible if the keyword for another digital assistant is detected.
     * @remarks
     * Some digital assistant sessions cannot be interrupted by another signal. For example, Cortana requires the user to issue a cancel or stop command to end the current session (the user cannot be in a Cortana session and issue commands to Alexa).
     * 
     * If a session can be interrupted, the Windows Conversational Agent platform raises the [SessionInterrupted](conversationalagentsession_sessioninterrupted.md) event to indicate that the digital assistant app should set itself to inactive and stop processing input.
     * @param {Boolean} interruptible True, if interruptible; otherwise, false.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.requestinterruptibleasync
     */
    RequestInterruptibleAsync(interruptible) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.RequestInterruptibleAsync(interruptible)
    }

    /**
     * Synchronously requests that this [ConversationalAgentSession](conversationalagentsession.md) be interruptible if the keyword for another digital assistant is detected.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [RequestInterruptibleAsync](conversationalagentsession_requestinterruptibleasync_1030348212.md) instead.
     * @remarks
     * Some digital assistant sessions cannot be interrupted by another signal. For example, Cortana requires the user to issue a cancel or stop command to end the current session (the user cannot be in a Cortana session and issue commands to Alexa).
     * 
     * If a session can be interrupted, the Windows Conversational Agent platform raises the [SessionInterrupted](conversationalagentsession_sessioninterrupted.md) event to indicate that the digital assistant app should set itself to inactive and stop processing input.
     * @param {Boolean} interruptible True, if interruptible; otherwise, false.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.requestinterruptible
     */
    RequestInterruptible(interruptible) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.RequestInterruptible(interruptible)
    }

    /**
     * Asynchronously requests a state change for the current [ConversationalAgentSession](conversationalagentsession.md).
     * @param {Integer} state The [AgentState](conversationalagentsession_agentstate.md) requested.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.requestagentstatechangeasync
     */
    RequestAgentStateChangeAsync(state) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.RequestAgentStateChangeAsync(state)
    }

    /**
     * Synchronously requests a state change for the current [ConversationalAgentSession](conversationalagentsession.md).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [RequestAgentStateChangeAsync](conversationalagentsession_requestagentstatechangeasync_1892921766.md) instead.
     * @param {Integer} state The [AgentState](conversationalagentsession_agentstate.md) requested.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.requestagentstatechange
     */
    RequestAgentStateChange(state) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.RequestAgentStateChange(state)
    }

    /**
     * Asynchronously requests that the digital assistant be activated to the foreground.
     * @remarks
     * Use this method to provide some kind of UI response in your app. Digital assistant voice responses can be initiated from a background task.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.requestforegroundactivationasync
     */
    RequestForegroundActivationAsync() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.RequestForegroundActivationAsync()
    }

    /**
     * Synchronously requests that the digital assistant be activated to the foreground.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [RequestForegroundActivationAsync](conversationalagentsession_requestforegroundactivationasync_303330599.md) instead.
     * @remarks
     * Use this method to provide some kind of UI response in your app. Digital assistant voice responses can be initiated from a background task.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.requestforegroundactivation
     */
    RequestForegroundActivation() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.RequestForegroundActivation()
    }

    /**
     * Asynchronously retrieves an [IAudioClient](/windows/desktop/api/audioclient/nn-audioclient-iaudioclient) object that creates and initializes an audio stream between your application and the audio rendering device.
     * @returns {IAsyncOperation<IInspectable>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getaudioclientasync
     */
    GetAudioClientAsync() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetAudioClientAsync()
    }

    /**
     * Synchronously retrieves an [IAudioClient](/windows/desktop/api/audioclient/nn-audioclient-iaudioclient) object that creates and initializes an audio stream between your application and the audio rendering device.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetAudioClientAsync](conversationalagentsession_getaudioclientasync_428364567.md) instead.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getaudioclient
     */
    GetAudioClient() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetAudioClient()
    }

    /**
     * Asynchronously creates an audio graph input node.
     * @param {AudioGraph} graph An audio graph that represents the connected input, output, and submix nodes for manipulating and routing audio.
     * @returns {IAsyncOperation<AudioDeviceInputNode>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.createaudiodeviceinputnodeasync
     */
    CreateAudioDeviceInputNodeAsync(graph) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.CreateAudioDeviceInputNodeAsync(graph)
    }

    /**
     * Synchronously creates an audio graph input node.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [CreateAudioDeviceInputNodeAsync](conversationalagentsession_createaudiodeviceinputnodeasync_1477409751.md) instead.
     * @param {AudioGraph} graph An audio graph that represents the connected input, output, and submix nodes for manipulating and routing audio.
     * @returns {AudioDeviceInputNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.createaudiodeviceinputnode
     */
    CreateAudioDeviceInputNode(graph) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.CreateAudioDeviceInputNode(graph)
    }

    /**
     * Asynchronously retrieves the device ID for the current speech input device.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getaudiocapturedeviceidasync
     */
    GetAudioCaptureDeviceIdAsync() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetAudioCaptureDeviceIdAsync()
    }

    /**
     * Synchronously retrieves the device ID for the current speech input device.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetAudioCaptureDeviceIdAsync](conversationalagentsession_getaudiocapturedeviceidasync_634409861.md) instead.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getaudiocapturedeviceid
     */
    GetAudioCaptureDeviceId() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetAudioCaptureDeviceId()
    }

    /**
     * Asynchronously retrieves the device ID for the current speech output device.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getaudiorenderdeviceidasync
     */
    GetAudioRenderDeviceIdAsync() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetAudioRenderDeviceIdAsync()
    }

    /**
     * Synchronously retrieves the device ID for the current speech output device.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetAudioRenderDeviceIdAsync](conversationalagentsession_getaudiorenderdeviceidasync_1057232923.md) instead.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getaudiorenderdeviceid
     */
    GetAudioRenderDeviceId() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetAudioRenderDeviceId()
    }

    /**
     * Asynchronously retrieves the unique model identifier of the [Signal](conversationalagentsignal.md) that activated the conversational agent.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getsignalmodelidasync
     */
    GetSignalModelIdAsync() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetSignalModelIdAsync()
    }

    /**
     * Retrieves the unique model identifier of the [Signal](conversationalagentsignal.md) that activated the conversational agent.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetSignalModelIdAsync](conversationalagentsession_getsignalmodelidasync_318358985.md) instead.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getsignalmodelid
     */
    GetSignalModelId() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetSignalModelId()
    }

    /**
     * Asynchronously assigns a unique identifier to the model representing the activation audio signal for the conversational agent.
     * @param {Integer} signalModelId The unique identifier.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.setsignalmodelidasync
     */
    SetSignalModelIdAsync(signalModelId) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.SetSignalModelIdAsync(signalModelId)
    }

    /**
     * Assigns a unique identifier to the model representing the activation audio signal for the conversational agent.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [SetSignalModelIdAsync](conversationalagentsession_setsignalmodelidasync_1536264347.md) instead.
     * @param {Integer} signalModelId The unique identifier.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.setsignalmodelid
     */
    SetSignalModelId(signalModelId) {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.SetSignalModelId(signalModelId)
    }

    /**
     * Asynchronously retrieves the collection of unique [Signal](conversationalagentsignal.md) model identifiers supported by the conversational agent.
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getsupportedsignalmodelidsasync
     */
    GetSupportedSignalModelIdsAsync() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetSupportedSignalModelIdsAsync()
    }

    /**
     * Retrieves the collection of unique [Signal](conversationalagentsignal.md) model identifiers supported by the conversational agent.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetSupportedSignalModelIdsAsync](conversationalagentsession_getsupportedsignalmodelidsasync_150685345.md) instead.
     * @returns {IVectorView<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getsupportedsignalmodelids
     */
    GetSupportedSignalModelIds() {
        if (!this.HasProp("__IConversationalAgentSession")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession := IConversationalAgentSession(outPtr)
        }

        return this.__IConversationalAgentSession.GetSupportedSignalModelIds()
    }

    /**
     * Asynchronously requests that the digital assistant be activated to the foreground.
     * @remarks
     * This is an updated version of the [RequestForegroundActivationAsync](conversationalagentsession_requestforegroundactivationasync_303330599.md) method.
     * @param {Integer} activationKind_ The supported agent activation type.
     * 
     * When activation is requested, you can choose whether the agent is activated in a voice activation preview window or normal window.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.requestactivationasync
     */
    RequestActivationAsync(activationKind_) {
        if (!this.HasProp("__IConversationalAgentSession2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession2 := IConversationalAgentSession2(outPtr)
        }

        return this.__IConversationalAgentSession2.RequestActivationAsync(activationKind_)
    }

    /**
     * Requests that the digital assistant be activated to the foreground.
     * @remarks
     * This is an updated version of the [RequestForegroundActivationAsync](conversationalagentsession_requestforegroundactivationasync_303330599.md) method.
     * @param {Integer} activationKind_ The supported agent activation type.
     * 
     * When activation is requested, you can choose whether the agent is activated in a voice activation preview window or normal window.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.requestactivation
     */
    RequestActivation(activationKind_) {
        if (!this.HasProp("__IConversationalAgentSession2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession2 := IConversationalAgentSession2(outPtr)
        }

        return this.__IConversationalAgentSession2.RequestActivation(activationKind_)
    }

    /**
     * Asynchronously enables or disables support for lock screen activation of the conversational agent.
     * @param {Boolean} lockScreenActivationSupported True, if lock screen activation is enabled. Otherwise, false.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.setsupportlockscreenactivationasync
     */
    SetSupportLockScreenActivationAsync(lockScreenActivationSupported) {
        if (!this.HasProp("__IConversationalAgentSession2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession2 := IConversationalAgentSession2(outPtr)
        }

        return this.__IConversationalAgentSession2.SetSupportLockScreenActivationAsync(lockScreenActivationSupported)
    }

    /**
     * Enables or disables support for lock screen activation of the conversational agent.
     * @param {Boolean} lockScreenActivationSupported True, if lock screen activation is enabled. Otherwise, false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.setsupportlockscreenactivation
     */
    SetSupportLockScreenActivation(lockScreenActivationSupported) {
        if (!this.HasProp("__IConversationalAgentSession2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession2 := IConversationalAgentSession2(outPtr)
        }

        return this.__IConversationalAgentSession2.SetSupportLockScreenActivation(lockScreenActivationSupported)
    }

    /**
     * Gets missing prerequisites that are required for voice activation to become available and function properly.
     * @remarks
     * Note that the permission for voice activation still needs to be granted separately and is not part of the prerequisites.
     * 
     * Missing prerequisites may prevent granting the voice activation permission.
     * @returns {IVectorView<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getmissingprerequisites
     */
    GetMissingPrerequisites() {
        if (!this.HasProp("__IConversationalAgentSession2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession2 := IConversationalAgentSession2(outPtr)
        }

        return this.__IConversationalAgentSession2.GetMissingPrerequisites()
    }

    /**
     * Gets missing prerequisites for voice activation to become available and function properly.
     * @remarks
     * Note that the permission for voice activation still needs to be granted separately and is not part of the prerequisites.
     * 
     * Missing prerequisites may prevent granting the voice activation permission.
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.getmissingprerequisitesasync
     */
    GetMissingPrerequisitesAsync() {
        if (!this.HasProp("__IConversationalAgentSession2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSession2 := IConversationalAgentSession2(outPtr)
        }

        return this.__IConversationalAgentSession2.GetMissingPrerequisitesAsync()
    }

    /**
     * Terminates the [ConversationalAgentSession](conversationalagentsession.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsession.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
