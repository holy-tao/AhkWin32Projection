#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMMPID_MP_ENUM extends Win32Enum {

    /**
     * Native name: IMMPID_MP_BEFORE__
     * @type {Integer (Int32)}
     */
    static BEFORE__ => 4095

    /**
     * Native name: IMMPID_MP_RECIPIENT_LIST
     * @type {Integer (Int32)}
     */
    static RECIPIENT_LIST => 4096

    /**
     * Native name: IMMPID_MP_CONTENT_FILE_NAME
     * @type {Integer (Int32)}
     */
    static CONTENT_FILE_NAME => 4097

    /**
     * Native name: IMMPID_MP_SENDER_ADDRESS_SMTP
     * @type {Integer (Int32)}
     */
    static SENDER_ADDRESS_SMTP => 4098

    /**
     * Native name: IMMPID_MP_SENDER_ADDRESS_X500
     * @type {Integer (Int32)}
     */
    static SENDER_ADDRESS_X500 => 4099

    /**
     * Native name: IMMPID_MP_SENDER_ADDRESS_X400
     * @type {Integer (Int32)}
     */
    static SENDER_ADDRESS_X400 => 4100

    /**
     * Native name: IMMPID_MP_SENDER_ADDRESS_LEGACY_EX_DN
     * @type {Integer (Int32)}
     */
    static SENDER_ADDRESS_LEGACY_EX_DN => 4101

    /**
     * Native name: IMMPID_MP_DOMAIN_LIST
     * @type {Integer (Int32)}
     */
    static DOMAIN_LIST => 4102

    /**
     * Native name: IMMPID_MP_PICKUP_FILE_NAME
     * @type {Integer (Int32)}
     */
    static PICKUP_FILE_NAME => 4103

    /**
     * Native name: IMMPID_MP_AUTHENTICATED_USER_NAME
     * @type {Integer (Int32)}
     */
    static AUTHENTICATED_USER_NAME => 4104

    /**
     * Native name: IMMPID_MP_CONNECTION_IP_ADDRESS
     * @type {Integer (Int32)}
     */
    static CONNECTION_IP_ADDRESS => 4105

    /**
     * Native name: IMMPID_MP_HELO_DOMAIN
     * @type {Integer (Int32)}
     */
    static HELO_DOMAIN => 4106

    /**
     * Native name: IMMPID_MP_EIGHTBIT_MIME_OPTION
     * @type {Integer (Int32)}
     */
    static EIGHTBIT_MIME_OPTION => 4107

    /**
     * Native name: IMMPID_MP_CHUNKING_OPTION
     * @type {Integer (Int32)}
     */
    static CHUNKING_OPTION => 4108

    /**
     * Native name: IMMPID_MP_BINARYMIME_OPTION
     * @type {Integer (Int32)}
     */
    static BINARYMIME_OPTION => 4109

    /**
     * Native name: IMMPID_MP_REMOTE_AUTHENTICATION_TYPE
     * @type {Integer (Int32)}
     */
    static REMOTE_AUTHENTICATION_TYPE => 4110

    /**
     * Native name: IMMPID_MP_ERROR_CODE
     * @type {Integer (Int32)}
     */
    static ERROR_CODE => 4111

    /**
     * Native name: IMMPID_MP_DSN_ENVID_VALUE
     * @type {Integer (Int32)}
     */
    static DSN_ENVID_VALUE => 4112

    /**
     * Native name: IMMPID_MP_DSN_RET_VALUE
     * @type {Integer (Int32)}
     */
    static DSN_RET_VALUE => 4113

    /**
     * Native name: IMMPID_MP_REMOTE_SERVER_DSN_CAPABLE
     * @type {Integer (Int32)}
     */
    static REMOTE_SERVER_DSN_CAPABLE => 4114

    /**
     * Native name: IMMPID_MP_ARRIVAL_TIME
     * @type {Integer (Int32)}
     */
    static ARRIVAL_TIME => 4115

    /**
     * Native name: IMMPID_MP_MESSAGE_STATUS
     * @type {Integer (Int32)}
     */
    static MESSAGE_STATUS => 4116

    /**
     * Native name: IMMPID_MP_EXPIRE_DELAY
     * @type {Integer (Int32)}
     */
    static EXPIRE_DELAY => 4117

    /**
     * Native name: IMMPID_MP_EXPIRE_NDR
     * @type {Integer (Int32)}
     */
    static EXPIRE_NDR => 4118

    /**
     * Native name: IMMPID_MP_LOCAL_EXPIRE_DELAY
     * @type {Integer (Int32)}
     */
    static LOCAL_EXPIRE_DELAY => 4119

    /**
     * Native name: IMMPID_MP_LOCAL_EXPIRE_NDR
     * @type {Integer (Int32)}
     */
    static LOCAL_EXPIRE_NDR => 4120

    /**
     * Native name: IMMPID_MP_ARRIVAL_FILETIME
     * @type {Integer (Int32)}
     */
    static ARRIVAL_FILETIME => 4121

    /**
     * Native name: IMMPID_MP_HR_CAT_STATUS
     * @type {Integer (Int32)}
     */
    static HR_CAT_STATUS => 4122

    /**
     * Native name: IMMPID_MP_MSG_GUID
     * @type {Integer (Int32)}
     */
    static MSG_GUID => 4123

    /**
     * Native name: IMMPID_MP_SUPERSEDES_MSG_GUID
     * @type {Integer (Int32)}
     */
    static SUPERSEDES_MSG_GUID => 4124

    /**
     * Native name: IMMPID_MP_SCANNED_FOR_CRLF_DOT_CRLF
     * @type {Integer (Int32)}
     */
    static SCANNED_FOR_CRLF_DOT_CRLF => 4125

    /**
     * Native name: IMMPID_MP_FOUND_EMBEDDED_CRLF_DOT_CRLF
     * @type {Integer (Int32)}
     */
    static FOUND_EMBEDDED_CRLF_DOT_CRLF => 4126

    /**
     * Native name: IMMPID_MP_MSG_SIZE_HINT
     * @type {Integer (Int32)}
     */
    static MSG_SIZE_HINT => 4127

    /**
     * Native name: IMMPID_MP_RFC822_MSG_ID
     * @type {Integer (Int32)}
     */
    static RFC822_MSG_ID => 4128

    /**
     * Native name: IMMPID_MP_RFC822_MSG_SUBJECT
     * @type {Integer (Int32)}
     */
    static RFC822_MSG_SUBJECT => 4129

    /**
     * Native name: IMMPID_MP_RFC822_FROM_ADDRESS
     * @type {Integer (Int32)}
     */
    static RFC822_FROM_ADDRESS => 4130

    /**
     * Native name: IMMPID_MP_RFC822_TO_ADDRESS
     * @type {Integer (Int32)}
     */
    static RFC822_TO_ADDRESS => 4131

    /**
     * Native name: IMMPID_MP_RFC822_CC_ADDRESS
     * @type {Integer (Int32)}
     */
    static RFC822_CC_ADDRESS => 4132

    /**
     * Native name: IMMPID_MP_RFC822_BCC_ADDRESS
     * @type {Integer (Int32)}
     */
    static RFC822_BCC_ADDRESS => 4133

    /**
     * Native name: IMMPID_MP_CONNECTION_SERVER_IP_ADDRESS
     * @type {Integer (Int32)}
     */
    static CONNECTION_SERVER_IP_ADDRESS => 4134

    /**
     * Native name: IMMPID_MP_SERVER_NAME
     * @type {Integer (Int32)}
     */
    static SERVER_NAME => 4135

    /**
     * Native name: IMMPID_MP_SERVER_VERSION
     * @type {Integer (Int32)}
     */
    static SERVER_VERSION => 4136

    /**
     * Native name: IMMPID_MP_NUM_RECIPIENTS
     * @type {Integer (Int32)}
     */
    static NUM_RECIPIENTS => 4137

    /**
     * Native name: IMMPID_MP_X_PRIORITY
     * @type {Integer (Int32)}
     */
    static X_PRIORITY => 4138

    /**
     * Native name: IMMPID_MP_FROM_ADDRESS
     * @type {Integer (Int32)}
     */
    static FROM_ADDRESS => 4139

    /**
     * Native name: IMMPID_MP_SENDER_ADDRESS
     * @type {Integer (Int32)}
     */
    static SENDER_ADDRESS => 4140

    /**
     * Native name: IMMPID_MP_DEFERRED_DELIVERY_FILETIME
     * @type {Integer (Int32)}
     */
    static DEFERRED_DELIVERY_FILETIME => 4141

    /**
     * Native name: IMMPID_MP_SENDER_ADDRESS_OTHER
     * @type {Integer (Int32)}
     */
    static SENDER_ADDRESS_OTHER => 4142

    /**
     * Native name: IMMPID_MP_ORIGINAL_ARRIVAL_TIME
     * @type {Integer (Int32)}
     */
    static ORIGINAL_ARRIVAL_TIME => 4143

    /**
     * Native name: IMMPID_MP_MSGCLASS
     * @type {Integer (Int32)}
     */
    static MSGCLASS => 4144

    /**
     * Native name: IMMPID_MP_CONTENT_TYPE
     * @type {Integer (Int32)}
     */
    static CONTENT_TYPE => 4145

    /**
     * Native name: IMMPID_MP_ENCRYPTION_TYPE
     * @type {Integer (Int32)}
     */
    static ENCRYPTION_TYPE => 4146

    /**
     * Native name: IMMPID_MP_CONNECTION_SERVER_PORT
     * @type {Integer (Int32)}
     */
    static CONNECTION_SERVER_PORT => 4147

    /**
     * Native name: IMMPID_MP_CLIENT_AUTH_USER
     * @type {Integer (Int32)}
     */
    static CLIENT_AUTH_USER => 4148

    /**
     * Native name: IMMPID_MP_CLIENT_AUTH_TYPE
     * @type {Integer (Int32)}
     */
    static CLIENT_AUTH_TYPE => 4149

    /**
     * Native name: IMMPID_MP_CRC_GLOBAL
     * @type {Integer (Int32)}
     */
    static CRC_GLOBAL => 4150

    /**
     * Native name: IMMPID_MP_CRC_RECIPS
     * @type {Integer (Int32)}
     */
    static CRC_RECIPS => 4151

    /**
     * Native name: IMMPID_MP_INBOUND_MAIL_FROM_AUTH
     * @type {Integer (Int32)}
     */
    static INBOUND_MAIL_FROM_AUTH => 4152

    /**
     * Native name: IMMPID_MP_AFTER__
     * @type {Integer (Int32)}
     */
    static AFTER__ => 4153
}
