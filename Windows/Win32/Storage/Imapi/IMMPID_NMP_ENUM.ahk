#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMMPID_NMP_ENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_BEFORE__ => 24575

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_SECONDARY_GROUPS => 24576

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_SECONDARY_ARTNUM => 24577

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_PRIMARY_GROUP => 24578

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_PRIMARY_ARTID => 24579

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_POST_TOKEN => 24580

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_NEWSGROUP_LIST => 24581

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_HEADERS => 24582

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_NNTP_PROCESSING => 24583

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_NNTP_APPROVED_HEADER => 24584

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_NMP_AFTER__ => 24585
}
