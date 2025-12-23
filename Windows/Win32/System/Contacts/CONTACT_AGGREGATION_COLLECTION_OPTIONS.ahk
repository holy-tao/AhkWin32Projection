#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class CONTACT_AGGREGATION_COLLECTION_OPTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CACO_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static CACO_INCLUDE_EXTERNAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CACO_EXTERNAL_ONLY => 2
}
