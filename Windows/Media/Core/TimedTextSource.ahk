#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedTextSource.ahk
#Include .\ITimedTextSourceStatics.ahk
#Include .\ITimedTextSourceStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\TimedTextSource.ahk
#Include .\TimedTextSourceResolveResultEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a source of timed text data.
 * @remarks
 * Get an instance of **TimedTextSource** from one of the factory methods, [CreateFromStream](timedtextsource_createfromstream_1985521886.md) or [CreateFromUri](timedtextsource_createfromuri_1421797945.md). After obtaining an instance, you can use it to set the [MediaSource.ExternalTimedTextSources](mediasource_externaltimedtextsources.md) property of a [MediaSource](mediasource.md) object to initialize its [ExternalTimedMetadataTracks](mediasource_externaltimedmetadatatracks.md) collection.
 * 
 * For how-to guidance for working with external timed text sources, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * 
 * For a list of supported timed text formats, see [Supported codecs](/windows/uwp/audio-video-camera/supported-codecs).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsource
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedTextSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedTextSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of [TimedTextSource](timedtextsource.md) with the specified default language from the provided stream.
     * @param {IRandomAccessStream} stream The stream from which the timed text source is created.
     * @returns {TimedTextSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsource.createfromstream
     */
    static CreateFromStream(stream) {
        if (!TimedTextSource.HasProp("__ITimedTextSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedTextSourceStatics.IID)
            TimedTextSource.__ITimedTextSourceStatics := ITimedTextSourceStatics(factoryPtr)
        }

        return TimedTextSource.__ITimedTextSourceStatics.CreateFromStream(stream)
    }

    /**
     * Creates a new instance of [TimedTextSource](timedtextsource.md) with the specified default language from the provided URI.
     * @param {Uri} uri_ The URI from which the timed text source is created.
     * @returns {TimedTextSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsource.createfromuri
     */
    static CreateFromUri(uri_) {
        if (!TimedTextSource.HasProp("__ITimedTextSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedTextSourceStatics.IID)
            TimedTextSource.__ITimedTextSourceStatics := ITimedTextSourceStatics(factoryPtr)
        }

        return TimedTextSource.__ITimedTextSourceStatics.CreateFromUri(uri_)
    }

    /**
     * Creates a new instance of [TimedTextSource](timedtextsource.md) from the provided stream.
     * @param {IRandomAccessStream} stream The stream from which the timed text source is created.
     * @param {HSTRING} defaultLanguage 
     * @returns {TimedTextSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsource.createfromstream
     */
    static CreateFromStreamWithLanguage(stream, defaultLanguage) {
        if (!TimedTextSource.HasProp("__ITimedTextSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedTextSourceStatics.IID)
            TimedTextSource.__ITimedTextSourceStatics := ITimedTextSourceStatics(factoryPtr)
        }

        return TimedTextSource.__ITimedTextSourceStatics.CreateFromStreamWithLanguage(stream, defaultLanguage)
    }

    /**
     * Creates a new instance of [TimedTextSource](timedtextsource.md) from the provided URI.
     * @param {Uri} uri_ The URI from which the timed text source is created.
     * @param {HSTRING} defaultLanguage 
     * @returns {TimedTextSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsource.createfromuri
     */
    static CreateFromUriWithLanguage(uri_, defaultLanguage) {
        if (!TimedTextSource.HasProp("__ITimedTextSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedTextSourceStatics.IID)
            TimedTextSource.__ITimedTextSourceStatics := ITimedTextSourceStatics(factoryPtr)
        }

        return TimedTextSource.__ITimedTextSourceStatics.CreateFromUriWithLanguage(uri_, defaultLanguage)
    }

    /**
     * Creates a new instance of [TimedTextSource](timedtextsource.md) that uses image-based subtitles from the provided image and index streams and sets the default language.
     * @param {IRandomAccessStream} stream A stream containing the image data for image-based subtitles.
     * @param {IRandomAccessStream} indexStream A stream containing the index data for image-based subtitles.
     * @returns {TimedTextSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsource.createfromstreamwithindex
     */
    static CreateFromStreamWithIndex(stream, indexStream) {
        if (!TimedTextSource.HasProp("__ITimedTextSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedTextSourceStatics2.IID)
            TimedTextSource.__ITimedTextSourceStatics2 := ITimedTextSourceStatics2(factoryPtr)
        }

        return TimedTextSource.__ITimedTextSourceStatics2.CreateFromStreamWithIndex(stream, indexStream)
    }

    /**
     * Creates a new instance of [TimedTextSource](timedtextsource.md) that uses image-based subtitles from the provided image and index URIs and sets the default language.
     * @param {Uri} uri_ The URI of the image data from which the timed text source is created.
     * @param {Uri} indexUri The URI of the index data from which the timed text source is created.
     * @returns {TimedTextSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsource.createfromuriwithindex
     */
    static CreateFromUriWithIndex(uri_, indexUri) {
        if (!TimedTextSource.HasProp("__ITimedTextSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedTextSourceStatics2.IID)
            TimedTextSource.__ITimedTextSourceStatics2 := ITimedTextSourceStatics2(factoryPtr)
        }

        return TimedTextSource.__ITimedTextSourceStatics2.CreateFromUriWithIndex(uri_, indexUri)
    }

    /**
     * Creates a new instance of [TimedTextSource](timedtextsource.md) that uses image-based subtitles from the provided image and index streams.
     * @param {IRandomAccessStream} stream A stream containing the image data for image-based subtitles.
     * @param {IRandomAccessStream} indexStream A stream containing the index data for image-based subtitles.
     * @param {HSTRING} defaultLanguage 
     * @returns {TimedTextSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsource.createfromstreamwithindex
     */
    static CreateFromStreamWithIndexAndLanguage(stream, indexStream, defaultLanguage) {
        if (!TimedTextSource.HasProp("__ITimedTextSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedTextSourceStatics2.IID)
            TimedTextSource.__ITimedTextSourceStatics2 := ITimedTextSourceStatics2(factoryPtr)
        }

        return TimedTextSource.__ITimedTextSourceStatics2.CreateFromStreamWithIndexAndLanguage(stream, indexStream, defaultLanguage)
    }

    /**
     * Creates a new instance of [TimedTextSource](timedtextsource.md) that uses image-based subtitles from the provided image and index URIs.
     * @param {Uri} uri_ The URI of the image data from which the timed text source is created.
     * @param {Uri} indexUri The URI of the index data from which the timed text source is created.
     * @param {HSTRING} defaultLanguage 
     * @returns {TimedTextSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsource.createfromuriwithindex
     */
    static CreateFromUriWithIndexAndLanguage(uri_, indexUri, defaultLanguage) {
        if (!TimedTextSource.HasProp("__ITimedTextSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedTextSourceStatics2.IID)
            TimedTextSource.__ITimedTextSourceStatics2 := ITimedTextSourceStatics2(factoryPtr)
        }

        return TimedTextSource.__ITimedTextSourceStatics2.CreateFromUriWithIndexAndLanguage(uri_, indexUri, defaultLanguage)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnResolvedToken")) {
            this.remove_Resolved(this.__OnResolvedToken)
            this.__OnResolved.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<TimedTextSource, TimedTextSourceResolveResultEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Resolved(handler) {
        if (!this.HasProp("__ITimedTextSource")) {
            if ((queryResult := this.QueryInterface(ITimedTextSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSource := ITimedTextSource(outPtr)
        }

        return this.__ITimedTextSource.add_Resolved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Resolved(token) {
        if (!this.HasProp("__ITimedTextSource")) {
            if ((queryResult := this.QueryInterface(ITimedTextSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSource := ITimedTextSource(outPtr)
        }

        return this.__ITimedTextSource.remove_Resolved(token)
    }

;@endregion Instance Methods
}
