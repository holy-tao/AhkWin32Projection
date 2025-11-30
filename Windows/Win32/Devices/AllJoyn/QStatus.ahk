#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class QStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ER_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static ER_FAIL => 1

    /**
     * @type {Integer (Int32)}
     */
    static ER_UTF_CONVERSION_FAILED => 2

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUFFER_TOO_SMALL => 3

    /**
     * @type {Integer (Int32)}
     */
    static ER_OS_ERROR => 4

    /**
     * @type {Integer (Int32)}
     */
    static ER_OUT_OF_MEMORY => 5

    /**
     * @type {Integer (Int32)}
     */
    static ER_SOCKET_BIND_ERROR => 6

    /**
     * @type {Integer (Int32)}
     */
    static ER_INIT_FAILED => 7

    /**
     * @type {Integer (Int32)}
     */
    static ER_WOULDBLOCK => 8

    /**
     * @type {Integer (Int32)}
     */
    static ER_NOT_IMPLEMENTED => 9

    /**
     * @type {Integer (Int32)}
     */
    static ER_TIMEOUT => 10

    /**
     * @type {Integer (Int32)}
     */
    static ER_SOCK_OTHER_END_CLOSED => 11

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_ARG_1 => 12

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_ARG_2 => 13

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_ARG_3 => 14

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_ARG_4 => 15

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_ARG_5 => 16

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_ARG_6 => 17

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_ARG_7 => 18

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_ARG_8 => 19

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_ADDRESS => 20

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_DATA => 21

    /**
     * @type {Integer (Int32)}
     */
    static ER_READ_ERROR => 22

    /**
     * @type {Integer (Int32)}
     */
    static ER_WRITE_ERROR => 23

    /**
     * @type {Integer (Int32)}
     */
    static ER_OPEN_FAILED => 24

    /**
     * @type {Integer (Int32)}
     */
    static ER_PARSE_ERROR => 25

    /**
     * @type {Integer (Int32)}
     */
    static ER_END_OF_DATA => 26

    /**
     * @type {Integer (Int32)}
     */
    static ER_CONN_REFUSED => 27

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_ARG_COUNT => 28

    /**
     * @type {Integer (Int32)}
     */
    static ER_WARNING => 29

    /**
     * @type {Integer (Int32)}
     */
    static ER_EOF => 30

    /**
     * @type {Integer (Int32)}
     */
    static ER_DEADLOCK => 31

    /**
     * @type {Integer (Int32)}
     */
    static ER_COMMON_ERRORS => 4096

    /**
     * @type {Integer (Int32)}
     */
    static ER_STOPPING_THREAD => 4097

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALERTED_THREAD => 4098

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_MALFORMED => 4099

    /**
     * @type {Integer (Int32)}
     */
    static ER_AUTH_FAIL => 4100

    /**
     * @type {Integer (Int32)}
     */
    static ER_AUTH_USER_REJECT => 4101

    /**
     * @type {Integer (Int32)}
     */
    static ER_NO_SUCH_ALARM => 4102

    /**
     * @type {Integer (Int32)}
     */
    static ER_TIMER_FALLBEHIND => 4103

    /**
     * @type {Integer (Int32)}
     */
    static ER_SSL_ERRORS => 4104

    /**
     * @type {Integer (Int32)}
     */
    static ER_SSL_INIT => 4105

    /**
     * @type {Integer (Int32)}
     */
    static ER_SSL_CONNECT => 4106

    /**
     * @type {Integer (Int32)}
     */
    static ER_SSL_VERIFY => 4107

    /**
     * @type {Integer (Int32)}
     */
    static ER_EXTERNAL_THREAD => 4108

    /**
     * @type {Integer (Int32)}
     */
    static ER_CRYPTO_ERROR => 4109

    /**
     * @type {Integer (Int32)}
     */
    static ER_CRYPTO_TRUNCATED => 4110

    /**
     * @type {Integer (Int32)}
     */
    static ER_CRYPTO_KEY_UNAVAILABLE => 4111

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_HOSTNAME => 4112

    /**
     * @type {Integer (Int32)}
     */
    static ER_CRYPTO_KEY_UNUSABLE => 4113

    /**
     * @type {Integer (Int32)}
     */
    static ER_EMPTY_KEY_BLOB => 4114

    /**
     * @type {Integer (Int32)}
     */
    static ER_CORRUPT_KEYBLOB => 4115

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_KEY_ENCODING => 4116

    /**
     * @type {Integer (Int32)}
     */
    static ER_DEAD_THREAD => 4117

    /**
     * @type {Integer (Int32)}
     */
    static ER_THREAD_RUNNING => 4118

    /**
     * @type {Integer (Int32)}
     */
    static ER_THREAD_STOPPING => 4119

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_STRING_ENCODING => 4120

    /**
     * @type {Integer (Int32)}
     */
    static ER_CRYPTO_INSUFFICIENT_SECURITY => 4121

    /**
     * @type {Integer (Int32)}
     */
    static ER_CRYPTO_ILLEGAL_PARAMETERS => 4122

    /**
     * @type {Integer (Int32)}
     */
    static ER_CRYPTO_HASH_UNINITIALIZED => 4123

    /**
     * @type {Integer (Int32)}
     */
    static ER_THREAD_NO_WAIT => 4124

    /**
     * @type {Integer (Int32)}
     */
    static ER_TIMER_EXITING => 4125

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_GUID => 4126

    /**
     * @type {Integer (Int32)}
     */
    static ER_THREADPOOL_EXHAUSTED => 4127

    /**
     * @type {Integer (Int32)}
     */
    static ER_THREADPOOL_STOPPING => 4128

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_STREAM => 4129

    /**
     * @type {Integer (Int32)}
     */
    static ER_TIMER_FULL => 4130

    /**
     * @type {Integer (Int32)}
     */
    static ER_IODISPATCH_STOPPING => 4131

    /**
     * @type {Integer (Int32)}
     */
    static ER_SLAP_INVALID_PACKET_LEN => 4132

    /**
     * @type {Integer (Int32)}
     */
    static ER_SLAP_HDR_CHECKSUM_ERROR => 4133

    /**
     * @type {Integer (Int32)}
     */
    static ER_SLAP_INVALID_PACKET_TYPE => 4134

    /**
     * @type {Integer (Int32)}
     */
    static ER_SLAP_LEN_MISMATCH => 4135

    /**
     * @type {Integer (Int32)}
     */
    static ER_SLAP_PACKET_TYPE_MISMATCH => 4136

    /**
     * @type {Integer (Int32)}
     */
    static ER_SLAP_CRC_ERROR => 4137

    /**
     * @type {Integer (Int32)}
     */
    static ER_SLAP_ERROR => 4138

    /**
     * @type {Integer (Int32)}
     */
    static ER_SLAP_OTHER_END_CLOSED => 4139

    /**
     * @type {Integer (Int32)}
     */
    static ER_TIMER_NOT_ALLOWED => 4140

    /**
     * @type {Integer (Int32)}
     */
    static ER_NOT_CONN => 4141

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_CONVERTER_ERROR => 8192

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_RULES_COUNT => 8193

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INTERFACE_MEMBERS_MISSING => 8194

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_MEMBER_TYPE => 8195

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_MEMBER_ACTION => 8196

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_MEMBER_DENY_ACTION_WITH_OTHER => 8197

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_ANNOTATIONS_COUNT => 8198

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_ELEMENT_NAME => 8199

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_ATTRIBUTE_VALUE => 8200

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_SECURITY_LEVEL_ANNOTATION_VALUE => 8201

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_ELEMENT_CHILDREN_COUNT => 8202

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_POLICY_VERSION => 8203

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_POLICY_SERIAL_NUMBER => 8204

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_ACL_PEER_TYPE => 8205

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_ACL_PEER_CHILDREN_COUNT => 8206

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_ACL_ALL_TYPE_PEER_WITH_OTHERS => 8207

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_ACL_PEER_PUBLIC_KEY => 8208

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_ACL_PEER_NOT_UNIQUE => 8209

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_ACL_PEER_PUBLIC_KEY_SET => 8210

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_ACLS_MISSING => 8211

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_ACL_PEERS_MISSING => 8212

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_OBJECT_PATH => 8213

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_INTERFACE_NAME => 8214

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_MEMBER_NAME => 8215

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_MANIFEST_VERSION => 8216

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_OID => 8217

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INVALID_BASE64 => 8218

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_INTERFACE_NAME_NOT_UNIQUE => 8219

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_MEMBER_NAME_NOT_UNIQUE => 8220

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_OBJECT_PATH_NOT_UNIQUE => 8221

    /**
     * @type {Integer (Int32)}
     */
    static ER_XML_ANNOTATION_NOT_UNIQUE => 8222

    /**
     * @type {Integer (Int32)}
     */
    static ER_NONE => 65535

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ERRORS => 36864

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_READ_ERROR => 36865

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_WRITE_ERROR => 36866

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_VALUE_TYPE => 36867

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_HEADER_FIELD => 36868

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_SIGNATURE => 36869

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_OBJ_PATH => 36870

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_MEMBER_NAME => 36871

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_INTERFACE_NAME => 36872

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_ERROR_NAME => 36873

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_BUS_NAME => 36874

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NAME_TOO_LONG => 36875

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_LENGTH => 36876

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_VALUE => 36877

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_HDR_FLAGS => 36878

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_BODY_LEN => 36879

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_HEADER_LEN => 36880

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_UNKNOWN_SERIAL => 36881

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_UNKNOWN_PATH => 36882

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_UNKNOWN_INTERFACE => 36883

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ESTABLISH_FAILED => 36884

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_UNEXPECTED_SIGNATURE => 36885

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_INTERFACE_MISSING => 36886

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_PATH_MISSING => 36887

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_MEMBER_MISSING => 36888

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_REPLY_SERIAL_MISSING => 36889

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ERROR_NAME_MISSING => 36890

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_INTERFACE_NO_SUCH_MEMBER => 36891

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_SUCH_OBJECT => 36892

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_OBJECT_NO_SUCH_MEMBER => 36893

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_OBJECT_NO_SUCH_INTERFACE => 36894

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_SUCH_INTERFACE => 36895

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_MEMBER_NO_SUCH_SIGNATURE => 36896

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NOT_NUL_TERMINATED => 36897

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_SUCH_PROPERTY => 36898

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_SET_WRONG_SIGNATURE => 36899

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_PROPERTY_VALUE_NOT_SET => 36900

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_PROPERTY_ACCESS_DENIED => 36901

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_TRANSPORTS => 36902

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_TRANSPORT_ARGS => 36903

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_ROUTE => 36904

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_ENDPOINT => 36905

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_SEND_PARAMETER => 36906

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_UNMATCHED_REPLY_SERIAL => 36907

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_SENDER_ID => 36908

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_TRANSPORT_NOT_STARTED => 36909

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_EMPTY_MESSAGE => 36910

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NOT_OWNER => 36911

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_SET_PROPERTY_REJECTED => 36912

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_CONNECT_FAILED => 36913

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_REPLY_IS_ERROR_MESSAGE => 36914

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NOT_AUTHENTICATING => 36915

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_LISTENER => 36916

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NOT_ALLOWED => 36918

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_WRITE_QUEUE_FULL => 36919

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ENDPOINT_CLOSING => 36920

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_INTERFACE_MISMATCH => 36921

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_MEMBER_ALREADY_EXISTS => 36922

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_PROPERTY_ALREADY_EXISTS => 36923

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_IFACE_ALREADY_EXISTS => 36924

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ERROR_RESPONSE => 36925

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_XML => 36926

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_CHILD_PATH => 36927

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_OBJ_ALREADY_EXISTS => 36928

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_OBJ_NOT_FOUND => 36929

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_CANNOT_EXPAND_MESSAGE => 36930

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NOT_COMPRESSED => 36931

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ALREADY_CONNECTED => 36932

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NOT_CONNECTED => 36933

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ALREADY_LISTENING => 36934

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_KEY_UNAVAILABLE => 36935

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_TRUNCATED => 36936

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_KEY_STORE_NOT_LOADED => 36937

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_AUTHENTICATION_MECHANISM => 36938

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BUS_ALREADY_STARTED => 36939

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BUS_NOT_STARTED => 36940

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_KEYBLOB_OP_INVALID => 36941

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_INVALID_HEADER_CHECKSUM => 36942

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_MESSAGE_NOT_ENCRYPTED => 36943

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_INVALID_HEADER_SERIAL => 36944

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_TIME_TO_LIVE_EXPIRED => 36945

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_HDR_EXPANSION_INVALID => 36946

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_MISSING_COMPRESSION_TOKEN => 36947

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_PEER_GUID => 36948

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_MESSAGE_DECRYPTION_FAILED => 36949

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_SECURITY_FATAL => 36950

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_KEY_EXPIRED => 36951

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_CORRUPT_KEYSTORE => 36952

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_CALL_FOR_REPLY => 36953

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NOT_A_COMPLETE_TYPE => 36954

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_POLICY_VIOLATION => 36955

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_SUCH_SERVICE => 36956

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_TRANSPORT_NOT_AVAILABLE => 36957

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_INVALID_AUTH_MECHANISM => 36958

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_KEYSTORE_VERSION_MISMATCH => 36959

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BLOCKING_CALL_NOT_ALLOWED => 36960

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_SIGNATURE_MISMATCH => 36961

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_STOPPING => 36962

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_METHOD_CALL_ABORTED => 36963

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_CANNOT_ADD_INTERFACE => 36964

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_CANNOT_ADD_HANDLER => 36965

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_KEYSTORE_NOT_LOADED => 36966

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_SUCH_HANDLE => 36971

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_HANDLES_NOT_ENABLED => 36972

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_HANDLES_MISMATCH => 36973

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_SESSION => 36975

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ELEMENT_NOT_FOUND => 36976

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NOT_A_DICTIONARY => 36977

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_WAIT_FAILED => 36978

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_BAD_SESSION_OPTS => 36980

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_CONNECTION_REJECTED => 36981

    /**
     * @type {Integer (Int32)}
     */
    static ER_DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER => 36982

    /**
     * @type {Integer (Int32)}
     */
    static ER_DBUS_REQUEST_NAME_REPLY_IN_QUEUE => 36983

    /**
     * @type {Integer (Int32)}
     */
    static ER_DBUS_REQUEST_NAME_REPLY_EXISTS => 36984

    /**
     * @type {Integer (Int32)}
     */
    static ER_DBUS_REQUEST_NAME_REPLY_ALREADY_OWNER => 36985

    /**
     * @type {Integer (Int32)}
     */
    static ER_DBUS_RELEASE_NAME_REPLY_RELEASED => 36986

    /**
     * @type {Integer (Int32)}
     */
    static ER_DBUS_RELEASE_NAME_REPLY_NON_EXISTENT => 36987

    /**
     * @type {Integer (Int32)}
     */
    static ER_DBUS_RELEASE_NAME_REPLY_NOT_OWNER => 36988

    /**
     * @type {Integer (Int32)}
     */
    static ER_DBUS_START_REPLY_ALREADY_RUNNING => 36990

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_BINDSESSIONPORT_REPLY_ALREADY_EXISTS => 36992

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_BINDSESSIONPORT_REPLY_FAILED => 36993

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_JOINSESSION_REPLY_NO_SESSION => 36995

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_JOINSESSION_REPLY_UNREACHABLE => 36996

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_JOINSESSION_REPLY_CONNECT_FAILED => 36997

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_JOINSESSION_REPLY_REJECTED => 36998

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_JOINSESSION_REPLY_BAD_SESSION_OPTS => 36999

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_JOINSESSION_REPLY_FAILED => 37000

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_LEAVESESSION_REPLY_NO_SESSION => 37002

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_LEAVESESSION_REPLY_FAILED => 37003

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_ADVERTISENAME_REPLY_TRANSPORT_NOT_AVAILABLE => 37004

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_ADVERTISENAME_REPLY_ALREADY_ADVERTISING => 37005

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_ADVERTISENAME_REPLY_FAILED => 37006

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_CANCELADVERTISENAME_REPLY_FAILED => 37008

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_TRANSPORT_NOT_AVAILABLE => 37009

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_ALREADY_DISCOVERING => 37010

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_FAILED => 37011

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_CANCELFINDADVERTISEDNAME_REPLY_FAILED => 37013

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_UNEXPECTED_DISPOSITION => 37014

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_INTERFACE_ACTIVATED => 37015

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_BAD_PORT => 37016

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_FAILED => 37017

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_BINDSESSIONPORT_REPLY_INVALID_OPTS => 37018

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_JOINSESSION_REPLY_ALREADY_JOINED => 37019

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_SELF_CONNECT => 37020

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_SECURITY_NOT_ENABLED => 37021

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_LISTENER_ALREADY_SET => 37022

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_PEER_AUTH_VERSION_MISMATCH => 37023

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NOT_SUPPORTED => 37024

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NO_DEST_SUPPORT => 37025

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_SETLINKTIMEOUT_REPLY_FAILED => 37026

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_ACCESS_PERMISSION_WARNING => 37027

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_ACCESS_PERMISSION_ERROR => 37028

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_DESTINATION_NOT_AUTHENTICATED => 37029

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ENDPOINT_REDIRECTED => 37030

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_AUTHENTICATION_PENDING => 37031

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NOT_AUTHORIZED => 37032

    /**
     * @type {Integer (Int32)}
     */
    static ER_PACKET_BUS_NO_SUCH_CHANNEL => 37033

    /**
     * @type {Integer (Int32)}
     */
    static ER_PACKET_BAD_FORMAT => 37034

    /**
     * @type {Integer (Int32)}
     */
    static ER_PACKET_CONNECT_TIMEOUT => 37035

    /**
     * @type {Integer (Int32)}
     */
    static ER_PACKET_CHANNEL_FAIL => 37036

    /**
     * @type {Integer (Int32)}
     */
    static ER_PACKET_TOO_LARGE => 37037

    /**
     * @type {Integer (Int32)}
     */
    static ER_PACKET_BAD_PARAMETER => 37038

    /**
     * @type {Integer (Int32)}
     */
    static ER_PACKET_BAD_CRC => 37039

    /**
     * @type {Integer (Int32)}
     */
    static ER_RENDEZVOUS_SERVER_DEACTIVATED_USER => 37067

    /**
     * @type {Integer (Int32)}
     */
    static ER_RENDEZVOUS_SERVER_UNKNOWN_USER => 37068

    /**
     * @type {Integer (Int32)}
     */
    static ER_UNABLE_TO_CONNECT_TO_RENDEZVOUS_SERVER => 37069

    /**
     * @type {Integer (Int32)}
     */
    static ER_NOT_CONNECTED_TO_RENDEZVOUS_SERVER => 37070

    /**
     * @type {Integer (Int32)}
     */
    static ER_UNABLE_TO_SEND_MESSAGE_TO_RENDEZVOUS_SERVER => 37071

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_RENDEZVOUS_SERVER_INTERFACE_MESSAGE => 37072

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_PERSISTENT_CONNECTION_MESSAGE_RESPONSE => 37073

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_ON_DEMAND_CONNECTION_MESSAGE_RESPONSE => 37074

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_HTTP_METHOD_USED_FOR_RENDEZVOUS_SERVER_INTERFACE_MESSAGE => 37075

    /**
     * @type {Integer (Int32)}
     */
    static ER_RENDEZVOUS_SERVER_ERR500_INTERNAL_ERROR => 37076

    /**
     * @type {Integer (Int32)}
     */
    static ER_RENDEZVOUS_SERVER_ERR503_STATUS_UNAVAILABLE => 37077

    /**
     * @type {Integer (Int32)}
     */
    static ER_RENDEZVOUS_SERVER_ERR401_UNAUTHORIZED_REQUEST => 37078

    /**
     * @type {Integer (Int32)}
     */
    static ER_RENDEZVOUS_SERVER_UNRECOVERABLE_ERROR => 37079

    /**
     * @type {Integer (Int32)}
     */
    static ER_RENDEZVOUS_SERVER_ROOT_CERTIFICATE_UNINITIALIZED => 37080

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_SUCH_ANNOTATION => 37081

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_ANNOTATION_ALREADY_EXISTS => 37082

    /**
     * @type {Integer (Int32)}
     */
    static ER_SOCK_CLOSING => 37083

    /**
     * @type {Integer (Int32)}
     */
    static ER_NO_SUCH_DEVICE => 37084

    /**
     * @type {Integer (Int32)}
     */
    static ER_P2P => 37085

    /**
     * @type {Integer (Int32)}
     */
    static ER_P2P_TIMEOUT => 37086

    /**
     * @type {Integer (Int32)}
     */
    static ER_P2P_NOT_CONNECTED => 37087

    /**
     * @type {Integer (Int32)}
     */
    static ER_BAD_TRANSPORT_MASK => 37088

    /**
     * @type {Integer (Int32)}
     */
    static ER_PROXIMITY_CONNECTION_ESTABLISH_FAIL => 37089

    /**
     * @type {Integer (Int32)}
     */
    static ER_PROXIMITY_NO_PEERS_FOUND => 37090

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_OBJECT_NOT_REGISTERED => 37091

    /**
     * @type {Integer (Int32)}
     */
    static ER_P2P_DISABLED => 37092

    /**
     * @type {Integer (Int32)}
     */
    static ER_P2P_BUSY => 37093

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_INCOMPATIBLE_DAEMON => 37094

    /**
     * @type {Integer (Int32)}
     */
    static ER_P2P_NO_GO => 37095

    /**
     * @type {Integer (Int32)}
     */
    static ER_P2P_NO_STA => 37096

    /**
     * @type {Integer (Int32)}
     */
    static ER_P2P_FORBIDDEN => 37097

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_ONAPPSUSPEND_REPLY_FAILED => 37098

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_ONAPPSUSPEND_REPLY_UNSUPPORTED => 37099

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_ONAPPRESUME_REPLY_FAILED => 37100

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_ONAPPRESUME_REPLY_UNSUPPORTED => 37101

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_NO_SUCH_MESSAGE => 37102

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_NO_SESSION => 37103

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_BINDER => 37104

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_MULTIPOINT => 37105

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_FOUND => 37106

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_REMOVESESSIONMEMBER_INCOMPATIBLE_REMOTE_DAEMON => 37107

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_FAILED => 37108

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_REMOVED_BY_BINDER => 37109

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_MATCH_RULE_NOT_FOUND => 37110

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_PING_FAILED => 37111

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_PING_REPLY_UNREACHABLE => 37112

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_MSG_TOO_LONG => 37113

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_DEMUX_NO_ENDPOINT => 37114

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_NO_NETWORK => 37115

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_UNEXPECTED_LENGTH => 37116

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_UNEXPECTED_FLOW => 37117

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_DISCONNECT => 37118

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_NOT_IMPLEMENTED => 37119

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_NO_LISTENER => 37120

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_STOPPING => 37121

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_BACKPRESSURE => 37122

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_BACKPRESSURE => 37123

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_INVALID_STATE => 37124

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_TTL_EXPIRED => 37125

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_PERSIST_TIMEOUT => 37126

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_PROBE_TIMEOUT => 37127

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_REMOTE_CONNECTION_RESET => 37128

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_BUSHELLO => 37129

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_MESSAGE => 37130

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_INVALID => 37131

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_UNSUPPORTED => 37132

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_ENDPOINT_STALLED => 37133

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_INVALID_RESPONSE => 37134

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_INVALID_CONNECTION => 37135

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_LOCAL_DISCONNECT => 37136

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_EARLY_EXIT => 37137

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_LOCAL_DISCONNECT_FAIL => 37138

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_DISCONNECTING => 37139

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_PING_REPLY_INCOMPATIBLE_REMOTE_ROUTING_NODE => 37140

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_PING_REPLY_TIMEOUT => 37141

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_PING_REPLY_UNKNOWN_NAME => 37142

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_PING_REPLY_FAILED => 37143

    /**
     * @type {Integer (Int32)}
     */
    static ER_TCP_MAX_UNTRUSTED => 37144

    /**
     * @type {Integer (Int32)}
     */
    static ER_ALLJOYN_PING_REPLY_IN_PROGRESS => 37145

    /**
     * @type {Integer (Int32)}
     */
    static ER_LANGUAGE_NOT_SUPPORTED => 37146

    /**
     * @type {Integer (Int32)}
     */
    static ER_ABOUT_FIELD_ALREADY_SPECIFIED => 37147

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_NOT_DISCONNECTED => 37148

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_ENDPOINT_NOT_STARTED => 37149

    /**
     * @type {Integer (Int32)}
     */
    static ER_UDP_ENDPOINT_REMOVED => 37150

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_VERSION_NOT_SUPPORTED => 37151

    /**
     * @type {Integer (Int32)}
     */
    static ER_CONNECTION_LIMIT_EXCEEDED => 37152

    /**
     * @type {Integer (Int32)}
     */
    static ER_ARDP_WRITE_BLOCKED => 37153

    /**
     * @type {Integer (Int32)}
     */
    static ER_PERMISSION_DENIED => 37154

    /**
     * @type {Integer (Int32)}
     */
    static ER_ABOUT_DEFAULT_LANGUAGE_NOT_SPECIFIED => 37155

    /**
     * @type {Integer (Int32)}
     */
    static ER_ABOUT_SESSIONPORT_NOT_BOUND => 37156

    /**
     * @type {Integer (Int32)}
     */
    static ER_ABOUT_ABOUTDATA_MISSING_REQUIRED_FIELD => 37157

    /**
     * @type {Integer (Int32)}
     */
    static ER_ABOUT_INVALID_ABOUTDATA_LISTENER => 37158

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_PING_GROUP_NOT_FOUND => 37159

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_REMOVED_BY_BINDER_SELF => 37160

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_CONFIG => 37161

    /**
     * @type {Integer (Int32)}
     */
    static ER_ABOUT_INVALID_ABOUTDATA_FIELD_VALUE => 37162

    /**
     * @type {Integer (Int32)}
     */
    static ER_ABOUT_INVALID_ABOUTDATA_FIELD_APPID_SIZE => 37163

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_TRANSPORT_ACCESS_DENIED => 37164

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_CERTIFICATE => 37165

    /**
     * @type {Integer (Int32)}
     */
    static ER_CERTIFICATE_NOT_FOUND => 37166

    /**
     * @type {Integer (Int32)}
     */
    static ER_DUPLICATE_CERTIFICATE => 37167

    /**
     * @type {Integer (Int32)}
     */
    static ER_UNKNOWN_CERTIFICATE => 37168

    /**
     * @type {Integer (Int32)}
     */
    static ER_MISSING_DIGEST_IN_CERTIFICATE => 37169

    /**
     * @type {Integer (Int32)}
     */
    static ER_DIGEST_MISMATCH => 37170

    /**
     * @type {Integer (Int32)}
     */
    static ER_DUPLICATE_KEY => 37171

    /**
     * @type {Integer (Int32)}
     */
    static ER_NO_COMMON_TRUST => 37172

    /**
     * @type {Integer (Int32)}
     */
    static ER_MANIFEST_NOT_FOUND => 37173

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_CERT_CHAIN => 37174

    /**
     * @type {Integer (Int32)}
     */
    static ER_NO_TRUST_ANCHOR => 37175

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_APPLICATION_STATE => 37176

    /**
     * @type {Integer (Int32)}
     */
    static ER_FEATURE_NOT_AVAILABLE => 37177

    /**
     * @type {Integer (Int32)}
     */
    static ER_KEY_STORE_ALREADY_INITIALIZED => 37178

    /**
     * @type {Integer (Int32)}
     */
    static ER_KEY_STORE_ID_NOT_YET_SET => 37179

    /**
     * @type {Integer (Int32)}
     */
    static ER_POLICY_NOT_NEWER => 37180

    /**
     * @type {Integer (Int32)}
     */
    static ER_MANIFEST_REJECTED => 37181

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_CERTIFICATE_USAGE => 37182

    /**
     * @type {Integer (Int32)}
     */
    static ER_INVALID_SIGNAL_EMISSION_TYPE => 37183

    /**
     * @type {Integer (Int32)}
     */
    static ER_APPLICATION_STATE_LISTENER_ALREADY_EXISTS => 37184

    /**
     * @type {Integer (Int32)}
     */
    static ER_APPLICATION_STATE_LISTENER_NO_SUCH_LISTENER => 37185

    /**
     * @type {Integer (Int32)}
     */
    static ER_MANAGEMENT_ALREADY_STARTED => 37186

    /**
     * @type {Integer (Int32)}
     */
    static ER_MANAGEMENT_NOT_STARTED => 37187

    /**
     * @type {Integer (Int32)}
     */
    static ER_BUS_DESCRIPTION_ALREADY_EXISTS => 37188
}
