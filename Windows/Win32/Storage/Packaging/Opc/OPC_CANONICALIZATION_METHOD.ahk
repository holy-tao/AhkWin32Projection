#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes the canonicalization method to be applied to XML markup.
 * @remarks
 * For more information about XML canonicalization, see the <a href="https://www.w3.org/TR/xml-c14n">W3C Recommendation, Canonical XML
 * Version 1.0</a> (http://www.w3.org/TR/xml-c14n).
 * 
 * For more information about canonicalization and packages, see the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_canonicalization_method
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
class OPC_CANONICALIZATION_METHOD extends Win32Enum {

    /**
     * No canonicalization method is applied.
     * Native name: OPC_CANONICALIZATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The C14N canonicalization method that removes comments is applied.
     * Native name: OPC_CANONICALIZATION_C14N
     * @type {Integer (Int32)}
     */
    static C14N => 1

    /**
     * The C14N canonicalization method that preserves comments is applied.
     * Native name: OPC_CANONICALIZATION_C14N_WITH_COMMENTS
     * @type {Integer (Int32)}
     */
    static C14N_WITH_COMMENTS => 2
}
