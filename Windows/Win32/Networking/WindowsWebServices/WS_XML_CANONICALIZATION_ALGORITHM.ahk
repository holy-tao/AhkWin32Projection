#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values for the XML canonicalization algorithms.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_canonicalization_algorithm
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_CANONICALIZATION_ALGORITHM extends Win32Enum{

    /**
     * The exclusive XML canonicalization algorithm
     *           represented by the URI 'http://www.w3.org/2001/10/xml-exc-c14n#' and
     *           defined in <a href="https://datatracker.ietf.org/doc/html/rfc3741">RFC 3741</a>.
     * @type {Integer (Int32)}
     */
    static WS_EXCLUSIVE_XML_CANONICALIZATION_ALGORITHM => 0

    /**
     * The exclusive XML canonicalization with comments algorithm
     *           defined in <a href="https://datatracker.ietf.org/doc/html/rfc3741">RFC 3741</a>.
     * @type {Integer (Int32)}
     */
    static WS_EXCLUSIVE_WITH_COMMENTS_XML_CANONICALIZATION_ALGORITHM => 1

    /**
     * The inclusive XML canonicalization algorithm
     *           defined in <a href="https://www.w3.org/TR/xml-c14n">Canonical XML
     * Version 1.0</a>.
     *         
     * 
     * Inclusive canonicalization can only be applied to entire xml documents.
     * @type {Integer (Int32)}
     */
    static WS_INCLUSIVE_XML_CANONICALIZATION_ALGORITHM => 2

    /**
     * The inclusive XML canonicalization with comments algorithm
     *           represented by the URI 'http://www.w3.org/TR/2001/REC-xml-c14n-20010315#WithComments' and
     *           defined in <a href="https://www.w3.org/TR/xml-c14n">Canonical XML
     * Version 1.0</a>.
     *         
     * 
     * Inclusive canonicalization can only be applied to entire xml documents.
     * @type {Integer (Int32)}
     */
    static WS_INCLUSIVE_WITH_COMMENTS_XML_CANONICALIZATION_ALGORITHM => 3
}
