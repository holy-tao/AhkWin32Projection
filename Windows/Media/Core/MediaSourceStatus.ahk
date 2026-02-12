#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a [MediaSource](mediasource.md) when opening media items associated with the source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourcestatus
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaSourceStatus extends Win32Enum{

    /**
     * The [MediaSource](mediasource.md) is fully supported.
     * @type {Integer (Int32)}
     */
    static FullySupported => 0

    /**
     * The [MediaSource](mediasource.md) status is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 1
}
