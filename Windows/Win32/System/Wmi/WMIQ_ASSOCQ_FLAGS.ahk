#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that indicate the features in a query.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/ne-wmiutils-wmiq_assocq_flags
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WMIQ_ASSOCQ_FLAGS extends Win32Enum{

    /**
     * Associators exist in the query.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_ASSOCIATORS => 1

    /**
     * References exist in the query.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_REFERENCES => 2

    /**
     * A result class is specified in the query.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_RESULTCLASS => 4

    /**
     * An association class is specified in the query.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_ASSOCCLASS => 8

    /**
     * A role is specified in the query.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_ROLE => 16

    /**
     * A result role is specified in the query.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_RESULTROLE => 32

    /**
     * Required qualifiers are specified in the query.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_REQUIREDQUALIFIER => 64

    /**
     * Required association qualifiers are specified in the query.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_REQUIREDASSOCQUALIFIER => 128

    /**
     * The query specifies class definitions only.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_CLASSDEFSONLY => 256

    /**
     * The query contains the <b>KEYSONLY</b> keyword.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_KEYSONLY => 512

    /**
     * The query returns only the schema.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_SCHEMAONLY => 1024

    /**
     * The query returns only the class references.
     * @type {Integer (Int32)}
     */
    static WMIQ_ASSOCQ_CLASSREFSONLY => 2048
}
