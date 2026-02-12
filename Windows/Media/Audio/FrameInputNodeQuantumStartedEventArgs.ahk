#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameInputNodeQuantumStartedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AudioFrameInputNode.QuantumStarted](audioframeinputnode_quantumstarted.md) event. This event is raised when the audio graph containing the audio frame input node is ready to begin processing a new quantum of data.
 * @remarks
 * Get an instance of this class by handling the [AudioFrameInputNode.QuantumStarted](audioframeinputnode_quantumstarted.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.frameinputnodequantumstartedeventargs
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class FrameInputNodeQuantumStartedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameInputNodeQuantumStartedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameInputNodeQuantumStartedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of samples that the audio graph requires to fill the quantum with data.
     * @remarks
     * Pass an [AudioFrame](audioframecompletedeventargs.md) into the [AddFrame](audioframeinputnode_addframe_561479871.md) method to provide the required audio samples. It is recommended that you only submit the number of samples requested by the audio graph. Submitting extra samples can result in latency in the audio graph.
     * 
     * If the amount of data currently in the node is more than enough to fill one quantum, **RequiredSamples** will be 0.
     * 
     * Note that the count returned by this property represents the required number of audio frames to fill the quantum. The number of samples required depends on the number of channels in the audio encoding settings. For example, for 2-channel audio the required number of samples is actually twice the value returned by this property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.frameinputnodequantumstartedeventargs.requiredsamples
     * @type {Integer} 
     */
    RequiredSamples {
        get => this.get_RequiredSamples()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequiredSamples() {
        if (!this.HasProp("__IFrameInputNodeQuantumStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(IFrameInputNodeQuantumStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameInputNodeQuantumStartedEventArgs := IFrameInputNodeQuantumStartedEventArgs(outPtr)
        }

        return this.__IFrameInputNodeQuantumStartedEventArgs.get_RequiredSamples()
    }

;@endregion Instance Methods
}
