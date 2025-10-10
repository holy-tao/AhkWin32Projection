#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies a type of header.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_header_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HEADER_TYPE{

    /**
     * The Action addressing header.
 *                 
 * 
 * This header can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>s:
 *                     <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_XML_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_WSZ_TYPE</a>
 * </li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static WS_ACTION_HEADER => 1

    /**
     * The To addressing header.
 *                 
 * 
 * This header can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>s:
 *                     <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_XML_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_WSZ_TYPE</a>
 * </li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static WS_TO_HEADER => 2

    /**
     * The MessageID addressing header.
 *                 
 * 
 * This header can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>s:
 *                     <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_UNIQUE_ID_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_XML_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_WSZ_TYPE</a>
 * </li>
 * </ul>
 * 
 * 
 * This header is not supported for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_TRANSPORT</a>.
     * @type {Integer (Int32)}
     */
    static WS_MESSAGE_ID_HEADER => 3

    /**
     * The RelatesTo addressing header.
 *                 
 * 
 * This header can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>s:
 *                     <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_UNIQUE_ID_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_XML_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_WSZ_TYPE</a>
 * </li>
 * </ul>
 * 
 * 
 * This header is not supported for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_TRANSPORT</a>.
     * @type {Integer (Int32)}
     */
    static WS_RELATES_TO_HEADER => 4

    /**
     * The From addressing header.
 *                 
 * 
 * This header is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_ENDPOINT_ADDRESS_TYPE</a>.
 *                 
 * 
 * This header is not supported for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_TRANSPORT</a>.
     * @type {Integer (Int32)}
     */
    static WS_FROM_HEADER => 5

    /**
     * The ReplyTo addressing header.
 *                 
 * 
 * This header is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_ENDPOINT_ADDRESS_TYPE</a>.
 *                 
 * 
 * This header is not supported for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_TRANSPORT</a>.
     * @type {Integer (Int32)}
     */
    static WS_REPLY_TO_HEADER => 6

    /**
     * The FaultTo addressing header, in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a> format.
 *                 
 * 
 * This header is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_ENDPOINT_ADDRESS_TYPE</a>.
 *                 
 * 
 * This header is not supported for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_TRANSPORT</a>.
     * @type {Integer (Int32)}
     */
    static WS_FAULT_TO_HEADER => 7
}
