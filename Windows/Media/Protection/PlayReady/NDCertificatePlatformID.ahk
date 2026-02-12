#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the client platforms with which a PlayReady-ND certificate can be associated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndcertificateplatformid
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDCertificatePlatformID extends Win32Enum{

    /**
     * Client platform is Microsoft Windows.
     * @type {Integer (Int32)}
     */
    static Windows => 0

    /**
     * Client platform is the Apple OSX operating system.
     * @type {Integer (Int32)}
     */
    static OSX => 1

    /**
     * Client platform is the Microsoft Windows Phone 7 operating system running on an ARM processor.
     * @type {Integer (Int32)}
     */
    static WindowsOnARM => 2

    /**
     * Client platform is the Microsoft Windows Phone 7 operating system.
     * @type {Integer (Int32)}
     */
    static WindowsMobile7 => 5

    /**
     * Client platform is the Apple iOS operating system running on an ARM processor.
     * @type {Integer (Int32)}
     */
    static iOSOnARM => 6

    /**
     * Client platform is the Xbox operating system running on a Power PC processor.
     * @type {Integer (Int32)}
     */
    static XBoxOnPPC => 7

    /**
     * Client platform is the Microsoft Windows Phone 8 operating system running on an ARM processor.
     * @type {Integer (Int32)}
     */
    static WindowsPhone8OnARM => 8

    /**
     * Client platform is the Microsoft Windows Phone 8 operating system running on an x86 processor.
     * @type {Integer (Int32)}
     */
    static WindowsPhone8OnX86 => 9

    /**
     * Client platform is the Xbox operating system.
     * @type {Integer (Int32)}
     */
    static XboxOne => 10

    /**
     * Client platform is the Google Android operating system running on an ARM processor.
     * @type {Integer (Int32)}
     */
    static AndroidOnARM => 11

    /**
     * Client platform is the Microsoft Windows Phone 8.1 operating system running on an ARM processor.
     * @type {Integer (Int32)}
     */
    static WindowsPhone81OnARM => 12

    /**
     * Client platform is the Microsoft Windows Phone 8.1 operating system running on an x86 processor.
     * @type {Integer (Int32)}
     */
    static WindowsPhone81OnX86 => 13
}
