#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the sizes of a web account picture.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountpicturesize
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class WebAccountPictureSize extends Win32Enum{

    /**
     * 64x64
     * @type {Integer (Int32)}
     */
    static Size64x64 => 64

    /**
     * 208x208
     * @type {Integer (Int32)}
     */
    static Size208x208 => 208

    /**
     * 424x424
     * @type {Integer (Int32)}
     */
    static Size424x424 => 424

    /**
     * 1080x1080
     * @type {Integer (Int32)}
     */
    static Size1080x1080 => 1080
}
