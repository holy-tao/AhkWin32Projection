#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies each XML canonicalization property and its associated value. This enumeration is used within the WS_XML_CANONICALIZATION_PROPERTY structure, which is used as a parameter to WsStartReaderCanonicalization and WsStartWriterCanonicalization.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_canonicalization_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_CANONICALIZATION_PROPERTY_ID extends Win32Enum{

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_canonicalization_algorithm">WS_XML_CANONICALIZATION_ALGORITHM</a> value that specifies the algorithm to be used for canonicalization.  If this is not specified,
     *           the <b>WS_EXCLUSIVE_XML_CANONICALIZATION_ALGORITHM</b> is used.
     * @type {Integer (Int32)}
     */
    static WS_XML_CANONICALIZATION_PROPERTY_ALGORITHM => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_canonicalization_inclusive_prefixes">WS_XML_CANONICALIZATION_INCLUSIVE_PREFIXES</a> structure that contains the set of prefixes to be treated as inclusive prefixes when using
     *           the exclusive canonicalization algorithm.  If this is not specified,
     *           no prefix is treated as an inclusive prefix.
     * @type {Integer (Int32)}
     */
    static WS_XML_CANONICALIZATION_PROPERTY_INCLUSIVE_PREFIXES => 1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_qname">WS_XML_QNAME</a> structure that contains the elements to be omitted during canonicalization.  If one or more
     *           elements in the XML input match the specified name and namespace, then
     *           all such elements and the subtrees rooted at them are omitted from the
     *           canonical output.  This property can be used to implement enveloped
     *           signatures where canonicalization needs to skip a signature element
     *           that is embedded within the XML content being canonicalized and
     *           signed.  If this is not specified, no element is omitted from the
     *           output.
     * @type {Integer (Int32)}
     */
    static WS_XML_CANONICALIZATION_PROPERTY_OMITTED_ELEMENT => 2

    /**
     * A <b>ULONG</b> that specifies the size of the buffer in which canonical bytes are accumulated.  Once at least this
     *           many bytes are generated, or canonicalization is ended by a call to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsendreadercanonicalization">WsEndReaderCanonicalization</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsendwritercanonicalization">WsEndWriterCanonicalization</a>, the canonical bytes are
     *           written to the output specified at the start of canonicalization.  If this is
     *           not specified, a default buffer size of 1024 is used.
     * @type {Integer (Int32)}
     */
    static WS_XML_CANONICALIZATION_PROPERTY_OUTPUT_BUFFER_SIZE => 3
}
