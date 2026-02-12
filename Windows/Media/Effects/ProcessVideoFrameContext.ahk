#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessVideoFrameContext.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides context for performing a custom video effect operation within the [ProcessFrame](ibasicvideoeffect_processframe_1753355935.md) method.
 * @remarks
 * To retrieve an instance of this class, implement the [ProcessFrame](ibasicaudioeffect_processframe_1501667467.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.processvideoframecontext
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class ProcessVideoFrameContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessVideoFrameContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessVideoFrameContext.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the input frame for a video effect operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.processvideoframecontext.inputframe
     * @type {VideoFrame} 
     */
    InputFrame {
        get => this.get_InputFrame()
    }

    /**
     * Gets the output frame for a video effect operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.processvideoframecontext.outputframe
     * @type {VideoFrame} 
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
     * @returns {VideoFrame} 
     */
    get_InputFrame() {
        if (!this.HasProp("__IProcessVideoFrameContext")) {
            if ((queryResult := this.QueryInterface(IProcessVideoFrameContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessVideoFrameContext := IProcessVideoFrameContext(outPtr)
        }

        return this.__IProcessVideoFrameContext.get_InputFrame()
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_OutputFrame() {
        if (!this.HasProp("__IProcessVideoFrameContext")) {
            if ((queryResult := this.QueryInterface(IProcessVideoFrameContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessVideoFrameContext := IProcessVideoFrameContext(outPtr)
        }

        return this.__IProcessVideoFrameContext.get_OutputFrame()
    }

;@endregion Instance Methods
}
