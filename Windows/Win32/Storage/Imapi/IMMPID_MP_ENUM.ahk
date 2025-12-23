#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMMPID_MP_ENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_BEFORE__ => 4095

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_RECIPIENT_LIST => 4096

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CONTENT_FILE_NAME => 4097

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SENDER_ADDRESS_SMTP => 4098

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SENDER_ADDRESS_X500 => 4099

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SENDER_ADDRESS_X400 => 4100

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SENDER_ADDRESS_LEGACY_EX_DN => 4101

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_DOMAIN_LIST => 4102

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_PICKUP_FILE_NAME => 4103

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_AUTHENTICATED_USER_NAME => 4104

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CONNECTION_IP_ADDRESS => 4105

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_HELO_DOMAIN => 4106

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_EIGHTBIT_MIME_OPTION => 4107

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CHUNKING_OPTION => 4108

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_BINARYMIME_OPTION => 4109

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_REMOTE_AUTHENTICATION_TYPE => 4110

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_ERROR_CODE => 4111

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_DSN_ENVID_VALUE => 4112

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_DSN_RET_VALUE => 4113

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_REMOTE_SERVER_DSN_CAPABLE => 4114

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_ARRIVAL_TIME => 4115

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_MESSAGE_STATUS => 4116

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_EXPIRE_DELAY => 4117

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_EXPIRE_NDR => 4118

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_LOCAL_EXPIRE_DELAY => 4119

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_LOCAL_EXPIRE_NDR => 4120

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_ARRIVAL_FILETIME => 4121

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_HR_CAT_STATUS => 4122

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_MSG_GUID => 4123

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SUPERSEDES_MSG_GUID => 4124

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SCANNED_FOR_CRLF_DOT_CRLF => 4125

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_FOUND_EMBEDDED_CRLF_DOT_CRLF => 4126

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_MSG_SIZE_HINT => 4127

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_RFC822_MSG_ID => 4128

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_RFC822_MSG_SUBJECT => 4129

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_RFC822_FROM_ADDRESS => 4130

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_RFC822_TO_ADDRESS => 4131

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_RFC822_CC_ADDRESS => 4132

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_RFC822_BCC_ADDRESS => 4133

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CONNECTION_SERVER_IP_ADDRESS => 4134

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SERVER_NAME => 4135

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SERVER_VERSION => 4136

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_NUM_RECIPIENTS => 4137

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_X_PRIORITY => 4138

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_FROM_ADDRESS => 4139

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SENDER_ADDRESS => 4140

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_DEFERRED_DELIVERY_FILETIME => 4141

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_SENDER_ADDRESS_OTHER => 4142

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_ORIGINAL_ARRIVAL_TIME => 4143

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_MSGCLASS => 4144

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CONTENT_TYPE => 4145

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_ENCRYPTION_TYPE => 4146

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CONNECTION_SERVER_PORT => 4147

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CLIENT_AUTH_USER => 4148

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CLIENT_AUTH_TYPE => 4149

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CRC_GLOBAL => 4150

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_CRC_RECIPS => 4151

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_INBOUND_MAIL_FROM_AUTH => 4152

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MP_AFTER__ => 4153
}
