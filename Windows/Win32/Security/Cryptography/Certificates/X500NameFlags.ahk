#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the display and encoding characteristics of a distinguished name or relative distinguished name (RDN).
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x500nameflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X500NameFlags extends Win32Enum{

    /**
     * Display characteristics are not identified.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_NONE => 0

    /**
     * All <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifiers</a> (OIDs) are discarded. <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">Relative distinguished names</a> (RDNs) are separated by commas followed by a space (, ). RDN attributes are separated by a plus sign enclosed within spaces ( + ).
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SIMPLE_NAME_STR => 1

    /**
     * OIDs are separated from their associated attribute value by using an equal sign (=). RDNs are separated by a comma followed by a space (, ). RDN attributes are separated by a plus sign followed by a space (+ ).
     * @type {Integer (Int32)}
     */
    static XCN_CERT_OID_NAME_STR => 2

    /**
     * OIDs are converted to their <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> key names. They are separated from their associated attribute value by using an equal sign (=). RDNs are separated by a comma followed by a space (, ). RDN attributes are separated by a plus sign followed by a space (+ ).
     * 
     * If an OID does not have a corresponding X.500 name, the OID is used with a prefix of OID. The RDN is enclosed within quotation marks (" ") if it contains leading or trailing white space or one of the following characters:<ul>
     * <li>Comma (,)</li>
     * <li>Plus sign (+)</li>
     * <li>Equal sign (=)</li>
     * <li>Inch mark (")</li>
     * <li>Line feed (\n)</li>
     * <li>Less than sign (&lt;)</li>
     * <li>Greater than sign (&gt;)</li>
     * <li>Number sign (#)</li>
     * <li>Semicolon (;)</li>
     * <li>Embedded quotation mark (")</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_CERT_X500_NAME_STR => 3

    /**
     * OIDs are treated in the same manner as that used to convert XCN_CERT_X500_NAME_ST values except that they are formatted as a sequence of XML elements. This is shown in the following example.
     * 
     * 
     * ``` syntax
     * 
     * &lt;CN&gt;cart.contoso.com&lt;/CN&gt;
     * &lt;OU&gt;Terms of use at www.verisign.com/rpa (c)00&lt;/OU&gt;
     * &lt;OU rDNAttribute="true"&gt;IT Operations&lt;/OU&gt;
     * &lt;O&gt;Contoso.com&lt;/O&gt;
     * &lt;L&gt;New York&lt;/L&gt;
     * &lt;S&gt;New York&lt;/S&gt;
     * &lt;C&gt;US&lt;/C&gt;
     * &lt;RDN oid="1.2.3.4" type="string"&gt;name&lt;/RDN&gt;
     * &lt;RDN rDNAttribute="true" oid="1.2.1.3" type="encoded"&gt;0500&lt;/RDN&gt;
     * &lt;RDN oid="1.2.1.4" type="encoded"&gt;020135&lt;/RDN&gt;
     * &lt;RDN oid="1.2.2.5.3" type="octet"&gt;01FF7F&lt;/RDN&gt;
     * ```
     * 
     * The Unicode XML markup characters are escaped in the following manner. Characters greater than 0x7F are escaped by using character references (L"&amp;#xXXXX;").
     * <ul>
     * <li>&amp; becomes L"&amp;amp;"</li>
     * <li>&lt; becomes L"&amp;lt;"</li>
     * <li>&gt; becomes L"&amp;gt;"</li>
     * <li>\' becomes L"&amp;apos;"</li>
     * <li>\" becomes L"&amp;quot;"</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_CERT_XML_NAME_STR => 4

    /**
     * The comma (,) separator used between RDNs is replaced with a semicolon (;) character.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_SEMICOLON_FLAG => 1073741824

    /**
     * The (+) separator used between RDN attributes is replaced with a single space character.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_NO_PLUS_FLAG => 536870912

    /**
     * Inhibits the use of quotation marks for the XCN_CERT_X500_NAME_ST value.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_NO_QUOTING_FLAG => 268435456

    /**
     * The comma (,) separator used between RDNs is replaced with a carriage return/line feed (\r\n) sequence.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_CRLF_FLAG => 134217728

    /**
     * Specifies that the separator between RDNs is a comma (,).
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_COMMA_FLAG => 67108864

    /**
     * Specifies that the order of the RDNs that make up the distinguished name (DN) is reversed for encoding. The typical DN display order is CN=<i>name</i>,...,DC=<i>com</i>. Use this flag to change the encoding order to DC=<i>com</i>,...,CN=<i>name</i>. An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix500distinguishedname">IX500DistinguishedName</a> object sets this flag by default unless you specify  XCN_CERT_NAME_STR_FORWARD_FLAG.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_REVERSE_FLAG => 33554432

    /**
     * Use to undo the encoding order specified by setting the XCN_CERT_NAME_STR_REVERSE_FLAG value.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_FORWARD_FLAG => 16777216

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_AMBIGUOUS_SEPARATOR_FLAGS => 1275068416

    /**
     * Skips the initial attempt to decode T.61 Teletex character values to UTF-8 values. By default, T.61 values are initially decoded to UTF-8, but if UTF-8 decoding fails, the values are decoded as 8-bit characters.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_DISABLE_IE4_UTF8_FLAG => 65536

    /**
     * T.61 is used rather than Unicode character encoding for all characters less than 0xFF. LDAP, for example, uses T.61.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_ENABLE_T61_UNICODE_FLAG => 131072

    /**
     * UTF-8 is used for the DN instead of Unicode character encoding.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_ENABLE_UTF8_UNICODE_FLAG => 262144

    /**
     * Forces the following X.500 keys to be encoded as UTF-8 strings rather than printable Unicode strings.
     * 
     * <table>
     * <tr>
     * <th>Key</th>
     * <th>OID</th>
     * </tr>
     * <tr>
     * <td>CN</td>
     * <td>XCN_OID_COMMON_NAME</td>
     * </tr>
     * <tr>
     * <td>G </td>
     * <td>XCN_OID_GIVEN_NAME</td>
     * </tr>
     * <tr>
     * <td>GivenName</td>
     * <td>XCN_OID_GIVEN_NAME</td>
     * </tr>
     * <tr>
     * <td>GN</td>
     * <td>XCN_OID_GIVEN_NAME</td>
     * </tr>
     * <tr>
     * <td>I</td>
     * <td>XCN_OID_INITIALS</td>
     * </tr>
     * <tr>
     * <td>Initials</td>
     * <td>XCN_OID_INITIALS</td>
     * </tr>
     * <tr>
     * <td>L</td>
     * <td>XCN_OID_LOCALITY_NAME</td>
     * </tr>
     * <tr>
     * <td>O</td>
     * <td>XCN_ORGANIZATION_NAME</td>
     * </tr>
     * <tr>
     * <td>OU </td>
     * <td>XCN_OID_ORGANIZATIONAL_UNIT_NAME</td>
     * </tr>
     * <tr>
     * <td>S</td>
     * <td>XCN_OID_STATE_OR_PROVINCE_NAME</td>
     * </tr>
     * <tr>
     * <td>SN</td>
     * <td>XCN_ID_SUR_NAME</td>
     * </tr>
     * <tr>
     * <td>ST</td>
     * <td>XCN_OID_STATE_OR_PROVINCE_NAME</td>
     * </tr>
     * <tr>
     * <td>STREET</td>
     * <td>XCN_OID_STREET_ADDRESS</td>
     * </tr>
     * <tr>
     * <td>T</td>
     * <td>XCN_OID_TITLE</td>
     * </tr>
     * <tr>
     * <td>Title</td>
     * <td>XCN_OID_TITLE</td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_FORCE_UTF8_DIR_STR_FLAG => 524288

    /**
     * Prevents forcing printable Unicode strings to be encoded by using UTF-8. Use when desired when  XCN_CERT_NAME_STR_FORCE_UTF8_DIR_STR_FLAG is the default behavior.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_DISABLE_UTF8_DIR_STR_FLAG => 1048576

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_ENABLE_PUNYCODE_FLAG => 2097152

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NAME_STR_DS_ESCAPED => 8388608
}
