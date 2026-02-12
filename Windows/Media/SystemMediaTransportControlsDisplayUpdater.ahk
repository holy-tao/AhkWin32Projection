#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemMediaTransportControlsDisplayUpdater.ahk
#Include ..\..\Guid.ahk

/**
 * Provides functionality to update the music information that is displayed on the [SystemMediaTransportControls](systemmediatransportcontrols.md).
 * @remarks
 * Starting with Windows 10, version 1607, UWP apps that use the [MediaPlayer](../windows.media.playback/mediaplayer.md) class to play media are automatically integrated with the SMTC by default. With automatic integration, you update the media metadata, such as the title of a media item, using the [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) class. Call [GetDisplayProperties](../windows.media.playback/mediaplaybackitem_getdisplayproperties_103236454.md) to get an instance of the [MediaItemDisplayProperties](../windows.media.playback/mediaitemdisplayproperties.md) class. Update the object with the values you want to be displayed for the item in the SMTC and then call [ApplyDisplayProperties](../windows.media.playback/mediaplaybackitem_applydisplayproperties_1634192028.md) to commit the changes. For how-to guidance on using the SMTC from your app, see [Integrate with the SystemMediaTransportControls](/windows/uwp/audio-video-camera/integrate-with-systemmediatransportcontrols).
 * 
 * If you are disabling manual SMTC integration or you are targeting an older version of Windows, you must use the [SystemMediaTransportControls.DisplayUpdater](systemmediatransportcontrols_displayupdater.md) to update the media metadata. For how-to guidance on manually controlling the SMTC, see [Manual control of the System Media Transport Controls](/windows/uwp/audio-video-camera/system-media-transport-controls).
 * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class SystemMediaTransportControlsDisplayUpdater extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemMediaTransportControlsDisplayUpdater

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemMediaTransportControlsDisplayUpdater.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the type of media.
     * @remarks
     * > [!Note]
     * > Apps should set a value for the **Type** property even if they aren't supplying other media metadata to be displayed by the System Media Transport Controls. 
     * This value helps the system handle your media content correctly, including preventing the screen saver from activating during playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the media id of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater.appmediaid
     * @type {HSTRING} 
     */
    AppMediaId {
        get => this.get_AppMediaId()
        set => this.put_AppMediaId(value)
    }

    /**
     * Gets or sets thumbnail image associated with the currently playing media.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater.thumbnail
     * @type {RandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * Gets the music properties associated with the currently playing media.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater.musicproperties
     * @type {MusicDisplayProperties} 
     */
    MusicProperties {
        get => this.get_MusicProperties()
    }

    /**
     * Gets the video properties associated with the currently playing media.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater.videoproperties
     * @type {VideoDisplayProperties} 
     */
    VideoProperties {
        get => this.get_VideoProperties()
    }

    /**
     * Gets the image properties associated with the currently playing media.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater.imageproperties
     * @type {ImageDisplayProperties} 
     */
    ImageProperties {
        get => this.get_ImageProperties()
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
    get_Type() {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.get_Type()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.put_Type(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppMediaId() {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.get_AppMediaId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AppMediaId(value) {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.put_AppMediaId(value)
    }

    /**
     * 
     * @returns {RandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.get_Thumbnail()
    }

    /**
     * 
     * @param {RandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {MusicDisplayProperties} 
     */
    get_MusicProperties() {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.get_MusicProperties()
    }

    /**
     * 
     * @returns {VideoDisplayProperties} 
     */
    get_VideoProperties() {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.get_VideoProperties()
    }

    /**
     * 
     * @returns {ImageDisplayProperties} 
     */
    get_ImageProperties() {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.get_ImageProperties()
    }

    /**
     * Initialize the media properties using the specified file.
     * @param {Integer} type The type of media.
     * @param {StorageFile} source The file to initialize the media properties.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater.copyfromfileasync
     */
    CopyFromFileAsync(type, source) {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.CopyFromFileAsync(type, source)
    }

    /**
     * Clears out all of the media metadata.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater.clearall
     */
    ClearAll() {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.ClearAll()
    }

    /**
     * Updates the metadata for the currently playing media.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsdisplayupdater.update
     */
    Update() {
        if (!this.HasProp("__ISystemMediaTransportControlsDisplayUpdater")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsDisplayUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsDisplayUpdater := ISystemMediaTransportControlsDisplayUpdater(outPtr)
        }

        return this.__ISystemMediaTransportControlsDisplayUpdater.Update()
    }

;@endregion Instance Methods
}
