#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToSource.ahk
#Include .\IPlayToSourceWithPreferredSourceUri.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a media element to connect to a Play To target.
 * @remarks
 * For an example of using the PlayToSource class, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosource
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToSource.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the connection to the Play To target.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosource.connection
     * @type {PlayToConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * Gets or sets the next Play To source element.
     * @remarks
     * For an example of using the Next property, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosource.next
     * @type {PlayToSource} 
     */
    Next {
        get => this.get_Next()
        set => this.put_Next(value)
    }

    /**
     * Specifies a preferred Uniform Resource Identifier (URI) for the media stream, such as a cloud based media server, used is used for Play To by reference.
     * @remarks
     * Play To by reference enables web pages and UWP apps to play Digital Rights Management (DRM) protected content. The app specifies a preferred Uniform Resource Identifier (URI) that will be sent to the PlayTo target device. This Uniform Resource Identifier (URI) can point to a cloud based media server. If the preferredSourceUri is present, the PlayTo target device can stream content directly from the cloud, which can be Digital Rights Management (DRM) protected, instead of streaming content from the Windows 8.1 machine which must be unprotected content.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosource.preferredsourceuri
     * @type {Uri} 
     */
    PreferredSourceUri {
        get => this.get_PreferredSourceUri()
        set => this.put_PreferredSourceUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PlayToConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IPlayToSource")) {
            if ((queryResult := this.QueryInterface(IPlayToSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSource := IPlayToSource(outPtr)
        }

        return this.__IPlayToSource.get_Connection()
    }

    /**
     * 
     * @returns {PlayToSource} 
     */
    get_Next() {
        if (!this.HasProp("__IPlayToSource")) {
            if ((queryResult := this.QueryInterface(IPlayToSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSource := IPlayToSource(outPtr)
        }

        return this.__IPlayToSource.get_Next()
    }

    /**
     * 
     * @param {PlayToSource} value 
     * @returns {HRESULT} 
     */
    put_Next(value) {
        if (!this.HasProp("__IPlayToSource")) {
            if ((queryResult := this.QueryInterface(IPlayToSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSource := IPlayToSource(outPtr)
        }

        return this.__IPlayToSource.put_Next(value)
    }

    /**
     * Connects the next Play To source element to the Play To target.
     * @remarks
     * You can use the PlayNext method to stop streaming the current Play To source media to the target and then start streaming the Play To source identified by the [Next](playtosource_next.md) property to the Play To target.
     * 
     * For an example of using the [Next](playtosource_next.md) property, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosource.playnext
     */
    PlayNext() {
        if (!this.HasProp("__IPlayToSource")) {
            if ((queryResult := this.QueryInterface(IPlayToSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSource := IPlayToSource(outPtr)
        }

        return this.__IPlayToSource.PlayNext()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PreferredSourceUri() {
        if (!this.HasProp("__IPlayToSourceWithPreferredSourceUri")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceWithPreferredSourceUri.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceWithPreferredSourceUri := IPlayToSourceWithPreferredSourceUri(outPtr)
        }

        return this.__IPlayToSourceWithPreferredSourceUri.get_PreferredSourceUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_PreferredSourceUri(value) {
        if (!this.HasProp("__IPlayToSourceWithPreferredSourceUri")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceWithPreferredSourceUri.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceWithPreferredSourceUri := IPlayToSourceWithPreferredSourceUri(outPtr)
        }

        return this.__IPlayToSourceWithPreferredSourceUri.put_PreferredSourceUri(value)
    }

;@endregion Instance Methods
}
