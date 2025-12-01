#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_PROPERTY_FLAGS.ahk

/**
 * Defines the application-specific connection timeout limits.
 * @remarks
 * This structure is used in the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserversessionproperty">HttpQueryServerSessionProperty</a>, and  <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserversessionproperty">HttpSetServerSessionProperty</a> functions to set or query the connection timeouts. The following table lists the default timeouts.
 * 
 * <table>
 * <tr>
 * <th>Timer</th>
 * <th>HTTP Server API Default</th>
 * <th>HTTP Server API  Wide Configuration</th>
 * <th>Application Specific Configuration</th>
 * </tr>
 * <tr>
 * <td>EntityBody</td>
 * <td>2 Minutes</td>
 * <td>No</td>
 * <td>Yes</td>
 * </tr>
 * <tr>
 * <td> DrainEntityBody</td>
 * <td>2 Minutes</td>
 * <td>No</td>
 * <td>Yes</td>
 * </tr>
 * <tr>
 * <td>RequestQueue</td>
 * <td>2 Minutes</td>
 * <td>No</td>
 * <td>Yes</td>
 * </tr>
 * <tr>
 * <td>IdleConnection</td>
 * <td>2 Minutes</td>
 * <td>Yes</td>
 * <td>Limited</td>
 * </tr>
 * <tr>
 * <td>HeaderWait</td>
 * <td>2 Minutes</td>
 * <td>Yes</td>
 * <td>Limited</td>
 * </tr>
 * <tr>
 * <td>MinSendRate</td>
 * <td>150 bytes/second</td>
 * <td>No</td>
 * <td>Yes</td>
 * </tr>
 * </table>
 *  
 * 
 * Calling <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserversessionproperty">HttpSetServerSessionProperty</a> or <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpseturlgroupproperty">HttpSetUrlGroupProperty</a> to configure a connection timeout affects only the calling application and does not set driver wide timeout limits. The idle connection and header wait timers can be configured for all HTTP applications by calling <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>. Administrative privileges are required to configure HTTP Server API wide timeouts. HTTP Server API wide configurations affect all HTTP applications on the computer and persist when the computer is shut down.
 * 
 * The application-specific <b>IdleConnection</b>  and <b>HeaderWait</b> timers are set on a limited basis. The HTTP Server API cannot determine the request queue or URL group that the request is associated with until the headers have been parsed. Therefore, the HTTP Server API enforces the default <b>IdleConnection</b>  and <b>HeaderWait</b> timers for the first request on a connection.  Subsequent requests on a Keep-Alive connection will use the application specific timeouts.
 * 
 * Setting a timeout on a server session affects all the URL Groups under the server session. However, if the URL Group has configured a timeout, the setting for the URL Group takes precedence over the server session configuration.
 * 
 * Setting a timeout to zero on a server session causes the HTTP Server API to revert to the default value for that timer. For timers set on a URL Group, the server session timeout is used if present, otherwise the HTTP Server API default is used.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_timeout_limit_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_TIMEOUT_LIMIT_INFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure that specifies whether the property is present.
     * @type {HTTP_PROPERTY_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := HTTP_PROPERTY_FLAGS(0, this)
            return this.__Flags
        }
    }

    /**
     * The time, in seconds, allowed for the request entity body to arrive.
     * 
     *  The HTTP Server API turns on this timer when the request has an entity body. The timer expiration is initially set to the configured value. When the  HTTP Server API receives additional data indications on the request, it resets the timer to give the connection another interval.
     * @type {Integer}
     */
    EntityBody {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The time, in seconds, allowed for the HTTP Server API to drain the entity body on a Keep-Alive connection.
     * 
     * On a Keep-Alive connection, after the application has sent a response for a request and before the request entity body has completely arrived, the HTTP Server API starts draining the remainder of the entity body to reach another potentially pipelined request from the client. If the time to drain the remaining entity body exceeds the allowed period the connection is timed out.
     * @type {Integer}
     */
    DrainEntityBody {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The time, in seconds, allowed  for the request to remain in the request queue before the application picks it up.
     * @type {Integer}
     */
    RequestQueue {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The time, in seconds, allowed for an idle connection.
     * 
     * This timeout is only enforced after the first request on the connection is routed to the application. For more information, see the Remarks section.
     * @type {Integer}
     */
    IdleConnection {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The time, in seconds, allowed for the HTTP Server API to  parse the request header.
     * 
     * This timeout is only enforced after the first request on the connection is routed to the application. For more information, see the Remarks section.
     * @type {Integer}
     */
    HeaderWait {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * The minimum send rate, in bytes-per-second, for the response. The default response send rate is 150 bytes-per-second.
     * 
     * To disable this timer, set <b>MinSendRate</b> to <b>MAXULONG</b>.
     * @type {Integer}
     */
    MinSendRate {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
