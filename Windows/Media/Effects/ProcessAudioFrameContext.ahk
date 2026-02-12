#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessAudioFrameContext.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides context for performing a custom audio effect operation within the [ProcessFrame](ibasicaudioeffect_processframe_1501667467.md) method.
 * @remarks
 * To retrieve an instance of this class, implement the [ProcessFrame](ibasicaudioeffect_processframe_1501667467.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.processaudioframecontext
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class ProcessAudioFrameContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessAudioFrameContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessAudioFrameContext.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the input frame for an audio effect operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.processaudioframecontext.inputframe
     * @type {AudioFrame} 
     */
    InputFrame {
        get => this.get_InputFrame()
    }

    /**
     * Gets the output frame for an audio effect operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.processaudioframecontext.outputframe
     * @type {AudioFrame} 
     */
    OutputFrame {
        get => this.get_OutputFrame()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AudioFrame} 
     */
    get_InputFrame() {
        if (!this.HasProp("__IProcessAudioFrameContext")) {
            if ((queryResult := this.QueryInterface(IProcessAudioFrameContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessAudioFrameContext := IProcessAudioFrameContext(outPtr)
        }

        return this.__IProcessAudioFrameContext.get_InputFrame()
    }

    /**
     * 
     * @returns {AudioFrame} 
     */
    get_OutputFrame() {
        if (!this.HasProp("__IProcessAudioFrameContext")) {
            if ((queryResult := this.QueryInterface(IProcessAudioFrameContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessAudioFrameContext := IProcessAudioFrameContext(outPtr)
        }

        return this.__IProcessAudioFrameContext.get_OutputFrame()
    }

;@endregion Instance Methods
}
