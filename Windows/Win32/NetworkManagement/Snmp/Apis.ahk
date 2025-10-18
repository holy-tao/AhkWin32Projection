#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class Snmp {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static ASN_UNIVERSAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ASN_APPLICATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ASN_CONTEXT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ASN_PRIVATE => 192

    /**
     * @type {Integer (UInt32)}
     */
    static ASN_PRIMITIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ASN_CONSTRUCTOR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ACCESS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ACCESS_NOTIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ACCESS_READ_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ACCESS_READ_WRITE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ACCESS_READ_CREATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_NOERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_OUTPUT_TO_EVENTLOG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEFAULT_SNMP_PORT_UDP => 161

    /**
     * @type {Integer (UInt32)}
     */
    static DEFAULT_SNMP_PORT_IPX => 36879

    /**
     * @type {Integer (UInt32)}
     */
    static DEFAULT_SNMPTRAP_PORT_UDP => 162

    /**
     * @type {Integer (UInt32)}
     */
    static DEFAULT_SNMPTRAP_PORT_IPX => 36880

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MAX_OID_LEN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MEM_ALLOC_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_BERAPI_INVALID_LENGTH => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_BERAPI_INVALID_TAG => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_BERAPI_OVERFLOW => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_BERAPI_SHORT_BUFFER => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_BERAPI_INVALID_OBJELEM => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDUAPI_UNRECOGNIZED_PDU => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDUAPI_INVALID_ES => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDUAPI_INVALID_GT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_AUTHAPI_INVALID_VERSION => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_AUTHAPI_INVALID_MSG_TYPE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_AUTHAPI_TRIV_AUTH_FAILED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ASN_CONTEXTSPECIFIC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ASN_PRIMATIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MGMTAPI_TIMEOUT => 40

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MGMTAPI_SELECT_FDERRORS => 41

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MGMTAPI_TRAP_ERRORS => 42

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MGMTAPI_TRAP_DUPINIT => 43

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MGMTAPI_NOTRAPS => 44

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MGMTAPI_AGAIN => 45

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MGMTAPI_INVALID_CTL => 46

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MGMTAPI_INVALID_SESSION => 47

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_MGMTAPI_INVALID_BUFFER => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MGMCTL_SETAGENTPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAXOBJIDSIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAXOBJIDSTRSIZE => 1408

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPLISTEN_USEENTITY_ADDR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPLISTEN_ALL_ADDR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_TRAP_COLDSTART => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_TRAP_WARMSTART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_TRAP_LINKDOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_TRAP_LINKUP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_TRAP_AUTHFAIL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_TRAP_EGPNEIGHBORLOSS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_TRAP_ENTERPRISESPECIFIC => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_NO_SUPPORT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_V1_SUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_V2_SUPPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_M2M_SUPPORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_FAILURE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_ALLOC_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_CONTEXT_INVALID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_CONTEXT_UNKNOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_ENTITY_INVALID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_ENTITY_UNKNOWN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_INDEX_INVALID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_NOOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_OID_INVALID => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_OPERATION_INVALID => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_OUTPUT_TRUNCATED => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_PDU_INVALID => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_SESSION_INVALID => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_SYNTAX_INVALID => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_VBL_INVALID => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_MODE_INVALID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_SIZE_INVALID => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_NOT_INITIALIZED => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_MESSAGE_INVALID => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_HWND_INVALID => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_OTHER_ERROR => 99

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_NOT_INITIALIZED => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_NOT_SUPPORTED => 101

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_NOT_AVAILABLE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_RESOURCE_ERROR => 103

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_UNDELIVERABLE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_SRC_INVALID => 105

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_INVALID_PARAM => 106

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_IN_USE => 107

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_TIMEOUT => 108

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_PDU_TOO_BIG => 109

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TL_OTHER => 199

    /**
     * @type {Integer (UInt32)}
     */
    static MAXVENDORINFO => 32
;@endregion Constants

