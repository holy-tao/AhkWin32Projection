#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlayerSurface.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to a [ICompositionSurface](../windows.ui.composition/icompositionsurface.md) that is shared between a [MediaPlayer](mediaplayer.md) and a [Compositor](../windows.ui.composition/compositor.md) to enable the rendering of **MediaPlayer** content using the [Windows.UI.Composition](../windows.ui.composition/windows_ui_composition.md) APIs without requiring the use of the XAML framework.
 * @remarks
 * Get an instance of this class by calling [MediaPlayer.GetSurface](mediaplayer_getsurface_812026623.md).
 * 
 * For more information on using the [Windows.UI.Composition](../windows.ui.composition/windows_ui_composition.md) APIs to render visuals, see [Visual layer](/windows/uwp/graphics/visual-layer).
 * 
 * For how-to guidance for rendering video to a composition surface, see [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayersurface
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlayerSurface extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlayerSurface

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlayerSurface.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ICompositionSurface](../windows.ui.composition/icompositionsurface.md) for rendering [MediaPlayer](mediaplayer.md) content.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayersurface.compositionsurface
     * @type {ICompositionSurface} 
     */
    CompositionSurface {
        get => this.get_CompositionSurface()
    }

    /**
     * Gets the [Compositor](../windows.ui.composition/compositor.md) with which the surface will be used.
     * @remarks
     * Specify the [Compositor](../windows.ui.composition/compositor.md) for the surface by passing it in as an argument to [MediaPlayer.GetSurface](mediaplayer_getsurface_812026623.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayersurface.compositor
     * @type {Compositor} 
     */
    Compositor {
        get => this.get_Compositor()
    }

    /**
     * Gets the [MediaPlayer](mediaplayer.md) associated with the [MediaPlayerSurface](mediaplayersurface.md).
     * @remarks
     * The returned [MediaPlayer](mediaplayer.md) instance is the one on which [GetSurface](mediaplayer_getsurface_812026623.md) was called to generate the [MediaPlayerSurface](mediaplayersurface.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayersurface.mediaplayer
     * @type {MediaPlayer} 
     */
    MediaPlayer {
        get => this.get_MediaPlayer()
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
     * @returns {ICompositionSurface} 
     */
    get_CompositionSurface() {
        if (!this.HasProp("__IMediaPlayerSurface")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSurface := IMediaPlayerSurface(outPtr)
        }

        return this.__IMediaPlayerSurface.get_CompositionSurface()
    }

    /**
     * 
     * @returns {Compositor} 
     */
    get_Compositor() {
        if (!this.HasProp("__IMediaPlayerSurface")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSurface := IMediaPlayerSurface(outPtr)
        }

        return this.__IMediaPlayerSurface.get_Compositor()
    }

    /**
     * 
     * @returns {MediaPlayer} 
     */
    get_MediaPlayer() {
        if (!this.HasProp("__IMediaPlayerSurface")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSurface := IMediaPlayerSurface(outPtr)
        }

        return this.__IMediaPlayerSurface.get_MediaPlayer()
    }

    /**
     * Closes the [MediaPlayerSurface](mediaplayersurface.md) and disposes of associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [MediaPlayerSurface](mediaplayersurface.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayersurface.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
