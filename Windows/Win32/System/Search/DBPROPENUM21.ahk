#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPROPENUM21 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_TRUSTEE_USERNAME => 241

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_TRUSTEE_AUTHENTICATION => 242

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_TRUSTEE_NEWAUTHENTICATION => 243

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRow => 263

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowChange => 264

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowSchemaChange => 265

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IGetRow => 266

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IScopedOperations => 267

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IBindResource => 268

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ICreateRow => 269

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_BINDFLAGS => 270

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_LOCKOWNER => 271

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_GENERATEURL => 273

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IDBBinderProperties => 274

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IColumnsInfo2 => 275

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRegisterProvider => 276

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IGetSession => 277

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IGetSourceRow => 278

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetCurrentIndex => 279

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OPENROWSETSUPPORT => 280

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COL_ISLONG => 281
}
