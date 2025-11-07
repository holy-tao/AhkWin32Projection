#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the canonicalization method to be applied to XML markup.
 * @remarks
 * 
 * For more information about XML canonicalization, see the <a href="https://www.w3.org/TR/xml-c14n">W3C Recommendation, Canonical XML
 * Version 1.0</a> (http://www.w3.org/TR/xml-c14n).
 * 
 * For more information about canonicalization and packages, see the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/ne-msopc-opc_canonicalization_method
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class OPC_CANONICALIZATION_METHOD{

    /**
     * No canonicalization method is applied.
     * @type {Integer (Int32)}
     */
    static OPC_CANONICALIZATION_NONE => 0

    /**
     * The C14N canonicalization method that removes comments is applied.
     * @type {Integer (Int32)}
     */
    static OPC_CANONICALIZATION_C14N => 1

    /**
     * The C14N canonicalization method that preserves comments is applied.
     * @type {Integer (Int32)}
     */
    static OPC_CANONICALIZATION_C14N_WITH_COMMENTS => 2
}
