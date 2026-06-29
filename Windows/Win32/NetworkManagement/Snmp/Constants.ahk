#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global ASN_UNIVERSAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global ASN_APPLICATION := 64

/**
 * @type {Integer (UInt32)}
 */
export global ASN_CONTEXT := 128

/**
 * @type {Integer (UInt32)}
 */
export global ASN_PRIVATE := 192

/**
 * @type {Integer (UInt32)}
 */
export global ASN_PRIMITIVE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ASN_CONSTRUCTOR := 32

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_ACCESS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_ACCESS_NOTIFY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_ACCESS_READ_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_ACCESS_READ_WRITE := 3

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_ACCESS_READ_CREATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_NOERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_OUTPUT_TO_EVENTLOG := 4

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_SNMP_PORT_UDP := 161

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_SNMP_PORT_IPX := 36879

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_SNMPTRAP_PORT_UDP := 162

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_SNMPTRAP_PORT_IPX := 36880

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MAX_OID_LEN := 128

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MEM_ALLOC_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_BERAPI_INVALID_LENGTH := 10

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_BERAPI_INVALID_TAG := 11

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_BERAPI_OVERFLOW := 12

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_BERAPI_SHORT_BUFFER := 13

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_BERAPI_INVALID_OBJELEM := 14

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_PDUAPI_UNRECOGNIZED_PDU := 20

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_PDUAPI_INVALID_ES := 21

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_PDUAPI_INVALID_GT := 22

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_AUTHAPI_INVALID_VERSION := 30

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_AUTHAPI_INVALID_MSG_TYPE := 31

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_AUTHAPI_TRIV_AUTH_FAILED := 32

/**
 * @type {Integer (UInt32)}
 */
export global ASN_CONTEXTSPECIFIC := 128

/**
 * @type {Integer (UInt32)}
 */
export global ASN_PRIMATIVE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MGMTAPI_TIMEOUT := 40

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MGMTAPI_SELECT_FDERRORS := 41

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MGMTAPI_TRAP_ERRORS := 42

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MGMTAPI_TRAP_DUPINIT := 43

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MGMTAPI_NOTRAPS := 44

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MGMTAPI_AGAIN := 45

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MGMTAPI_INVALID_CTL := 46

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MGMTAPI_INVALID_SESSION := 47

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_MGMTAPI_INVALID_BUFFER := 48

/**
 * @type {Integer (UInt32)}
 */
export global MGMCTL_SETAGENTPORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAXOBJIDSIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAXOBJIDSTRSIZE := 1408

/**
 * @type {Integer (UInt32)}
 */
export global SNMPLISTEN_USEENTITY_ADDR := 0

/**
 * @type {Integer (UInt32)}
 */
export global SNMPLISTEN_ALL_ADDR := 1

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_TRAP_COLDSTART := 0

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_TRAP_WARMSTART := 1

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_TRAP_LINKDOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_TRAP_LINKUP := 3

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_TRAP_AUTHFAIL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_TRAP_EGPNEIGHBORLOSS := 5

/**
 * @type {Integer (UInt32)}
 */
export global SNMP_TRAP_ENTERPRISESPECIFIC := 6

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_NO_SUPPORT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_V1_SUPPORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_V2_SUPPORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_M2M_SUPPORT := 3

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_FAILURE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_SUCCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_ALLOC_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_CONTEXT_INVALID := 3

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_CONTEXT_UNKNOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_ENTITY_INVALID := 5

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_ENTITY_UNKNOWN := 6

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_INDEX_INVALID := 7

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_NOOP := 8

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_OID_INVALID := 9

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_OPERATION_INVALID := 10

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_OUTPUT_TRUNCATED := 11

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_PDU_INVALID := 12

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_SESSION_INVALID := 13

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_SYNTAX_INVALID := 14

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_VBL_INVALID := 15

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_MODE_INVALID := 16

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_SIZE_INVALID := 17

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_NOT_INITIALIZED := 18

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_MESSAGE_INVALID := 19

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_HWND_INVALID := 20

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_OTHER_ERROR := 99

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_NOT_INITIALIZED := 100

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_NOT_SUPPORTED := 101

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_NOT_AVAILABLE := 102

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_RESOURCE_ERROR := 103

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_UNDELIVERABLE := 104

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_SRC_INVALID := 105

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_INVALID_PARAM := 106

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_IN_USE := 107

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_TIMEOUT := 108

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_PDU_TOO_BIG := 109

/**
 * @type {Integer (UInt32)}
 */
export global SNMPAPI_TL_OTHER := 199

/**
 * @type {Integer (UInt32)}
 */
export global MAXVENDORINFO := 32
;@endregion Constants
