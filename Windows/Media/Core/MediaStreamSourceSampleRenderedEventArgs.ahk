#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSourceSampleRenderedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaStreamSource.SampleRendered](mediastreamsource_samplerendered.md) event, which occurs when a sample from a [MediaStreamSource](mediastreamsource.md) is rendered. Use [SampleLag](mediastreamsourcesamplerenderedeventargs_samplelag.md) property to determine if there is a lag in the rendering of a sample, in which case you may decide to switch to a lower-bandwidth stream.
 * @remarks
 * Get an instance of this class by handling the [MediaStreamSource.SampleRendered](mediastreamsource_samplerendered.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerenderedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceSampleRenderedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSourceSampleRenderedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSourceSampleRenderedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a time span representing the lag with which a sample was rendered.
     * @remarks
     * If the value of this property is greater than 0, then the sample was rendered late. In this case, depending on the size of the lag, you may choose to switch to a lower bandwidth stream in order to reduce lag.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerenderedeventargs.samplelag
     * @type {TimeSpan} 
     */
    SampleLag {
        get => this.get_SampleLag()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SampleLag() {
        if (!this.HasProp("__IMediaStreamSourceSampleRenderedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSampleRenderedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSampleRenderedEventArgs := IMediaStreamSourceSampleRenderedEventArgs(outPtr)
        }

        return this.__IMediaStreamSourceSampleRenderedEventArgs.get_SampleLag()
    }

;@endregion Instance Methods
}
