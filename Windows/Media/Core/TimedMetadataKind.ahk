#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the types of metadata that may be present in a [TimedMetadataTrack](timedmetadatatrack.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatakind
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedMetadataKind extends Win32Enum{

    /**
     * The metadata contains caption text.
     * @type {Integer (Int32)}
     */
    static Caption => 0

    /**
     * The metadata contains chapter information.
     * @type {Integer (Int32)}
     */
    static Chapter => 1

    /**
     * The metadata contains custom data.
     * @type {Integer (Int32)}
     */
    static Custom => 2

    /**
     * The metadata contains data.
     * @type {Integer (Int32)}
     */
    static Data => 3

    /**
     * The metadata contains description text.
     * @type {Integer (Int32)}
     */
    static Description => 4

    /**
     * The metadata contains subtitle text.
     * @type {Integer (Int32)}
     */
    static Subtitle => 5

    /**
     * The metadata contains images to be used as subtitles.
     * @type {Integer (Int32)}
     */
    static ImageSubtitle => 6

    /**
     * The metadata contains speech metadata, such as word boundaries, sentence boundaries, and Speech Sythesis Markup Language (SSML) bookmarks.
     * @type {Integer (Int32)}
     */
    static Speech => 7
}
