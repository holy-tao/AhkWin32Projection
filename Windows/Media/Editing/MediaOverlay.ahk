#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaOverlay.ahk
#Include .\IMediaOverlayFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an overlay that can be used in a media composition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlay
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class MediaOverlay extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaOverlay

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaOverlay.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [MediaOverlay](mediaoverlay.md) class.
     * @param {MediaClip} clip The media clip to be used for the overlay.
     * @returns {MediaOverlay} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlay.#ctor
     */
    static Create(clip) {
        if (!MediaOverlay.HasProp("__IMediaOverlayFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaOverlay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaOverlayFactory.IID)
            MediaOverlay.__IMediaOverlayFactory := IMediaOverlayFactory(factoryPtr)
        }

        return MediaOverlay.__IMediaOverlayFactory.Create(clip)
    }

    /**
     * Initializes a new instance of the [MediaOverlay](mediaoverlay.md) class.
     * @param {MediaClip} clip The media clip to be used for the overlay.
     * @param {RECT} position The position of the overlay.
     * @param {Float} opacity The opacity of the overlay, in the range of 0.0 to 1.0, where 0.0 is completely transparent and 1.0 is completely opaque.
     * @returns {MediaOverlay} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlay.#ctor
     */
    static CreateWithPositionAndOpacity(clip, position, opacity) {
        if (!MediaOverlay.HasProp("__IMediaOverlayFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaOverlay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaOverlayFactory.IID)
            MediaOverlay.__IMediaOverlayFactory := IMediaOverlayFactory(factoryPtr)
        }

        return MediaOverlay.__IMediaOverlayFactory.CreateWithPositionAndOpacity(clip, position, opacity)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the position of the overlay.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlay.position
     * @type {RECT} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets or sets the time span from the start of the clip after which the media overlay should be rendered.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlay.delay
     * @type {TimeSpan} 
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * Gets the opacity of the overlay.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlay.opacity
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * Gets the media clip to be used for the overlay.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlay.clip
     * @type {MediaClip} 
     */
    Clip {
        get => this.get_Clip()
    }

    /**
     * Gets or sets a value indicating whether audio is enabled for the [MediaOverlay](mediaoverlay.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlay.audioenabled
     * @type {Boolean} 
     */
    AudioEnabled {
        get => this.get_AudioEnabled()
        set => this.put_AudioEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Position() {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.get_Position()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.put_Position(value)
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Delay(value) {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.put_Delay(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Delay() {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.get_Delay()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.get_Opacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Opacity(value) {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.put_Opacity(value)
    }

    /**
     * Creates a [MediaOverlay](mediaoverlay.md) object that is identical to this instance.
     * @returns {MediaOverlay} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlay.clone
     */
    Clone() {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.Clone()
    }

    /**
     * 
     * @returns {MediaClip} 
     */
    get_Clip() {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.get_Clip()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AudioEnabled() {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.get_AudioEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AudioEnabled(value) {
        if (!this.HasProp("__IMediaOverlay")) {
            if ((queryResult := this.QueryInterface(IMediaOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlay := IMediaOverlay(outPtr)
        }

        return this.__IMediaOverlay.put_AudioEnabled(value)
    }

;@endregion Instance Methods
}
