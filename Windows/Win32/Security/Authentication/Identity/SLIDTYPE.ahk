#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents the type of Software Licensing ID.
 * @see https://docs.microsoft.com/windows/win32/api//slpublic/ne-slpublic-slidtype
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SLIDTYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_ID_APPLICATION => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_ID_PRODUCT_SKU => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_ID_LICENSE_FILE => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_ID_LICENSE => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_ID_PKEY => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_ID_ALL_LICENSES => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_ID_ALL_LICENSE_FILES => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_ID_STORE_TOKEN => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_ID_LAST => 8
}
