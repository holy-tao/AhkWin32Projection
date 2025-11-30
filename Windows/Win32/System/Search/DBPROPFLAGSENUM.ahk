#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPROPFLAGSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_NOTSUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_COLUMN => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_DATASOURCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_DATASOURCECREATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_DATASOURCEINFO => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_DBINIT => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_INDEX => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_ROWSET => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_TABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_COLUMNOK => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_READ => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_WRITE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_REQUIRED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_SESSION => 4096
}
