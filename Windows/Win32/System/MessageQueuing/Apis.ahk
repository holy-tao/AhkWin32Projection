#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MessageQueuing {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PRLT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRGT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PREQ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRNE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_SORTASCEND => 0

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_SORTDESCEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_MOVE_ACCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_ACTION_RECEIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_ACTION_PEEK_CURRENT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_ACTION_PEEK_NEXT => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_PEEK_CURRENT => 1073741840

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_PEEK_NEXT => 1073741841

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_PEEK_PREV => 1073741842

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_PEEK_FIRST => 1073741844

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_PEEK_LAST => 1073741848

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_RECEIVE_CURRENT => 1073741856

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_RECEIVE_NEXT => 1073741857

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_RECEIVE_PREV => 1073741858

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_RECEIVE_FIRST => 1073741860

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_RECEIVE_LAST => 1073741864

    /**
     * @type {Integer (UInt32)}
     */
    static MQ_LOOKUP_RECEIVE_ALLOW_PEEK => 1073742112

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_CLASS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_MSGID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_CORRELATIONID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_PRIORITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_DELIVERY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_ACKNOWLEDGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_JOURNAL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_APPSPECIFIC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_BODY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_BODY_SIZE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_LABEL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_LABEL_LEN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_TIME_TO_REACH_QUEUE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_TIME_TO_BE_RECEIVED => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_RESP_QUEUE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_RESP_QUEUE_LEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_ADMIN_QUEUE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_ADMIN_QUEUE_LEN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_VERSION => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SENDERID => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SENDERID_LEN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SENDERID_TYPE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_PRIV_LEVEL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_AUTH_LEVEL => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_AUTHENTICATED => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_HASH_ALG => 26

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_ENCRYPTION_ALG => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SENDER_CERT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SENDER_CERT_LEN => 29

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SRC_MACHINE_ID => 30

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SENTTIME => 31

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_ARRIVEDTIME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_DEST_QUEUE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_DEST_QUEUE_LEN => 34

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_EXTENSION => 35

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_EXTENSION_LEN => 36

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SECURITY_CONTEXT => 37

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_CONNECTOR_TYPE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_XACT_STATUS_QUEUE => 39

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_XACT_STATUS_QUEUE_LEN => 40

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_TRACE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_BODY_TYPE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_DEST_SYMM_KEY => 43

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_DEST_SYMM_KEY_LEN => 44

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SIGNATURE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SIGNATURE_LEN => 46

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_PROV_TYPE => 47

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_PROV_NAME => 48

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_PROV_NAME_LEN => 49

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_FIRST_IN_XACT => 50

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_LAST_IN_XACT => 51

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_XACTID => 52

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_AUTHENTICATED_EX => 53

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_RESP_FORMAT_NAME => 54

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_RESP_FORMAT_NAME_LEN => 55

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_DEST_FORMAT_NAME => 58

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_DEST_FORMAT_NAME_LEN => 59

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_LOOKUPID => 60

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SOAP_ENVELOPE => 61

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SOAP_ENVELOPE_LEN => 62

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_COMPOUND_MESSAGE => 63

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_COMPOUND_MESSAGE_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SOAP_HEADER => 65

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_SOAP_BODY => 66

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_DEADLETTER_QUEUE => 67

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_DEADLETTER_QUEUE_LEN => 68

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_ABORT_COUNT => 69

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_MOVE_COUNT => 70

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_LAST_MOVE_TIME => 75

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_MSGID_SIZE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_CORRELATIONID_SIZE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_M_XACTID_SIZE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MQMSG_PRIV_LEVEL_BODY_AES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MQMSG_AUTHENTICATED_QM_MESSAGE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MQMSG_NOT_FIRST_IN_XACT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MQMSG_FIRST_IN_XACT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MQMSG_NOT_LAST_IN_XACT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MQMSG_LAST_IN_XACT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_BASE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_INSTANCE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_TYPE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_PATHNAME => 103

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_JOURNAL => 104

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_QUOTA => 105

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_BASEPRIORITY => 106

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_JOURNAL_QUOTA => 107

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_LABEL => 108

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_CREATE_TIME => 109

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_MODIFY_TIME => 110

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_AUTHENTICATE => 111

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_PRIV_LEVEL => 112

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_TRANSACTION => 113

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_PATHNAME_DNS => 124

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_MULTICAST_ADDRESS => 125

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_Q_ADS_PATH => 126

    /**
     * @type {String}
     */
    static MQ_QTYPE_REPORT => "{55ee8f32-cce9-11cf-b108-0020afd61ce9}"

    /**
     * @type {String}
     */
    static MQ_QTYPE_TEST => "{55ee8f33-cce9-11cf-b108-0020afd61ce9}"

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_BASE => 200

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_SITE_ID => 201

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_MACHINE_ID => 202

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_PATHNAME => 203

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_CONNECTION => 204

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_ENCRYPTION_PK => 205

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_ENCRYPTION_PK_BASE => 231

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_ENCRYPTION_PK_ENHANCED => 232

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_PATHNAME_DNS => 233

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QM_ENCRYPTION_PK_AES => 244

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_PC_BASE => 5800

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_PC_VERSION => 5801

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_PC_DS_ENABLED => 5802

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_MSMQ_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_MSMQ_ACTIVEQUEUES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_MSMQ_PRIVATEQ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_MSMQ_DSSERVER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_MSMQ_CONNECTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_MSMQ_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_MSMQ_BYTES_IN_ALL_QUEUES => 6

    /**
     * @type {String}
     */
    static MSMQ_CONNECTED => "CONNECTED"

    /**
     * @type {String}
     */
    static MSMQ_DISCONNECTED => "DISCONNECTED"

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_PATHNAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_FORMATNAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_TYPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_LOCATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_XACT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_FOREIGN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_MESSAGE_COUNT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_BYTES_IN_QUEUE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_JOURNAL_MESSAGE_COUNT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_BYTES_IN_JOURNAL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_STATE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_NEXTHOPS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_LAST_ACK => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_LAST_ACK_TIME => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_LAST_ACK_COUNT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_FIRST_NON_ACK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_LAST_NON_ACK => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_NEXT_SEQ => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_NO_READ_COUNT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_NO_ACK_COUNT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_RESEND_TIME => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_RESEND_INTERVAL => 22

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_RESEND_COUNT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_EOD_SOURCE_INFO => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_CONNECTION_HISTORY => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_SUBQUEUE_COUNT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_SUBQUEUE_NAMES => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_USED_QUOTA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_MGMT_QUEUE_JOURNAL_USED_QUOTA => 10

    /**
     * @type {String}
     */
    static MGMT_QUEUE_TYPE_PUBLIC => "PUBLIC"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_TYPE_PRIVATE => "PRIVATE"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_TYPE_MACHINE => "MACHINE"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_TYPE_CONNECTOR => "CONNECTOR"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_TYPE_MULTICAST => "MULTICAST"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_STATE_LOCAL => "LOCAL CONNECTION"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_STATE_NONACTIVE => "INACTIVE"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_STATE_WAITING => "WAITING"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_STATE_NEED_VALIDATE => "NEED VALIDATION"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_STATE_ONHOLD => "ONHOLD"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_STATE_CONNECTED => "CONNECTED"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_STATE_DISCONNECTING => "DISCONNECTING"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_STATE_DISCONNECTED => "DISCONNECTED"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_STATE_LOCKED => "LOCKED"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_LOCAL_LOCATION => "LOCAL"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_REMOTE_LOCATION => "REMOTE"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_UNKNOWN_TYPE => "UNKNOWN"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_CORRECT_TYPE => "YES"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_INCORRECT_TYPE => "NO"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_TRANSACTIONAL_TYPE => "YES"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_NOT_TRANSACTIONAL_TYPE => "NO"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_FOREIGN_TYPE => "YES"

    /**
     * @type {String}
     */
    static MGMT_QUEUE_NOT_FOREIGN_TYPE => "NO"

    /**
     * @type {String}
     */
    static MO_MACHINE_TOKEN => "MACHINE"

    /**
     * @type {String}
     */
    static MO_QUEUE_TOKEN => "QUEUE"

    /**
     * @type {String}
     */
    static MACHINE_ACTION_CONNECT => "CONNECT"

    /**
     * @type {String}
     */
    static MACHINE_ACTION_DISCONNECT => "DISCONNECT"

    /**
     * @type {String}
     */
    static MACHINE_ACTION_TIDY => "TIDY"

    /**
     * @type {String}
     */
    static QUEUE_ACTION_PAUSE => "PAUSE"

    /**
     * @type {String}
     */
    static QUEUE_ACTION_RESUME => "RESUME"

    /**
     * @type {String}
     */
    static QUEUE_ACTION_EOD_RESEND => "EOD_RESEND"

    /**
     * @type {Integer (UInt32)}
     */
    static LONG_LIVED => 4294967294

    /**
     * @type {Integer (Int32)}
     */
    static MQ_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_RESOLVE_ADDRESS => -1072824167

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_TOO_MANY_PROPERTIES => -1072824166

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MESSAGE_NOT_AUTHENTICATED => -1072824165

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MESSAGE_LOCKED_UNDER_TRANSACTION => -1072824164
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @param {Pointer<MQQUEUEPROPS>} pQueueProps 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Pointer<UInt32>} lpdwFormatNameLength 
     * @returns {HRESULT} 
     */
    static MQCreateQueue(pSecurityDescriptor, pQueueProps, lpwcsFormatName, lpdwFormatNameLength) {
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("mqrt.dll\MQCreateQueue", "ptr", pSecurityDescriptor, "ptr", pQueueProps, "ptr", lpwcsFormatName, "uint*", lpdwFormatNameLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsFormatName 
     * @returns {HRESULT} 
     */
    static MQDeleteQueue(lpwcsFormatName) {
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

        result := DllCall("mqrt.dll\MQDeleteQueue", "ptr", lpwcsFormatName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsContext 
     * @param {Pointer<MQRESTRICTION>} pRestriction 
     * @param {Pointer<MQCOLUMNSET>} pColumns 
     * @param {Pointer<MQSORTSET>} pSort 
     * @param {Pointer<HANDLE>} phEnum 
     * @returns {HRESULT} 
     */
    static MQLocateBegin(lpwcsContext, pRestriction, pColumns, pSort, phEnum) {
        lpwcsContext := lpwcsContext is String ? StrPtr(lpwcsContext) : lpwcsContext

        result := DllCall("mqrt.dll\MQLocateBegin", "ptr", lpwcsContext, "ptr", pRestriction, "ptr", pColumns, "ptr", pSort, "ptr", phEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hEnum 
     * @param {Pointer<UInt32>} pcProps 
     * @param {Pointer<PROPVARIANT>} aPropVar 
     * @returns {HRESULT} 
     */
    static MQLocateNext(hEnum, pcProps, aPropVar) {
        hEnum := hEnum is Win32Handle ? NumGet(hEnum, "ptr") : hEnum

        result := DllCall("mqrt.dll\MQLocateNext", "ptr", hEnum, "uint*", pcProps, "ptr", aPropVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hEnum 
     * @returns {HRESULT} 
     */
    static MQLocateEnd(hEnum) {
        hEnum := hEnum is Win32Handle ? NumGet(hEnum, "ptr") : hEnum

        result := DllCall("mqrt.dll\MQLocateEnd", "ptr", hEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Integer} dwAccess 
     * @param {Integer} dwShareMode 
     * @param {Pointer<IntPtr>} phQueue 
     * @returns {HRESULT} 
     */
    static MQOpenQueue(lpwcsFormatName, dwAccess, dwShareMode, phQueue) {
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

        result := DllCall("mqrt.dll\MQOpenQueue", "ptr", lpwcsFormatName, "uint", dwAccess, "uint", dwShareMode, "ptr*", phQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hDestinationQueue 
     * @param {Pointer<MQMSGPROPS>} pMessageProps 
     * @param {Pointer<ITransaction>} pTransaction 
     * @returns {HRESULT} 
     */
    static MQSendMessage(hDestinationQueue, pMessageProps, pTransaction) {
        result := DllCall("mqrt.dll\MQSendMessage", "ptr", hDestinationQueue, "ptr", pMessageProps, "ptr", pTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hSource 
     * @param {Integer} dwTimeout 
     * @param {Integer} dwAction 
     * @param {Pointer<MQMSGPROPS>} pMessageProps 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Pointer<PMQRECEIVECALLBACK>} fnReceiveCallback 
     * @param {HANDLE} hCursor 
     * @param {Pointer<ITransaction>} pTransaction 
     * @returns {HRESULT} 
     */
    static MQReceiveMessage(hSource, dwTimeout, dwAction, pMessageProps, lpOverlapped, fnReceiveCallback, hCursor, pTransaction) {
        hCursor := hCursor is Win32Handle ? NumGet(hCursor, "ptr") : hCursor

        result := DllCall("mqrt.dll\MQReceiveMessage", "ptr", hSource, "uint", dwTimeout, "uint", dwAction, "ptr", pMessageProps, "ptr", lpOverlapped, "ptr", fnReceiveCallback, "ptr", hCursor, "ptr", pTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hSource 
     * @param {Integer} ullLookupId 
     * @param {Integer} dwLookupAction 
     * @param {Pointer<MQMSGPROPS>} pMessageProps 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Pointer<PMQRECEIVECALLBACK>} fnReceiveCallback 
     * @param {Pointer<ITransaction>} pTransaction 
     * @returns {HRESULT} 
     */
    static MQReceiveMessageByLookupId(hSource, ullLookupId, dwLookupAction, pMessageProps, lpOverlapped, fnReceiveCallback, pTransaction) {
        result := DllCall("mqrt.dll\MQReceiveMessageByLookupId", "ptr", hSource, "uint", ullLookupId, "uint", dwLookupAction, "ptr", pMessageProps, "ptr", lpOverlapped, "ptr", fnReceiveCallback, "ptr", pTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hQueue 
     * @param {Pointer<HANDLE>} phCursor 
     * @returns {HRESULT} 
     */
    static MQCreateCursor(hQueue, phCursor) {
        result := DllCall("mqrt.dll\MQCreateCursor", "ptr", hQueue, "ptr", phCursor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hCursor 
     * @returns {HRESULT} 
     */
    static MQCloseCursor(hCursor) {
        hCursor := hCursor is Win32Handle ? NumGet(hCursor, "ptr") : hCursor

        result := DllCall("mqrt.dll\MQCloseCursor", "ptr", hCursor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hQueue 
     * @returns {HRESULT} 
     */
    static MQCloseQueue(hQueue) {
        result := DllCall("mqrt.dll\MQCloseQueue", "ptr", hQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Pointer<MQQUEUEPROPS>} pQueueProps 
     * @returns {HRESULT} 
     */
    static MQSetQueueProperties(lpwcsFormatName, pQueueProps) {
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

        result := DllCall("mqrt.dll\MQSetQueueProperties", "ptr", lpwcsFormatName, "ptr", pQueueProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Pointer<MQQUEUEPROPS>} pQueueProps 
     * @returns {HRESULT} 
     */
    static MQGetQueueProperties(lpwcsFormatName, pQueueProps) {
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

        result := DllCall("mqrt.dll\MQGetQueueProperties", "ptr", lpwcsFormatName, "ptr", pQueueProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Integer} RequestedInformation 
     * @param {Pointer} pSecurityDescriptor 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpnLengthNeeded 
     * @returns {HRESULT} 
     */
    static MQGetQueueSecurity(lpwcsFormatName, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded) {
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

        result := DllCall("mqrt.dll\MQGetQueueSecurity", "ptr", lpwcsFormatName, "uint", RequestedInformation, "ptr", pSecurityDescriptor, "uint", nLength, "uint*", lpnLengthNeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @returns {HRESULT} 
     */
    static MQSetQueueSecurity(lpwcsFormatName, SecurityInformation, pSecurityDescriptor) {
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("mqrt.dll\MQSetQueueSecurity", "ptr", lpwcsFormatName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsPathName 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Pointer<UInt32>} lpdwFormatNameLength 
     * @returns {HRESULT} 
     */
    static MQPathNameToFormatName(lpwcsPathName, lpwcsFormatName, lpdwFormatNameLength) {
        lpwcsPathName := lpwcsPathName is String ? StrPtr(lpwcsPathName) : lpwcsPathName
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

        result := DllCall("mqrt.dll\MQPathNameToFormatName", "ptr", lpwcsPathName, "ptr", lpwcsFormatName, "uint*", lpdwFormatNameLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hQueue 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Pointer<UInt32>} lpdwFormatNameLength 
     * @returns {HRESULT} 
     */
    static MQHandleToFormatName(hQueue, lpwcsFormatName, lpdwFormatNameLength) {
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

        result := DllCall("mqrt.dll\MQHandleToFormatName", "ptr", hQueue, "ptr", lpwcsFormatName, "uint*", lpdwFormatNameLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Pointer<UInt32>} lpdwFormatNameLength 
     * @returns {HRESULT} 
     */
    static MQInstanceToFormatName(pGuid, lpwcsFormatName, lpdwFormatNameLength) {
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

        result := DllCall("mqrt.dll\MQInstanceToFormatName", "ptr", pGuid, "ptr", lpwcsFormatName, "uint*", lpdwFormatNameLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsADsPath 
     * @param {PWSTR} lpwcsFormatName 
     * @param {Pointer<UInt32>} lpdwFormatNameLength 
     * @returns {HRESULT} 
     */
    static MQADsPathToFormatName(lpwcsADsPath, lpwcsFormatName, lpdwFormatNameLength) {
        lpwcsADsPath := lpwcsADsPath is String ? StrPtr(lpwcsADsPath) : lpwcsADsPath
        lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

        result := DllCall("mqrt.dll\MQADsPathToFormatName", "ptr", lpwcsADsPath, "ptr", lpwcsFormatName, "uint*", lpdwFormatNameLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMemory 
     * @returns {String} Nothing - always returns an empty string
     */
    static MQFreeMemory(pvMemory) {
        DllCall("mqrt.dll\MQFreeMemory", "ptr", pvMemory)
    }

    /**
     * 
     * @param {PWSTR} lpwcsMachineName 
     * @param {Pointer<Guid>} pguidMachineId 
     * @param {Pointer<MQQMPROPS>} pQMProps 
     * @returns {HRESULT} 
     */
    static MQGetMachineProperties(lpwcsMachineName, pguidMachineId, pQMProps) {
        lpwcsMachineName := lpwcsMachineName is String ? StrPtr(lpwcsMachineName) : lpwcsMachineName

        result := DllCall("mqrt.dll\MQGetMachineProperties", "ptr", lpwcsMachineName, "ptr", pguidMachineId, "ptr", pQMProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} lpCertBuffer 
     * @param {Integer} dwCertBufferLength 
     * @param {Pointer<HANDLE>} phSecurityContext 
     * @returns {HRESULT} 
     */
    static MQGetSecurityContext(lpCertBuffer, dwCertBufferLength, phSecurityContext) {
        result := DllCall("mqrt.dll\MQGetSecurityContext", "ptr", lpCertBuffer, "uint", dwCertBufferLength, "ptr", phSecurityContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} lpCertBuffer 
     * @param {Integer} dwCertBufferLength 
     * @param {Pointer<HANDLE>} phSecurityContext 
     * @returns {HRESULT} 
     */
    static MQGetSecurityContextEx(lpCertBuffer, dwCertBufferLength, phSecurityContext) {
        result := DllCall("mqrt.dll\MQGetSecurityContextEx", "ptr", lpCertBuffer, "uint", dwCertBufferLength, "ptr", phSecurityContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hSecurityContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static MQFreeSecurityContext(hSecurityContext) {
        hSecurityContext := hSecurityContext is Win32Handle ? NumGet(hSecurityContext, "ptr") : hSecurityContext

        DllCall("mqrt.dll\MQFreeSecurityContext", "ptr", hSecurityContext)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} lpCertBuffer 
     * @param {Integer} dwCertBufferLength 
     * @returns {HRESULT} 
     */
    static MQRegisterCertificate(dwFlags, lpCertBuffer, dwCertBufferLength) {
        result := DllCall("mqrt.dll\MQRegisterCertificate", "uint", dwFlags, "ptr", lpCertBuffer, "uint", dwCertBufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITransaction>} ppTransaction 
     * @returns {HRESULT} 
     */
    static MQBeginTransaction(ppTransaction) {
        result := DllCall("mqrt.dll\MQBeginTransaction", "ptr", ppTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    static MQGetOverlappedResult(lpOverlapped) {
        result := DllCall("mqrt.dll\MQGetOverlappedResult", "ptr", lpOverlapped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwcsComputerName 
     * @param {Pointer<MQPRIVATEPROPS>} pPrivateProps 
     * @returns {HRESULT} 
     */
    static MQGetPrivateComputerInformation(lpwcsComputerName, pPrivateProps) {
        lpwcsComputerName := lpwcsComputerName is String ? StrPtr(lpwcsComputerName) : lpwcsComputerName

        result := DllCall("mqrt.dll\MQGetPrivateComputerInformation", "ptr", lpwcsComputerName, "ptr", pPrivateProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hQueue 
     * @returns {HRESULT} 
     */
    static MQPurgeQueue(hQueue) {
        result := DllCall("mqrt.dll\MQPurgeQueue", "ptr", hQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pComputerName 
     * @param {PWSTR} pObjectName 
     * @param {Pointer<MQMGMTPROPS>} pMgmtProps 
     * @returns {HRESULT} 
     */
    static MQMgmtGetInfo(pComputerName, pObjectName, pMgmtProps) {
        pComputerName := pComputerName is String ? StrPtr(pComputerName) : pComputerName
        pObjectName := pObjectName is String ? StrPtr(pObjectName) : pObjectName

        result := DllCall("mqrt.dll\MQMgmtGetInfo", "ptr", pComputerName, "ptr", pObjectName, "ptr", pMgmtProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pComputerName 
     * @param {PWSTR} pObjectName 
     * @param {PWSTR} pAction 
     * @returns {HRESULT} 
     */
    static MQMgmtAction(pComputerName, pObjectName, pAction) {
        pComputerName := pComputerName is String ? StrPtr(pComputerName) : pComputerName
        pObjectName := pObjectName is String ? StrPtr(pObjectName) : pObjectName
        pAction := pAction is String ? StrPtr(pAction) : pAction

        result := DllCall("mqrt.dll\MQMgmtAction", "ptr", pComputerName, "ptr", pObjectName, "ptr", pAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hQueue 
     * @param {Integer} ullLookupId 
     * @returns {HRESULT} 
     */
    static MQMarkMessageRejected(hQueue, ullLookupId) {
        hQueue := hQueue is Win32Handle ? NumGet(hQueue, "ptr") : hQueue

        result := DllCall("mqrt.dll\MQMarkMessageRejected", "ptr", hQueue, "uint", ullLookupId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hSourceQueue 
     * @param {Pointer} hDestinationQueue 
     * @param {Integer} ullLookupId 
     * @param {Pointer<ITransaction>} pTransaction 
     * @returns {HRESULT} 
     */
    static MQMoveMessage(hSourceQueue, hDestinationQueue, ullLookupId, pTransaction) {
        result := DllCall("mqrt.dll\MQMoveMessage", "ptr", hSourceQueue, "ptr", hDestinationQueue, "uint", ullLookupId, "ptr", pTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
