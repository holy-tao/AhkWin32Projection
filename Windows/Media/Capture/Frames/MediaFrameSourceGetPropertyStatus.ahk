#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the result of a [MediaFrameSourceController.GetPropertyAsync](mediaframesourcecontroller_getpropertyasync_1561087689.md) or [MediaFrameSourceController.GetPropertyByExtendedIdAsync](mediaframesourcecontroller_getpropertybyextendedidasync_2013722339.md) operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegetpropertystatus
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameSourceGetPropertyStatus extends Win32Enum{

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
     * The operation failed because the media frame source device is unavailable.
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 3

    /**
     * The *maxPropertyValueSize* provided in the call to [MediaFrameSourceController.GetPropertyByExtendedIdAsync](mediaframesourcecontroller_getpropertybyextendedidasync_2013722339.md) is too small for the property value.
     * @type {Integer (Int32)}
     */
    static MaxPropertyValueSizeTooSmall => 4

    /**
     * The *maxPropertyValueSize* parameter to [MediaFrameSourceController.GetPropertyByExtendedIdAsync](mediaframesourcecontroller_getpropertybyextendedidasync_2013722339.md) is required.
     * @type {Integer (Int32)}
     */
    static MaxPropertyValueSizeRequired => 5
}
