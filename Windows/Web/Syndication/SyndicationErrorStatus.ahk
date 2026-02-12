#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines errors encountered during a Syndication operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationerrorstatus
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationErrorStatus extends Win32Enum{

    /**
     * An unknown error has occurred.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * A required element is missing.
     * @type {Integer (Int32)}
     */
    static MissingRequiredElement => 1

    /**
     * A required attribute is missing.
     * @type {Integer (Int32)}
     */
    static MissingRequiredAttribute => 2

    /**
     * The provided XML is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidXml => 3

    /**
     * An unexpected error was encountered with the content.
     * @type {Integer (Int32)}
     */
    static UnexpectedContent => 4

    /**
     * The content is not presented in a supported format.
     * @type {Integer (Int32)}
     */
    static UnsupportedFormat => 5
}
