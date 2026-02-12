#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the step in the progress for an HTTP connection.
 * @remarks
 * This enumeration value is a member of the [HttpProgress](httpprogress.md) structure returned by many of the asynchronous methods in the [Windows.Web.Http](windows_web_http.md) namespace. The enumeration values indicates steps in the progress for an HTTP connection.
 * 
 * Some steps are not taken depending on the system configuration and other factors.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpprogressstage
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpProgressStage extends Win32Enum{

    /**
     * A default value that should not be encountered.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The system starts to detect a proxy.
     * 
     * This step may not occur depending on the system configuration.
     * @type {Integer (Int32)}
     */
    static DetectingProxy => 10

    /**
     * The system is resolving the hostname for the HTTP connection.
     * 
     * This step may not occur if the hostname doesn't need to be resolved.
     * @type {Integer (Int32)}
     */
    static ResolvingName => 20

    /**
     * The socket used for the HTTP connection is connecting to the server.
     * @type {Integer (Int32)}
     */
    static ConnectingToServer => 30

    /**
     * The HTTP connection to the server is negotiating SSL.
     * 
     * If the SSL negotiation fails, then this will be the last step that occurs on the HTTP connection.
     * @type {Integer (Int32)}
     */
    static NegotiatingSsl => 40

    /**
     * HTTP headers are being sent to the server.
     * @type {Integer (Int32)}
     */
    static SendingHeaders => 50

    /**
     * HTTP content is being sent to the server.
     * 
     * This step may not occur if there is no content to send.
     * @type {Integer (Int32)}
     */
    static SendingContent => 60

    /**
     * The HTTP client is waiting for a response from the server.
     * @type {Integer (Int32)}
     */
    static WaitingForResponse => 70

    /**
     * The HTTP client is receiving headers from the server.
     * @type {Integer (Int32)}
     */
    static ReceivingHeaders => 80

    /**
     * The HTTP client is receiving content from the server.
     * @type {Integer (Int32)}
     */
    static ReceivingContent => 90
}
