#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the result of a [MediaFrameSourceController.SetPropertyAsync](mediaframesourcecontroller_setpropertyasync_419187035.md) operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcesetpropertystatus
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameSourceSetPropertyStatus extends Win32Enum{

    /**
     * The operation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The operation failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * The operation failed because specified property is not supported by the media frame source.
     * @type {Integer (Int32)}
     */
    static NotSupported => 2

    /**
     * The operation failed because the supplied value is not valid for the specified property.
     * @type {Integer (Int32)}
     */
    static InvalidValue => 3

    /**
     * The operation failed because the media frame source device is unavailable.
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 4

    /**
     * The operation failed because the media frame source was not opened with [SharingMode](../windows.media.capture/mediacaptureinitializationsettings_sharingmode.md) set to [ExclusiveControl](../windows.media.capture/mediacapturesharingmode.md).
     * @type {Integer (Int32)}
     */
    static NotInControl => 5
}
