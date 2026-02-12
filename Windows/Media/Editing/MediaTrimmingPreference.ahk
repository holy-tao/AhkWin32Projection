#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Used to specify if media trimming should use a faster or a more precise algorithm during transcoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediatrimmingpreference
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class MediaTrimmingPreference extends Win32Enum{

    /**
     * Use the faster trimming algorithm during transcoding.
     * @type {Integer (Int32)}
     */
    static Fast => 0

    /**
     * Use the more precise trimming algorithm during transcoding.
     * @type {Integer (Int32)}
     */
    static Precise => 1
}
