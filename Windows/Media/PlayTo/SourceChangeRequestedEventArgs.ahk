#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISourceChangeRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [SourceChangeRequested](playtoreceiver_sourcechangerequested.md) event.
 * @remarks
 * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
 * 
 * [!code-csharp[SourceChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetSourceChangeRequested)]
 * 
 * [!code-vb[SourceChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetSourceChangeRequested)]
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class SourceChangeRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISourceChangeRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISourceChangeRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the media stream for the Play To receiver.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.stream
     * @type {IRandomAccessStreamWithContentType} 
     */
    Stream {
        get => this.get_Stream()
    }

    /**
     * Gets the title of the content in the media stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the author of the content in the media stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.author
     * @type {HSTRING} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * Gets the name of the album that contains the song in the audio stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.album
     * @type {HSTRING} 
     */
    Album {
        get => this.get_Album()
    }

    /**
     * Gets the names of the genres that the content in the media stream belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.genre
     * @type {HSTRING} 
     */
    Genre {
        get => this.get_Genre()
    }

    /**
     * Gets the description of the content in the media stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the date that the content in the media stream was published.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.date
     * @type {IReference<DateTime>} 
     */
    Date {
        get => this.get_Date()
    }

    /**
     * Gets the thumbnail image for the content in the media stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.thumbnail
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * Gets the rating for the content in the media stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.rating
     * @type {IReference<Integer>} 
     */
    Rating {
        get => this.get_Rating()
    }

    /**
     * Gets custom property names and values for the content in the media stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.sourcechangerequestedeventargs.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IRandomAccessStreamWithContentType} 
     */
    get_Stream() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Stream()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Author() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Author()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Album() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Album()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Genre() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Genre()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Description()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Date() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Date()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Thumbnail()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Rating() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Rating()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__ISourceChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISourceChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISourceChangeRequestedEventArgs := ISourceChangeRequestedEventArgs(outPtr)
        }

        return this.__ISourceChangeRequestedEventArgs.get_Properties()
    }

;@endregion Instance Methods
}