;@region Methods
    /**
     * The SnmpUtilOidCpy function copies the variable pointed to by the pOidSrc parameter to the pOidDst parameter, allocating any necessary memory for the destination's copy. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnObjectIdentifier>} pOidDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to receive the copy.
     * @param {Pointer<AsnObjectIdentifier>} pOidSrc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloidcpy
     * @since windows5.0
     */
    static SnmpUtilOidCpy(pOidDst, pOidSrc) {
        result := DllCall("snmpapi.dll\SnmpUtilOidCpy", "ptr", pOidDst, "ptr", pOidSrc, "int")
        return result
    }

    /**
     * The SnmpUtilOidAppend function appends the source object identifier to the destination object identifier. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnObjectIdentifier>} pOidDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to receive the source structure.
     * @param {Pointer<AsnObjectIdentifier>} pOidSrc Pointer to an 
     * <b>AsnObjectIdentifier</b> structure to append.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. This function does not generate Windows Sockets errors. The application should call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> may return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_BERAPI_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an overflow condition
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MEM_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a memory allocation error
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloidappend
     * @since windows5.0
     */
    static SnmpUtilOidAppend(pOidDst, pOidSrc) {
        A_LastError := 0

        result := DllCall("snmpapi.dll\SnmpUtilOidAppend", "ptr", pOidDst, "ptr", pOidSrc, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SnmpUtilOidNCmp function compares two object identifiers.
     * @param {Pointer<AsnObjectIdentifier>} pOid1 Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to compare.
     * @param {Pointer<AsnObjectIdentifier>} pOid2 Pointer to a second 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to compare.
     * @param {Integer} nSubIds Specifies the number of subidentifiers to compare.
     * @returns {Integer} The function returns a value greater than zero if <i>pOid1</i> is greater than <i>pOid2</i>, zero if <i>pOid1</i> equals <i>pOid2</i>, and less than zero if <i>pOid1</i> is less than <i>pOid2</i>.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloidncmp
     * @since windows5.0
     */
    static SnmpUtilOidNCmp(pOid1, pOid2, nSubIds) {
        result := DllCall("snmpapi.dll\SnmpUtilOidNCmp", "ptr", pOid1, "ptr", pOid2, "uint", nSubIds, "int")
        return result
    }

    /**
     * The SnmpUtilOidCmp function compares two object identifiers. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnObjectIdentifier>} pOid1 Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to compare.
     * @param {Pointer<AsnObjectIdentifier>} pOid2 Pointer to a second 
     * <b>AsnObjectIdentifier</b> structure to compare.
     * @returns {Integer} The function returns a value greater than zero if <i>pOid1</i> is greater than <i>pOid2</i>, zero if <i>pOid1</i> equals <i>pOid2</i>, and less than zero if <i>pOid1</i> is less than <i>pOid2</i>.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloidcmp
     * @since windows5.0
     */
    static SnmpUtilOidCmp(pOid1, pOid2) {
        result := DllCall("snmpapi.dll\SnmpUtilOidCmp", "ptr", pOid1, "ptr", pOid2, "int")
        return result
    }

    /**
     * The SnmpUtilOidFree function frees the memory allocated for the specified object identifier. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnObjectIdentifier>} pOid Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure whose memory should be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloidfree
     * @since windows5.0
     */
    static SnmpUtilOidFree(pOid) {
        DllCall("snmpapi.dll\SnmpUtilOidFree", "ptr", pOid)
    }

    /**
     * The SnmpUtilOctetsCmp function compares two octet strings. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnOctetString>} pOctets1 Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnoctetstring">AsnOctetString</a> structure to compare.
     * @param {Pointer<AsnOctetString>} pOctets2 Pointer to a second 
     * <b>AsnOctetString</b> structure to compare.
     * @returns {Integer} The function returns a value greater than zero if <i>pOctets1</i> is greater than <i>pOctets2</i>, zero if <i>pOctets1</i> equals <i>pOctets2</i>, and less than zero if <i>pOctets1</i> is less than <i>pOctets2</i>.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloctetscmp
     * @since windows5.0
     */
    static SnmpUtilOctetsCmp(pOctets1, pOctets2) {
        result := DllCall("snmpapi.dll\SnmpUtilOctetsCmp", "ptr", pOctets1, "ptr", pOctets2, "int")
        return result
    }

    /**
     * The SnmpUtilOctetsNCmp function compares two octet strings. The function compares the subidentifiers in the strings until it reaches the number of subidentifiers specified by the nChars parameter. SnmpUtilOctetsNCmp is an element of the SNMP Utility API.
     * @param {Pointer<AsnOctetString>} pOctets1 Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnoctetstring">AsnOctetString</a> structure to compare.
     * @param {Pointer<AsnOctetString>} pOctets2 Pointer to a second 
     * <b>AsnOctetString</b> structure to compare.
     * @param {Integer} nChars Specifies the number of subidentifiers to compare.
     * @returns {Integer} The function returns a value greater than zero if <i>pOctets1</i> is greater than <i>pOctets2</i>, zero if <i>pOctets1</i> equals <i>pOctets2</i>, and less than zero if <i>pOctets1</i> is less than <i>pOctets2</i>.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloctetsncmp
     * @since windows5.0
     */
    static SnmpUtilOctetsNCmp(pOctets1, pOctets2, nChars) {
        result := DllCall("snmpapi.dll\SnmpUtilOctetsNCmp", "ptr", pOctets1, "ptr", pOctets2, "uint", nChars, "int")
        return result
    }

    /**
     * The SnmpUtilOctetsCpy function copies the variable pointed to by the pOctetsSrc parameter to the variable pointed to by the pOctetsDst parameter.
     * @param {Pointer<AsnOctetString>} pOctetsDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnoctetstring">AsnOctetString</a> structure to receive the copy.
     * @param {Pointer<AsnOctetString>} pOctetsSrc Pointer to an 
     * <b>AsnOctetString</b> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloctetscpy
     * @since windows5.0
     */
    static SnmpUtilOctetsCpy(pOctetsDst, pOctetsSrc) {
        result := DllCall("snmpapi.dll\SnmpUtilOctetsCpy", "ptr", pOctetsDst, "ptr", pOctetsSrc, "int")
        return result
    }

    /**
     * The SnmpUtilOctetsFree function frees the memory allocated for the specified octet string. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnOctetString>} pOctets Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnoctetstring">AsnOctetString</a> structure whose memory should be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloctetsfree
     * @since windows5.0
     */
    static SnmpUtilOctetsFree(pOctets) {
        DllCall("snmpapi.dll\SnmpUtilOctetsFree", "ptr", pOctets)
    }

    /**
     * The SnmpUtilAsnAnyCpy function copies the variable pointed to by the pAnySrc parameter to the pAnyDst parameter. The function allocates any necessary memory for the destination's copy. The SnmpUtilAsnAnyCpy function is an element of the SNMP Utility API.
     * @param {Pointer<AsnAny>} pAnyDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnany">AsnAny</a> structure to receive the copy.
     * @param {Pointer<AsnAny>} pAnySrc Pointer to an 
     * <b>AsnAny</b> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilasnanycpy
     * @since windows5.0
     */
    static SnmpUtilAsnAnyCpy(pAnyDst, pAnySrc) {
        result := DllCall("snmpapi.dll\SnmpUtilAsnAnyCpy", "ptr", pAnyDst, "ptr", pAnySrc, "int")
        return result
    }

    /**
     * The SnmpUtilAsnAnyFree function frees the memory allocated for the specified AsnAny structure. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnAny>} pAny Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnany">AsnAny</a> structure whose memory should be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilasnanyfree
     * @since windows5.0
     */
    static SnmpUtilAsnAnyFree(pAny) {
        DllCall("snmpapi.dll\SnmpUtilAsnAnyFree", "ptr", pAny)
    }

    /**
     * The SnmpUtilVarBindCpy function copies the specified SnmpVarBind structure, and allocates any memory necessary for the destination structure. The SnmpUtilVarBindCpy function is an element of the SNMP Utility API.
     * @param {Pointer<SnmpVarBind>} pVbDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbind">SnmpVarBind</a> structure to receive the copy.
     * @param {Pointer<SnmpVarBind>} pVbSrc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbind">SnmpVarBind</a> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilvarbindcpy
     * @since windows5.0
     */
    static SnmpUtilVarBindCpy(pVbDst, pVbSrc) {
        result := DllCall("snmpapi.dll\SnmpUtilVarBindCpy", "ptr", pVbDst, "ptr", pVbSrc, "int")
        return result
    }

    /**
     * The SnmpUtilVarBindFree function frees the memory allocated for an SnmpVarBind structure. This function is an element of the SNMP Utility API.
     * @param {Pointer<SnmpVarBind>} pVb Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbind">SnmpVarBind</a> structure whose memory should be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilvarbindfree
     * @since windows5.0
     */
    static SnmpUtilVarBindFree(pVb) {
        DllCall("snmpapi.dll\SnmpUtilVarBindFree", "ptr", pVb)
    }

    /**
     * The SnmpUtilVarBindListCpy function copies the specified SnmpVarBindList structure, and allocates any necessary memory for the destination's copy. This function is an element of the SNMP Utility API.
     * @param {Pointer<SnmpVarBindList>} pVblDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbindlist">SnmpVarBindList</a> structure to receive the copy.
     * @param {Pointer<SnmpVarBindList>} pVblSrc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbindlist">SnmpVarBindList</a> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilvarbindlistcpy
     * @since windows5.0
     */
    static SnmpUtilVarBindListCpy(pVblDst, pVblSrc) {
        result := DllCall("snmpapi.dll\SnmpUtilVarBindListCpy", "ptr", pVblDst, "ptr", pVblSrc, "int")
        return result
    }

    /**
     * The SnmpUtilVarBindListFree function frees the memory allocated for an SnmpVarBindList structure. This function is an element of the SNMP Utility API.
     * @param {Pointer<SnmpVarBindList>} pVbl Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbindlist">SnmpVarBindList</a> structure whose allocated memory should be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilvarbindlistfree
     * @since windows5.0
     */
    static SnmpUtilVarBindListFree(pVbl) {
        DllCall("snmpapi.dll\SnmpUtilVarBindListFree", "ptr", pVbl)
    }

    /**
     * The SnmpUtilMemFree function frees the specified memory object. This function is an element of the SNMP Utility API.
     * @param {Pointer<Void>} pMem Pointer to the memory object to release.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilmemfree
     * @since windows5.0
     */
    static SnmpUtilMemFree(pMem) {
        DllCall("snmpapi.dll\SnmpUtilMemFree", "ptr", pMem)
    }

    /**
     * The SnmpUtilMemAlloc function allocates dynamic memory from the process heap. This function is an element of the SNMP Utility API.
     * @param {Integer} nBytes Specifies the number of bytes to allocate for the memory object.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the newly allocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilmemalloc
     * @since windows5.0
     */
    static SnmpUtilMemAlloc(nBytes) {
        result := DllCall("snmpapi.dll\SnmpUtilMemAlloc", "uint", nBytes, "ptr")
        return result
    }

    /**
     * The SnmpUtilMemReAlloc function changes the size of the specified memory object. This function is an element of the SNMP Utility API.
     * @param {Pointer<Void>} pMem Pointer to the memory object to resize.
     * @param {Integer} nBytes Specifies the number of bytes to allocate for the new memory object.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the newly allocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilmemrealloc
     * @since windows5.0
     */
    static SnmpUtilMemReAlloc(pMem, nBytes) {
        result := DllCall("snmpapi.dll\SnmpUtilMemReAlloc", "ptr", pMem, "uint", nBytes, "ptr")
        return result
    }

    /**
     * The SnmpUtilOidToA function converts an object identifier (OID) to a null-terminated string. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnObjectIdentifier>} Oid Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to convert.
     * @returns {PSTR} The function returns a null-terminated string of characters that contains the string representation of the object identifier pointed to by the <i>Oid</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputiloidtoa
     * @since windows5.0
     */
    static SnmpUtilOidToA(Oid) {
        result := DllCall("snmpapi.dll\SnmpUtilOidToA", "ptr", Oid, "char*")
        return result
    }

    /**
     * The SnmpUtilIdsToA function converts an object identifier (OID) to a null-terminated string. This function is an element of the SNMP Utility API.
     * @param {Pointer<UInt32>} Ids Pointer to an array of unsigned integers. The array contains the sequence of numbers that the OID contains. The <i>IdLength</i> parameter specifies the array's length. 
     * 
     * 
     * 
     * 
     * For more information, see the following Return Values and Remarks sections.
     * @param {Integer} IdLength Specifies the number of elements in the array pointed to by the <i>Ids</i> parameter.
     * @returns {PSTR} The function returns a null-terminated string that contains the string representation of the array of numbers pointed to by the <i>Ids</i> parameter. The string contains a sequence of numbers separated by periods ('.'); for example, 1.3.6.1.4.1.311.
     * 
     * If the <i>Ids</i> parameter is null, or if the <i>IdLength</i> parameter specifies zero, the function returns the string "&lt;null oid&gt;".
     * 
     * The maximum length of the returned string is 256 characters. If the string's length exceeds 256 characters, the string is truncated and terminated with a sequence of three periods ('...').
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilidstoa
     * @since windows5.0
     */
    static SnmpUtilIdsToA(Ids, IdLength) {
        result := DllCall("snmpapi.dll\SnmpUtilIdsToA", "uint*", Ids, "uint", IdLength, "char*")
        return result
    }

    /**
     * The SnmpUtilPrintOid function formats the specified object identifier (OID) and prints the result to the standard output device. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnObjectIdentifier>} Oid Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to print.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilprintoid
     * @since windows5.0
     */
    static SnmpUtilPrintOid(Oid) {
        DllCall("snmpapi.dll\SnmpUtilPrintOid", "ptr", Oid)
    }

    /**
     * The SnmpUtilPrintAsnAny function prints the value of the Any parameter to the standard output. This function is an element of the SNMP Utility API.
     * @param {Pointer<AsnAny>} pAny Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnany">AsnAny</a> structure for a value to print.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputilprintasnany
     * @since windows5.0
     */
    static SnmpUtilPrintAsnAny(pAny) {
        DllCall("snmpapi.dll\SnmpUtilPrintAsnAny", "ptr", pAny)
    }

    /**
     * The SnmpSvcGetUptime function retrieves the number of centiseconds that the SNMP service has been running. This function is an element of the SNMP Utility API.
     * @returns {Integer} The function returns a <b>DWORD</b> value that is the number of centiseconds the SNMP service has been running.
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmpsvcgetuptime
     * @since windows5.0
     */
    static SnmpSvcGetUptime() {
        result := DllCall("snmpapi.dll\SnmpSvcGetUptime", "uint")
        return result
    }

    /**
     * The SnmpSvcSetLogLevel function adjusts the level of detail of the debug output from the SNMP service and from SNMP extension agents using the SnmpUtilDbgPrint function. This function is an element of the SNMP Utility API.
     * @param {Integer} nLogLevel Specifies a signed integer variable that indicates the level of detail of the debug output from the
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmpsvcsetloglevel
     * @since windows5.0
     */
    static SnmpSvcSetLogLevel(nLogLevel) {
        DllCall("snmpapi.dll\SnmpSvcSetLogLevel", "int", nLogLevel)
    }

    /**
     * The SnmpSvcSetLogType function adjusts the destination for the debug output from the SNMP service and from SNMP extension agents using the SnmpUtilDbgPrint function. This function is an element of the SNMP Utility API.
     * @param {Integer} nLogType Specifies a signed integer variable that represents the destination for the debug output from the
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmpsvcsetlogtype
     * @since windows5.0
     */
    static SnmpSvcSetLogType(nLogType) {
        DllCall("snmpapi.dll\SnmpSvcSetLogType", "int", nLogType)
    }

    /**
     * The SnmpUtilDbgPrint function enables debugging output from the SNMP service. This function is an element of the SNMP Utility API.
     * @param {Integer} nLogLevel 
     * @param {PSTR} szFormat Pointer to a null-terminated format string that is similar to the standard C library function <b>printf</b> style.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//snmp/nf-snmp-snmputildbgprint
     * @since windows5.0
     */
    static SnmpUtilDbgPrint(nLogLevel, szFormat) {
        szFormat := szFormat is String ? StrPtr(szFormat) : szFormat

        DllCall("snmpapi.dll\SnmpUtilDbgPrint", "int", nLogLevel, "ptr", szFormat, "CDecl ")
    }

    /**
     * The SnmpMgrOpen function initializes communications sockets and data structures, allowing communications with the specified SNMP agent. This function is an element of the SNMP Management API.
     * @param {PSTR} lpAgentAddress Pointer to a <b>null</b>-terminated string that specifies a host name or an IP address. The host name must resolve to an IP address, an IPX address (in 8.12 notation), or an ethernet address. See the Remarks section for the acceptable forms for host names and IP addresses.
     * @param {PSTR} lpAgentCommunity Pointer to a <b>null</b>-terminated string that specifies the SNMP community name to use when communicating with the agent that is identified by the <i>lpAgentAddress</i> parameter.
     * @param {Integer} nTimeOut Specifies the communications time-out in milliseconds.
     * @param {Integer} nRetries Specifies the communications retry count. The time-out that is specified in the <i>nTimeOut</i> parameter is doubled each time that a retry attempt is transmitted.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to an <b>LPSNMP_MGR_SESSION</b> structure. This structure is used internally and the programmer should not alter it. For more information, see the following Remarks section.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return the SNMP_MEM_ALLOC_ERROR error code, which indicates a memory allocation error.
     * 
     * This function may also return Windows Sockets error codes.
     * @see https://docs.microsoft.com/windows/win32/api//mgmtapi/nf-mgmtapi-snmpmgropen
     * @since windows5.0
     */
    static SnmpMgrOpen(lpAgentAddress, lpAgentCommunity, nTimeOut, nRetries) {
        lpAgentAddress := lpAgentAddress is String ? StrPtr(lpAgentAddress) : lpAgentAddress
        lpAgentCommunity := lpAgentCommunity is String ? StrPtr(lpAgentCommunity) : lpAgentCommunity

        A_LastError := 0

        result := DllCall("mgmtapi.dll\SnmpMgrOpen", "ptr", lpAgentAddress, "ptr", lpAgentCommunity, "int", nTimeOut, "int", nRetries, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SnmpMgrCtl function sets an operating parameter associated with an SNMP session. This function is an element of the SNMP Management API.
     * @param {Pointer<Void>} session Pointer to an internal structure that specifies the session to which the control code applies.
     * @param {Integer} dwCtlCode Specifies a value (a control code) that identifies the operation to perform. 
     * 
     * 
     * 
     * 
     * Currently, MGMCTL_SETAGENTPORT is the only supported control code. Setting this code allows an SNMP management application to send requests to a remote agent that is "listening" for SNMP manager requests on an arbitrary port. For more information, see the <i>lpvInBuffer</i> and the <i>cbInBuffer</i> parameter descriptions.
     * @param {Pointer<Void>} lpvInBuffer Pointer to the buffer that contains the input parameters required for the operation. 
     * 
     * 
     * 
     * 
     * When you specify the MGMCTL_SETAGENTPORT control code, this parameter must point to an unsigned integer that specifies the port number on which the remote agent will "listen" for SNMP manager requests. The port number must be in host-byte order.
     * @param {Integer} cbInBuffer Specifies the size, in bytes, of the buffer pointed to by the <i>lpvInBuffer</i> parameter. 
     * 
     * 
     * 
     * 
     * When you specify the MGMCTL_SETAGENTPORT control code, this parameter is equal to sizeof(UINT).
     * @param {Pointer<Void>} lpvOUTBuffer Pointer to the buffer that receives the operation's output data.
     * @param {Integer} cbOUTBuffer Specifies the size, in bytes, of the buffer pointed to by the <i>lpvOutBuffer</i> parameter.
     * @param {Pointer<UInt32>} lpcbBytesReturned Pointer to a variable that receives the actual size, in bytes, of the data stored in the buffer pointed to by the <i>lpvOutBuffer</i> parameter.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> can also return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_INVALID_CTL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwCtlCode</i> parameter does not specify a valid control code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_INVALID_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter does not specify a valid SNMP session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_INVALID_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the <i>lpvInBuffer</i>, <i>lpvOutBuffer</i>, or <i>lpcbBytesRequired</i> parameters are invalid, or the <i>cbInBuffer</i> or <i>cbOutBuffer</i> parameter is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mgmtapi/nf-mgmtapi-snmpmgrctl
     * @since windows5.0
     */
    static SnmpMgrCtl(session, dwCtlCode, lpvInBuffer, cbInBuffer, lpvOUTBuffer, cbOUTBuffer, lpcbBytesReturned) {
        A_LastError := 0

        result := DllCall("mgmtapi.dll\SnmpMgrCtl", "ptr", session, "uint", dwCtlCode, "ptr", lpvInBuffer, "uint", cbInBuffer, "ptr", lpvOUTBuffer, "uint", cbOUTBuffer, "uint*", lpcbBytesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SnmpMgrClose function closes the communications sockets and data structures that are associated with the specified session. This function is an element of the SNMP Management API.
     * @param {Pointer<Void>} session Pointer to an internal structure that specifies the session to close. For more information, see the following Remarks section.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * 
     *  This function may return Windows Sockets error codes.
     * @see https://docs.microsoft.com/windows/win32/api//mgmtapi/nf-mgmtapi-snmpmgrclose
     * @since windows5.0
     */
    static SnmpMgrClose(session) {
        result := DllCall("mgmtapi.dll\SnmpMgrClose", "ptr", session, "int")
        return result
    }

    /**
     * The SnmpMgrRequest function requests the specified operation be performed with the specified agent. This function is an element of the SNMP Management API.
     * @param {Pointer<Void>} session Pointer to an internal structure that specifies the session that will perform the request. 
     * 
     * 
     * 
     * 
     * Applications should not specify the <b>LPSNMP_MGR_SESSION</b> pointer returned by this function in a different thread. You can specify a pointer returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgropen">SnmpMgrOpen</a>, but only if the calls to 
     * <b>SnmpMgrOpen</b> and 
     * <b>SnmpMgrRequest</b> originate in the context of the same thread.
     * @param {Integer} requestType 
     * @param {Pointer<SnmpVarBindList>} variableBindings Pointer to the variable bindings list. 
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbind">SnmpVarBind</a> array pointed to by the <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbindlist">SnmpVarBindList</a> structure must be allocated using the <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemalloc">SnmpUtilMemAlloc</a> function.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} errorStatus 
     * @param {Pointer<Int32>} errorIndex Pointer to a variable in which the error index result will be returned.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request timed-out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_SELECT_FDERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error file descriptors indicated by the Windows Sockets 
     * <a href="/windows/desktop/api/winsock2/nf-winsock2-select">select</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mgmtapi/nf-mgmtapi-snmpmgrrequest
     * @since windows5.0
     */
    static SnmpMgrRequest(session, requestType, variableBindings, errorStatus, errorIndex) {
        A_LastError := 0

        result := DllCall("mgmtapi.dll\SnmpMgrRequest", "ptr", session, "char", requestType, "ptr", variableBindings, "uint*", errorStatus, "int*", errorIndex, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SnmpMgrStrToOid function converts the string format of an object identifier to its internal object identifier structure. This function is an element of the SNMP Management API.
     * @param {PSTR} string Pointer to a null-terminated string to convert.
     * @param {Pointer<AsnObjectIdentifier>} oid Pointer to an object identifier variable to receive the converted value.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//mgmtapi/nf-mgmtapi-snmpmgrstrtooid
     * @since windows5.0
     */
    static SnmpMgrStrToOid(string, oid) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("mgmtapi.dll\SnmpMgrStrToOid", "ptr", string, "ptr", oid, "int")
        return result
    }

    /**
     * The SnmpMgrOidToStr function converts an internal object identifier structure to its string representation. This function is an element of the SNMP Management API.
     * @param {Pointer<AsnObjectIdentifier>} oid Pointer to an object identifier variable to convert.
     * @param {Pointer<PSTR>} string Pointer to a null-terminated string to receive the converted value.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//mgmtapi/nf-mgmtapi-snmpmgroidtostr
     * @since windows5.0
     */
    static SnmpMgrOidToStr(oid, string) {
        result := DllCall("mgmtapi.dll\SnmpMgrOidToStr", "ptr", oid, "ptr", string, "int")
        return result
    }

    /**
     * The SnmpMgrTrapListen function registers the ability of an SNMP manager application to receive SNMP traps from the SNMP Trap Service. This function is an element of the SNMP Management API.
     * @param {Pointer<HANDLE>} phTrapAvailable Pointer to an event handle to receive an indication that there are traps available, and that the application should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrgettrap">SnmpMgrGetTrap</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which may return any of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MEM_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a memory allocation error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_TRAP_DUPINIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that this function has already been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_TRAP_ERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates one or more errors occurred; traps are not accessible. The application can attempt to call the function again.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This function may return other system errors as well.
     * @see https://docs.microsoft.com/windows/win32/api//mgmtapi/nf-mgmtapi-snmpmgrtraplisten
     * @since windows5.0
     */
    static SnmpMgrTrapListen(phTrapAvailable) {
        A_LastError := 0

        result := DllCall("mgmtapi.dll\SnmpMgrTrapListen", "ptr", phTrapAvailable, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SnmpMgrGetTrap function returns outstanding trap data that the caller has not received if trap reception is enabled. This function is an element of the SNMP Management API.
     * @param {Pointer<AsnObjectIdentifier>} enterprise Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to receive the enterprise that generated the SNMP trap.
     * @param {Pointer<AsnOctetString>} IPAddress Pointer to a variable to receive the address of the agent that generated the SNMP trap.
     * @param {Pointer<UInt32>} genericTrap 
     * @param {Pointer<Int32>} specificTrap Pointer to a variable to receive an indication of the specific trap generated.
     * @param {Pointer<UInt32>} timeStamp Pointer to a variable to receive the time stamp.
     * @param {Pointer<SnmpVarBindList>} variableBindings Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbindlist">SnmpVarBindList</a> structure to receive the variable bindings list.
     * @returns {BOOL} If the function returns a trap, the return value is <b>TRUE</b>. The code for the error can be retrieved by calling <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> immediately after the call.
     * 
     * You should call the 
     * <b>SnmpMgrGetTrap</b> function repeatedly until it returns <b>FALSE</b> (zero). The function may also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_TRAP_ERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates errors were encountered; traps are not accessible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_NOTRAPS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates no traps are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MEM_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a memory allocation error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mgmtapi/nf-mgmtapi-snmpmgrgettrap
     * @since windows5.0
     */
    static SnmpMgrGetTrap(enterprise, IPAddress, genericTrap, specificTrap, timeStamp, variableBindings) {
        result := DllCall("mgmtapi.dll\SnmpMgrGetTrap", "ptr", enterprise, "ptr", IPAddress, "uint*", genericTrap, "int*", specificTrap, "uint*", timeStamp, "ptr", variableBindings, "int")
        return result
    }

    /**
     * The SnmpMgrGetTrapEx function returns outstanding trap data that the caller has not received if trap reception is enabled.
     * @param {Pointer<AsnObjectIdentifier>} enterprise Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to receive the enterprise that generated the SNMP trap.
     * @param {Pointer<AsnOctetString>} agentAddress Pointer to a variable to receive the address of the agent that generated the SNMP trap; this information is retrieved from the SNMP protocol data unit (PDU).
     * @param {Pointer<AsnOctetString>} sourceAddress Pointer to a variable to receive the address of the agent that generated the SNMP trap; this information is retrieved from the network transport.
     * @param {Pointer<UInt32>} genericTrap 
     * @param {Pointer<Int32>} specificTrap Pointer to a variable to receive an indicator of the specific trap generated.
     * @param {Pointer<AsnOctetString>} community Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnoctetstring">AsnOctetString</a> structure to receive the community string of the generated SNMP trap.
     * @param {Pointer<UInt32>} timeStamp Pointer to a variable to receive the time stamp.
     * @param {Pointer<SnmpVarBindList>} variableBindings Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbindlist">SnmpVarBindList</a> structure to receive the variable bindings list.
     * @returns {BOOL} If the function returns a trap, the return value is nonzero.
     * 
     * You should call the 
     * <b>SnmpMgrGetTrapEx</b> function repeatedly until it returns zero. The function may also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_TRAP_ERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that errors were encountered; traps are not accessible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MGMTAPI_NOTRAPS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that no traps are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMP_MEM_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a memory allocation error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mgmtapi/nf-mgmtapi-snmpmgrgettrapex
     * @since windows5.0
     */
    static SnmpMgrGetTrapEx(enterprise, agentAddress, sourceAddress, genericTrap, specificTrap, community, timeStamp, variableBindings) {
        result := DllCall("mgmtapi.dll\SnmpMgrGetTrapEx", "ptr", enterprise, "ptr", agentAddress, "ptr", sourceAddress, "uint*", genericTrap, "int*", specificTrap, "ptr", community, "uint*", timeStamp, "ptr", variableBindings, "int")
        return result
    }

    /**
     * The WinSNMP SnmpGetTranslateMode function returns the current setting of the entity and context translation mode to a WinSNMP application.
     * @param {Pointer<UInt32>} nTranslateMode 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. If 
     * <b>SnmpGetTranslateMode</b> fails, the value of the <i>nTranslateMode</i> parameter has no meaning for the application. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpgettranslatemode
     * @since windows5.0
     */
    static SnmpGetTranslateMode(nTranslateMode) {
        result := DllCall("wsnmp32.dll\SnmpGetTranslateMode", "uint*", nTranslateMode, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetTranslateMode function enables a WinSNMP application to change the entity and context translation mode. The entity and context translation mode affects the interpretation and return of WinSNMP input and output string parameters.
     * @param {Integer} nTranslateMode 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_MODE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The implementation does not support the requested translation mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpsettranslatemode
     * @since windows5.0
     */
    static SnmpSetTranslateMode(nTranslateMode) {
        result := DllCall("wsnmp32.dll\SnmpSetTranslateMode", "uint", nTranslateMode, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpGetRetransmitMode function returns the current setting of the retransmission mode to a WinSNMP application.
     * @param {Pointer<UInt32>} nRetransmitMode 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. If 
     * <b>SnmpGetRetransmitMode</b> fails, the value of the <i>nRetransmitMode</i> parameter has no meaning for the application. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpgetretransmitmode
     * @since windows5.0
     */
    static SnmpGetRetransmitMode(nRetransmitMode) {
        result := DllCall("wsnmp32.dll\SnmpGetRetransmitMode", "uint*", nRetransmitMode, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetRetransmitMode function enables a WinSNMP application to set the retransmission mode.
     * @param {Integer} nRetransmitMode 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_MODE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The implementation does not support the requested retransmission mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpsetretransmitmode
     * @since windows5.0
     */
    static SnmpSetRetransmitMode(nRetransmitMode) {
        result := DllCall("wsnmp32.dll\SnmpSetRetransmitMode", "uint", nRetransmitMode, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpGetTimeout function returns the time-out value, in hundredths of a second, for the transmission of SNMP message requests.
     * @param {Pointer} hEntity Handle to the destination management entity of interest.
     * @param {Pointer<UInt32>} nPolicyTimeout Pointer to an integer variable to receive the time-out value, in hundredths of a second, for the specified management entity. This is a value that the Microsoft WinSNMP implementation stores in a database. If you do not need the information returned in this parameter, <i>nPolicyRetry</i> must be a <b>NULL</b> pointer.
     * @param {Pointer<UInt32>} nActualTimeout Pointer to an integer variable to receive the last actual or estimated response interval for the destination entity, as reported by the implementation. If you do not need the information returned in this parameter, <i>nActualRetry</i> must be a <b>NULL</b> pointer. If this parameter is a valid pointer, the function returns 0. For additional information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hEntity</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>nPolicyRetry</i> and <i>nActualRetry</i> parameters are both <b>NULL</b>. The operation was not performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpgettimeout
     * @since windows5.0
     */
    static SnmpGetTimeout(hEntity, nPolicyTimeout, nActualTimeout) {
        result := DllCall("wsnmp32.dll\SnmpGetTimeout", "ptr", hEntity, "uint*", nPolicyTimeout, "uint*", nActualTimeout, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetTimeout function enables a WinSNMP application to change the time-out value for the transmission of SNMP message requests.
     * @param {Pointer} hEntity Handle to the destination management entity of interest.
     * @param {Integer} nPolicyTimeout Specifies a new time-out value, in hundredths of a second, for the management entity. This value replaces the value currently stored in the implementation's database. 
     * 
     * 
     * 
     * 
     * If this parameter is equal to zero, and the current retransmission mode is equal to SNMPAPI_ON, the implementation selects a time-out value. The implementation uses this time-out value when it executes the WinSNMP application's retransmission policy.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hEntity</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpsettimeout
     * @since windows5.0
     */
    static SnmpSetTimeout(hEntity, nPolicyTimeout) {
        result := DllCall("wsnmp32.dll\SnmpSetTimeout", "ptr", hEntity, "uint", nPolicyTimeout, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpGetRetry function returns the retry count value, in units, for the retransmission of SNMP message requests. The retry count applies to calls that a WinSNMP application makes to the SnmpSendMsg function for a specified management entity.
     * @param {Pointer} hEntity Handle to the destination management entity of interest.
     * @param {Pointer<UInt32>} nPolicyRetry Pointer to an unsigned long integer variable to receive the retry count value for the specified management entity. This is a value that the Microsoft WinSNMP implementation stores in a database. If you do not need the information returned in this parameter, <i>nPolicyRetry</i> must be a <b>NULL</b> pointer.
     * @param {Pointer<UInt32>} nActualRetry Pointer to an unsigned long integer variable to receive the last actual or estimated retry count for the destination entity, as reported by the implementation. If you do not need the information returned in this parameter, <i>nActualRetry</i> must be a <b>NULL</b> pointer. If this parameter is a valid pointer, the function returns 0. For additional information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hEntity</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>nPolicyRetry</i> and <i>nActualRetry</i> parameters are both <b>NULL</b>. The operation was not performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpgetretry
     * @since windows5.0
     */
    static SnmpGetRetry(hEntity, nPolicyRetry, nActualRetry) {
        result := DllCall("wsnmp32.dll\SnmpGetRetry", "ptr", hEntity, "uint*", nPolicyRetry, "uint*", nActualRetry, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetRetry function enables a WinSNMP application to change the retry count value for the retransmission of SNMP message requests.
     * @param {Pointer} hEntity Handle to the destination management entity of interest.
     * @param {Integer} nPolicyRetry Specifies a new value for the retry count for the management entity. This value replaces the value currently stored in the implementation's database. 
     * 
     * 
     * 
     * 
     * If this parameter is equal to zero, and the current retransmission mode is equal to SNMPAPI_ON, the implementation selects a value for the retry count. The implementation uses this value when it executes the WinSNMP application's retransmission policy.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hEntity</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpsetretry
     * @since windows5.0
     */
    static SnmpSetRetry(hEntity, nPolicyRetry) {
        result := DllCall("wsnmp32.dll\SnmpSetRetry", "ptr", hEntity, "uint", nPolicyRetry, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the SnmpGetVendorInfo function to retrieve information about the Microsoft WinSNMP implementation.
     * @param {Pointer<smiVENDORINFO>} vendorInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smivendorinfo">smiVENDORINFO</a> structure to receive information. The information includes a way to contact Microsoft and the enterprise number assigned to Microsoft by the Internet Assigned Numbers Authority (IANA).
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>vendorInfo</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpgetvendorinfo
     * @since windows5.0
     */
    static SnmpGetVendorInfo(vendorInfo) {
        result := DllCall("wsnmp32.dll\SnmpGetVendorInfo", "ptr", vendorInfo, "uint")
        return result
    }

    /**
     * The SnmpStartup function notifies the Microsoft WinSNMP implementation that the WinSNMP application requires the implementation's services.
     * @param {Pointer<UInt32>} nMajorVersion Pointer to an unsigned long integer variable to receive the major version number of the WinSNMP API that the implementation supports. For example, to indicate that the implementation supports WinSNMP version 2.0, the function returns a value of 2.
     * @param {Pointer<UInt32>} nMinorVersion Pointer to an unsigned long integer variable to receive the minor version number of the WinSNMP API that the implementation supports. For example, to indicate that the implementation supports WinSNMP version 2.0, the function returns a value of 0.
     * @param {Pointer<UInt32>} nLevel Pointer to an unsigned long integer variable to receive the highest level of SNMP communications the implementation supports. Upon successful return, this parameter contains a value of 2. For a description of level 2 support, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/levels-of-snmp-support">Levels of SNMP Support</a>.
     * @param {Pointer<UInt32>} nTranslateMode Pointer to an unsigned long integer variable to receive the default translation mode in effect for the implementation. The translation mode applies to the implementation's interpretation of the <i>entity</i> parameter that the WinSNMP application passes to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> function. The translation mode also applies to the <i>string</i> parameter that the WinSNMP application passes to the
     * @param {Pointer<UInt32>} nRetransmitMode 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS, and the parameters contain appropriate values, as indicated in the preceding parameter descriptions.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors. For additional information, see the Remarks section that follows.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <b>SnmpStartup</b> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpstartup
     * @since windows5.0
     */
    static SnmpStartup(nMajorVersion, nMinorVersion, nLevel, nTranslateMode, nRetransmitMode) {
        result := DllCall("wsnmp32.dll\SnmpStartup", "uint*", nMajorVersion, "uint*", nMinorVersion, "uint*", nLevel, "uint*", nTranslateMode, "uint*", nRetransmitMode, "uint")
        return result
    }

    /**
     * The SnmpCleanup function informs the Microsoft WinSNMP implementation that the calling WinSNMP application no longer requires the implementation's services.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS. Until the WinSNMP application successfully recalls the 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function, any other call to a WinSNMP function returns SNMPAPI_FAILURE, with an extended error code of SNMPAPI_NOT_INITIALIZED.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE, but the WinSNMP application does not need to retry the call to 
     * <b>SnmpCleanup</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its<i> session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpcleanup
     * @since windows5.0
     */
    static SnmpCleanup() {
        result := DllCall("wsnmp32.dll\SnmpCleanup", "uint")
        return result
    }

    /**
     * The SnmpOpen function requests the Microsoft WinSNMP implementation to open a session for the WinSNMP application.
     * @param {HWND} hWnd Handle to a window of the WinSNMP application to notify when an asynchronous request completes, or when trap notification occurs.
     * @param {Integer} wMsg Specifies an unsigned integer that identifies the notification message to send to the WinSNMP application window.
     * @returns {Pointer} If the function succeeds, the return value is a handle that identifies the WinSNMP session that the implementation opens for the calling application.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_HWND_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWnd</i> parameter is not a valid window handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpopen
     * @since windows5.0
     */
    static SnmpOpen(hWnd, wMsg) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("wsnmp32.dll\SnmpOpen", "ptr", hWnd, "uint", wMsg, "ptr")
        return result
    }

    /**
     * The SnmpClose function enables the Microsoft WinSNMP implementation to deallocate memory, resources, and data structures associated with a WinSNMP session.
     * @param {Pointer} session Handle to the WinSNMP session to close.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpclose
     * @since windows5.0
     */
    static SnmpClose(session) {
        result := DllCall("wsnmp32.dll\SnmpClose", "ptr", session, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the SnmpSendMsg function to request that the Microsoft WinSNMP implementation transmit an SNMP protocol data unit (PDU), in the form of an SNMP message.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer} srcEntity Handle to the management entity that initiates the request to send the SNMP message.
     * @param {Pointer} dstEntity Handle to the target entity that will respond to the SNMP request.
     * @param {Pointer} context Handle to the context, (a set of managed object resources), that the target management entity controls.
     * @param {Pointer} PDU Handle to the protocol data unit that contains the SNMP operation request.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function may return one of the following WinSNMP or network transport layer errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or both of the entity parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_CONTEXT_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>context</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_PDU_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>PDU</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OPERATION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation specified in the <b>PDU_type</b> field of the PDU is inappropriate for the destination entity. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network transport layer was not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network transport layer does not support the SNMP protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network subsystem failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_RESOURCE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resource error occurred in the network transport layer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_SRC_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entity specified by the <i>srcEntity</i> parameter was not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network transport layer function call received an invalid input parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_PDU_TOO_BIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PDU is too large for the network transport layer to send or receive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_OTHER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An undefined network transport layer error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For additional information, see 
     * <a href="/windows/desktop/SNMP/network-transport-errors">Network Transport Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpsendmsg
     * @since windows5.0
     */
    static SnmpSendMsg(session, srcEntity, dstEntity, context, PDU) {
        result := DllCall("wsnmp32.dll\SnmpSendMsg", "ptr", session, "ptr", srcEntity, "ptr", dstEntity, "ptr", context, "ptr", PDU, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpRecvMsg function retrieves the results of a completed asynchronous request submitted by a call to the SnmpSendMsg function, in the form of an SNMP message.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer<IntPtr>} srcEntity Pointer to a variable that receives a handle to the entity that sends the message. Note that the <i>srcEntity</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpregister">SnmpRegister</a> function specifies a handle to the management entity that registers for trap notification.
     * @param {Pointer<IntPtr>} dstEntity Pointer to a variable that receives a handle to the entity that receives the message. Note that the <i>dstEntity</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpregister">SnmpRegister</a> function specifies a handle to the management entity that sends traps.
     * @param {Pointer<IntPtr>} context Pointer to a variable that receives a handle to the context, which is a set of managed object resources. The entity specified by the <i>srcEntity</i> parameter issues the message from this context.
     * @param {Pointer<IntPtr>} PDU Pointer to a variable that receives a handle to the protocol data unit (PDU) component of the message.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS, and the output parameters contain the values indicated in the preceding parameter descriptions.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. If the function fails with an extended error code that indicates a network transport layer error, that is, one that begins with SNMPAPI_TL_, the output parameters also contain the values indicated preceding to enable the WinSNMP application to recover gracefully.
     * 
     * To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function may return one of the following WinSNMP or network transport layer errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified session has no messages in its queue at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network transport layer was not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network transport layer does not support the SNMP protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network subsystem failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_RESOURCE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resource error occurred in the network transport layer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_UNDELIVERABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entity specified by the <i>dstEntity</i> parameter is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_SRC_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entity specified by the <i>srcEntity</i> parameter was not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network transport layer function call received an invalid input parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_PDU_TOO_BIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PDU is too large for the network transport layer to send or receive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_OTHER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An undefined network transport layer error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For additional information, see 
     * <a href="/windows/desktop/SNMP/network-transport-errors">Network Transport Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmprecvmsg
     * @since windows5.0
     */
    static SnmpRecvMsg(session, srcEntity, dstEntity, context, PDU) {
        result := DllCall("wsnmp32.dll\SnmpRecvMsg", "ptr", session, "ptr*", srcEntity, "ptr*", dstEntity, "ptr*", context, "ptr*", PDU, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpRegister function registers or unregisters a WinSNMP application for trap and notification reception. The application can register and receive traps and notifications, or unregister and disable traps and notifications.
     * @param {Pointer} session Handle to the WinSNMP session that is registering or unregistering for traps and notifications.
     * @param {Pointer} srcEntity Handle to the management entity that is the source of the registration request. This entity, acting in an SNMP manager role, will receive the trap or notification. 
     * 
     * 
     * Because the implementation does not use this parameter to filter traps and notifications from reaching the WinSNMP application,  a WinSNMP manager application typically passes <b>NULL</b> in this parameter.
     * 
     * If this parameter is <b>NULL</b>, the Microsoft WinSNMP implementation registers or unregisters all sources of trap and notification requests.
     * 
     * Note that the <i>srcEntity</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function has a different role. In that function, <i>srcEntity</i> receives a handle to the entity that sent the trap.
     * @param {Pointer} dstEntity Handle to the management entity that is the recipient of the registration request. This entity, acting in an SNMP agent role, will send the trap or notification. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the implementation registers or unregisters the WinSNMP application for traps and notifications from all management entities.
     * 
     * Note that the <i>dstEntity</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function receives a handle to the management entity that registers for trap notification.
     * @param {Pointer} context Handle to the context, which is a set of managed object resources. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the implementation registers or unregisters the WinSNMP application for traps and notifications for every context.
     * @param {Pointer<smiOID>} notification Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure that contains the pattern-matching sequence for one type of trap or notification. The implementation uses this sequence to identify the type of trap or notification for which the WinSNMP application is registering or unregistering. For additional information, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the implementation registers or unregisters the WinSNMP application for all traps and notifications from the management entity or entities specified by the <i>dstEntity</i> parameter.
     * @param {Integer} state 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function may return one of the following WinSNMP or network transport layer errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or both of the entity parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_CONTEXT_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>context</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OID_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>notification</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network transport layer was not initialized, or the SNMPTRAP.EXE service could not be started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trap port is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network subsystem failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For additional information, see 
     * <a href="/windows/desktop/SNMP/network-transport-errors">Network Transport Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpregister
     * @since windows5.0
     */
    static SnmpRegister(session, srcEntity, dstEntity, context, notification, state) {
        result := DllCall("wsnmp32.dll\SnmpRegister", "ptr", session, "ptr", srcEntity, "ptr", dstEntity, "ptr", context, "ptr", notification, "uint", state, "uint")
        return result
    }

    /**
     * The SnmpCreateSession function requests the Microsoft WinSNMP implementation to open a session for the WinSNMP application.
     * @param {HWND} hWnd Handle to a window of the WinSNMP application to notify when an asynchronous request completes, or when trap notification occurs. This parameter is required for window notification messages for the session.
     * @param {Integer} wMsg Specifies an unsigned integer that identifies the notification message to send to the WinSNMP application window. This parameter is required for window notification messages for the session.
     * @param {Pointer<SNMPAPI_CALLBACK>} fCallBack Specifies the address of an application-defined, session-specific 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nc-winsnmp-snmpapi_callback">SNMPAPI_CALLBACK</a> function. The implementation will call this function to inform the WinSNMP session when notifications are available. 
     * 
     * 
     * 
     * 
     * This parameter is required to specify callback notifications for the session. This parameter must be <b>NULL</b> to specify window notification messages for the session. For additional information, see the following Remarks section.
     * @param {Pointer<Void>} lpClientData Pointer to application-defined data to pass to the callback function specified by the <i>fCallback</i> parameter. This parameter is optional and can be <b>NULL</b>. If the <i>fCallback</i> parameter is <b>NULL</b>, the implementation ignores this parameter.
     * @returns {Pointer} If the function succeeds, the return value is a handle that identifies the WinSNMP session that the implementation opens for the calling application.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_HWND_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>fCallback</i> parameter is <b>NULL</b>, but the <i>hWnd</i> parameter is not a valid window handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_MESSAGE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>fCallback</i> parameter is <b>NULL</b>, but the <i>wMsg</i> parameter is not a valid message value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_MODE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>fCallback</i> parameter is <b>NULL</b> and the <i>hWnd</i> and <i>wMsg</i> parameters are valid individually. However, the values are mutually incompatible on the Windows platform.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OPERATION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The combination of parameter values does not specify callback notifications or window notification messages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpcreatesession
     * @since windows5.0
     */
    static SnmpCreateSession(hWnd, wMsg, fCallBack, lpClientData) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("wsnmp32.dll\SnmpCreateSession", "ptr", hWnd, "uint", wMsg, "ptr", fCallBack, "ptr", lpClientData, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpListen function registers a WinSNMP application as an SNMP agent.
     * @param {Pointer} hEntity Handle to the WinSNMP entity to notify when the Microsoft WinSNMP implementation receives an incoming SNMP request message (PDU). This parameter identifies the agent application. For more information, see the following Remarks and Return Values sections. 
     * 
     * 
     * 
     * 
     * When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a> function, you can specify whether the implementation should use a window notification message or an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nc-winsnmp-snmpapi_callback">SNMPAPI_CALLBACK</a> function to notify the application when an SNMP message or asynchronous event is available.
     * @param {Integer} lStatus 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hEntity</i> parameter is invalid. This parameter must be a handle returned by a previous call to the 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_MODE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lStatus</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entity specified by the <i>hEntity</i> parameter is already functioning in the role of an SNMP agent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_RESOURCE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a network transport layer error. A socket could not be created for the entity specified by the <i>hEntity</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_OTHER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred in the network transport layer while trying to bind a socket for the entity specified by the <i>hEntity</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmplisten
     * @since windows5.0
     */
    static SnmpListen(hEntity, lStatus) {
        result := DllCall("wsnmp32.dll\SnmpListen", "ptr", hEntity, "uint", lStatus, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} hEntity 
     * @param {Integer} lStatus 
     * @param {Integer} nUseEntityAddr 
     * @returns {Integer} 
     */
    static SnmpListenEx(hEntity, lStatus, nUseEntityAddr) {
        result := DllCall("wsnmp32.dll\SnmpListenEx", "ptr", hEntity, "uint", lStatus, "uint", nUseEntityAddr, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the SnmpCancelMsg function to request that the Microsoft WinSNMP implementation cancel retransmission attempts and time-out notifications for an SNMP request message.
     * @param {Pointer} session Handle to the WinSNMP session that submitted the SNMP request message (PDU) to be canceled.
     * @param {Integer} reqId Specifies a unique numeric value that identifies the PDU of interest. This parameter must match the request identifier (<b>request_id</b>) of the <i>PDU</i> parameter specified in the application's initial call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a> function.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_PDU_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>reqId</i> parameter does not identify an outstanding message for the specified session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpcancelmsg
     * @since windows5.0
     */
    static SnmpCancelMsg(session, reqId) {
        result := DllCall("wsnmp32.dll\SnmpCancelMsg", "ptr", session, "int", reqId, "uint")
        return result
    }

    /**
     * The SnmpStartupEx function notifies the Microsoft WinSNMP implementation that the WinSNMP application requires the implementation's services.
     * @param {Pointer<UInt32>} nMajorVersion Pointer to an unsigned long integer variable to receive the major version number of the WinSNMP API that 
     *       the implementation supports. For example, to indicate that the implementation supports WinSNMP version 2.0, the 
     *       function returns a value of 2.
     * @param {Pointer<UInt32>} nMinorVersion Pointer to an unsigned long integer variable to receive the minor version number of the WinSNMP API that 
     *       the implementation supports. For example, to indicate that the implementation supports WinSNMP version 2.0, the function returns a value of 0.
     * @param {Pointer<UInt32>} nLevel Pointer to an unsigned long integer variable to receive the highest level of SNMP communications the 
     *       implementation supports. Upon successful return, this parameter contains a value of 2. For a description of level 2 support, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/SNMP/levels-of-snmp-support">Levels of SNMP Support</a>.
     * @param {Pointer<UInt32>} nTranslateMode Pointer to an unsigned long integer variable to receive the default translation mode in effect for 
     *       the implementation. The translation mode applies to how the implementation interprets the 
     *       <i>entity</i> parameter, that the WinSNMP application passes to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> function. The translation mode also 
     *       applies to the <i>string</i> parameter that the WinSNMP application passes to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtocontext">SnmpStrToContext</a> function. This parameter can be
     * @param {Pointer<UInt32>} nRetransmitMode Pointer to an unsigned long integer variable to receive the default retransmission mode in effect for the
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS, and the parameters contain appropriate values, 
     *        as indicated in the preceding parameter descriptions.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     *        <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a 
     *        <b>NULL</b> value in its <i>session</i> parameter. The 
     *        <b>SnmpGetLastError</b> function can return one of the 
     *        following errors. For additional information, see the "Remarks" section later in this document.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_RESOURCE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resource allocation error occurred during startup.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_TL_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartupex">SnmpStartupEx</a> function did not initialize correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpstartupex
     * @since windows5.0
     */
    static SnmpStartupEx(nMajorVersion, nMinorVersion, nLevel, nTranslateMode, nRetransmitMode) {
        result := DllCall("wsnmp32.dll\SnmpStartupEx", "uint*", nMajorVersion, "uint*", nMinorVersion, "uint*", nLevel, "uint*", nTranslateMode, "uint*", nRetransmitMode, "uint")
        return result
    }

    /**
     * The SnmpCleanupEx function performs cleanup when there are no outstanding successful calls to SnmpStartup or SnmpStartupEx within a Windows SNMP (WinSNMP) application.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS. Until the WinSNMP application successfully recalls the 
     * corresponding <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartupex">SnmpStartupEx</a> function and there are no additional outstanding successful calls to either <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> or <b>SnmpStartupEx</b>, any other call to a WinSNMP function within the same application returns SNMPAPI_FAILURE, with an extended error code of SNMPAPI_NOT_INITIALIZED.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE, but the WinSNMP application does not need to retry the call to 
     * <b>SnmpCleanupEx</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartupex">SnmpStartupEx</a> function did not complete successfully, or an unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpcleanupex
     * @since windows5.0
     */
    static SnmpCleanupEx() {
        result := DllCall("wsnmp32.dll\SnmpCleanupEx", "uint")
        return result
    }

    /**
     * The WinSNMP SnmpStrToEntity function returns a handle to information about an SNMP management entity that is specific to the Microsoft WinSNMP implementation.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {PSTR} string Pointer to a null-terminated string that identifies the SNMP management entity of interest. The current setting of the entity and context translation mode determines the manner in which 
     * <b>SnmpStrToEntity</b> interprets the input string as follows. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Entity/Context Translation Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMPAPI_TRANSLATED"></a><a id="snmpapi_translated"></a><dl>
     * <dt><b>SNMPAPI_TRANSLATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The implementation interprets the <i>string</i> parameter as a user-friendly name. The implementation translates the name into its SNMPv1 or SNMPv2C components using the implementation's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMPAPI_UNTRANSLATED_V1"></a><a id="snmpapi_untranslated_v1"></a><dl>
     * <dt><b>SNMPAPI_UNTRANSLATED_V1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The implementation interprets the <i>string</i> parameter as a literal SNMP transport address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMPAPI_UNTRANSLATED_V2"></a><a id="snmpapi_untranslated_v2"></a><dl>
     * <dt><b>SNMPAPI_UNTRANSLATED_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The implementation interprets the <i>string</i> parameter as a literal SNMP transport address.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Pointer} If the function succeeds, the return value is a handle to the SNMP management entity of interest.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entity string is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpstrtoentity
     * @since windows5.0
     */
    static SnmpStrToEntity(session, string) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("wsnmp32.dll\SnmpStrToEntity", "ptr", session, "ptr", string, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpEntityToStr function returns a string that identifies an SNMP management entity.
     * @param {Pointer} entity Handle to the SNMP management entity of interest.
     * @param {Integer} size Specifies the size, in bytes, of the buffer pointed to by the <i>string</i> parameter. The WinSNMP application must allocate a buffer that is large enough to contain the output string.
     * @param {PSTR} string Pointer to a buffer to receive the null-terminated string that identifies the SNMP management entity of interest.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes, including a terminating null byte, that 
     * <b>SnmpEntityToStr</b> returns in the <i>string</i> buffer. This value can be less than or equal to the value of the <i>size</i> parameter, but it cannot be greater.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>entity</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OUTPUT_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer length is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpentitytostr
     * @since windows5.0
     */
    static SnmpEntityToStr(entity, size, string) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("wsnmp32.dll\SnmpEntityToStr", "ptr", entity, "uint", size, "ptr", string, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpFreeEntity function releases resources associated with an SNMP management entity.
     * @param {Pointer} entity Handle to the SNMP management entity that will have its resources released.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>entity</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpfreeentity
     * @since windows5.0
     */
    static SnmpFreeEntity(entity) {
        result := DllCall("wsnmp32.dll\SnmpFreeEntity", "ptr", entity, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpStrToContext function returns a handle to SNMP context information that is specific to the Microsoft WinSNMP implementation.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer<smiOCTETS>} string Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure that contains a string to interpret. The string can identify a collection of managed objects, or it can be a community string. 
     * 
     * 
     * 
     * 
     * The current setting of the entity and context translation mode determines the way 
     * <b>SnmpStrToContext</b> interprets the input string structure as shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Entity/Context Translation Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMPAPI_TRANSLATED"></a><a id="snmpapi_translated"></a><dl>
     * <dt><b>SNMPAPI_TRANSLATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The implementation interprets the <i>string</i> parameter as a user-friendly name for a collection of managed objects. The implementation translates the name into its SNMPv1 or SNMPv2C components using the implementation's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMPAPI_UNTRANSLATED_V1"></a><a id="snmpapi_untranslated_v1"></a><dl>
     * <dt><b>SNMPAPI_UNTRANSLATED_V1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The implementation interprets the <i>string</i> parameter as a literal SNMP community string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMPAPI_UNTRANSLATED_V2"></a><a id="snmpapi_untranslated_v2"></a><dl>
     * <dt><b>SNMPAPI_UNTRANSLATED_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The implementation interprets the <i>string</i> parameter as a literal SNMP community string.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Pointer} If the function succeeds, the return value is a handle to the context of interest.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_CONTEXT_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>string</i> parameter format is invalid. For example, the <b>len</b> member or the <b>ptr</b> member of the 
     * <a href="/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure pointed to by the <i>string</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_CONTEXT_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value referenced in the <i>string</i> parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpstrtocontext
     * @since windows5.0
     */
    static SnmpStrToContext(session, string) {
        result := DllCall("wsnmp32.dll\SnmpStrToContext", "ptr", session, "ptr", string, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpContextToStr function returns a string that identifies an SNMP context, which is a set of managed object resources. The function returns the string in an smiOCTETS structure.
     * @param {Pointer} context Handle to the SNMP context of interest.
     * @param {Pointer<smiOCTETS>} string Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure to receive the string that identifies the context of interest. The string can have a null-terminating byte.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_CONTEXT_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>context</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpcontexttostr
     * @since windows5.0
     */
    static SnmpContextToStr(context, string) {
        result := DllCall("wsnmp32.dll\SnmpContextToStr", "ptr", context, "ptr", string, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpFreeContext function releases resources associated with an SNMP context, which is a set of managed object resources.
     * @param {Pointer} context Handle to the SNMP context that will have its resources released.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_CONTEXT_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>context</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpfreecontext
     * @since windows5.0
     */
    static SnmpFreeContext(context) {
        result := DllCall("wsnmp32.dll\SnmpFreeContext", "ptr", context, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the SnmpSetPort function to change the port assigned to a destination entity. The SnmpSetPort function is an element of the WinSNMP API, version 2.0.
     * @param {Pointer} hEntity Handle to a WinSNMP destination entity. This parameter can specify the handle to an entity acting in the role of an SNMP agent application as a result of a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmplisten">SnmpListen</a> function. For more information, see the following Remarks section.
     * @param {Integer} nPort Specifies an unsigned integer that identifies the new port assignment for the destination entity. If you specify a local address that is busy, or if you specify a remote address that is unavailable, a call to the 
     * <b>SnmpSetPort</b> function fails.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OPERATION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entity specified by the <i>hEntity</i> parameter is already functioning in an agent role as the result of a call to the 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmplisten">SnmpListen</a> function. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hEntity</i> parameter is invalid. This parameter must be a handle returned by a previous call to the 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpsetport
     * @since windows5.0
     */
    static SnmpSetPort(hEntity, nPort) {
        result := DllCall("wsnmp32.dll\SnmpSetPort", "ptr", hEntity, "uint", nPort, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpCreatePdu function creates and initializes an SNMP protocol data unit (PDU).
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Integer} PDU_type 
     * @param {Integer} request_id Specifies a unique numeric value that the WinSNMP application supplies to identify the PDU. If this parameter is <b>NULL</b>, the implementation assigns a value.
     * @param {Integer} error_status If the <i>PDU_type</i> parameter is equal to <b>SNMP_PDU_GETBULK</b>, this parameter specifies a value for the <b>non_repeaters</b> field of the PDU. For other PDU types, this parameter specifies a value for the <b>error_status</b> field of the PDU. This parameter can be <b>NULL</b>.
     * @param {Integer} error_index If the <i>PDU_type</i> parameter is equal to <b>SNMP_PDU_GETBULK</b>, this parameter specifies a value for the <b>max_repetitions</b> field of the PDU. For other PDU types, this parameter specifies a value for the <b>error_index</b> field of the PDU. This parameter can be <b>NULL</b>.
     * @param {Pointer} varbindlist Handle to a structure that represents an SNMP variable bindings list. This parameter can be <b>NULL</b>.
     * @returns {Pointer} If the function succeeds, the return value is the handle to a new SNMP PDU.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_PDU_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PDU type is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_VBL_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variable bindings list is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpcreatepdu
     * @since windows5.0
     */
    static SnmpCreatePdu(session, PDU_type, request_id, error_status, error_index, varbindlist) {
        result := DllCall("wsnmp32.dll\SnmpCreatePdu", "ptr", session, "uint", PDU_type, "int", request_id, "int", error_status, "int", error_index, "ptr", varbindlist, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpGetPduData function returns selected data fields from a specified SNMP protocol data unit (PDU).
     * @param {Pointer} PDU Handle to the SNMP PDU.
     * @param {Pointer<UInt32>} PDU_type 
     * @param {Pointer<Int32>} request_id Pointer to a variable that receives the <b>request_id</b> field of the specified PDU. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} error_status Pointer to a variable that receives the <b>error_status</b> field of the specified PDU. If the <i>PDU_type</i> parameter is equal to <b>SNMP_PDU_GETBULK</b>, this parameter receives the value of the <b>non_repeaters</b> field of the PDU.
     * @param {Pointer<Int32>} error_index Pointer to a variable that receives the <b>error_index</b> field of the specified PDU. 
     * 
     * 
     * 
     * 
     * If the <i>PDU_type</i> parameter is equal to <b>SNMP_PDU_GETBULK</b>, this parameter receives the value of the <b>max_repetitions</b> field of the specified PDU. This parameter can be <b>NULL</b>.
     * @param {Pointer<IntPtr>} varbindlist Pointer to a variable that receives a handle to the variable bindings list field of the specified PDU. This parameter can be <b>NULL</b>. For additional information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All output parameters are <b>NULL</b>. The SNMP operation was not performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_PDU_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PDU type is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpgetpdudata
     * @since windows5.0
     */
    static SnmpGetPduData(PDU, PDU_type, request_id, error_status, error_index, varbindlist) {
        result := DllCall("wsnmp32.dll\SnmpGetPduData", "ptr", PDU, "uint*", PDU_type, "int*", request_id, "uint*", error_status, "int*", error_index, "ptr*", varbindlist, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetPduData function updates selected data fields in the specified SNMP protocol data unit (PDU).
     * @param {Pointer} PDU Handle to an SNMP PDU.
     * @param {Pointer<Int32>} PDU_type Pointer to a variable with a value to update the <b>PDU_type</b> field of the specified PDU. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Int32>} request_id Pointer to a variable with a value to update the <b>request_id</b> field of the specified PDU. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Int32>} non_repeaters If the <i>PDU_type</i> parameter is equal to <a href="https://docs.microsoft.com/windows/desktop/SNMP/snmp-variable-types-and-request-pdu-types">SNMP_PDU_GETBULK</a>, this parameter points to a variable with a value to update the <b>non_repeaters</b> field of the specified PDU. The Microsoft WinSNMP implementation ignores this parameter for other PDU types. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Int32>} max_repetitions If the <i>PDU_type</i> parameter is equal to <a href="https://docs.microsoft.com/windows/desktop/SNMP/snmp-variable-types-and-request-pdu-types">SNMP_PDU_GETBULK</a>, this parameter points to a variable with a value to update the <b>max_repetitions</b> field of the specified PDU. The implementation ignores this parameter for other PDU types. This parameter can also be <b>NULL</b>.
     * @param {Pointer<IntPtr>} varbindlist Pointer to a variable with a value that updates the handle to the variable bindings list field of the specified PDU. This parameter can also be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_PDU_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PDU type is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_VBL_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variable bindings list is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All input parameters are <b>NULL</b>. The SNMP operation was not performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpsetpdudata
     * @since windows5.0
     */
    static SnmpSetPduData(PDU, PDU_type, request_id, non_repeaters, max_repetitions, varbindlist) {
        result := DllCall("wsnmp32.dll\SnmpSetPduData", "ptr", PDU, "int*", PDU_type, "int*", request_id, "int*", non_repeaters, "int*", max_repetitions, "ptr*", varbindlist, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpDuplicatePdu function duplicates the SNMP protocol data unit (PDU) that the PDU parameter identifies, allocating any necessary memory for the duplicate PDU.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer} PDU Handle to the PDU to duplicate. The 
     * <b>SnmpDuplicatePdu</b> function provides a unique handle to each PDU within the calling application.
     * @returns {Pointer} If the function succeeds, the return value is a handle that identifies the new duplicate PDU.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_PDU_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PDU handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpduplicatepdu
     * @since windows5.0
     */
    static SnmpDuplicatePdu(session, PDU) {
        result := DllCall("wsnmp32.dll\SnmpDuplicatePdu", "ptr", session, "ptr", PDU, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpFreePdu function releases resources associated with an SNMP protocol data unit (PDU) created by the SnmpCreatePdu or the SnmpDuplicatePdu function.
     * @param {Pointer} PDU Handle to the SNMP PDU to free.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_PDU_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PDU handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpfreepdu
     * @since windows5.0
     */
    static SnmpFreePdu(PDU) {
        result := DllCall("wsnmp32.dll\SnmpFreePdu", "ptr", PDU, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpCreateVbl function creates a new variable bindings list for the calling WinSNMP application.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer<smiOID>} name Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure that contains the variable name for the first variable binding entry. This parameter can be <b>NULL</b>. For additional information, see the following Remarks section.
     * @param {Pointer<smiVALUE>} value Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smivalue">smiVALUE</a> structure that contains a value to associate with the variable in the first variable binding entry. This parameter can be <b>NULL</b>. For additional information, see the following Remarks section.
     * @returns {Pointer} If the function succeeds, the return value is a handle to a new variable bindings list.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OID_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>name</i> parameter references an invalid 
     * <a href="/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SYNTAX_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>syntax</b> member of the structure pointed to by the <i>value</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpcreatevbl
     * @since windows5.0
     */
    static SnmpCreateVbl(session, name, value) {
        result := DllCall("wsnmp32.dll\SnmpCreateVbl", "ptr", session, "ptr", name, "ptr", value, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpDuplicateVbl function copies a variable bindings list for the specified WinSNMP session. This function returns a handle to the copied variable bindings list and allocates any necessary memory for it.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer} vbl Handle to the variable bindings list to copy. The source variable bindings list can be empty.
     * @returns {Pointer} If the function succeeds, the return value is a handle to a new variable bindings list.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_VBL_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>vbl</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpduplicatevbl
     * @since windows5.0
     */
    static SnmpDuplicateVbl(session, vbl) {
        result := DllCall("wsnmp32.dll\SnmpDuplicateVbl", "ptr", session, "ptr", vbl, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpFreeVbl function releases resources associated with a variable bindings list. These are resources allocated previously by a call to the SnmpCreateVbl function or the SnmpDuplicateVbl function in a WinSNMP application.
     * @param {Pointer} vbl Handle to the variable bindings list to release.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_VBL_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>vbl</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpfreevbl
     * @since windows5.0
     */
    static SnmpFreeVbl(vbl) {
        result := DllCall("wsnmp32.dll\SnmpFreeVbl", "ptr", vbl, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the WinSNMP SnmpCountVbl function to enumerate the variable binding entries in the specified variable bindings list.
     * @param {Pointer} vbl Handle to the variable bindings list to enumerate.
     * @returns {Integer} If the function succeeds, the return value is the count of variable binding entries in the variable bindings list.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variable bindings list does not contain any variable binding entries at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_VBL_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>vbl</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpcountvbl
     * @since windows5.0
     */
    static SnmpCountVbl(vbl) {
        result := DllCall("wsnmp32.dll\SnmpCountVbl", "ptr", vbl, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the SnmpGetVb function to retrieve information from a variable bindings list. This WinSNMP function retrieves a variable name and its associated value from the variable binding entry specified by the index parameter.
     * @param {Pointer} vbl Handle to the variable bindings list to retrieve.
     * @param {Integer} index Specifies an unsigned long integer variable that identifies the variable binding entry to retrieve. This variable contains the position of the variable binding entry, within the variable bindings list. 
     * 
     * 
     * 
     * 
     * Valid values for this parameter are in the range from 1 to n, where 1 indicates the first variable binding entry in the variable bindings list, and n is the total number of entries in the list. For additional information, see the following Remarks section.
     * @param {Pointer<smiOID>} name Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure to receive the variable name of the variable binding entry.
     * @param {Pointer<smiVALUE>} value Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smivalue">smiVALUE</a> structure to receive the value associated with the variable identified by the <i>name</i> parameter. 
     * 
     * 
     * 
     * 
     * If the function succeeds, the <b>syntax</b> member of the structure pointed to by the <i>value</i> parameter can be one of the following syntax data types. For additional information, see RFC 1902, "Structure of Management Information for Version 2 of the Simple Network Management Protocol (SNMPv2)."
     * 
     * <table>
     * <tr>
     * <th>Syntax data type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_INT"></a><a id="snmp_syntax_int"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_INT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a 32-bit signed integer variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_OCTETS"></a><a id="snmp_syntax_octets"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_OCTETS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an octet string variable that is binary or textual data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_NULL"></a><a id="snmp_syntax_null"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_NULL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a <b>NULL</b> value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_OID"></a><a id="snmp_syntax_oid"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_OID</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an object identifier variable that is an assigned name with a maximum of 128 subidentifiers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_INT32"></a><a id="snmp_syntax_int32"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_INT32</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a 32-bit signed integer variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_IPADDR"></a><a id="snmp_syntax_ipaddr"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_IPADDR</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a 32-bit Internet address variable. If SNMPv1 PDU trap format is used to represent an IPv6 address, this value is 0.0.0.0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_CNTR32"></a><a id="snmp_syntax_cntr32"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_CNTR32</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a counter variable that increases until it reaches a maximum value of (2^32) – 1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_GAUGE32"></a><a id="snmp_syntax_gauge32"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_GAUGE32</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a gauge variable that is a non-negative integer that can increase or decrease, but never exceed a maximum value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_TIMETICKS"></a><a id="snmp_syntax_timeticks"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_TIMETICKS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a counter variable that measures the time in hundredths of a second, until it reaches a maximum value of (2^32) – 1. It is a non-negative integer that is relative to a specific timer event.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_OPAQUE"></a><a id="snmp_syntax_opaque"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_OPAQUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This type provides backward compatibility, and should not be used for new object types. It supports the capability to pass arbitrary Abstract Syntax Notation One (ASN.1) syntax.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_CNTR64"></a><a id="snmp_syntax_cntr64"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_CNTR64</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a counter variable that increases until it reaches a maximum value of (2^64) – 1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_UINT32"></a><a id="snmp_syntax_uint32"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_UINT32</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a 32-bit unsigned integer variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_NOSUCHOBJECT"></a><a id="snmp_syntax_nosuchobject"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_NOSUCHOBJECT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the agent does not support the object type that corresponds to the variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_NOSUCHINSTANCE"></a><a id="snmp_syntax_nosuchinstance"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_NOSUCHINSTANCE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the object instance does not exist for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SNMP_SYNTAX_ENDOFMIBVIEW"></a><a id="snmp_syntax_endofmibview"></a><dl>
     * <dt><b><b>SNMP_SYNTAX_ENDOFMIBVIEW</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the WinSNMP application is attempting to reference an object identifier that is beyond the end of the MIB tree that the agent supports.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_INDEX_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>index</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_VBL_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>vbl</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpgetvb
     * @since windows5.0
     */
    static SnmpGetVb(vbl, index, name, value) {
        result := DllCall("wsnmp32.dll\SnmpGetVb", "ptr", vbl, "uint", index, "ptr", name, "ptr", value, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetVb function changes variable binding entries in a variable bindings list. This function also appends new variable binding entries to an existing variable bindings list.
     * @param {Pointer} vbl Handle to the variable bindings list to update.
     * @param {Integer} index Specifies an unsigned long integer variable that contains the position of the variable binding entry, within the variable bindings list, if this is an update operation. If this is an append operation, this parameter must be equal to zero. For more information, see the following Remarks section.
     * @param {Pointer<smiOID>} name Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure that represents the name of the variable to append or change. For more information, see the following Remarks section.
     * @param {Pointer<smiVALUE>} value Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smivalue">smiVALUE</a> structure. The structure contains the value associated with the variable specified by the <i>name</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is the position of the updated or appended variable binding entry in the variable bindings list. For additional information, see the following Remarks section.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_VBL_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>vbl</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_INDEX_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>index</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OID_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>name</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SYNTAX_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>syntax</b> member of the structure pointed to by the <i>value</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpsetvb
     * @since windows5.0
     */
    static SnmpSetVb(vbl, index, name, value) {
        result := DllCall("wsnmp32.dll\SnmpSetVb", "ptr", vbl, "uint", index, "ptr", name, "ptr", value, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpDeleteVb function removes a variable binding entry from a variable bindings list.
     * @param {Pointer} vbl Handle to the variable bindings list to update.
     * @param {Integer} index Specifies an unsigned long integer variable that identifies the variable binding entry to remove. This variable contains the position of the variable binding entry, within the variable bindings list. 
     * 
     * 
     * 
     * 
     * Valid values for this parameter are in the range from 1 to n, where 1 indicates the first variable binding entry in the variable bindings list, and n is the total number of entries in the variable bindings list. For additional information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_INDEX_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>index</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_VBL_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>vbl</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpdeletevb
     * @since windows5.0
     */
    static SnmpDeleteVb(vbl, index) {
        result := DllCall("wsnmp32.dll\SnmpDeleteVb", "ptr", vbl, "uint", index, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpGetLastError function returns the calling application's last-error code value. The value indicates the reason why the last function call executed by the WinSNMP application failed.
     * @param {Pointer} session Handle to the WinSNMP session. This parameter can also be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * In certain cases, when a function call fails you can pass a <b>NULL</b><i>session</i> value to the 
     * <b>SnmpGetLastError</b> function to retrieve the last-error code value. This is true for function calls that do not involve a <i>session</i> parameter, and cases in which the <i>session</i> parameter value is invalid. These cases are noted in the Return Values section on the function's reference page.
     * 
     * A single-thread application can pass a <b>NULL</b><i>session</i> value to 
     * <b>SnmpGetLastError</b> to retrieve last-error information for the entire application.
     * 
     * For more information, see the following Remarks and Return Values sections.
     * @returns {Integer} If the <i>session</i> parameter is a valid WinSNMP session handle, the 
     * <b>SnmpGetLastError</b> function returns the last WinSNMP error that occurred for the indicated session.
     * 
     * If the <i>session</i> parameter is <b>NULL</b> — for example, if the 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function fails, 
     * <b>SnmpGetLastError</b> returns the last WinSNMP error that occurred.
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpgetlasterror
     * @since windows5.0
     */
    static SnmpGetLastError(session) {
        result := DllCall("wsnmp32.dll\SnmpGetLastError", "ptr", session, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpStrToOid function converts the dotted numeric string format of an SNMP object identifier, for example, &quot;1.2.3.4.5.6&quot;, to its internal binary representation.
     * @param {PSTR} string Pointer to a <b>null</b>-terminated object identifier string to convert.
     * @param {Pointer<smiOID>} dstOID Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure that receives the converted value.
     * @returns {Integer} If the function succeeds, the return value is the number of subidentifiers in the converted object identifier. This number is also the value of the <b>len</b> member of the 
     * <a href="/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure pointed to by the <i>dstOID</i> parameter.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OID_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>string</i> parameter is invalid. For additional information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpstrtooid
     * @since windows5.0
     */
    static SnmpStrToOid(string, dstOID) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("wsnmp32.dll\SnmpStrToOid", "ptr", string, "ptr", dstOID, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpOidToStr function converts the internal binary representation of an SNMP object identifier to its dotted numeric string format, for example, to &quot;1.2.3.4.5.6&quot;.
     * @param {Pointer<smiOID>} srcOID Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure with an object identifier to convert.
     * @param {Integer} size Specifies the size, in bytes, of the buffer indicated by the <i>string</i> parameter. For more information, see the following Remarks section.
     * @param {PSTR} string Pointer to a buffer to receive the converted string object identifier that specifies the SNMP management entity.
     * @returns {Integer} If the function succeeds, the return value is the length, in bytes, of the string that the WinSNMP application writes to the <i>string</i> parameter. The return value includes a <b>null</b>-terminating byte. This value may be less than or equal to the value of the <i>size</i> parameter, but it may not be greater.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SIZE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>size</i> parameter is invalid. This parameter cannot be equal to zero; it must indicate the size of the buffer pointed to by the <i>string</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OID_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>srcOID</i> parameter is invalid. For additional information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OUTPUT_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer length is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpoidtostr
     * @since windows5.0
     */
    static SnmpOidToStr(srcOID, size, string) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("wsnmp32.dll\SnmpOidToStr", "ptr", srcOID, "uint", size, "ptr", string, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpOidCopy function copies an SNMP object identifier, allocating any necessary memory for the copy.
     * @param {Pointer<smiOID>} srcOID Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure to copy.
     * @param {Pointer<smiOID>} dstOID Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure to receive a copy of the object identifier specified by the <i>srcOID</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is the number of subidentifiers in the copied object identifier. This number is also the value of the <b>len</b> member of the 
     * <a href="/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure pointed to by the <i>dstOID</i> parameter.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OID_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>srcOID</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpoidcopy
     * @since windows5.0
     */
    static SnmpOidCopy(srcOID, dstOID) {
        result := DllCall("wsnmp32.dll\SnmpOidCopy", "ptr", srcOID, "ptr", dstOID, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpOidCompare function lexicographically compares two SNMP object identifiers, up to the length specified by the maxlen parameter.
     * @param {Pointer<smiOID>} xOID Pointer to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> object identifier to compare. The length of the object identifier can be zero.
     * @param {Pointer<smiOID>} yOID Pointer to the second 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> object identifier to compare. The length of the object identifier can be zero.
     * @param {Integer} maxlen If not equal to zero, specifies the number of subidentifiers to compare. This parameter must be less than MAXOBJIDSIZE: 128 subidentifiers, the maximum number of components in an object identifier. For additional information, see the following Remarks section.
     * @param {Pointer<Int32>} result Pointer to an integer variable to receive the result of the comparison. The variable can receive one of the following results. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Result</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Greater_than_0"></a><a id="greater_than_0"></a><a id="GREATER_THAN_0"></a><dl>
     * <dt><b>Greater than 0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>xOID</i> is greater than <i>yOID</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Equal_to_0"></a><a id="equal_to_0"></a><a id="EQUAL_TO_0"></a><dl>
     * <dt><b>Equal to 0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>xOID</i> equals <i>yOID</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Less_than_0"></a><a id="less_than_0"></a><a id="LESS_THAN_0"></a><dl>
     * <dt><b>Less than 0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>xOID</i> is less than <i>yOID</i>
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For additional comparison conditions, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OID_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or both of the <i>xOID</i> and <i>yOID</i> parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SIZE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>maxlen</i> parameter is invalid. The parameter size is greater than MAXOBJIDSIZE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpoidcompare
     * @since windows5.0
     */
    static SnmpOidCompare(xOID, yOID, maxlen, result) {
        result := DllCall("wsnmp32.dll\SnmpOidCompare", "ptr", xOID, "ptr", yOID, "uint", maxlen, "int*", result, "uint")
        return result
    }

    /**
     * The Microsoft WinSNMP implementation uses the parameters passed in the WinSNMP SnmpEncodeMsg function to encode an SNMP message.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer} srcEntity Handle to the management entity that initiates the request to encode the SNMP message.
     * @param {Pointer} dstEntity Handle to the target management entity.
     * @param {Pointer} context Handle to the context (a set of managed object resources) that the target management entity controls.
     * @param {Pointer} pdu Handle to the PDU that contains the SNMP operation request.
     * @param {Pointer<smiOCTETS>} msgBufDesc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure that receives the encoded SNMP message.
     * @returns {Integer} If the function succeeds, the return value is the length, in bytes, of the encoded SNMP message. This number is also the value of the <b>len</b> member of the 
     * <a href="/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure pointed to by the <i>msgBufDesc</i> parameter.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. For additional information, see the following Remarks section. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or both of the entity parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_CONTEXT_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>context</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_PDU_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdu</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpencodemsg
     * @since windows5.0
     */
    static SnmpEncodeMsg(session, srcEntity, dstEntity, context, pdu, msgBufDesc) {
        result := DllCall("wsnmp32.dll\SnmpEncodeMsg", "ptr", session, "ptr", srcEntity, "ptr", dstEntity, "ptr", context, "ptr", pdu, "ptr", msgBufDesc, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpDecodeMsg function decodes an encoded SNMP message into its components. This function performs the opposite action of the WinSNMP SnmpEncodeMsg function.
     * @param {Pointer} session Handle to the WinSNMP session. This parameter is required. For additional information, see the following Remarks section.
     * @param {Pointer<IntPtr>} srcEntity Pointer to a variable that receives a handle to the source management entity. For more information, see the following Remarks section.
     * @param {Pointer<IntPtr>} dstEntity Pointer to a variable that receives a handle to the target management entity. For more information, see the following Remarks section.
     * @param {Pointer<IntPtr>} context Pointer to a variable that receives a handle to the context (a set of managed object resources) that the target management entity controls.
     * @param {Pointer<IntPtr>} pdu Pointer to a variable that receives a handle to the SNMP protocol data unit (PDU).
     * @param {Pointer<smiOCTETS>} msgBufDesc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure that contains the SNMP message to decode into its components. The <b>len</b> member of the structure specifies the maximum number of bytes to process; the <b>ptr</b> member points to the encoded SNMP message.
     * @returns {Integer} If the function succeeds, the return value is the number of decoded bytes. This value can be equal to, or less than, the <b>len</b> member of the 
     * <a href="/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure pointed to by the <i>msgBufDesc</i> parameter.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SESSION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>session</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ENTITY_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or both of the entity parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_CONTEXT_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>context</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_PDU_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdu</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OUTPUT_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer length is insufficient. No output parameters were created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_MESSAGE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SNMP message format in the buffer indicated by the <i>msgBufDesc</i> parameter is invalid. No output parameters were created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpdecodemsg
     * @since windows5.0
     */
    static SnmpDecodeMsg(session, srcEntity, dstEntity, context, pdu, msgBufDesc) {
        result := DllCall("wsnmp32.dll\SnmpDecodeMsg", "ptr", session, "ptr*", srcEntity, "ptr*", dstEntity, "ptr*", context, "ptr*", pdu, "ptr", msgBufDesc, "uint")
        return result
    }

    /**
     * A WinSNMP application uses the SnmpFreeDescriptor function to inform the Microsoft WinSNMP implementation that it no longer requires access to a descriptor object.
     * @param {Integer} syntax Specifies the syntax data type of the target descriptor object.
     * @param {Pointer<smiOCTETS>} descriptor Pointer to an <b>smiOPAQUE</b> structure that contains the target descriptor object to release.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
     * <b>SnmpGetLastError</b> function can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_ALLOC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_SYNTAX_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>syntax</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OPERATION_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>descriptor</i> parameter is invalid. For additional information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SNMPAPI_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsnmp/nf-winsnmp-snmpfreedescriptor
     * @since windows5.0
     */
    static SnmpFreeDescriptor(syntax, descriptor) {
        result := DllCall("wsnmp32.dll\SnmpFreeDescriptor", "uint", syntax, "ptr", descriptor, "uint")
        return result
    }

;@endregion Methods
}
