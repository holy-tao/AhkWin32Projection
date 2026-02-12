#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Learn about the architecture of client-side and server-side XML formatting in SQLXML 4.0.
 * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/sqlxml/formatting/architecture-of-client-side-and-server-side-xml-formatting-sqlxml-4-0
 * @namespace Windows.Win32.Foundation.Metadata
 * @version v4.0.30319
 */
class Architecture extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static X86 => 1

    /**
     * @type {Integer (Int32)}
     */
    static X64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Arm64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static All => 7
}
