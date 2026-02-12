#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioFrameInputNode.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\CreateAudioDeviceInputNodeResult.ahk
#Include .\AudioFrameOutputNode.ahk
#Include .\CreateAudioDeviceOutputNodeResult.ahk
#Include .\CreateAudioFileInputNodeResult.ahk
#Include .\CreateAudioFileOutputNodeResult.ahk
#Include .\AudioSubmixNode.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\MediaProperties\AudioEncodingProperties.ahk
#Include ..\..\Devices\Enumeration\DeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioGraph extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioGraph
     * @type {Guid}
     */
    static IID => Guid("{1ad46eed-e48c-4e14-9660-2c4f83e9cdd8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFrameInputNode", "CreateFrameInputNodeWithFormat", "CreateDeviceInputNodeAsync", "CreateDeviceInputNodeWithFormatAsync", "CreateDeviceInputNodeWithFormatOnDeviceAsync", "CreateFrameOutputNode", "CreateFrameOutputNodeWithFormat", "CreateDeviceOutputNodeAsync", "CreateFileInputNodeAsync", "CreateFileOutputNodeAsync", "CreateFileOutputNodeWithFileProfileAsync", "CreateSubmixNode", "CreateSubmixNodeWithFormat", "Start", "Stop", "ResetAllNodes", "add_QuantumStarted", "remove_QuantumStarted", "add_QuantumProcessed", "remove_QuantumProcessed", "add_UnrecoverableErrorOccurred", "remove_UnrecoverableErrorOccurred", "get_CompletedQuantumCount", "get_EncodingProperties", "get_LatencyInSamples", "get_PrimaryRenderDevice", "get_RenderDeviceAudioProcessing", "get_SamplesPerQuantum"]

    /**
     * @type {Integer} 
     */
    CompletedQuantumCount {
        get => this.get_CompletedQuantumCount()
    }

    /**
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * @type {Integer} 
     */
    LatencyInSamples {
        get => this.get_LatencyInSamples()
    }

    /**
     * @type {DeviceInformation} 
     */
    PrimaryRenderDevice {
        get => this.get_PrimaryRenderDevice()
    }

    /**
     * @type {Integer} 
     */
    RenderDeviceAudioProcessing {
        get => this.get_RenderDeviceAudioProcessing()
    }

    /**
     * @type {Integer} 
     */
    SamplesPerQuantum {
        get => this.get_SamplesPerQuantum()
    }

    /**
     * 
     * @returns {AudioFrameInputNode} 
     */
    CreateFrameInputNode() {
        result := ComCall(6, this, "ptr*", &frameInputNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioFrameInputNode(frameInputNode)
    }

    /**
     * 
     * @param {AudioEncodingProperties} encodingProperties 
     * @returns {AudioFrameInputNode} 
     */
    CreateFrameInputNodeWithFormat(encodingProperties) {
        result := ComCall(7, this, "ptr", encodingProperties, "ptr*", &frameInputNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioFrameInputNode(frameInputNode)
    }

    /**
     * 
     * @param {Integer} category 
     * @returns {IAsyncOperation<CreateAudioDeviceInputNodeResult>} 
     */
    CreateDeviceInputNodeAsync(category) {
        result := ComCall(8, this, "int", category, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateAudioDeviceInputNodeResult, result_)
    }

    /**
     * 
     * @param {Integer} category 
     * @param {AudioEncodingProperties} encodingProperties 
     * @returns {IAsyncOperation<CreateAudioDeviceInputNodeResult>} 
     */
    CreateDeviceInputNodeWithFormatAsync(category, encodingProperties) {
        result := ComCall(9, this, "int", category, "ptr", encodingProperties, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateAudioDeviceInputNodeResult, result_)
    }

    /**
     * 
     * @param {Integer} category 
     * @param {AudioEncodingProperties} encodingProperties 
     * @param {DeviceInformation} device 
     * @returns {IAsyncOperation<CreateAudioDeviceInputNodeResult>} 
     */
    CreateDeviceInputNodeWithFormatOnDeviceAsync(category, encodingProperties, device) {
        result := ComCall(10, this, "int", category, "ptr", encodingProperties, "ptr", device, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateAudioDeviceInputNodeResult, result_)
    }

    /**
     * 
     * @returns {AudioFrameOutputNode} 
     */
    CreateFrameOutputNode() {
        result := ComCall(11, this, "ptr*", &frameOutputNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioFrameOutputNode(frameOutputNode)
    }

    /**
     * 
     * @param {AudioEncodingProperties} encodingProperties 
     * @returns {AudioFrameOutputNode} 
     */
    CreateFrameOutputNodeWithFormat(encodingProperties) {
        result := ComCall(12, this, "ptr", encodingProperties, "ptr*", &frameOutputNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioFrameOutputNode(frameOutputNode)
    }

    /**
     * 
     * @returns {IAsyncOperation<CreateAudioDeviceOutputNodeResult>} 
     */
    CreateDeviceOutputNodeAsync() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateAudioDeviceOutputNodeResult, result_)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<CreateAudioFileInputNodeResult>} 
     */
    CreateFileInputNodeAsync(file_) {
        result := ComCall(14, this, "ptr", file_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateAudioFileInputNodeResult, result_)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<CreateAudioFileOutputNodeResult>} 
     */
    CreateFileOutputNodeAsync(file_) {
        result := ComCall(15, this, "ptr", file_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateAudioFileOutputNodeResult, result_)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {MediaEncodingProfile} fileEncodingProfile 
     * @returns {IAsyncOperation<CreateAudioFileOutputNodeResult>} 
     */
    CreateFileOutputNodeWithFileProfileAsync(file_, fileEncodingProfile) {
        result := ComCall(16, this, "ptr", file_, "ptr", fileEncodingProfile, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateAudioFileOutputNodeResult, result_)
    }

    /**
     * 
     * @returns {AudioSubmixNode} 
     */
    CreateSubmixNode() {
        result := ComCall(17, this, "ptr*", &submixNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioSubmixNode(submixNode)
    }

    /**
     * 
     * @param {AudioEncodingProperties} encodingProperties 
     * @returns {AudioSubmixNode} 
     */
    CreateSubmixNodeWithFormat(encodingProperties) {
        result := ComCall(18, this, "ptr", encodingProperties, "ptr*", &submixNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioSubmixNode(submixNode)
    }

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetAllNodes() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AudioGraph, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuantumStarted(handler) {
        token := EventRegistrationToken()
        result := ComCall(22, this, "ptr", handler, "ptr", token, "int")
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
    remove_QuantumStarted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AudioGraph, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuantumProcessed(handler) {
        token := EventRegistrationToken()
        result := ComCall(24, this, "ptr", handler, "ptr", token, "int")
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
    remove_QuantumProcessed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(25, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AudioGraph, AudioGraphUnrecoverableErrorOccurredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnrecoverableErrorOccurred(handler) {
        token := EventRegistrationToken()
        result := ComCall(26, this, "ptr", handler, "ptr", token, "int")
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
    remove_UnrecoverableErrorOccurred(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(27, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompletedQuantumCount() {
        result := ComCall(28, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_EncodingProperties() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LatencyInSamples() {
        result := ComCall(30, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_PrimaryRenderDevice() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RenderDeviceAudioProcessing() {
        result := ComCall(32, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SamplesPerQuantum() {
        result := ComCall(33, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
