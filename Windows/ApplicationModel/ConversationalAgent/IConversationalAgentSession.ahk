#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\ConversationalAgentSignal.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Media\Audio\AudioDeviceInputNode.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IConversationalAgentSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConversationalAgentSession
     * @type {Guid}
     */
    static IID => Guid("{daaae09a-b7ba-57e5-ad13-df520f9b6fa7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_SessionInterrupted", "remove_SessionInterrupted", "add_SignalDetected", "remove_SignalDetected", "add_SystemStateChanged", "remove_SystemStateChanged", "get_AgentState", "get_Signal", "get_IsIndicatorLightAvailable", "get_IsScreenAvailable", "get_IsUserAuthenticated", "get_IsVoiceActivationAvailable", "get_IsInterruptible", "get_IsInterrupted", "RequestInterruptibleAsync", "RequestInterruptible", "RequestAgentStateChangeAsync", "RequestAgentStateChange", "RequestForegroundActivationAsync", "RequestForegroundActivation", "GetAudioClientAsync", "GetAudioClient", "CreateAudioDeviceInputNodeAsync", "CreateAudioDeviceInputNode", "GetAudioCaptureDeviceIdAsync", "GetAudioCaptureDeviceId", "GetAudioRenderDeviceIdAsync", "GetAudioRenderDeviceId", "GetSignalModelIdAsync", "GetSignalModelId", "SetSignalModelIdAsync", "SetSignalModelId", "GetSupportedSignalModelIdsAsync", "GetSupportedSignalModelIds"]

    /**
     * @type {Integer} 
     */
    AgentState {
        get => this.get_AgentState()
    }

    /**
     * @type {ConversationalAgentSignal} 
     */
    Signal {
        get => this.get_Signal()
    }

    /**
     * @type {Boolean} 
     */
    IsIndicatorLightAvailable {
        get => this.get_IsIndicatorLightAvailable()
    }

    /**
     * @type {Boolean} 
     */
    IsScreenAvailable {
        get => this.get_IsScreenAvailable()
    }

    /**
     * @type {Boolean} 
     */
    IsUserAuthenticated {
        get => this.get_IsUserAuthenticated()
    }

    /**
     * @type {Boolean} 
     */
    IsVoiceActivationAvailable {
        get => this.get_IsVoiceActivationAvailable()
    }

    /**
     * @type {Boolean} 
     */
    IsInterruptible {
        get => this.get_IsInterruptible()
    }

    /**
     * @type {Boolean} 
     */
    IsInterrupted {
        get => this.get_IsInterrupted()
    }

    /**
     * 
     * @param {TypedEventHandler<ConversationalAgentSession, ConversationalAgentSessionInterruptedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionInterrupted(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionInterrupted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ConversationalAgentSession, ConversationalAgentSignalDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SignalDetected(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SignalDetected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ConversationalAgentSession, ConversationalAgentSystemStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SystemStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SystemStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AgentState() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ConversationalAgentSignal} 
     */
    get_Signal() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConversationalAgentSignal(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIndicatorLightAvailable() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScreenAvailable() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserAuthenticated() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVoiceActivationAvailable() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInterruptible() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInterrupted() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} interruptible 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestInterruptibleAsync(interruptible) {
        result := ComCall(20, this, "int", interruptible, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Boolean} interruptible 
     * @returns {Integer} 
     */
    RequestInterruptible(interruptible) {
        result := ComCall(21, this, "int", interruptible, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} state 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAgentStateChangeAsync(state) {
        result := ComCall(22, this, "int", state, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Integer} state 
     * @returns {Integer} 
     */
    RequestAgentStateChange(state) {
        result := ComCall(23, this, "int", state, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestForegroundActivationAsync() {
        result := ComCall(24, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    RequestForegroundActivation() {
        result := ComCall(25, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<IInspectable>} 
     */
    GetAudioClientAsync() {
        result := ComCall(26, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IInspectable, operation)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    GetAudioClient() {
        result := ComCall(27, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {AudioGraph} graph 
     * @returns {IAsyncOperation<AudioDeviceInputNode>} 
     */
    CreateAudioDeviceInputNodeAsync(graph) {
        result := ComCall(28, this, "ptr", graph, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AudioDeviceInputNode, operation)
    }

    /**
     * 
     * @param {AudioGraph} graph 
     * @returns {AudioDeviceInputNode} 
     */
    CreateAudioDeviceInputNode(graph) {
        result := ComCall(29, this, "ptr", graph, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioDeviceInputNode(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetAudioCaptureDeviceIdAsync() {
        result := ComCall(30, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAudioCaptureDeviceId() {
        result_ := HSTRING()
        result := ComCall(31, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetAudioRenderDeviceIdAsync() {
        result := ComCall(32, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAudioRenderDeviceId() {
        result_ := HSTRING()
        result := ComCall(33, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetSignalModelIdAsync() {
        result := ComCall(34, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSignalModelId() {
        result := ComCall(35, this, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} signalModelId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    SetSignalModelIdAsync(signalModelId) {
        result := ComCall(36, this, "uint", signalModelId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} signalModelId 
     * @returns {Boolean} 
     */
    SetSignalModelId(signalModelId) {
        result := ComCall(37, this, "uint", signalModelId, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     */
    GetSupportedSignalModelIdsAsync() {
        result := ComCall(38, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => IPropertyValue(ptr).GetUInt32()), operation)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    GetSupportedSignalModelIds() {
        result := ComCall(39, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), result_)
    }
}
