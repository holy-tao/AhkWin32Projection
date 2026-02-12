#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioFrameOutputNode.ahk
#Include .\IAudioNode.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a node in an audio graph node that outputs audio data from the graph into app-implemented code.
 * @remarks
 * Get an instance of this class by calling [CreateFrameOutputNode](audiograph_createframeoutputnode_1505747890.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioFrameOutputNode extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioFrameOutputNode

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioFrameOutputNode.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of effect definitions for the audio frame output node. The effects in the list process audio data that flows through the node in the order in which they appear in the list.
     * @remarks
     * To add an audio effect to the node, add an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the **EffectDefinitions** property. You can disable effects by passing a previously added effect definition to the [DisableEffectsByDefinition](audioframeoutputnode_disableeffectsbydefinition_730128310.md) method. Reenable a disabled effect by passing the definition to [EnableEffectsByDefinition](audioframeoutputnode_enableeffectsbydefinition_1376948293.md).
     * 
     * Several platform-provided effects can be found in the **Windows.Media.Audio** namespace. These include:
     * * [EchoEffectDefinition](echoeffectdefinition.md)
     * * [EqualizerEffectDefinition](equalizereffectdefinition.md)
     * * [LimiterEffectDefinition](limitereffectdefinition.md)
     * * [ReverbEffectDefinition](reverbeffectdefinition.md)
     * 
     * Also, you can create your own custom audio effects by creating a Windows Runtime component that implements the [IBasicAudioEffect](../windows.media.effects/ibasicaudioeffect.md) interface. For a walkthrough of creating a custom audio effect, see [Custom audio effects](/windows/uwp/audio-video-camera/custom-audio-effects).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.effectdefinitions
     * @type {IVector<IAudioEffectDefinition>} 
     */
    EffectDefinitions {
        get => this.get_EffectDefinitions()
    }

    /**
     * Gets or sets the outgoing gain for the audio frame output node.
     * @remarks
     * This value is a linear multiplier of the audio data leaving the node. By default, the outgoing gain is 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.outgoinggain
     * @type {Float} 
     */
    OutgoingGain {
        get => this.get_OutgoingGain()
        set => this.put_OutgoingGain(value)
    }

    /**
     * Gets the encoding properties for the audio frame output node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.encodingproperties
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * Gets or sets a value indicating if the audio frame output node consumes input.
     * @remarks
     * You can stop all audio processing of a node by calling [Stop](audioframeoutputnode_stop_1201535524.md). Set **ConsumeInput** to false to mute the input of the node instead. This can be useful in scenarios such as when the node has an effect with a decay applied, such as delay or reverb. Setting **ConsumeInput** to false will stop the node from consuming audio data while allowing effects to continue processing.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.consumeinput
     * @type {Boolean} 
     */
    ConsumeInput {
        get => this.get_ConsumeInput()
        set => this.put_ConsumeInput(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Gets an audio frame containing all of the data accumulated by this node since the previous call to **GetFrame**. If **GetFrame** has not yet been called, the audio frame will contain all of the data accumulated since the node was created.
     * @remarks
     * If you want to retrieve audio frames on a regular cadence, synchronized with the audio graph, you can call this method from within the synchronous [QuantumStarted](audiograph_quantumstarted.md) event handler. The [QuantumProcessed](audiograph_quantumprocessed.md) event is raised asynchronously after the audio engine has completed audio processing, which means its cadence may be irregular. Therefore you should not use the **QuantumProcessed** event for synchronized processing of audio frame data.
     * @returns {AudioFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.getframe
     */
    GetFrame() {
        if (!this.HasProp("__IAudioFrameOutputNode")) {
            if ((queryResult := this.QueryInterface(IAudioFrameOutputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameOutputNode := IAudioFrameOutputNode(outPtr)
        }

        return this.__IAudioFrameOutputNode.GetFrame()
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
     * Starts the audio frame output node.
     * @remarks
     * Audio graph nodes are created in the started state by default and will start processing audio when [AudioGraph.Start](audiograph_start_1587696324.md) is called. This method will restart processing for a node that was stopped with a call to **Stop**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.start
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
     * Stops the audio frame output node.
     * @remarks
     * To mute the input of the node, while allowing audio processing to continue, set the [ConsumeInput](audioframeoutputnode_consumeinput.md) property to false. This is useful when effects with decay, such as reverb or delay, are applied to the node because effect processing will continue after the input is muted. Calling **Stop** immediately stops all processing for the node, including effects.
     * 
     * To stop all processing for all nodes of the graph, call [AudioGraph.Stop](audiograph_stop_1201535524.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.stop
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
     * Resets the audio frame output node.
     * @remarks
     * Calling this method causes [DiscardQueuedFrames](../windows.media.effects/ibasicaudioeffect_discardqueuedframes_1358903059.md) to be called on any audio effects applied to the [AudioFrameOutputNode](audioframeoutputnode.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.reset
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
     * Disables all effects in the [EffectDefinitions](audioframeoutputnode_effectdefinitions.md) list with the specified effect definition.
     * @remarks
     * Apply an audio effect to a node by adding an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the [EffectDefinitions](audioframeoutputnode_effectdefinitions.md) collection. Reenable disabled effects by calling [EnableEffectsByDefinition](audioframeoutputnode_enableeffectsbydefinition_1376948293.md).
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to disable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.disableeffectsbydefinition
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
     * Enables all effects in the [EffectDefinitions](audioframeoutputnode_effectdefinitions.md) list with the specified effect definition.
     * @remarks
     * Apply an audio effect to a node by adding an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the [EffectDefinitions](audioframeinputnode_effectdefinitions.md) collection. Disable effects by calling [DisableEffectsByDefinition](audioframeoutputnode_disableeffectsbydefinition_730128310.md).
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to enable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.enableeffectsbydefinition
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
     * Closes the audio frame output node and disposes of associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [AudioGraphBatchUpdater](audiographbatchupdater.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframeoutputnode.close
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
