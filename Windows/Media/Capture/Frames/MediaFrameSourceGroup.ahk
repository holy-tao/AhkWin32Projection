#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaFrameSourceGroup.ahk
#Include .\IMediaFrameSourceGroupStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a group of media frame sources that can be used simultaneously by a [MediaCapture](../windows.media.capture/mediacapture.md).
 * @remarks
 * Get an instance of this class by calling [FindAllAsync](mediaframesourcegroup_findallasync_326280522.md) and selecting an instance from the returned list. If you know the unique identifier of a media frame source group, you can get an instance of this class by calling [FromIdAsync](mediaframesourcegroup_fromidasync_1322863552.md).
 * 
 * Initialize a [MediaCapture](../windows.media.capture/mediacapture.md) object to use the selected **MediaFrameSourceGroup** by assigning the group to the [SourceGroup](../windows.media.capture/mediacaptureinitializationsettings_sourcegroup.md) property of a [MediaCaptureInitializationSettings](../windows.media.capture/mediacaptureinitializationsettings.md) object, and then passing that settings object into [InitializeAsync](../windows.media.capture/mediacapture_initializeasync_315323248.md).
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegroup
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameSourceGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaFrameSourceGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaFrameSourceGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously retrieves a list of the available media frame source groups on the current device.
     * @remarks
     * If MediaFrameSourceGroup.FindAllAsync() returns zero groups, request the Webcam capability in your Package.appxmanifest file.
     * @returns {IAsyncOperation<IVectorView<MediaFrameSourceGroup>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegroup.findallasync
     */
    static FindAllAsync() {
        if (!MediaFrameSourceGroup.HasProp("__IMediaFrameSourceGroupStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.Frames.MediaFrameSourceGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaFrameSourceGroupStatics.IID)
            MediaFrameSourceGroup.__IMediaFrameSourceGroupStatics := IMediaFrameSourceGroupStatics(factoryPtr)
        }

        return MediaFrameSourceGroup.__IMediaFrameSourceGroupStatics.FindAllAsync()
    }

    /**
     * Asynchronously gets the media frame source group with the specified ID.
     * @param {HSTRING} id The unique identifier of a media frame source group.
     * @returns {IAsyncOperation<MediaFrameSourceGroup>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegroup.fromidasync
     */
    static FromIdAsync(id) {
        if (!MediaFrameSourceGroup.HasProp("__IMediaFrameSourceGroupStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.Frames.MediaFrameSourceGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaFrameSourceGroupStatics.IID)
            MediaFrameSourceGroup.__IMediaFrameSourceGroupStatics := IMediaFrameSourceGroupStatics(factoryPtr)
        }

        return MediaFrameSourceGroup.__IMediaFrameSourceGroupStatics.FromIdAsync(id)
    }

    /**
     * Gets a device selector string that can be used to initialize a [DeviceWatcher](../windows.devices.enumeration/devicewatcher.md), which allows you receive notifications when the set of available media frame source groups changes.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegroup.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!MediaFrameSourceGroup.HasProp("__IMediaFrameSourceGroupStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.Frames.MediaFrameSourceGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaFrameSourceGroupStatics.IID)
            MediaFrameSourceGroup.__IMediaFrameSourceGroupStatics := IMediaFrameSourceGroupStatics(factoryPtr)
        }

        return MediaFrameSourceGroup.__IMediaFrameSourceGroupStatics.GetDeviceSelector()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a unique identifier for the media frame source group.
     * @remarks
     * Use this identifier when calling [FromIdAsync](mediaframesourcegroup_fromidasync_1322863552.md) to retrieve a specific media frame source group.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegroup.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the human-readable name for the media frame source group.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegroup.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets a list of [MediaFrameSourceInfo](mediaframesourceinfo.md) objects that describe each media frame source in the group.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegroup.sourceinfos
     * @type {IVectorView<MediaFrameSourceInfo>} 
     */
    SourceInfos {
        get => this.get_SourceInfos()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IMediaFrameSourceGroup")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceGroup := IMediaFrameSourceGroup(outPtr)
        }

        return this.__IMediaFrameSourceGroup.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IMediaFrameSourceGroup")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceGroup := IMediaFrameSourceGroup(outPtr)
        }

        return this.__IMediaFrameSourceGroup.get_DisplayName()
    }

    /**
     * 
     * @returns {IVectorView<MediaFrameSourceInfo>} 
     */
    get_SourceInfos() {
        if (!this.HasProp("__IMediaFrameSourceGroup")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceGroup := IMediaFrameSourceGroup(outPtr)
        }

        return this.__IMediaFrameSourceGroup.get_SourceInfos()
    }

;@endregion Instance Methods
}
