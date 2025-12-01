#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the DVD domains.
 * @remarks
 * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getcurrentdomain">IDvdInfo2::GetCurrentDomain</a> method.
 * 
 * A domain is a logical space on a DVD disc. When the DVD Navigator is displaying the disc's main menu, it is said to be in the Video Manager domain. When it is displaying a menu specific to a title, it is in the Video Title Set domain. When it is playing video, it is the Title domain. When the user issues a Stop command, the Navigator goes into the Stop domain.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_domain
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_DOMAIN extends Win32Enum{

    /**
     * Performing default initialization of a DVD disc.
     * @type {Integer (Int32)}
     */
    static DVD_DOMAIN_FirstPlay => 1

    /**
     * Displaying menus for whole disc.
     * @type {Integer (Int32)}
     */
    static DVD_DOMAIN_VideoManagerMenu => 2

    /**
     * Displaying menus for current title set.
     * @type {Integer (Int32)}
     */
    static DVD_DOMAIN_VideoTitleSetMenu => 3

    /**
     * Displaying the current title.
     * @type {Integer (Int32)}
     */
    static DVD_DOMAIN_Title => 4

    /**
     * The DVD Navigator is in the DVD Stop domain.
     * @type {Integer (Int32)}
     */
    static DVD_DOMAIN_Stop => 5
}
