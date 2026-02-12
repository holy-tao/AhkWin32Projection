#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason why a [MediaStreamSource](mediastreamsource.md) was closed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceclosedreason
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceClosedReason extends Win32Enum{

    /**
     * No error has occurred.
     * @type {Integer (Int32)}
     */
    static Done => 0

    /**
     * An unspecified error has occurred.
     * @type {Integer (Int32)}
     */
    static UnknownError => 1

    /**
     * The app reported an error by calling the [NotifyError](mediastreamsource_notifyerror_645943664.md) method on the [MediaStreamSource](mediastreamsource.md).
     * @type {Integer (Int32)}
     */
    static AppReportedError => 2

    /**
     * Components needed to implement the protection system are missing.
     * @type {Integer (Int32)}
     */
    static UnsupportedProtectionSystem => 3

    /**
     * A failure occurred while initializing the protection system
     * @type {Integer (Int32)}
     */
    static ProtectionSystemFailure => 4

    /**
     * One or more media streams use an encoding format which cannot be handled by the media pipeline.
     * @type {Integer (Int32)}
     */
    static UnsupportedEncodingFormat => 5

    /**
     * The [MediaStreamSource](mediastreamsource.md) object does not have an event handler for the [SampleRequested](mediastreamsource_samplerequested.md) event.
     * @type {Integer (Int32)}
     */
    static MissingSampleRequestedEventHandler => 6
}
