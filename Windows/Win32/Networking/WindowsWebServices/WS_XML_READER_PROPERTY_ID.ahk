#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies each XML reader property is and its associated value.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_xml_reader_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_READER_PROPERTY_ID extends Win32Enum{

    /**
     * A <b>ULONG</b> that specifies the maximum depth of the document that the reader will permit.
     *         
     * 
     * Depth is measured at any point by the number of nested start elements.
     *         
     * 
     * A depth of 0 prevents any start elements from being read.
     *         
     * 
     * This property defaults to 32.
     *         
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatereader">WsCreateReader</a> for security considerations.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_MAX_DEPTH => 0

    /**
     * A <b>BOOL</b> that
     *           specifies whether the reader will permit multiple elements and non-white space at the top level of the document.  This property
     *           may not be set to <b>TRUE</b> with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_mtom_encoding">WS_XML_READER_MTOM_ENCODING</a>.
     *         
     * 
     * This property defaults to <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_ALLOW_FRAGMENT => 1

    /**
     * A <b>ULONG</b>that specifies the maximum number of attributes the reader will permit on an element.
     *         
     * 
     * This property defaults to 128.
     *         
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatereader">WsCreateReader</a> for security considerations.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_MAX_ATTRIBUTES => 2

    /**
     * A <b>BOOL</b> that specifies if the reader should permit an xml declaration at the start of the document.
     *         
     * 
     * This property defaults to <b>TRUE</b>.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_READ_DECLARATION => 3

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET</a> value that returns the character set of the xml document.  This value is only available for
     *           text documents.
     *         
     * 
     * If the reader was initialized with a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_AUTO</a> then it will automatically determine this
     *           value.  The reader input source is streamed, then the reader must have enough data buffered to be able to
     *           inspect initial byte order marks and the xml declaration.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfillreader">WsFillReader</a>.
     *         
     * 
     * If the reader was initialized with any other value, then this property simply returns that value.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_CHARSET => 4

    /**
     * A <b>ULONGLONG</b> that returns the 0 based row number of the node the reader is positioned on for text xml documents.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_ROW => 5

    /**
     * A <b>ULONGLONG</b> that returns the 0 based column number of the node the reader is positioned on for text xml documents.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_COLUMN => 6

    /**
     * A <b>ULONG</b> that specifies the trim size of the internal buffer used by the
     *           <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> for performing UTF-16 to UTF-8 conversions.  Increasing this value
     *           uses more memory, but can reduce allocations when processing UTF-16 encoded documents.
     *         
     * 
     * This property defaults to 4096.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_UTF8_TRIM_SIZE => 7

    /**
     * A <b>ULONG</b> that specifies the size of the buffer the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> will use when configured to use
     *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_stream_input">WS_XML_READER_STREAM_INPUT</a>.  Increasing this value uses more memory, but
     *           can reduce the number of times the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_read_callback">WS_READ_CALLBACK</a> is invoked.
     *         
     * 
     * This property defaults to 4096.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_STREAM_BUFFER_SIZE => 8

    /**
     * Indicates that <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadstartattribute">WsReadStartAttribute</a> has been called and the reader is
     *           positioned on attribute content.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_IN_ATTRIBUTE => 9

    /**
     * A <b>ULONG</b>used with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_mtom_encoding">WS_XML_READER_STREAM_INPUT</a> in conjunction with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_mtom_encoding">WS_XML_READER_MTOM_ENCODING</a>.
     *           This value specifies the maximum size of the root MIME part, which is the part that contains
     *           the xml portion of the document.  It has no effect when used with other encodings, or when used with
     *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_buffer_input">WS_XML_READER_BUFFER_INPUT</a>.
     *         
     * 
     * This property defaults to 65536.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_STREAM_MAX_ROOT_MIME_PART_SIZE => 10

    /**
     * A <b>ULONG</b>used with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_mtom_encoding">WS_XML_READER_STREAM_INPUT</a> in conjunction with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_mtom_encoding">WS_XML_READER_MTOM_ENCODING</a>.
     *           This value specifies the maximum size of any group of MIME headers that may appear in the document.
     *           It has no effect when used with other encodings, or when used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_buffer_input">WS_XML_READER_BUFFER_INPUT</a>.
     *         
     * 
     * This property defaults to 256.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_STREAM_MAX_MIME_HEADERS_SIZE => 11

    /**
     * A <b>ULONG</b>used with  <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_mtom_encoding">WS_XML_READER_MTOM_ENCODING</a>. This value specifies the maximum number of MIME parts
     *           that may appear in the document.  It has no effect when used with other encodings.
     *         
     * 
     * This property defaults to 4096.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_MAX_MIME_PARTS => 12

    /**
     * A <b>BOOL</b> used with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_text_encoding">WS_XML_READER_TEXT_ENCODING</a>. Setting this to <b>TRUE</b> permits character references
     *           of characters considered invalid by XML 1.0 to be accepted.
     *         
     * 
     * Setting this property to <b>TRUE</b> may affect interoperability.
     *         
     * 
     * This property defaults to <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_ALLOW_INVALID_CHARACTER_REFERENCES => 13

    /**
     * A <b>ULONG</b>that specifies the maximum number of xmlns unique declarations that may appear in scope at any point
     *           while reading the document.
     *         
     * 
     * This property defaults to 32.
     *         
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatereader">WsCreateReader</a> for security considerations.
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_PROPERTY_MAX_NAMESPACES => 14
}
