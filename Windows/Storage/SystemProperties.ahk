#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemProperties.ahk
#Include ..\..\Guid.ahk

/**
 * Provides string values for indexing names of common [Windows file properties](/windows/desktop/properties/props) such as [System.Title](/windows/desktop/properties/props-system-title), and also references helper objects that provide indexing names for properties of specific file types (for example video files).
 * @remarks
 * The scenario for using SystemProperties is when you are defining search indexes or other operations where you want the indexing to use the same name for a property that the system has already defined, as one of the [Windows file properties](/windows/desktop/properties/props).
 * 
 * Some of the SystemProperties properties return a string name directly. For example, [SystemProperties.Title](systemproperties_title.md) returns the string "System.Title". Some of the SystemProperties properties return a helper object. For example, [SystemProperties.Video](systemproperties_video.md) returns a [SystemVideoProperties](systemvideoproperties.md) object. You can then use this object's properties to get the name for a video-specific [Windows file property](/windows/desktop/properties/props), for example [SystemVideoProperties.FrameHeight](systemvideoproperties_frameheight.md) returns "System.Video.FrameHeight".
 * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SystemProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets the name of the [System.Author](/windows/desktop/properties/props-system-author) property (one of the [Windows file properties](/windows/desktop/properties/props).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.author
     * @type {HSTRING} 
     */
    static Author {
        get => SystemProperties.get_Author()
    }

    /**
     * Gets the name of the [System.Comment](/windows/desktop/properties/props-system-comment) property (one of the [Windows file properties](/windows/desktop/properties/props).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.comment
     * @type {HSTRING} 
     */
    static Comment {
        get => SystemProperties.get_Comment()
    }

    /**
     * Gets the name of the [System.ItemNameDisplay](/windows/desktop/properties/props-system-itemnamedisplay) property (one of the [Windows file properties](/windows/desktop/properties/props).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.itemnamedisplay
     * @type {HSTRING} 
     */
    static ItemNameDisplay {
        get => SystemProperties.get_ItemNameDisplay()
    }

    /**
     * Gets the name of the [System.Keywords](/windows/desktop/properties/props-system-keywords) property (one of the [Windows file properties](/windows/desktop/properties/props).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.keywords
     * @type {HSTRING} 
     */
    static Keywords {
        get => SystemProperties.get_Keywords()
    }

    /**
     * Gets the name of the [System.Rating](/windows/desktop/properties/props-system-rating) property (one of the [Windows file properties](/windows/desktop/properties/props).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.rating
     * @type {HSTRING} 
     */
    static Rating {
        get => SystemProperties.get_Rating()
    }

    /**
     * Gets the name of the [System.Title](/windows/desktop/properties/props-system-title) property (one of the [Windows file properties](/windows/desktop/properties/props).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.title
     * @type {HSTRING} 
     */
    static Title {
        get => SystemProperties.get_Title()
    }

    /**
     * Gets an object that provides the indexing names of [Windows file properties](/windows/desktop/properties/props) for **System.Audio**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.audio
     * @type {SystemAudioProperties} 
     */
    static Audio {
        get => SystemProperties.get_Audio()
    }

    /**
     * Gets an object that provides the indexing names of [Windows system file properties](/windows/desktop/properties/props) for **System.GPS**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.gps
     * @type {SystemGPSProperties} 
     */
    static GPS {
        get => SystemProperties.get_GPS()
    }

    /**
     * Gets an object that provides the indexing names of [system media file properties](/windows/desktop/properties/media-bumper) such as [System.Media.Duration](/windows/desktop/properties/props-system-media-duration).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.media
     * @type {SystemMediaProperties} 
     */
    static Media {
        get => SystemProperties.get_Media()
    }

    /**
     * Gets an object that provides the indexing names of [Windows file properties](/windows/desktop/properties/props) for **System.Music**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.music
     * @type {SystemMusicProperties} 
     */
    static Music {
        get => SystemProperties.get_Music()
    }

    /**
     * Gets an object that provides the indexing names of [Windows file properties](/windows/desktop/properties/props) for **System.Photo**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.photo
     * @type {SystemPhotoProperties} 
     */
    static Photo {
        get => SystemProperties.get_Photo()
    }

    /**
     * Gets an object that provides the indexing names of [Windows file properties](/windows/desktop/properties/props) for **System.Video**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.video
     * @type {SystemVideoProperties} 
     */
    static Video {
        get => SystemProperties.get_Video()
    }

    /**
     * Gets an object that provides the indexing names of [Windows file properties](/windows/desktop/properties/props) for **System.Image**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemproperties.image
     * @type {SystemImageProperties} 
     */
    static Image {
        get => SystemProperties.get_Image()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Author() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Author()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Comment() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Comment()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ItemNameDisplay() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_ItemNameDisplay()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Keywords() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Keywords()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rating() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Rating()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Title() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Title()
    }

    /**
     * 
     * @returns {SystemAudioProperties} 
     */
    static get_Audio() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Audio()
    }

    /**
     * 
     * @returns {SystemGPSProperties} 
     */
    static get_GPS() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_GPS()
    }

    /**
     * 
     * @returns {SystemMediaProperties} 
     */
    static get_Media() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Media()
    }

    /**
     * 
     * @returns {SystemMusicProperties} 
     */
    static get_Music() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Music()
    }

    /**
     * 
     * @returns {SystemPhotoProperties} 
     */
    static get_Photo() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Photo()
    }

    /**
     * 
     * @returns {SystemVideoProperties} 
     */
    static get_Video() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Video()
    }

    /**
     * 
     * @returns {SystemImageProperties} 
     */
    static get_Image() {
        if (!SystemProperties.HasProp("__ISystemProperties")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemProperties.IID)
            SystemProperties.__ISystemProperties := ISystemProperties(factoryPtr)
        }

        return SystemProperties.__ISystemProperties.get_Image()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
