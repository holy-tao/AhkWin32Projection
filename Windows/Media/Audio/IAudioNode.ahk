#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\Effects\IAudioEffectDefinition.ahk
#Include ..\MediaProperties\AudioEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines an audio node.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNode
     * @type {Guid}
     */
    static IID => Guid("{15389d7f-dbd8-4819-bf03-668e9357cd6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EffectDefinitions", "put_OutgoingGain", "get_OutgoingGain", "get_EncodingProperties", "get_ConsumeInput", "put_ConsumeInput", "Start", "Stop", "Reset", "DisableEffectsByDefinition", "EnableEffectsByDefinition"]

    /**
     * Gets the list of effect definitions for the audio node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode.effectdefinitions
     * @type {IVector<IAudioEffectDefinition>} 
     */
    EffectDefinitions {
        get => this.get_EffectDefinitions()
    }

    /**
     * Gets or sets the outgoing gain for the audio node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode.outgoinggain
     * @type {Float} 
     */
    OutgoingGain {
        get => this.get_OutgoingGain()
        set => this.put_OutgoingGain(value)
    }

    /**
     * Gets the encoding properties for the audio node.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode.encodingproperties
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * Gets or sets a value indicating if the audio node consumes input.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode.consumeinput
     * @type {Boolean} 
     */
    ConsumeInput {
        get => this.get_ConsumeInput()
        set => this.put_ConsumeInput(value)
    }

    /**
     * 
     * @returns {IVector<IAudioEffectDefinition>} 
     */
    get_EffectDefinitions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IAudioEffectDefinition, value)
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OutgoingGain(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OutgoingGain() {
        result := ComCall(8, this, "double*", &value := 0, "int")
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
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ConsumeInput() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ConsumeInput(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Starts the audio node.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode.start
     */
    Start() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops the audio node.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode.stop
     */
    Stop() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resets the audio node.
     * @remarks
     * Calling this method causes [DiscardQueuedFrames](../windows.media.effects/ibasicaudioeffect_discardqueuedframes_1358903059.md) to be called on any audio effects applied to the audio node.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode.reset
     */
    Reset() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disables all effects in the [EffectDefinitions](iaudionode_effectdefinitions.md) list with the specified effect definition.
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to disable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode.disableeffectsbydefinition
     */
    DisableEffectsByDefinition(definition) {
        result := ComCall(15, this, "ptr", definition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables all effects in the [EffectDefinitions](iaudionode_effectdefinitions.md) list with the specified effect definition.
     * @param {IAudioEffectDefinition} definition The effect definition of the effects to enable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionode.enableeffectsbydefinition
     */
    EnableEffectsByDefinition(definition) {
        result := ComCall(16, this, "ptr", definition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
