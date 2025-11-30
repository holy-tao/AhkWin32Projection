#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMMPID_RP_ENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_BEFORE__ => 8191

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_DSN_NOTIFY_SUCCESS => 8192

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_DSN_NOTIFY_INVALID => 8193

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_ADDRESS_TYPE => 8194

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_ADDRESS => 8195

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_ADDRESS_TYPE_SMTP => 8196

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_ERROR_CODE => 8197

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_ERROR_STRING => 8198

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_DSN_NOTIFY_VALUE => 8199

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_DSN_ORCPT_VALUE => 8200

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_ADDRESS_SMTP => 8201

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_ADDRESS_X400 => 8202

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_ADDRESS_X500 => 8203

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_LEGACY_EX_DN => 8204

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_RECIPIENT_FLAGS => 8205

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_SMTP_STATUS_STRING => 8206

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_DSN_PRE_CAT_ADDRESS => 8207

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_MDB_GUID => 8208

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_USER_GUID => 8209

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_DOMAIN => 8210

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_ADDRESS_OTHER => 8211

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_DISPLAY_NAME => 8212

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RP_AFTER__ => 8213
}
