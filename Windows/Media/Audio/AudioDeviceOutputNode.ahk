#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioDeviceOutputNode.ahk
#Include .\IAudioNode.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IAudioNodeWithListener.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a node in an audio graph node that outputs audio data from the graph to an audio device such as a speaker or external audio interface.
 * @remarks
 * Get an instance of this class by calling [AudioGraph.CreateDeviceOutputNodeAsync](audiograph_createdeviceoutputnodeasync_954542725.md) and then accessing the [CreateAudioDeviceOutputNodeResult.DeviceOutputNode](createaudiodeviceoutputnoderesult_deviceoutputnode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioDeviceOutputNode extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioDeviceOutputNode

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioDeviceOutputNode.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the audio device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.device
     * @type {DeviceInformation} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * Gets the list of effect definitions for the audio device output node. The effects in the list process audio data that flows through the node in the order in which they appear in the list.
     * @remarks
     * To add an audio effect to the node, add an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the **EffectDefinitions** property. You can disable effects by passing a previously added effect definition to the [DisableEffectsByDefinition](audiodeviceoutputnode_disableeffectsbydefinition_730128310.md) method. Reenable a disabled effect by passing the definition to [EnableEffectsByDefinition](audiodeviceoutputnode_enableeffectsbydefinition_1376948293.md).
     * 
     * Several platform-provided effects can be found in the **Windows.Media.Audio** namespace. These include:
     * * [EchoEffectDefinition](echoeffectdefinition.md)
     * * [EqualizerEffectDefinition](equalizereffectdefinition.md)
     * * [LimiterEffectDefinition](limitereffectdefinition.md)
     * * [ReverbEffectDefinition](reverbeffectdefinition.md)
     * 
     * Also, you can create your own custom audio effects by creating a Windows Runtime component that implements the [IBasicAudioEffect](../windows.media.effects/ibasicaudioeffect.md) interface. For a walkthrough of creating a custom audio effect, see [Custom audio effects](/windows/uwp/audio-video-camera/custom-audio-effects).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.effectdefinitions
     * @type {IVector<IAudioEffectDefinition>} 
     */
    EffectDefinitions {
        get => this.get_EffectDefinitions()
    }

    /**
     * Gets or sets the outgoing gain for the audio device output node.
     * @remarks
     * This value is a linear multiplier of the audio data leaving the node. By default, the outgoing gain is 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.outgoinggain
     * @type {Float} 
     */
    OutgoingGain {
        get => this.get_OutgoingGain()
        set => this.put_OutgoingGain(value)
    }

    /**
     * Gets the encoding properties for the audio device output node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.encodingproperties
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * Gets or sets a value indicating if the audio device output node consumes input.
     * @remarks
     * You can stop all audio processing of a node by calling [Stop](audiodeviceoutputnode_stop_1201535524.md). Set **ConsumeInput** to false to mute the input of the node instead. This can be useful in scenarios such as when the node has an effect with a decay applied, such as delay or reverb. Setting **ConsumeInput** to false will stop the node from consuming audio data while allowing effects to continue processing.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.consumeinput
     * @type {Boolean} 
     */
    ConsumeInput {
        get => this.get_ConsumeInput()
        set => this.put_ConsumeInput(value)
    }

    /**
     * Gets or sets the [AudioNodeListener](audionodelistener.md) that describes the position and other characteristics of the listener from which the [AudioDeviceOutputNode](audiodeviceoutputnode.md) audio is heard when spatial audio processing is used.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.listener
     * @type {AudioNodeListener} 
     */
    Listener {
        get => this.get_Listener()
        set => this.put_Listener(value)
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
     * 
     * @returns {DeviceInformation} 
     */
    get_Device() {
        if (!this.HasProp("__IAudioDeviceOutputNode")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceOutputNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceOutputNode := IAudioDeviceOutputNode(outPtr)
        }

        return this.__IAudioDeviceOutputNode.get_Device()
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
     * Starts the audio device output node.
     * @remarks
     * Audio graph nodes are created in the started state by default and will start processing audio when [AudioGraph.Start](audiograph_start_1587696324.md) is called. This method will restart processing for a node that was stopped with a call to **Stop**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.start
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
     * Stops the audio device output node.
     * @remarks
     * To mute the input of the node, while allowing audio processing to continue, set the [ConsumeInput](audiodeviceoutputnode_consumeinput.md) property to false. This is useful when effects with decay, such as reverb or delay, are applied to the node because effect processing will continue after the input is muted. Calling **Stop** immediately stops all processing for the node, including effects.
     * 
     * To stop all processing for all nodes of the graph, call [AudioGraph.Stop](audiograph_stop_1201535524.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.stop
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
     * Resets the audio device output node.
     * @remarks
     * Calling this method causes [DiscardQueuedFrames](../windows.media.effects/ibasicaudioeffect_discardqueuedframes_1358903059.md) to be called on any audio effects applied to the [AudioDeviceOutputNode](audiodeviceoutputnode.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.reset
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
     * Disables all effects in the [EffectDefinitions](audiodeviceoutputnode_effectdefinitions.md) list with the specified effect definition.
     * @remarks
     * Apply an audio effect to a node by adding an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the [EffectDefinitions](audiodeviceoutputnode_effectdefinitions.md) collection. Reenable disabled effects by calling [EnableEffectsByDefinition](audiodeviceoutputnode_enableeffectsbydefinition_1376948293.md).
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to disable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.disableeffectsbydefinition
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
     * Enables all effects in the [EffectDefinitions](audiodeviceoutputnode_effectdefinitions.md) list with the specified effect definition.
     * @remarks
     * Apply an audio effect to a node by adding an object that implements [IAudioEffectDefinition](../windows.media.effects/iaudioeffectdefinition.md) to the [EffectDefinitions](audiodeviceoutputnode_effectdefinitions.md) collection. Disable effects by calling [DisableEffectsByDefinition](audiodeviceoutputnode_disableeffectsbydefinition_730128310.md).
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to enable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.enableeffectsbydefinition
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
     * Closes the audio device output node and disposes of associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [AudioGraphBatchUpdater](audiographbatchupdater.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodeviceoutputnode.close
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
     * @param {AudioNodeListener} value 
     * @returns {HRESULT} 
     */
    put_Listener(value) {
        if (!this.HasProp("__IAudioNodeWithListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeWithListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeWithListener := IAudioNodeWithListener(outPtr)
        }

        return this.__IAudioNodeWithListener.put_Listener(value)
    }

    /**
     * 
     * @returns {AudioNodeListener} 
     */
    get_Listener() {
        if (!this.HasProp("__IAudioNodeWithListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeWithListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeWithListener := IAudioNodeWithListener(outPtr)
        }

        return this.__IAudioNodeWithListener.get_Listener()
    }

;@endregion Instance Methods
}
