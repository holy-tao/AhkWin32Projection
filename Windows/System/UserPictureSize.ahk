#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Represents user picture sizes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userpicturesize
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserPictureSize extends Win32Enum{

    /**
     * The picture size is 64x64.
     * @type {Integer (Int32)}
     */
    static Size64x64 => 0

    /**
     * The picture size is 208x208.
     * @type {Integer (Int32)}
     */
    static Size208x208 => 1

    /**
     * The picture size is 424x424.
     * @type {Integer (Int32)}
     */
    static Size424x424 => 2

    /**
     * The picture size is 1080x1080.
     * @type {Integer (Int32)}
     */
    static Size1080x1080 => 3
}
