#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMMPID_NMP_ENUM extends Win32Enum {

    /**
     * Native name: IMMPID_NMP_BEFORE__
     * @type {Integer (Int32)}
     */
    static BEFORE__ => 24575

    /**
     * Native name: IMMPID_NMP_SECONDARY_GROUPS
     * @type {Integer (Int32)}
     */
    static SECONDARY_GROUPS => 24576

    /**
     * Native name: IMMPID_NMP_SECONDARY_ARTNUM
     * @type {Integer (Int32)}
     */
    static SECONDARY_ARTNUM => 24577

    /**
     * Native name: IMMPID_NMP_PRIMARY_GROUP
     * @type {Integer (Int32)}
     */
    static PRIMARY_GROUP => 24578

    /**
     * Native name: IMMPID_NMP_PRIMARY_ARTID
     * @type {Integer (Int32)}
     */
    static PRIMARY_ARTID => 24579

    /**
     * Native name: IMMPID_NMP_POST_TOKEN
     * @type {Integer (Int32)}
     */
    static POST_TOKEN => 24580

    /**
     * Native name: IMMPID_NMP_NEWSGROUP_LIST
     * @type {Integer (Int32)}
     */
    static NEWSGROUP_LIST => 24581

    /**
     * Native name: IMMPID_NMP_HEADERS
     * @type {Integer (Int32)}
     */
    static HEADERS => 24582

    /**
     * Native name: IMMPID_NMP_NNTP_PROCESSING
     * @type {Integer (Int32)}
     */
    static NNTP_PROCESSING => 24583

    /**
     * Native name: IMMPID_NMP_NNTP_APPROVED_HEADER
     * @type {Integer (Int32)}
     */
    static NNTP_APPROVED_HEADER => 24584

    /**
     * Native name: IMMPID_NMP_AFTER__
     * @type {Integer (Int32)}
     */
    static AFTER__ => 24585
}
