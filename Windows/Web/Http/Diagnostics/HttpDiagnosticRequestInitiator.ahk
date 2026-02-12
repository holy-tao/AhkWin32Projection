#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides the download request initiator type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticrequestinitiator
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class HttpDiagnosticRequestInitiator extends Win32Enum{

    /**
     * A parsed element
     * @type {Integer (Int32)}
     */
    static ParsedElement => 0

    /**
     * A script resource
     * @type {Integer (Int32)}
     */
    static Script => 1

    /**
     * An image resource
     * @type {Integer (Int32)}
     */
    static Image => 2

    /**
     * A link
     * @type {Integer (Int32)}
     */
    static Link => 3

    /**
     * A CSS element
     * @type {Integer (Int32)}
     */
    static Style => 4

    /**
     * An XML HTTP request
     * @type {Integer (Int32)}
     */
    static XmlHttpRequest => 5

    /**
     * A media resource
     * @type {Integer (Int32)}
     */
    static Media => 6

    /**
     * An HTML download
     * @type {Integer (Int32)}
     */
    static HtmlDownload => 7

    /**
     * A pre-fetch request
     * @type {Integer (Int32)}
     */
    static Prefetch => 8

    /**
     * An other resource
     * @type {Integer (Int32)}
     */
    static Other => 9

    /**
     * A cross-origin pre-flight request
     * @type {Integer (Int32)}
     */
    static CrossOriginPreFlight => 10

    /**
     * A fetch request
     * @type {Integer (Int32)}
     */
    static Fetch => 11

    /**
     * A one-way beacon request
     * @type {Integer (Int32)}
     */
    static Beacon => 12
}
