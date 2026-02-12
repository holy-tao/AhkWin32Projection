#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioGraph.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IAudioGraph2.ahk
#Include .\IAudioGraph3.ahk
#Include .\IAudioGraphStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioGraph.ahk
#Include .\AudioGraphUnrecoverableErrorOccurredEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an audio graph of connected input, output, and submix nodes that manipulate and route audio.
 * @remarks
 * The audio graph is made up of input nodes, output nodes, and submix nodes. Input nodes include audio files, audio devices, and code that generates audio data. Output nodes also include audio files, audio devices, and code that processes audio data. When the graph is started, audio data flows through the graph from the input nodes, through any submix nodes, to the output nodes. Each node can have zero or more audio effects that are applied to the audio data before it is passed to the next node. This class and related APIs enable you to develop audio applications more quickly and easily than the low-level COM XAudio2 APIs. For how-to guidance on using audio graphs, see [Audio graphs](/windows/uwp/audio-video-camera/audio-graphs).
 * 
 * Get an instance of this class by calling [AudioGraph.CreateAsync](audiograph_createasync_145006550.md).
 * 
 * The entire audio graph must operate at the same sample rate. Sources can have different sample rates, but are resampled immediately.
 * 
 * > [!NOTE]
 * > If no audio devices are available, the audio graph cannot be instantiated.
 * 
 * > AudioGraph cannot be instantiated on the N and KN editions of Windows 8 and Windows 10, unless the optional Media Feature Pack has been installed.
 * For more information, see [Media Feature Pack for Windows N editions](https://support.microsoft.com/help/3145500/media-feature-pack-list-for-windows-n-editions).
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioGraph extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioGraph

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioGraph.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an audio graph with specific settings.
     * @param {AudioGraphSettings} settings An [AudioGraphSettings](audiographsettings.md) object representing the source audio file.
     * @returns {IAsyncOperation<CreateAudioGraphResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createasync
     */
    static CreateAsync(settings) {
        if (!AudioGraph.HasProp("__IAudioGraphStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioGraph")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioGraphStatics.IID)
            AudioGraph.__IAudioGraphStatics := IAudioGraphStatics(factoryPtr)
        }

        return AudioGraph.__IAudioGraphStatics.CreateAsync(settings)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the completed quantum count for the audio graph.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.completedquantumcount
     * @type {Integer} 
     */
    CompletedQuantumCount {
        get => this.get_CompletedQuantumCount()
    }

    /**
     * Gets the encoding properties for the audio graph.
     * @remarks
     * Specify the encoding properties for an audio graph by setting the [AudioGraphSettings.EncodingProperties](audiographsettings_encodingproperties.md) property before creating the audio graph with a call to [CreateAsync](audiograph_createasync_145006550.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.encodingproperties
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * Gets the latency in samples that the audio graph supports.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.latencyinsamples
     * @type {Integer} 
     */
    LatencyInSamples {
        get => this.get_LatencyInSamples()
    }

    /**
     * Gets the primary render device for the audio graph.
     * @remarks
     * Specify the primary rendering device for an audio graph by setting the [AudioGraphSettings.PrimaryRenderDevice](audiographsettings_primaryrenderdevice.md) property before creating the audio graph with a call to [CreateAsync](audiograph_createasync_145006550.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.primaryrenderdevice
     * @type {DeviceInformation} 
     */
    PrimaryRenderDevice {
        get => this.get_PrimaryRenderDevice()
    }

    /**
     * Gets a value that indicates the audio processing mode for the audio graph.
     * @remarks
     * Specify the audio processing mode for an audio graph by setting the [AudioGraphSettings.AudioProcessing](audiographsettings_desiredrenderdeviceaudioprocessing.md) property before creating the audio graph with a call to [CreateAsync](audiograph_createasync_145006550.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.renderdeviceaudioprocessing
     * @type {Integer} 
     */
    RenderDeviceAudioProcessing {
        get => this.get_RenderDeviceAudioProcessing()
    }

    /**
     * Gets the number of samples per quantum at which the audio graph is currently operating.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.samplesperquantum
     * @type {Integer} 
     */
    SamplesPerQuantum {
        get => this.get_SamplesPerQuantum()
    }

    /**
     * Notifies that the audio graph has started processing a new quantum.
     * @remarks
     * The **QuantumStarted** event is synchronous, which means that you can't update the properties or state of the [AudioGraph](audiograph.md) or the individual audio nodes in the handler for this event. Attempting perform an operation such as stopping the audio graph or adding, removing, or starting an individual audio node will result in an exception being thrown. You can change the state of the graph and its nodes from within the asynchronous [QuantumProcessed](audiograph_quantumprocessed.md) event handler.
     * 
     * Because this event is synchronous and fires regularly on the processing cadence of the audio graph, the event handler can be used for synchronized processing of audio data, such as that obtained from the [AudioFrameOutputNode.GetFrame](audioframeoutputnode_getframe_21670008.md) method.
     * @type {TypedEventHandler<AudioGraph, IInspectable>}
    */
    OnQuantumStarted {
        get {
            if(!this.HasProp("__OnQuantumStarted")){
                this.__OnQuantumStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e1407134-09e7-53de-b54c-8a0659397b88}"),
                    AudioGraph,
                    IInspectable
                )
                this.__OnQuantumStartedToken := this.add_QuantumStarted(this.__OnQuantumStarted.iface)
            }
            return this.__OnQuantumStarted
        }
    }

    /**
     * Notifies that the audio graph has processed the specified quantum.
     * @remarks
     * The **QuantumProcessed** event is asynchronous, which means that you can update the properties and state of the [AudioGraph](audiograph.md) and individual audio nodes in the handler for this event. However, because this event is asynchronous and raised only after the audio engine has completed processing, it is not raised on a regular cadence and it should not be used for synchronized processing of audio data such as that obtained from the [AudioFrameOutputNode.GetFrame](audioframeoutputnode_getframe_21670008.md) method. Instead, it is recommended that you use the [QuantumStarted](audiograph_quantumstarted.md) event for synchronized audio processing.
     * @type {TypedEventHandler<AudioGraph, IInspectable>}
    */
    OnQuantumProcessed {
        get {
            if(!this.HasProp("__OnQuantumProcessed")){
                this.__OnQuantumProcessed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e1407134-09e7-53de-b54c-8a0659397b88}"),
                    AudioGraph,
                    IInspectable
                )
                this.__OnQuantumProcessedToken := this.add_QuantumProcessed(this.__OnQuantumProcessed.iface)
            }
            return this.__OnQuantumProcessed
        }
    }

    /**
     * Notifies of an unrecoverable audio error in audio graph operation.
     * @type {TypedEventHandler<AudioGraph, AudioGraphUnrecoverableErrorOccurredEventArgs>}
    */
    OnUnrecoverableErrorOccurred {
        get {
            if(!this.HasProp("__OnUnrecoverableErrorOccurred")){
                this.__OnUnrecoverableErrorOccurred := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{899670c9-dd7f-5f12-98cb-8b17fe80a47f}"),
                    AudioGraph,
                    AudioGraphUnrecoverableErrorOccurredEventArgs
                )
                this.__OnUnrecoverableErrorOccurredToken := this.add_UnrecoverableErrorOccurred(this.__OnUnrecoverableErrorOccurred.iface)
            }
            return this.__OnUnrecoverableErrorOccurred
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnQuantumStartedToken")) {
            this.remove_QuantumStarted(this.__OnQuantumStartedToken)
            this.__OnQuantumStarted.iface.Dispose()
        }

        if(this.HasProp("__OnQuantumProcessedToken")) {
            this.remove_QuantumProcessed(this.__OnQuantumProcessedToken)
            this.__OnQuantumProcessed.iface.Dispose()
        }

        if(this.HasProp("__OnUnrecoverableErrorOccurredToken")) {
            this.remove_UnrecoverableErrorOccurred(this.__OnUnrecoverableErrorOccurredToken)
            this.__OnUnrecoverableErrorOccurred.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Creates an [AudioFrameInputNode](audioframeinputnode.md), with the specified encoding properties, that inputs audio data generated by app-implemented code into the audio graph.
     * @returns {AudioFrameInputNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createframeinputnode
     */
    CreateFrameInputNode() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateFrameInputNode()
    }

    /**
     * Creates a spatial audio-enabled [AudioFrameInputNode](audioframeinputnode.md), with the specified encoding properties, that inputs audio data generated by app-implemented code into the audio graph.
     * @param {AudioEncodingProperties} encodingProperties An object representing the audio encoding properties for the frame input node which specifies the sample rate at which the created node will operate. Only uncompressed PCM and float formats are allowed.
     * @returns {AudioFrameInputNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createframeinputnode
     */
    CreateFrameInputNodeWithFormat(encodingProperties) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateFrameInputNodeWithFormat(encodingProperties)
    }

    /**
     * Creates an [AudioDeviceInputNode](audiodeviceinputnode.md) that inputs audio data into the audio graph from the default audio input device such as a microphone or audio card.
     * @remarks
     * Other overloads of this method allow you to specify the ID of a specific audio device instead of using the system's default device.
     * @param {Integer} category A value from the [MediaCategory](../windows.media.capture/mediacategory.md) enumeration value indicating the category of the media processed by this node, allowing the system to perform content-appropriate processing and prioritization of the media.
     * @returns {IAsyncOperation<CreateAudioDeviceInputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createdeviceinputnodeasync
     */
    CreateDeviceInputNodeAsync(category) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateDeviceInputNodeAsync(category)
    }

    /**
     * Creates an [AudioDeviceInputNode](audiodeviceinputnode.md) that inputs audio data into the audio graph from the specified audio input device such as a microphone or audio card.
     * @remarks
     * Call [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_326280522.md), passing in the value returned by [GetAudioCaptureSelector](../windows.media.devices/mediadevice_getaudiocaptureselector_829052994.md), to get the list of  [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects representing the available capture devices. For more information, see [Audio graphs](/windows/uwp/audio-video-camera/audio-graphs).
     * @param {Integer} category A value from the [MediaCategory](../windows.media.capture/mediacategory.md) enumeration value indicating the category of the media processed by this node, allowing the system to perform content-appropriate processing and prioritization of the media.
     * @param {AudioEncodingProperties} encodingProperties An object representing the audio encoding properties for the device input node which specifies the sample rate at which the created node will operate. Only uncompressed PCM and float formats are allowed.
     * @returns {IAsyncOperation<CreateAudioDeviceInputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createdeviceinputnodeasync
     */
    CreateDeviceInputNodeWithFormatAsync(category, encodingProperties) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateDeviceInputNodeWithFormatAsync(category, encodingProperties)
    }

    /**
     * Creates a spatial audio-enabled [AudioDeviceInputNode](audiodeviceinputnode.md) that inputs audio data into the audio graph from the specified audio input device such as a microphone or audio card.
     * @remarks
     * Call [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_326280522.md), passing in the value returned by [GetAudioCaptureSelector](../windows.media.devices/mediadevice_getaudiocaptureselector_829052994.md), to get the list of  [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects representing the available capture devices. For more information, see [Audio graphs](/windows/uwp/audio-video-camera/audio-graphs).
     * @param {Integer} category A value from the [MediaCategory](../windows.media.capture/mediacategory.md) enumeration value indicating the category of the media processed by this node, allowing the system to perform content-appropriate processing and prioritization of the media.
     * @param {AudioEncodingProperties} encodingProperties An object representing the audio encoding properties for the device input node which specifies the sample rate at which the created node will operate. Only uncompressed PCM and float formats are allowed.
     * @param {DeviceInformation} device A [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object representing the device from which the device input node will get audio data.
     * @returns {IAsyncOperation<CreateAudioDeviceInputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createdeviceinputnodeasync
     */
    CreateDeviceInputNodeWithFormatOnDeviceAsync(category, encodingProperties, device) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateDeviceInputNodeWithFormatOnDeviceAsync(category, encodingProperties, device)
    }

    /**
     * Creates a new [AudioFrameOutputNode](audioframeoutputnode.md), with the specified encoding properties, that outputs audio data from the audio graph to app-implemented code.
     * @returns {AudioFrameOutputNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createframeoutputnode
     */
    CreateFrameOutputNode() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateFrameOutputNode()
    }

    /**
     * Creates a new [AudioFrameOutputNode](audioframeoutputnode.md) that outputs audio data from the audio graph to app-implemented code.
     * @param {AudioEncodingProperties} encodingProperties 
     * @returns {AudioFrameOutputNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createframeoutputnode
     */
    CreateFrameOutputNodeWithFormat(encodingProperties) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateFrameOutputNodeWithFormat(encodingProperties)
    }

    /**
     * Creates a new [AudioDeviceOutputNode](audiodeviceoutputnode.md) that outputs audio data from the audio graph to the system's default output device, such as speakers or headphones.
     * @returns {IAsyncOperation<CreateAudioDeviceOutputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createdeviceoutputnodeasync
     */
    CreateDeviceOutputNodeAsync() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateDeviceOutputNodeAsync()
    }

    /**
     * Creates a spatial audio-enabled [AudioFileInputNode](audiofileinputnode.md) that inputs audio data into the audio graph from a storage file.
     * @remarks
     * To create a file input node with an emitter, the audio file must be encoded in mono at 48kHz.
     * @param {IStorageFile} file_ A [IStorageFile](../windows.storage/istoragefile.md) object representing the audio file associated with the input node.
     * @returns {IAsyncOperation<CreateAudioFileInputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createfileinputnodeasync
     */
    CreateFileInputNodeAsync(file_) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateFileInputNodeAsync(file_)
    }

    /**
     * Creates a new [AudioFileOutuputNode](audiofileoutputnode.md) that outputs audio data from the audio graph to the specified storage file.
     * @remarks
     * If the *file* parameter is null, the encoding profile defaults to a WAV file format with the same [AudioEncodingProperties](../windows.media.mediaproperties/audioencodingproperties.md) as the [AudioGraph](audiograph.md) to which it belongs.
     * @param {IStorageFile} file_ A [StorageFile](../windows.storage/storagefile.md) to which audio data is written.
     * @returns {IAsyncOperation<CreateAudioFileOutputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createfileoutputnodeasync
     */
    CreateFileOutputNodeAsync(file_) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateFileOutputNodeAsync(file_)
    }

    /**
     * Creates a new [AudioFileOutputNode](audiofileoutputnode.md) that outputs audio data from the audio graph to the specified storage file.
     * @remarks
     * The file output node created by this method defaults to a WAV file format with the same [AudioEncodingProperties](../windows.media.mediaproperties/audioencodingproperties.md) properties as the [AudioGraph](audiograph.md) to which it belongs. To create a file output node with custom encoding properties use the [CreateFileOutputNodeAsync(IStorageFile, MediaEncodingProfile)](audiograph_createfileoutputnodeasync_870871467.md) overload.
     * @param {IStorageFile} file_ A [StorageFile](../windows.storage/storagefile.md) to which audio data is written.
     * @param {MediaEncodingProfile} fileEncodingProfile 
     * @returns {IAsyncOperation<CreateAudioFileOutputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createfileoutputnodeasync
     */
    CreateFileOutputNodeWithFileProfileAsync(file_, fileEncodingProfile) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateFileOutputNodeWithFileProfileAsync(file_, fileEncodingProfile)
    }

    /**
     * Creates an [AudioSubmixNode](audiosubmixnode.md) that mixes the output of one or more audio graph nodes into a single output that can be connected to output nodes or other submix nodes.
     * @remarks
     * The *encodingProperties* parameter specifies the sample rate at which the created node will operate. Only uncompressed PCM and float formats are allowed.
     * @returns {AudioSubmixNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createsubmixnode
     */
    CreateSubmixNode() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateSubmixNode()
    }

    /**
     * Creates a spatial audio-enabled [AudioSubmixNode](audiosubmixnode.md) that mixes the output of one or more audio graph nodes into a single output that can be connected to output nodes or other submix nodes.
     * @param {AudioEncodingProperties} encodingProperties An object representing the audio encoding properties for the submix node which specifies the sample rate at which the created node will operate. Only uncompressed PCM and float formats are allowed.
     * @returns {AudioSubmixNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createsubmixnode
     */
    CreateSubmixNodeWithFormat(encodingProperties) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.CreateSubmixNodeWithFormat(encodingProperties)
    }

    /**
     * Starts the audio graph.
     * @remarks
     * Starting and stopping the audio graph does not affect the state of the individual nodes in the graph. Calling **Start** on the audio graph causes all nodes that are in the started state to be processed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.start
     */
    Start() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.Start()
    }

    /**
     * Stops the audio graph.
     * @remarks
     * Starting and stopping the audio graph does not affect the state of the individual nodes in the graph. Calling [Start](audiograph_start_1587696324.md) on the audio graph causes all nodes that are in the started state to be processed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.stop
     */
    Stop() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.Stop()
    }

    /**
     * Resets all nodes in the audio graph.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.resetallnodes
     */
    ResetAllNodes() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.ResetAllNodes()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioGraph, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuantumStarted(handler) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.add_QuantumStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_QuantumStarted(token) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.remove_QuantumStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AudioGraph, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuantumProcessed(handler) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.add_QuantumProcessed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_QuantumProcessed(token) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.remove_QuantumProcessed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AudioGraph, AudioGraphUnrecoverableErrorOccurredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnrecoverableErrorOccurred(handler) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.add_UnrecoverableErrorOccurred(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnrecoverableErrorOccurred(token) {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.remove_UnrecoverableErrorOccurred(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompletedQuantumCount() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.get_CompletedQuantumCount()
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_EncodingProperties() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.get_EncodingProperties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LatencyInSamples() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.get_LatencyInSamples()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_PrimaryRenderDevice() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.get_PrimaryRenderDevice()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RenderDeviceAudioProcessing() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.get_RenderDeviceAudioProcessing()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SamplesPerQuantum() {
        if (!this.HasProp("__IAudioGraph")) {
            if ((queryResult := this.QueryInterface(IAudioGraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph := IAudioGraph(outPtr)
        }

        return this.__IAudioGraph.get_SamplesPerQuantum()
    }

    /**
     * Closes the audio graph and disposes of associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [AudioGraphBatchUpdater](audiographbatchupdater.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * Creates an [AudioFrameInputNode](audioframeinputnode.md) that inputs audio data generated by app-implemented code into the audio graph.
     * @param {AudioEncodingProperties} encodingProperties 
     * @param {AudioNodeEmitter} emitter 
     * @returns {AudioFrameInputNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createframeinputnode
     */
    CreateFrameInputNodeWithFormatAndEmitter(encodingProperties, emitter) {
        if (!this.HasProp("__IAudioGraph2")) {
            if ((queryResult := this.QueryInterface(IAudioGraph2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph2 := IAudioGraph2(outPtr)
        }

        return this.__IAudioGraph2.CreateFrameInputNodeWithFormatAndEmitter(encodingProperties, emitter)
    }

    /**
     * Creates an [AudioDeviceInputNode](audiodeviceinputnode.md) that inputs audio data into the audio graph from the default audio input device, such as a microphone or audio card.
     * @remarks
     * Other overloads of this method allow you to specify the ID of a specific audio device instead of using the system's default device.
     * @param {Integer} category A value from the [MediaCategory](../windows.media.capture/mediacategory.md) enumeration value indicating the category of the media processed by this node, allowing the system to perform content-appropriate processing and prioritization of the media.
     * @param {AudioEncodingProperties} encodingProperties 
     * @param {DeviceInformation} device 
     * @param {AudioNodeEmitter} emitter 
     * @returns {IAsyncOperation<CreateAudioDeviceInputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createdeviceinputnodeasync
     */
    CreateDeviceInputNodeWithFormatAndEmitterOnDeviceAsync(category, encodingProperties, device, emitter) {
        if (!this.HasProp("__IAudioGraph2")) {
            if ((queryResult := this.QueryInterface(IAudioGraph2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph2 := IAudioGraph2(outPtr)
        }

        return this.__IAudioGraph2.CreateDeviceInputNodeWithFormatAndEmitterOnDeviceAsync(category, encodingProperties, device, emitter)
    }

    /**
     * Creates an [AudioFileInputNode](audiofileinputnode.md) that inputs audio data into the audio graph from a storage file.
     * @param {IStorageFile} file_ A [StorageFile](../windows.storage/storagefile.md) object representing the audio file associated with the input node.
     * @param {AudioNodeEmitter} emitter 
     * @returns {IAsyncOperation<CreateAudioFileInputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createfileinputnodeasync
     */
    CreateFileInputNodeWithEmitterAsync(file_, emitter) {
        if (!this.HasProp("__IAudioGraph2")) {
            if ((queryResult := this.QueryInterface(IAudioGraph2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph2 := IAudioGraph2(outPtr)
        }

        return this.__IAudioGraph2.CreateFileInputNodeWithEmitterAsync(file_, emitter)
    }

    /**
     * Creates an [AudioSubmixNode](audiosubmixnode.md) that mixes the output of one or more audio graph nodes into a single output that can be connected to output nodes or other submix nodes.
     * @param {AudioEncodingProperties} encodingProperties 
     * @param {AudioNodeEmitter} emitter 
     * @returns {AudioSubmixNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createsubmixnode
     */
    CreateSubmixNodeWithFormatAndEmitter(encodingProperties, emitter) {
        if (!this.HasProp("__IAudioGraph2")) {
            if ((queryResult := this.QueryInterface(IAudioGraph2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph2 := IAudioGraph2(outPtr)
        }

        return this.__IAudioGraph2.CreateSubmixNodeWithFormatAndEmitter(encodingProperties, emitter)
    }

    /**
     * Creates a new [AudioGraphBatchUpdater](audiographbatchupdater.md) for the [AudioGraph](audiograph.md) which causes all subsequent modifications to all nodes in the audio graph to be accumulated and then committed once your app closes or disposes of the batch updater object.
     * @returns {AudioGraphBatchUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createbatchupdater
     */
    CreateBatchUpdater() {
        if (!this.HasProp("__IAudioGraph2")) {
            if ((queryResult := this.QueryInterface(IAudioGraph2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph2 := IAudioGraph2(outPtr)
        }

        return this.__IAudioGraph2.CreateBatchUpdater()
    }

    /**
     * Creates a spatial audio-enabled [MediaSourceAudioInputNode](mediasourceaudioinputnode.md) that inputs audio data into the audio graph from the provided [MediaSource](../windows.media.core/mediasource.md) object.
     * @remarks
     * The [MediaSource](../windows.media.core/mediasource.md) class provides a common representation of media content from different kinds of sources, such as files or network streams. For more information on working with **MediaSource**, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
     * @param {MediaSource} mediaSource_ The [MediaSource](../windows.media.core/mediasource.md) object from which audio data is input into the audio graph.
     * @returns {IAsyncOperation<CreateMediaSourceAudioInputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createmediasourceaudioinputnodeasync
     */
    CreateMediaSourceAudioInputNodeAsync(mediaSource_) {
        if (!this.HasProp("__IAudioGraph3")) {
            if ((queryResult := this.QueryInterface(IAudioGraph3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph3 := IAudioGraph3(outPtr)
        }

        return this.__IAudioGraph3.CreateMediaSourceAudioInputNodeAsync(mediaSource_)
    }

    /**
     * Creates a [MediaSourceAudioInputNode](mediasourceaudioinputnode.md) that inputs audio data into the audio graph from the provided [MediaSource](../windows.media.core/mediasource.md) object.
     * @remarks
     * The [MediaSource](../windows.media.core/mediasource.md) class provides a common representation of media content from different kinds of sources, such as files or network streams. For more information on working with **MediaSource**, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
     * @param {MediaSource} mediaSource_ The [MediaSource](../windows.media.core/mediasource.md) object from which audio data is input into the audio graph.
     * @param {AudioNodeEmitter} emitter 
     * @returns {IAsyncOperation<CreateMediaSourceAudioInputNodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiograph.createmediasourceaudioinputnodeasync
     */
    CreateMediaSourceAudioInputNodeWithEmitterAsync(mediaSource_, emitter) {
        if (!this.HasProp("__IAudioGraph3")) {
            if ((queryResult := this.QueryInterface(IAudioGraph3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraph3 := IAudioGraph3(outPtr)
        }

        return this.__IAudioGraph3.CreateMediaSourceAudioInputNodeWithEmitterAsync(mediaSource_, emitter)
    }

;@endregion Instance Methods
}
