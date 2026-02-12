#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the state of a [MediaSource](mediasource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourcestate
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaSourceState extends Win32Enum{

    /**
     * The **MediaSource** has been initialized.
     * @type {Integer (Int32)}
     */
    static Initial => 0

    /**
     * The **MediaSource** is in the process of opening the associated media content.
     * @type {Integer (Int32)}
     */
    static Opening => 1

    /**
     * The **MediaSource** has successfully opened the associated media content.
     * @type {Integer (Int32)}
     */
    static Opened => 2

    /**
     * The **MediaSource** failed to open the associated media content.
     * @type {Integer (Int32)}
     */
    static Failed => 3

    /**
     * The **MediaSource** has been closed.
     * @type {Integer (Int32)}
     */
    static Closed => 4
}
