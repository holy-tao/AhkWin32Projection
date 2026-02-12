#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the syndication formats supported by the API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationformat
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationFormat extends Win32Enum{

    /**
     * The API supports the *Atom 1.0* format.
     * @type {Integer (Int32)}
     */
    static Atom10 => 0

    /**
     * The API supports the *RSS 2.0* format.
     * @type {Integer (Int32)}
     */
    static Rss20 => 1

    /**
     * The API supports the *RSS 1.0* format.
     * @type {Integer (Int32)}
     */
    static Rss10 => 2

    /**
     * The API supports the *RSS 0.92* format.
     * @type {Integer (Int32)}
     */
    static Rss092 => 3

    /**
     * The API supports the *RSS 0.91* format.
     * @type {Integer (Int32)}
     */
    static Rss091 => 4

    /**
     * The API supports the *Atom 0.3* format.
     * @type {Integer (Int32)}
     */
    static Atom03 => 5
}
