#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a piece of content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentcategory
 * @namespace Windows.Media.ContentRestrictions
 * @version WindowsRuntime 1.4
 */
class RatedContentCategory extends Win32Enum{

    /**
     * In-app content for Windows 8.1 and Xbox apps.
     * @type {Integer (Int32)}
     */
    static General => 0

    /**
     * Apps on Windows 8.1 and Xbox.
     * @type {Integer (Int32)}
     */
    static Application => 1

    /**
     * Apps on Windows 8.1 and Xbox.
     * @type {Integer (Int32)}
     */
    static Game => 2

    /**
     * In-app content for Windows 8.1 and Xbox apps.
     * @type {Integer (Int32)}
     */
    static Movie => 3

    /**
     * In-app content for Windows 8.1 and Xbox apps.
     * @type {Integer (Int32)}
     */
    static Television => 4

    /**
     * In-app content for Windows 8.1 and Xbox apps.
     * @type {Integer (Int32)}
     */
    static Music => 5
}
