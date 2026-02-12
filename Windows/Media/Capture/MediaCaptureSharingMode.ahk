#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the media frame source sharing mode for a [MediaCapture](mediacapture.md) object.
 * @remarks
 * Specify the [MediaCapture](mediacapturememorypreference.md) sharing mode by setting the [SharingMode](mediacaptureinitializationsettings_sharingmode.md) property of the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md) object before calling [MediaCapture.InitializeAsync](/uwp/api/windows.media.capture.mediacapture.initializeasync).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesharingmode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureSharingMode extends Win32Enum{

    /**
     * The [MediaCapture](mediacapture.md) should have exclusive control of one or more of the frame sources specified in [SourceGroup](mediacaptureinitializationsettings_sourcegroup.md).
     * @type {Integer (Int32)}
     */
    static ExclusiveControl => 0

    /**
     * The [MediaCapture](mediacapture.md) can acquire frames from the frame sources specified in [SourceGroup](mediacaptureinitializationsettings_sourcegroup.md) but can't adjust the configuration of the frame sources.
     * @type {Integer (Int32)}
     */
    static SharedReadOnly => 1
}
