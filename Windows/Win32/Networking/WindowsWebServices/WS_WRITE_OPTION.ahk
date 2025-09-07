#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether a storage specified contains the value, or a pointer to the value, and whether the value can be represented as nil in the XML content.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_write_option
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_WRITE_OPTION{

    /**
     * The storage specified contains the value.  The size of the storage 
 *                     specified should be the size of the value.
 *                 
 * 
 * This option specifies that the value will always be written to the XML content.
 *                 
 * 
 * 
 * ``` syntax
 * int value;
 * Api(..., &amp;value, sizeof(value), ...);
 * ```
 * 
 * 
 * ``` syntax
 * // always written
 * &lt;element&gt;123&lt;/element&gt;
 * ```
 * 
 * This option is not supported for pointer types
 *                     (<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_WSZ_TYPE</a> and <b>WS_XML_BUFFER_TYPE</b>).  
 *                     The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_REQUIRED_POINTER</a> option should be used for these types.
     * @type {Integer (Int32)}
     */
    static WS_WRITE_REQUIRED_VALUE => 1

    /**
     * The storage specified contains a pointer to the value.  The
 *                     size of the storage specified is always the size of a pointer, regardless
 *                     of the type being serialized.
 *                 
 * 
 * This option specifies that the value will always be written to the XML content.
 *                 
 * 
 * 
 * ``` syntax
 * int* valuePointer; // may not be NULL
 * Api(..., &amp;valuePointer, sizeof(valuePointer), ...);
 * ```
 * 
 * 
 * ``` syntax
 * // always written
 * &lt;element&gt;123&lt;/element&gt;
 * ```
 * 
 * If the pointer to the value specified in the storage is <b>NULL</b>, 
 *                     <b>E_INVALIDARG</b> is returned.
 *                 (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @type {Integer (Int32)}
     */
    static WS_WRITE_REQUIRED_POINTER => 2

    /**
     * The storage specified contains a pointer to the value.  The
 *                     size of the storage specified is always the size of a pointer, regardless
 *                     of the type being serialized.
 *                 
 * 
 * If the value is nil, then a nil element is written in the XML content.
 *                     If non-nil, then the value is serialized normally.
 *                 
 * 
 * 
 * ``` syntax
 * WS_STRING value; // may contain a nil value (see WS_STRING_TYPE)
 * Api(..., &amp;value, sizeof(value), ...);
 * ```
 * 
 * 
 * ``` syntax
 * // if value is non-nil
 * &lt;element&gt;hello&lt;/element&gt;
 * 
 * // if value is nil
 * &lt;element xsi:nil='true'/&gt;
 * ```
 * 
 * This option is only supported for the following types, listed below,
 *                     which have a intrinsic way to represent a nil value.  See the documentation
 *                     for each type for information on how nil is represented.
 *                     <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_XML_STRING_TYPE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_BYTES_TYPE</a>
 * </li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static WS_WRITE_NILLABLE_VALUE => 3

    /**
     * For all types, the storage specified contains a pointer to the value.  The
 *                     size of the storage specified is always the size of a pointer, regardless
 *                     of the type being serialized.
 *                 
 * 
 * If the pointer to the value specified in the storage is <b>NULL</b>, then
 *                     a nil element is written in the XML content.
 *                 
 * 
 * 
 * ``` syntax
 * int* valuePointer; // may be NULL
 * Api(..., &amp;valuePointer, sizeof(valuePointer), ...);
 * 
 * ```
 * 
 * 
 * ``` syntax
 * // if value is non-NULL
 * &lt;element&gt;123&lt;/element&gt;
 * 
 * // if value is NULL
 * &lt;element xsi:nil='true'/&gt;
 * ```
     * @type {Integer (Int32)}
     */
    static WS_WRITE_NILLABLE_POINTER => 4
}
