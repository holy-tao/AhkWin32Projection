#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioFileInputNode.ahk
#Include .\IAudioInputNode.ahk
#Include .\IAudioNode.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IAudioInputNode2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioFileInputNode.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a node in an audio graph node that inputs audio data into the graph from an audio file.
 * @remarks
 * Get an instance of this class by calling [AudioGraph.CreateFileInputNodeAsync](audiograph_createfileinputnodeasync_152724062.md) and then accessing the [CreateFileInputNodeResult.FileInputNode](createaudiofileinputnoderesult_fileinputnode.md) property.
 * 
 * The [MediaSourceAudioInputNode](mediasourceaudioinputnode.md) is another way of inputing audio data from a file into a graph. The [MediaSource](../windows.media.core/mediasource.md) class also allows you to use other sources of audio, such as a network stream.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioFileInputNode extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioFileInputNode

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioFileInputNode.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the playback speed factor for the audio file input node.
     * @remarks
     * This is a linear scale of the playback speed. So, for example a value of .5 will result in half-speed playback and a value of 2.0 will play the audio file back at double speed.
     * 
     * The value you specify for this property is clamped to the value of the [MaxPlaybackSpeedFactor](audiographsettings_maxplaybackspeedfactor.md) property of the [AudioGraphSettings](audiographsettings.md) object used to initialize the audio graph to which the node belongs. The default maximum value is 1024.
     * 
     * > [!Important] 
     * > When an audio graph supports a playback speed factor greater than 1, the system must allocate additional memory in order to maintain a sufficient buffer of audio data. For this reason, setting **MaxPlaybackSpeedFactor** to the lowest value required by your app will reduce the memory consumption of your app. If your app will only play back content at normal speed, it is recommended that you set **MaxPlaybackSpeedFactor** to 1.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.playbackspeedfactor
     * @type {Float} 
     */
    PlaybackSpeedFactor {
        get => this.get_PlaybackSpeedFactor()
        set => this.put_PlaybackSpeedFactor(value)
    }

    /**
     * Gets the playback position of the audio file input node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.position
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets or sets the start time for the audio file input node.
     * @remarks
     * **StartTime** defines where in the file playback begins. If **StartTime** is **null**, playback will start at the beginning of the file. **StartTime** can't be set to a time greater than the duration of the file. Attempting to do so will result in an invalid argument error.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.starttime
     * @type {IReference<TimeSpan>} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Gets or sets the end time for the audio file input node, which determines when playback of the media content ends.
     * @remarks
     * **EndTime** defines where in the file playback ends. If **EndTime** is **null**, playback will end at the end of the file. **EndTime** can't be set to a time greater than the duration of the file. Attempting to do so will result in an invalid argument error.
     * 
     * Set the point within the media content at which playback starts with the [StartTime](audiofileinputnode_starttime.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.endtime
     * @type {IReference<TimeSpan>} 
     */
    EndTime {
        get => this.get_EndTime()
        set => this.put_EndTime(value)
    }

    /**
     * Gets or sets the loop count of the audio file input node.
     * @remarks
     * The **LoopCount** property specifies the number of times that the node will seek back to the [StartTime](audiofileinputnode_starttime.md), or the beginning of the file if [StartTime](audiofileinputnode_starttime.md) is not set, and replay the content of the file. This value does not include the initial playback of the file, so using the default value of 0 will result in the file being played once, and setting the value to 5 will result in the file being played 6 times in total. Setting this value to **null** will cause the file to be looped indefinitely. To break out of the infinite loop, set **LoopCount** back to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.loopcount
     * @type {IReference<Integer>} 
     */
    LoopCount {
        get => this.get_LoopCount()
        set => this.put_LoopCount(value)
    }

    /**
     * Gets the duration for the audio input file.
     * @remarks
     * The **Duration** property represents the duration of the audio input file. The [StartTime](audiofileinputnode_starttime.md) and [EndTime](audiofileinputnode_endtime.md) properties can be used to set the range of the file that is used for playback, but setting these properties does not cause the value returned by **Duration** to change.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the source audio file for the audio file input node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.sourcefile
     * @type {StorageFile} 
     */
    SourceFile {
        get => this.get_SourceFile()
    }

    /**
     * Gets the list of outgoing connections from the audio file input node to other nodes in the audio graph.
     * @remarks
     * This list of outgoing connections is read-only. Call [AddOutgoingConnection](audiofileinputnode_addoutgoingconnection_702981438.md) to connect this node to another node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.outgoingconnections
     * @type {IVectorView<AudioGraphConnection>} 
     */
    OutgoingConnections {
        get => this.get_OutgoingConnections()
    }

    /**
     * Gets the list of effect definitions for the audio file input node. The effects in the list process audio data that flows through the node in the order in which they appear in the list.
     * @remarks
     * To add an audio effect to the node, add an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the **EffectDefinitions** property. You can disable effects by passing a previously added effect definition to the [DisableEffectsByDefinition](audiofileinputnode_disableeffectsbydefinition_730128310.md) method. Reenable a disabled effect by passing the definition to [EnableEffectsByDefinition](audiofileinputnode_enableeffectsbydefinition_1376948293.md).
     * 
     * Several platform-provided effects can be found in the **Windows.Media.Audio** namespace. These include:
     * * [EchoEffectDefinition](echoeffectdefinition.md)
     * * [EqualizerEffectDefinition](equalizereffectdefinition.md)
     * * [LimiterEffectDefinition](limitereffectdefinition.md)
     * * [ReverbEffectDefinition](reverbeffectdefinition.md)
     * 
     * Also, you can create your own custom audio effects by creating a Windows Runtime component that implements the [IBasicAudioEffect](../windows.media.effects/ibasicaudioeffect.md) interface. For a walkthrough of creating a custom audio effect, see [Custom audio effects](/windows/uwp/audio-video-camera/custom-audio-effects).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.effectdefinitions
     * @type {IVector<IAudioEffectDefinition>} 
     */
    EffectDefinitions {
        get => this.get_EffectDefinitions()
    }

    /**
     * Gets or sets the outgoing gain for the audio file input node.
     * @remarks
     * This value is a linear multiplier of the audio data leaving the node. By default, the outgoing gain is 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.outgoinggain
     * @type {Float} 
     */
    OutgoingGain {
        get => this.get_OutgoingGain()
        set => this.put_OutgoingGain(value)
    }

    /**
     * Gets the encoding properties for the audio file input node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.encodingproperties
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * Gets or sets a value indicating if the audio file input node consumes input.
     * @remarks
     * You can stop all audio processing of a node by calling [Stop](audiofileinputnode_stop_1201535524.md). Set **ConsumeInput** to false to mute the input of the node instead. This can be useful in scenarios such as when the node has an effect with a decay applied, such as delay or reverb. Setting **ConsumeInput** to false will stop the node from consuming audio data while allowing effects to continue processing.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.consumeinput
     * @type {Boolean} 
     */
    ConsumeInput {
        get => this.get_ConsumeInput()
        set => this.put_ConsumeInput(value)
    }

    /**
     * Gets the [AudioNodeEmitter](audionodeemitter.md) that describes the position and other physical characteristics of the emitter from which the [AudioFileInputNode](audiofileinputnode.md) audio is emitted when spatial audio processing is used.
     * @remarks
     * Create an [AudioFileInputNode](audiofileinputnode.md) with an [AudioNodeEmitter](audionodeemitter.md) by calling the overload of [CreateFileInputNodeAsync](audiograph_createfileinputnodeasync_1569331208.md) that accepts an emitter as an argument.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.emitter
     * @type {AudioNodeEmitter} 
     */
    Emitter {
        get => this.get_Emitter()
    }

    /**
     * Occurs when the playback position reaches the end of the audio file or the position specified with the [EndTime](audiofileinputnode_endtime.md) property.
     * @type {TypedEventHandler<AudioFileInputNode, IInspectable>}
    */
    OnFileCompleted {
        get {
            if(!this.HasProp("__OnFileCompleted")){
                this.__OnFileCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4481085b-8b8b-5520-9825-e9671da2a89f}"),
                    AudioFileInputNode,
                    IInspectable
                )
                this.__OnFileCompletedToken := this.add_FileCompleted(this.__OnFileCompleted.iface)
            }
            return this.__OnFileCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFileCompletedToken")) {
            this.remove_FileCompleted(this.__OnFileCompletedToken)
            this.__OnFileCompleted.iface.Dispose()
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
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.put_PlaybackSpeedFactor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackSpeedFactor() {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.get_PlaybackSpeedFactor()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.get_Position()
    }

    /**
     * Moves the playback position of the node to the specified time within the audio input file.
     * @remarks
     * You can't seek to a time that is greater than the duration of the file. If the [StartTime](audiofileinputnode_starttime.md) or [EndTime](audiofileinputnode_endtime.md) properties have been set, you can't seek to a position before the [StartTime](audiofileinputnode_starttime.md) or after the [EndTime](audiofileinputnode_endtime.md). Attempting to do so will result in an illegal argument error.
     * @param {TimeSpan} position A value indicating the position to which the node should seek.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.seek
     */
    Seek(position) {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.Seek(position)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_StartTime() {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.get_StartTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.put_StartTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_EndTime() {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.get_EndTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_EndTime(value) {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.put_EndTime(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LoopCount() {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.get_LoopCount()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_LoopCount(value) {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.put_LoopCount(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.get_Duration()
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_SourceFile() {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.get_SourceFile()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioFileInputNode, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FileCompleted(handler) {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.add_FileCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FileCompleted(token) {
        if (!this.HasProp("__IAudioFileInputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFileInputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFileInputNode := IAudioFileInputNode(outPtr)
        }

        return this.__IAudioFileInputNode.remove_FileCompleted(token)
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
     * Adds an outgoing connection to the audio file input node.
     * @remarks
     * The other overload of this method allows you to specify a gain value that is applied to the audio values passing through the new connection.
     * @param {IAudioNode} destination The destination node for the connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.addoutgoingconnection
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
     * Adds an outgoing connection with gain to the audio file input node.
     * @param {IAudioNode} destination The destination node for the connection.
     * @param {Float} gain A value indicating the gain associated with the connection. This is a scalar multiplier of the audio signal. The default value is 1.0.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.addoutgoingconnection
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
     * Removes the outgoing connection from the audio file input node to the specified node.
     * @remarks
     * Add an outgoing connection by calling [AddOutgoingConnection](audiofileinputnode_addoutgoingconnection_702981438.md).
     * @param {IAudioNode} destination The audio node for which the outgoing connection is removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.removeoutgoingconnection
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
     * Starts the audio file input node.
     * @remarks
     * Audio graph nodes are created in the started state by default and will start processing audio when [AudioGraph.Start](audiograph_start_1587696324.md) is called. This method will restart processing for a node that was stopped with a call to **Stop**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.start
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
     * Stops the audio file input node.
     * @remarks
     * To mute the input of the node, while allowing audio processing to continue, set the [ConsumeInput](audiofileinputnode_consumeinput.md) property to false. This is useful when effects with decay, such as reverb or delay, are applied to the node because effect processing will continue after the input is muted. Calling **Stop** immediately stops all processing for the node, including effects.
     * 
     * To stop all processing for all nodes of the graph, call [AudioGraph.Stop](audiograph_stop_1201535524.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.stop
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
     * Resets the audio file input node.
     * @remarks
     * This method causes the node to reset the playback position back to the beginning of the file, or to the time specified by the [StartTime](audiofileinputnode_starttime.md) property if it has been set. Calling this method causes [DiscardQueuedFrames](../windows.media.effects/ibasicaudioeffect_discardqueuedframes_1358903059.md) to be called on any audio effects applied to the [AudioFileInputNode](audiofileinputnode.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.reset
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
     * Disables all effects in the [EffectDefinitions](audiofileinputnode_effectdefinitions.md) list with the specified effect definition.
     * @remarks
     * Apply an audio effect to a node by adding an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the [EffectDefinitions](audiofileinputnode_effectdefinitions.md) collection. Reenable disabled effects by calling [EnableEffectsByDefinition](audiofileinputnode_enableeffectsbydefinition_1376948293.md).
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to disable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.disableeffectsbydefinition
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
     * Enables all effects in the [EffectDefinitions](audiofileinputnode_effectdefinitions.md) list with the specified effect definition.
     * @remarks
     * Apply an audio effect to a node by adding an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the [EffectDefinitions](audiofileinputnode_effectdefinitions.md) collection. Disable effects by calling [DisableEffectsByDefinition](audiofileinputnode_disableeffectsbydefinition_730128310.md).
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to enable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.enableeffectsbydefinition
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
     * Closes the audio file input node and disposes of associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [AudioGraphBatchUpdater](audiographbatchupdater.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofileinputnode.close
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
