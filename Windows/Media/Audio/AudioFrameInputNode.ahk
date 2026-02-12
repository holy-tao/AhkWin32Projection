#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioFrameInputNode.ahk
#Include .\IAudioInputNode.ahk
#Include .\IAudioNode.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IAudioInputNode2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioFrameInputNode.ahk
#Include .\AudioFrameCompletedEventArgs.ahk
#Include .\FrameInputNodeQuantumStartedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a node in an audio graph node that inputs audio data into the graph from app-implemented code that generates audio samples programmatically.
 * @remarks
 * Get an instance of this class by calling [CreateFrameInputNode](audiograph_createframeinputnode_2056779528.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioFrameInputNode extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioFrameInputNode

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioFrameInputNode.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the playback speed factor for the audio frame input node.
     * @remarks
     * This is a linear scale of the playback speed. So, for example a value of .5 will result in half-speed playback and a value of 2.0 will play the audio back at double speed.
     * 
     * The value you specify for this property is clamped to the value of the [MaxPlaybackSpeedFactor](audiographsettings_maxplaybackspeedfactor.md) property of the [AudioGraphSettings](audiographsettings.md) object used to initialize the audio graph to which the node belongs. The default maximum value is 1024.
     * 
     * > [!Important] 
     * > When an audio graph supports a playback speed factor greater than 1, the system must allocate additional memory in order to maintain a sufficient buffer of audio data. For this reason, setting **MaxPlaybackSpeedFactor** to the lowest value required by your app will reduce the memory consumption of your app. If your app will only play back content at normal speed, it is recommended that you set **MaxPlaybackSpeedFactor** to 1.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.playbackspeedfactor
     * @type {Float} 
     */
    PlaybackSpeedFactor {
        get => this.get_PlaybackSpeedFactor()
        set => this.put_PlaybackSpeedFactor(value)
    }

    /**
     * Gets the queued sample count for the audio frame input node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.queuedsamplecount
     * @type {Integer} 
     */
    QueuedSampleCount {
        get => this.get_QueuedSampleCount()
    }

    /**
     * Gets the list of outgoing connections from the audio frame input node to other nodes in the audio graph.
     * @remarks
     * This list of outgoing connections is read-only. Call [AddOutgoingConnection](audioframeinputnode_addoutgoingconnection_702981438.md) to connect this node to another node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.outgoingconnections
     * @type {IVectorView<AudioGraphConnection>} 
     */
    OutgoingConnections {
        get => this.get_OutgoingConnections()
    }

    /**
     * Gets the list of effect definitions for the audio frame input node. The effects in the list process audio data that flows through the node in the order in which they appear in the list.
     * @remarks
     * To add an audio effect to the node, add an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the **EffectDefinitions** property. You can disable effects by passing a previously added effect definition to the [DisableEffectsByDefinition](audioframeinputnode_disableeffectsbydefinition_730128310.md) method. Reenable a disabled effect by passing the definition to [EnableEffectsByDefinition](audioframeinputnode_enableeffectsbydefinition_1376948293.md).
     * 
     * Several platform-provided effects can be found in the **Windows.Media.Audio** namespace. These include:
     * * [EchoEffectDefinition](echoeffectdefinition.md)
     * * [EqualizerEffectDefinition](equalizereffectdefinition.md)
     * * [LimiterEffectDefinition](limitereffectdefinition.md)
     * * [ReverbEffectDefinition](reverbeffectdefinition.md)
     * 
     * Also, you can create your own custom audio effects by creating a Windows Runtime component that implements the [IBasicAudioEffect](../windows.media.effects/ibasicaudioeffect.md) interface. For a walkthrough of creating a custom audio effect, see [Custom audio effects](/windows/uwp/audio-video-camera/custom-audio-effects).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.effectdefinitions
     * @type {IVector<IAudioEffectDefinition>} 
     */
    EffectDefinitions {
        get => this.get_EffectDefinitions()
    }

    /**
     * Gets or sets the outgoing gain for the audio frame input node.
     * @remarks
     * This value is a linear multiplier of the audio data leaving the node. By default, the outgoing gain is 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.outgoinggain
     * @type {Float} 
     */
    OutgoingGain {
        get => this.get_OutgoingGain()
        set => this.put_OutgoingGain(value)
    }

    /**
     * Gets the encoding properties for the audio frame input node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.encodingproperties
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * Gets or sets a value indicating if the audio frame input node consumes input.
     * @remarks
     * You can stop all audio processing of a node by calling [Stop](audioframeinputnode_stop_1201535524.md). Set **ConsumeInput** to false to mute the input of the node instead. This can be useful in scenarios such as when the node has an effect with a decay applied, such as delay or reverb. Setting **ConsumeInput** to false will stop the node from consuming audio data while allowing effects to continue processing.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.consumeinput
     * @type {Boolean} 
     */
    ConsumeInput {
        get => this.get_ConsumeInput()
        set => this.put_ConsumeInput(value)
    }

    /**
     * Gets the [AudioNodeEmitter](audionodeemitter.md) that describes the position and other physical characteristics of the emitter from which the [AudioFrameInputNode](audioframeinputnode.md) audio is emitted when spatial audio processing is used.
     * @remarks
     * Create an [AudioFrameInputNode](audioframeinputnode.md) with an [AudioNodeEmitter](audionodeemitter.md) by calling the overload of [CreateFrameInputNode](audiograph_createframeinputnode_2056779528.md) that accepts an emitter as an argument.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.emitter
     * @type {AudioNodeEmitter} 
     */
    Emitter {
        get => this.get_Emitter()
    }

    /**
     * Notifies of a completed audio frame that has been submitted to the graph with a call to [AddFrame](audioframeinputnode_addframe_561479871.md).
     * @type {TypedEventHandler<AudioFrameInputNode, AudioFrameCompletedEventArgs>}
    */
    OnAudioFrameCompleted {
        get {
            if(!this.HasProp("__OnAudioFrameCompleted")){
                this.__OnAudioFrameCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ad59dcfe-71b0-5e16-99c2-cd90644d8ee8}"),
                    AudioFrameInputNode,
                    AudioFrameCompletedEventArgs
                )
                this.__OnAudioFrameCompletedToken := this.add_AudioFrameCompleted(this.__OnAudioFrameCompleted.iface)
            }
            return this.__OnAudioFrameCompleted
        }
    }

    /**
     * Raised when the audio graph is ready to begin processing a new quantum of data.
     * @remarks
     * Use the [FrameInputNodeQuantumStartedEventArgs.RequiredSamples](frameinputnodequantumstartedeventargs_requiredsamples.md) property to determine how many samples are required to fill the quantum with data. Pass an [AudioFrame](audioframecompletedeventargs.md) into the [AddFrame](audioframeinputnode_addframe_561479871.md) method to provide the required audio samples.
     * @type {TypedEventHandler<AudioFrameInputNode, FrameInputNodeQuantumStartedEventArgs>}
    */
    OnQuantumStarted {
        get {
            if(!this.HasProp("__OnQuantumStarted")){
                this.__OnQuantumStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4530d121-bb9a-57fe-922f-a98eeedf59af}"),
                    AudioFrameInputNode,
                    FrameInputNodeQuantumStartedEventArgs
                )
                this.__OnQuantumStartedToken := this.add_QuantumStarted(this.__OnQuantumStarted.iface)
            }
            return this.__OnQuantumStarted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAudioFrameCompletedToken")) {
            this.remove_AudioFrameCompleted(this.__OnAudioFrameCompletedToken)
            this.__OnAudioFrameCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnQuantumStartedToken")) {
            this.remove_QuantumStarted(this.__OnQuantumStartedToken)
            this.__OnQuantumStarted.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackSpeedFactor(value) {
        if (!this.HasProp("__IAudioFrameInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameInputNode := IAudioFrameInputNode(outPtr)
        }

        return this.__IAudioFrameInputNode.put_PlaybackSpeedFactor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackSpeedFactor() {
        if (!this.HasProp("__IAudioFrameInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameInputNode := IAudioFrameInputNode(outPtr)
        }

        return this.__IAudioFrameInputNode.get_PlaybackSpeedFactor()
    }

    /**
     * Adds an audio frame to the audio frame input node.
     * @remarks
     * The provided [AudioFrame](../windows.media/audioframe.md) object must have an underlying [AudioBuffer](../windows.media/audiobuffer.md) with a [Length](../windows.media/audiobuffer_length.md) greater than 0 or an E_INVALIDARG error will result. Also, the underlying [IMemoryBuffer](../windows.foundation/imemorybuffer.md) containing the raw audio data must be block-aligned based on the bit depth per sample and number of channels. This means that the size of the buffer, in bytes, must be an integral multiple of ([BitsPerSample](../windows.media.mediaproperties/audioencodingproperties_bitspersample.md) / 8) * [ChannelCount](../windows.media.mediaproperties/audioencodingproperties_channelcount.md) of the [EncodingProperties](audioframeinputnode_encodingproperties.md) property for the node. Attempting to add a frame with a non-aligned audio buffer will result in an E_INVALIDARG error.
     * 
     * A maximum of 64 frames can be queued in the [AudioFrameInputNode](audioframeinputnode.md) at one time. Attempting to queue more than 64 frames will result in an error.
     * @param {AudioFrame} frame_ An [AudioFrame](../windows.media/audioframe.md) object representing the frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.addframe
     */
    AddFrame(frame_) {
        if (!this.HasProp("__IAudioFrameInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameInputNode := IAudioFrameInputNode(outPtr)
        }

        return this.__IAudioFrameInputNode.AddFrame(frame_)
    }

    /**
     * Removes queued frames from the audio frame input node.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.discardqueuedframes
     */
    DiscardQueuedFrames() {
        if (!this.HasProp("__IAudioFrameInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameInputNode := IAudioFrameInputNode(outPtr)
        }

        return this.__IAudioFrameInputNode.DiscardQueuedFrames()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QueuedSampleCount() {
        if (!this.HasProp("__IAudioFrameInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameInputNode := IAudioFrameInputNode(outPtr)
        }

        return this.__IAudioFrameInputNode.get_QueuedSampleCount()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioFrameInputNode, AudioFrameCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioFrameCompleted(handler) {
        if (!this.HasProp("__IAudioFrameInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameInputNode := IAudioFrameInputNode(outPtr)
        }

        return this.__IAudioFrameInputNode.add_AudioFrameCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AudioFrameCompleted(token) {
        if (!this.HasProp("__IAudioFrameInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameInputNode := IAudioFrameInputNode(outPtr)
        }

        return this.__IAudioFrameInputNode.remove_AudioFrameCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AudioFrameInputNode, FrameInputNodeQuantumStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuantumStarted(handler) {
        if (!this.HasProp("__IAudioFrameInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameInputNode := IAudioFrameInputNode(outPtr)
        }

        return this.__IAudioFrameInputNode.add_QuantumStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_QuantumStarted(token) {
        if (!this.HasProp("__IAudioFrameInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameInputNode := IAudioFrameInputNode(outPtr)
        }

        return this.__IAudioFrameInputNode.remove_QuantumStarted(token)
    }

    /**
     * 
     * @returns {IVectorView<AudioGraphConnection>} 
     */
    get_OutgoingConnections() {
        if (!this.HasProp("__IAudioInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioInputNode := IAudioInputNode(outPtr)
        }

        return this.__IAudioInputNode.get_OutgoingConnections()
    }

    /**
     * Adds an outgoing connection to the audio frame input node.
     * @remarks
     * The other overload of this method allows you to specify a gain value that is applied to the audio values passing through the new connection.
     * @param {IAudioNode} destination The destination node for the connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.addoutgoingconnection
     */
    AddOutgoingConnection(destination) {
        if (!this.HasProp("__IAudioInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioInputNode := IAudioInputNode(outPtr)
        }

        return this.__IAudioInputNode.AddOutgoingConnection(destination)
    }

    /**
     * Adds an outgoing connection with gain to the audio frame input node.
     * @param {IAudioNode} destination The destination node for the connection.
     * @param {Float} gain A value indicating the gain associated with the connection. This is a scalar multiplier of the audio signal. The default value is 1.0.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.addoutgoingconnection
     */
    AddOutgoingConnectionWithGain(destination, gain) {
        if (!this.HasProp("__IAudioInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioInputNode := IAudioInputNode(outPtr)
        }

        return this.__IAudioInputNode.AddOutgoingConnectionWithGain(destination, gain)
    }

    /**
     * Removes the outgoing connection from the audio frame input node to the specified node.
     * @remarks
     * Add an outgoing connection by calling [AddOutgoingConnection](audioframeinputnode_addoutgoingconnection_702981438.md).
     * @param {IAudioNode} destination The audio node for which the outgoing connection is removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.removeoutgoingconnection
     */
    RemoveOutgoingConnection(destination) {
        if (!this.HasProp("__IAudioInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioInputNode := IAudioInputNode(outPtr)
        }

        return this.__IAudioInputNode.RemoveOutgoingConnection(destination)
    }

    /**
     * 
     * @returns {IVector<IAudioEffectDefinition>} 
     */
    get_EffectDefinitions() {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.get_EffectDefinitions()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OutgoingGain(value) {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.put_OutgoingGain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OutgoingGain() {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.get_OutgoingGain()
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_EncodingProperties() {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.get_EncodingProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ConsumeInput() {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.get_ConsumeInput()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ConsumeInput(value) {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.put_ConsumeInput(value)
    }

    /**
     * Starts the audio frame input node.
     * @remarks
     * Audio graph nodes are created in the started state by default and will start processing audio when [AudioGraph.Start](audiograph_start_1587696324.md) is called. This method will restart processing for a node that was stopped with a call to **Stop**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.start
     */
    Start() {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.Start()
    }

    /**
     * Stops the audio frame input node.
     * @remarks
     * To mute the input of the node, while allowing audio processing to continue, set the [ConsumeInput](audioframeinputnode_consumeinput.md) property to false. This is useful when effects with decay, such as reverb or delay, are applied to the node because effect processing will continue after the input is muted. Calling **Stop** immediately stops all processing for the node, including effects.
     * 
     * To stop all processing for all nodes of the graph, call [AudioGraph.Stop](audiograph_stop_1201535524.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.stop
     */
    Stop() {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.Stop()
    }

    /**
     * Resets the audio frame input node.
     * @remarks
     * Calling this method will discard all queued frames and will cause [DiscardQueuedFrames](../windows.media.effects/ibasicaudioeffect_discardqueuedframes_1358903059.md) to be called on any audio effects applied to the [AudioFrameInputNode](audioframeinputnode.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.reset
     */
    Reset() {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.Reset()
    }

    /**
     * Disables all effects in the [EffectDefinitions](audioframeinputnode_effectdefinitions.md) list with the specified effect definition.
     * @remarks
     * Apply an audio effect to a node by adding an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the [EffectDefinitions](audioframeinputnode_effectdefinitions.md) collection. Reenable disabled effects by calling [EnableEffectsByDefinition](audioframeinputnode_enableeffectsbydefinition_1376948293.md).
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to disable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.disableeffectsbydefinition
     */
    DisableEffectsByDefinition(definition) {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.DisableEffectsByDefinition(definition)
    }

    /**
     * Enables all effects in the [EffectDefinitions](audioframeinputnode_effectdefinitions.md) list with the specified effect definition.
     * @remarks
     * Apply an audio effect to a node by adding an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the [EffectDefinitions](audioframeinputnode_effectdefinitions.md) collection. Disable effects by calling [DisableEffectsByDefinition](audioframeinputnode_disableeffectsbydefinition_730128310.md).
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to enable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.enableeffectsbydefinition
     */
    EnableEffectsByDefinition(definition) {
        if (!this.HasProp("__IAudioNode")) {
            if ((queryResult := this.QueryInterface(IAudioNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNode := IAudioNode(outPtr)
        }

        return this.__IAudioNode.EnableEffectsByDefinition(definition)
    }

    /**
     * Closes the audio frame input node and disposes of associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [AudioGraphBatchUpdater](audiographbatchupdater.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeinputnode.close
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
     * 
     * @returns {AudioNodeEmitter} 
     */
    get_Emitter() {
        if (!this.HasProp("__IAudioInputNode2")) {
            if ((queryResult := this.QueryInterface(IAudioInputNode2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioInputNode2 := IAudioInputNode2(outPtr)
        }

        return this.__IAudioInputNode2.get_Emitter()
    }

;@endregion Instance Methods
}
