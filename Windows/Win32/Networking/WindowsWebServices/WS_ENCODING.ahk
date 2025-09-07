#Requires AutoHotkey v2.0.0 64-bit

/**
 * The different encodings (message formats).
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENCODING{

    /**
     * The binary XML encoding.
 *                 
 * 
 * Although the data is still in the XML
 *                     infoset format, this encoding typically results in smaller messages
 *                     that require less CPU to produce and consume.
 *                 
 * 
 * This encoding requires SOAP 1.2 (<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_2</a>).
     * @type {Integer (Int32)}
     */
    static WS_ENCODING_XML_BINARY_1 => 0

    /**
     * The binary XML session encoding.
 *                 
 * 
 * Although the data is still in the XML
 *                     infoset format, this encoding typically results in smaller messages
 *                     that require less CPU to produce and consume.
 *                 
 * 
 * This encoding is like <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_encoding">WS_ENCODING_XML_BINARY_1</a> but adds the
 *                     feature of a session dictionary.  Because this encoding requires a
 *                     session, it may only be used on sessionful channel types
 *                     (<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_DUPLEX_SESSION</a>).
 *                 
 * 
 * The session dictionary is a data structure maintained by both the
 *                     sending and receiving side of a channel.  The session dictionary
 *                     is used to optimize the transmission of string data.  The first time
 *                     a particular string is written, it is encoded using in the full string
 *                     format.  If the same string is written again, then it will use a smaller
 *                     tokenized form, which can reduce message size.
 *                 
 * 
 * The writer of the string data selects which strings are candidates for
 *                     the session dictionary by filling out the dictionary and id fields of 
 *                     the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> structure.
 *                 
 * 
 * The size of the session dictionary is configured using 
 *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_MAX_SESSION_DICTIONARY_SIZE</a>.
 *                 
 * 
 * This encoding requires SOAP 1.2 (<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_2</a>).
     * @type {Integer (Int32)}
     */
    static WS_ENCODING_XML_BINARY_SESSION_1 => 1

    /**
     * The MTOM encoding.
 *                 
 * 
 * The MTOM encoding optimizes for binary data by avoiding the costs
 *                     of converting binary data to base64 format.  For messages containing
 *                     large amounts of binary data, this encoding usually results in smaller
 *                     messages that require less CPU to produce and consume
 *                     than with a text encoding.  This encoding is typically not as efficient as
 *                     a binary encoding, however.
 *                 
 * 
 * The XML part of the MTOM package is written
 *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_UTF8</a>, but may be in any <b>WS_CHARSET</b> when read.
     * @type {Integer (Int32)}
     */
    static WS_ENCODING_XML_MTOM_UTF8 => 2

    /**
     * The MTOM encoding.
 *                 
 * 
 * The MTOM encoding optimizes for binary data by avoiding the costs
 *                     of converting binary data to base64 format.  For messages containing
 *                     large amounts of binary data, this encoding usually results in smaller
 *                     messages that require less CPU to produce and consume
 *                     than with a text encoding.  This encoding is typically not as efficient as
 *                     a binary encoding, however.
 *                 
 * 
 * The XML part of the MTOM package is written
 *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_UTF16BE</a>, but may be in any <b>WS_CHARSET</b> when read.
     * @type {Integer (Int32)}
     */
    static WS_ENCODING_XML_MTOM_UTF16BE => 3

    /**
     * The MTOM encoding.
 *                 
 * 
 * The MTOM encoding optimizes for binary data by avoiding the costs
 *                     of converting binary data to base64 format.  For messages containing
 *                     large amounts of binary data, this encoding usually results in smaller
 *                     messages that require less CPU to produce and consume
 *                     than with a text encoding.  This encoding is typically not as efficient as
 *                     a binary encoding, however.
 *                 
 * 
 * The XML part of the MTOM package is written
 *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_UTF16LE</a>, but may be in any <b>WS_CHARSET</b> when read.
     * @type {Integer (Int32)}
     */
    static WS_ENCODING_XML_MTOM_UTF16LE => 4

    /**
     * The text encoding (XML 1.0 format).
 *                 
 * 
 * Data is written using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_UTF8</a>,
 *                     but may be in any <b>WS_CHARSET</b> when read.
     * @type {Integer (Int32)}
     */
    static WS_ENCODING_XML_UTF8 => 5

    /**
     * The text encoding (XML 1.0 format).
 *                 
 * 
 * Data is written using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_UTF16BE</a>,
 *                     but may be in any <b>WS_CHARSET</b> when read.
     * @type {Integer (Int32)}
     */
    static WS_ENCODING_XML_UTF16BE => 6

    /**
     * The text encoding (XML 1.0 format).
 *                 
 * 
 * Data is written using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_UTF16LE</a>,
 *                     but may be in any <b>WS_CHARSET</b> when read.
     * @type {Integer (Int32)}
     */
    static WS_ENCODING_XML_UTF16LE => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_ENCODING_RAW => 8
}
