#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that indicate the features in a query.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/ne-wmiutils-wmiq_assocq_flags
 * @namespace Windows.Win32.System.Wmi
 */
class WMIQ_ASSOCQ_FLAGS extends Win32Enum {

    /**
     * Associators exist in the query.
     * Native name: WMIQ_ASSOCQ_ASSOCIATORS
     * @type {Integer (Int32)}
     */
    static ASSOCIATORS => 1

    /**
     * References exist in the query.
     * Native name: WMIQ_ASSOCQ_REFERENCES
     * @type {Integer (Int32)}
     */
    static REFERENCES => 2

    /**
     * A result class is specified in the query.
     * Native name: WMIQ_ASSOCQ_RESULTCLASS
     * @type {Integer (Int32)}
     */
    static RESULTCLASS => 4

    /**
     * An association class is specified in the query.
     * Native name: WMIQ_ASSOCQ_ASSOCCLASS
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS => 8

    /**
     * A role is specified in the query.
     * Native name: WMIQ_ASSOCQ_ROLE
     * @type {Integer (Int32)}
     */
    static ROLE => 16

    /**
     * A result role is specified in the query.
     * Native name: WMIQ_ASSOCQ_RESULTROLE
     * @type {Integer (Int32)}
     */
    static RESULTROLE => 32

    /**
     * Required qualifiers are specified in the query.
     * Native name: WMIQ_ASSOCQ_REQUIREDQUALIFIER
     * @type {Integer (Int32)}
     */
    static REQUIREDQUALIFIER => 64

    /**
     * Required association qualifiers are specified in the query.
     * Native name: WMIQ_ASSOCQ_REQUIREDASSOCQUALIFIER
     * @type {Integer (Int32)}
     */
    static REQUIREDASSOCQUALIFIER => 128

    /**
     * The query specifies class definitions only.
     * Native name: WMIQ_ASSOCQ_CLASSDEFSONLY
     * @type {Integer (Int32)}
     */
    static CLASSDEFSONLY => 256

    /**
     * The query contains the <b>KEYSONLY</b> keyword.
     * Native name: WMIQ_ASSOCQ_KEYSONLY
     * @type {Integer (Int32)}
     */
    static KEYSONLY => 512

    /**
     * The query returns only the schema.
     * Native name: WMIQ_ASSOCQ_SCHEMAONLY
     * @type {Integer (Int32)}
     */
    static SCHEMAONLY => 1024

    /**
     * The query returns only the class references.
     * Native name: WMIQ_ASSOCQ_CLASSREFSONLY
     * @type {Integer (Int32)}
     */
    static CLASSREFSONLY => 2048
}
