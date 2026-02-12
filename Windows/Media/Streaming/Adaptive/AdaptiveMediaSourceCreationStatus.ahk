#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the result of an attempt to create a [AdaptiveMediaSource](adaptivemediasource.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecreationstatus
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceCreationStatus extends Win32Enum{

    /**
     * The [AdaptiveMediaSource](adaptivemediasource.md) object was successfully created.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The creation of the [AdaptiveMediaSource](adaptivemediasource.md) object failed as the result of a failure in downloading the adaptive streaming manifest.
     * @type {Integer (Int32)}
     */
    static ManifestDownloadFailure => 1

    /**
     * The creation of the [AdaptiveMediaSource](adaptivemediasource.md) object failed as the result of a failure in parsing the adaptive streaming manifest.
     * @type {Integer (Int32)}
     */
    static ManifestParseFailure => 2

    /**
     * The creation of the [AdaptiveMediaSource](adaptivemediasource.md) object failed because the content of the adaptive streaming manifest is unsupported.
     * @type {Integer (Int32)}
     */
    static UnsupportedManifestContentType => 3

    /**
     * The creation of the [AdaptiveMediaSource](adaptivemediasource.md) object failed because the version of the adaptive streaming manifest is unsupported.
     * @type {Integer (Int32)}
     */
    static UnsupportedManifestVersion => 4

    /**
     * The creation of the [AdaptiveMediaSource](adaptivemediasource.md) object failed because the profile of the adaptive streaming manifest is unsupported.
     * @type {Integer (Int32)}
     */
    static UnsupportedManifestProfile => 5

    /**
     * The creation of the [AdaptiveMediaSource](adaptivemediasource.md) object failed because of an unknown failure.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 6
}
