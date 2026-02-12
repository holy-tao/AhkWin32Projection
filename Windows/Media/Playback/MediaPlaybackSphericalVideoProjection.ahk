#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackSphericalVideoProjection.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the spherical video projection settings for a [MediaPlaybackSession](mediaplaybacksession.md).
 * @remarks
 * Get an instance of this class by acessing the [MediaPlaybackSession.SphericalVideoProjection](mediaplaybacksession_sphericalvideoprojection.md) property. The property values of the returned [MediaPlaybackSphericalVideoProjection](mediaplaybacksphericalvideoprojection.md) object are not guaranteed to be correct until after the [MediaPlayer.MediaOpened](mediaplayer_mediaopened.md) event has been raised for the associated media item.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksphericalvideoprojection
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackSphericalVideoProjection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackSphericalVideoProjection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackSphericalVideoProjection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether spherical video projection is enabled.
     * @remarks
     * The value of this property is not guaranteed to be correct until after the [MediaPlayer.MediaOpened](mediaplayer_mediaopened.md) event has been raised for the associated media item.
     * 
     * If you attempt to set this property to true when the value of the [FrameFormat](mediaplaybacksphericalvideoprojection_frameformat.md) is [None](/uwp/api/windows.media.mediaproperties.sphericalvideoframeformat) or [Unsupported](/uwp/api/windows.media.mediaproperties.sphericalvideoframeformat) an error will be raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksphericalvideoprojection.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a value that specifies the frame format used for spherical video projection.
     * @remarks
     * The value of this property is not guaranteed to be correct until after the [MediaPlayer.MediaOpened](mediaplayer_mediaopened.md) event has been raised for the associated media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksphericalvideoprojection.frameformat
     * @type {Integer} 
     */
    FrameFormat {
        get => this.get_FrameFormat()
        set => this.put_FrameFormat(value)
    }

    /**
     * Gets or sets the horizontal field of view, expressed in degrees, used for spherical video projection.
     * @remarks
     * The value of this property is not guaranteed to be correct until after the [MediaPlayer.MediaOpened](mediaplayer_mediaopened.md) event has been raised for the associated media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksphericalvideoprojection.horizontalfieldofviewindegrees
     * @type {Float} 
     */
    HorizontalFieldOfViewInDegrees {
        get => this.get_HorizontalFieldOfViewInDegrees()
        set => this.put_HorizontalFieldOfViewInDegrees(value)
    }

    /**
     * Gets or sets a quaternion that specifies the current view orientation used to project spherical video.
     * @remarks
     * The value of this property is not guaranteed to be correct until after the [MediaPlayer.MediaOpened](mediaplayer_mediaopened.md) event has been raised for the associated media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksphericalvideoprojection.vieworientation
     * @type {Quaternion} 
     */
    ViewOrientation {
        get => this.get_ViewOrientation()
        set => this.put_ViewOrientation(value)
    }

    /**
     * Gets or sets a value that specifies the projection mode used for spherical video.
     * @remarks
     * The value of this property is not guaranteed to be correct until after the [MediaPlayer.MediaOpened](mediaplayer_mediaopened.md) event has been raised for the associated media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksphericalvideoprojection.projectionmode
     * @type {Integer} 
     */
    ProjectionMode {
        get => this.get_ProjectionMode()
        set => this.put_ProjectionMode(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameFormat() {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.get_FrameFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FrameFormat(value) {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.put_FrameFormat(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalFieldOfViewInDegrees() {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.get_HorizontalFieldOfViewInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalFieldOfViewInDegrees(value) {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.put_HorizontalFieldOfViewInDegrees(value)
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_ViewOrientation() {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.get_ViewOrientation()
    }

    /**
     * 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    put_ViewOrientation(value) {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.put_ViewOrientation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProjectionMode() {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.get_ProjectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProjectionMode(value) {
        if (!this.HasProp("__IMediaPlaybackSphericalVideoProjection")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSphericalVideoProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSphericalVideoProjection := IMediaPlaybackSphericalVideoProjection(outPtr)
        }

        return this.__IMediaPlaybackSphericalVideoProjection.put_ProjectionMode(value)
    }

;@endregion Instance Methods
}
