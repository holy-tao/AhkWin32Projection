#Requires AutoHotkey v2.0.0 64-bit

/**
 * The layout rules applied to the elements of the WS-Security security header. This setting is relevant to message security bindings and mixed-mode security bindings.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_security_header_layout
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_HEADER_LAYOUT{

    /**
     * The elements of the security header must follow a 'declare before use'
     * layout.  All security tokens must appear before their usage.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_HEADER_LAYOUT_STRICT => 1

    /**
     * The elements of the security header can be in arbitrary order,
     * including security tokens appearing after usage.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_HEADER_LAYOUT_LAX => 2

    /**
     * The elements of the security header can be in arbitrary order as in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_header_layout">WS_SECURITY_HEADER_LAYOUT_LAX</a>, but the timestamp element must
     * be the first element.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_HEADER_LAYOUT_LAX_WITH_TIMESTAMP_FIRST => 3

    /**
     * The elements of the security header can be in arbitrary order as in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_header_layout">WS_SECURITY_HEADER_LAYOUT_LAX</a>, but the timestamp element must
     * be the last element.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_HEADER_LAYOUT_LAX_WITH_TIMESTAMP_LAST => 4
}
