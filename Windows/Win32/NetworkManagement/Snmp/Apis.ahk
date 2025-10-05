#Requires AutoHotkey v2.0.0 64-bit

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
     * @remarks
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputiloidfree">SnmpUtilOidFree</a> function to free memory that the 
     * <b>SnmpUtilOidCpy</b> function allocates for the destination structure.
     * @param {Pointer<AsnObjectIdentifier>} pOidDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to receive the copy.
     * @param {Pointer<AsnObjectIdentifier>} pOidSrc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloidcpy
     * @since windows5.0
     */
    static SnmpUtilOidCpy(pOidDst, pOidSrc) {
        result := DllCall("snmpapi.dll\SnmpUtilOidCpy", "ptr", pOidDst, "ptr", pOidSrc, "int")
        return result
    }

    /**
     * The SnmpUtilOidAppend function appends the source object identifier to the destination object identifier. This function is an element of the SNMP Utility API.
     * @remarks
     * The 
     * <b>SnmpUtilOidAppend</b> function calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemrealloc">SnmpUtilMemReAlloc</a> function. The 
     * <b>SnmpUtilMemReAlloc</b> function expands the buffer for the destination object identifier.
     * 
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputiloidfree">SnmpUtilOidFree</a> function to free memory that the 
     * <b>SnmpUtilOidAppend</b> function allocates for the destination.
     * @param {Pointer<AsnObjectIdentifier>} pOidDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to receive the source structure.
     * @param {Pointer<AsnObjectIdentifier>} pOidSrc Pointer to an 
     * <b>AsnObjectIdentifier</b> structure to append.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. This function does not generate Windows Sockets errors. The application should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> may return the following error codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloidappend
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
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloidncmp
     * @since windows5.0
     */
    static SnmpUtilOidNCmp(pOid1, pOid2, nSubIds) {
        result := DllCall("snmpapi.dll\SnmpUtilOidNCmp", "ptr", pOid1, "ptr", pOid2, "uint", nSubIds, "int")
        return result
    }

    /**
     * The SnmpUtilOidCmp function compares two object identifiers. This function is an element of the SNMP Utility API.
     * @remarks
     * The 
     * <b>SnmpUtilOidCmp</b> function calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputiloidncmp">SnmpUtilOidNCmp</a> function.
     * @param {Pointer<AsnObjectIdentifier>} pOid1 Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to compare.
     * @param {Pointer<AsnObjectIdentifier>} pOid2 Pointer to a second 
     * <b>AsnObjectIdentifier</b> structure to compare.
     * @returns {Integer} The function returns a value greater than zero if <i>pOid1</i> is greater than <i>pOid2</i>, zero if <i>pOid1</i> equals <i>pOid2</i>, and less than zero if <i>pOid1</i> is less than <i>pOid2</i>.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloidcmp
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
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloidfree
     * @since windows5.0
     */
    static SnmpUtilOidFree(pOid) {
        DllCall("snmpapi.dll\SnmpUtilOidFree", "ptr", pOid)
    }

    /**
     * The SnmpUtilOctetsCmp function compares two octet strings. This function is an element of the SNMP Utility API.
     * @remarks
     * The 
     * <b>SnmpUtilOctetsCmp</b> function calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputiloctetsncmp">SnmpUtilOctetsNCmp</a> function.
     * @param {Pointer<AsnOctetString>} pOctets1 Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnoctetstring">AsnOctetString</a> structure to compare.
     * @param {Pointer<AsnOctetString>} pOctets2 Pointer to a second 
     * <b>AsnOctetString</b> structure to compare.
     * @returns {Integer} The function returns a value greater than zero if <i>pOctets1</i> is greater than <i>pOctets2</i>, zero if <i>pOctets1</i> equals <i>pOctets2</i>, and less than zero if <i>pOctets1</i> is less than <i>pOctets2</i>.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloctetscmp
     * @since windows5.0
     */
    static SnmpUtilOctetsCmp(pOctets1, pOctets2) {
        result := DllCall("snmpapi.dll\SnmpUtilOctetsCmp", "ptr", pOctets1, "ptr", pOctets2, "int")
        return result
    }

    /**
     * The SnmpUtilOctetsNCmp function compares two octet strings. The function compares the subidentifiers in the strings until it reaches the number of subidentifiers specified by the nChars parameter. SnmpUtilOctetsNCmp is an element of the SNMP Utility API.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputiloctetscmp">SnmpUtilOctetsCmp</a> function calls the 
     * <b>SnmpUtilOctetsNCmp</b> function.
     * @param {Pointer<AsnOctetString>} pOctets1 Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnoctetstring">AsnOctetString</a> structure to compare.
     * @param {Pointer<AsnOctetString>} pOctets2 Pointer to a second 
     * <b>AsnOctetString</b> structure to compare.
     * @param {Integer} nChars Specifies the number of subidentifiers to compare.
     * @returns {Integer} The function returns a value greater than zero if <i>pOctets1</i> is greater than <i>pOctets2</i>, zero if <i>pOctets1</i> equals <i>pOctets2</i>, and less than zero if <i>pOctets1</i> is less than <i>pOctets2</i>.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloctetsncmp
     * @since windows5.0
     */
    static SnmpUtilOctetsNCmp(pOctets1, pOctets2, nChars) {
        result := DllCall("snmpapi.dll\SnmpUtilOctetsNCmp", "ptr", pOctets1, "ptr", pOctets2, "uint", nChars, "int")
        return result
    }

    /**
     * The SnmpUtilOctetsCpy function copies the variable pointed to by the pOctetsSrc parameter to the variable pointed to by the pOctetsDst parameter.
     * @remarks
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputiloctetsfree">SnmpUtilOctetsFree</a> function to free the memory that the 
     * <b>SnmpUtilOctetsCpy</b> function allocates for the destination structure.
     * @param {Pointer<AsnOctetString>} pOctetsDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnoctetstring">AsnOctetString</a> structure to receive the copy.
     * @param {Pointer<AsnOctetString>} pOctetsSrc Pointer to an 
     * <b>AsnOctetString</b> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloctetscpy
     * @since windows5.0
     */
    static SnmpUtilOctetsCpy(pOctetsDst, pOctetsSrc) {
        result := DllCall("snmpapi.dll\SnmpUtilOctetsCpy", "ptr", pOctetsDst, "ptr", pOctetsSrc, "int")
        return result
    }

    /**
     * The SnmpUtilOctetsFree function frees the memory allocated for the specified octet string. This function is an element of the SNMP Utility API.
     * @remarks
     * Call the 
     * <b>SnmpUtilOctetsFree</b> function to free the memory that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputiloctetscpy">SnmpUtilOctetsCpy</a> function allocates.
     * @param {Pointer<AsnOctetString>} pOctets Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnoctetstring">AsnOctetString</a> structure whose memory should be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloctetsfree
     * @since windows5.0
     */
    static SnmpUtilOctetsFree(pOctets) {
        DllCall("snmpapi.dll\SnmpUtilOctetsFree", "ptr", pOctets)
    }

    /**
     * The SnmpUtilAsnAnyCpy function copies the variable pointed to by the pAnySrc parameter to the pAnyDst parameter. The function allocates any necessary memory for the destination's copy. The SnmpUtilAsnAnyCpy function is an element of the SNMP Utility API.
     * @remarks
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilasnanyfree">SnmpUtilAsnAnyFree</a> function to free the memory that the 
     * <b>SnmpUtilAsnAnyCpy</b> function allocates for the destination structure.
     * @param {Pointer<AsnAny>} pAnyDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnany">AsnAny</a> structure to receive the copy.
     * @param {Pointer<AsnAny>} pAnySrc Pointer to an 
     * <b>AsnAny</b> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilasnanycpy
     * @since windows5.0
     */
    static SnmpUtilAsnAnyCpy(pAnyDst, pAnySrc) {
        result := DllCall("snmpapi.dll\SnmpUtilAsnAnyCpy", "ptr", pAnyDst, "ptr", pAnySrc, "int")
        return result
    }

    /**
     * The SnmpUtilAsnAnyFree function frees the memory allocated for the specified AsnAny structure. This function is an element of the SNMP Utility API.
     * @remarks
     * Call the 
     * <b>SnmpUtilAsnAnyFree</b> function to free the memory that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilasnanycpy">SnmpUtilAsnAnyCpy</a> function allocates.
     * @param {Pointer<AsnAny>} pAny Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnany">AsnAny</a> structure whose memory should be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilasnanyfree
     * @since windows5.0
     */
    static SnmpUtilAsnAnyFree(pAny) {
        DllCall("snmpapi.dll\SnmpUtilAsnAnyFree", "ptr", pAny)
    }

    /**
     * The SnmpUtilVarBindCpy function copies the specified SnmpVarBind structure, and allocates any memory necessary for the destination structure. The SnmpUtilVarBindCpy function is an element of the SNMP Utility API.
     * @remarks
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilvarbindfree">SnmpUtilVarBindFree</a> function to free memory that the 
     * <b>SnmpUtilVarBindCpy</b> function allocates for the destination structure.
     * @param {Pointer<SnmpVarBind>} pVbDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbind">SnmpVarBind</a> structure to receive the copy.
     * @param {Pointer<SnmpVarBind>} pVbSrc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbind">SnmpVarBind</a> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilvarbindcpy
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
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilvarbindfree
     * @since windows5.0
     */
    static SnmpUtilVarBindFree(pVb) {
        DllCall("snmpapi.dll\SnmpUtilVarBindFree", "ptr", pVb)
    }

    /**
     * The SnmpUtilVarBindListCpy function copies the specified SnmpVarBindList structure, and allocates any necessary memory for the destination's copy. This function is an element of the SNMP Utility API.
     * @remarks
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilvarbindlistfree">SnmpUtilVarBindListFree</a> function to free memory that the 
     * <b>SnmpUtilVarBindListCpy</b> function allocates for the destination structure.
     * @param {Pointer<SnmpVarBindList>} pVblDst Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbindlist">SnmpVarBindList</a> structure to receive the copy.
     * @param {Pointer<SnmpVarBindList>} pVblSrc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbindlist">SnmpVarBindList</a> structure to copy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilvarbindlistcpy
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
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilvarbindlistfree
     * @since windows5.0
     */
    static SnmpUtilVarBindListFree(pVbl) {
        DllCall("snmpapi.dll\SnmpUtilVarBindListFree", "ptr", pVbl)
    }

    /**
     * The SnmpUtilMemFree function frees the specified memory object. This function is an element of the SNMP Utility API.
     * @remarks
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemalloc">SnmpUtilMemAlloc</a> function to allocate the memory for the object.
     * @param {Pointer<Void>} pMem Pointer to the memory object to release.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilmemfree
     * @since windows5.0
     */
    static SnmpUtilMemFree(pMem) {
        DllCall("snmpapi.dll\SnmpUtilMemFree", "ptr", pMem)
    }

    /**
     * The SnmpUtilMemAlloc function allocates dynamic memory from the process heap. This function is an element of the SNMP Utility API.
     * @remarks
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemfree">SnmpUtilMemFree</a> function to release memory that the 
     * <b>SnmpUtilMemAlloc</b> function allocates.
     * @param {Integer} nBytes Specifies the number of bytes to allocate for the memory object.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the newly allocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilmemalloc
     * @since windows5.0
     */
    static SnmpUtilMemAlloc(nBytes) {
        result := DllCall("snmpapi.dll\SnmpUtilMemAlloc", "uint", nBytes, "ptr")
        return result
    }

    /**
     * The SnmpUtilMemReAlloc function changes the size of the specified memory object. This function is an element of the SNMP Utility API.
     * @remarks
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemfree">SnmpUtilMemFree</a> function to release memory that the 
     * <b>SnmpUtilMemReAlloc</b> function allocates.
     * @param {Pointer<Void>} pMem Pointer to the memory object to resize.
     * @param {Integer} nBytes Specifies the number of bytes to allocate for the new memory object.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the newly allocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilmemrealloc
     * @since windows5.0
     */
    static SnmpUtilMemReAlloc(pMem, nBytes) {
        result := DllCall("snmpapi.dll\SnmpUtilMemReAlloc", "ptr", pMem, "uint", nBytes, "ptr")
        return result
    }

    /**
     * The SnmpUtilOidToA function converts an object identifier (OID) to a null-terminated string. This function is an element of the SNMP Utility API.
     * @remarks
     * The 
     * <b>SnmpUtilOidToA</b> function can assist with the debugging of SNMP applications.
     * 
     * For more information, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilidstoa">SnmpUtilIdsToA</a> function. 
     * <b>SnmpUtilOidToA</b> calls 
     * <b>SnmpUtilIdsToA</b> internally to format the string.
     * @param {Pointer<AsnObjectIdentifier>} Oid Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to convert.
     * @returns {Pointer<Byte>} The function returns a null-terminated string of characters that contains the string representation of the object identifier pointed to by the <i>Oid</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputiloidtoa
     * @since windows5.0
     */
    static SnmpUtilOidToA(Oid) {
        result := DllCall("snmpapi.dll\SnmpUtilOidToA", "ptr", Oid, "char*")
        return result
    }

    /**
     * The SnmpUtilIdsToA function converts an object identifier (OID) to a null-terminated string. This function is an element of the SNMP Utility API.
     * @remarks
     * The 
     * <b>SnmpUtilIdsToA</b> function can assist with the debugging of SNMP applications.
     * 
     * Note that the following memory restrictions apply when you call 
     * <b>SnmpUtilIdsToA</b>:
     * 
     * <ul>
     * <li>The <i>Ids</i> parameter must point to a valid memory block of at least <i>IdLength</i> integers, or the function call results in an access violation exception.</li>
     * <li>The string returned by 
     * <b>SnmpUtilIdsToA</b> resides in memory that the SNMP Utility API allocates. The application should not make any assumptions about the memory allocation. The data is guaranteed to be valid until you call 
     * <b>SnmpUtilIdsToA</b> again, so before calling the function again you should copy the data to another location.</li>
     * </ul>
     * @param {Pointer<UInt32>} Ids Pointer to an array of unsigned integers. The array contains the sequence of numbers that the OID contains. The <i>IdLength</i> parameter specifies the array's length. 
     * 
     * 
     * 
     * 
     * For more information, see the following Return Values and Remarks sections.
     * @param {Integer} IdLength Specifies the number of elements in the array pointed to by the <i>Ids</i> parameter.
     * @returns {Pointer<Byte>} The function returns a null-terminated string that contains the string representation of the array of numbers pointed to by the <i>Ids</i> parameter. The string contains a sequence of numbers separated by periods ('.'); for example, 1.3.6.1.4.1.311.
     * 
     * If the <i>Ids</i> parameter is null, or if the <i>IdLength</i> parameter specifies zero, the function returns the string "&lt;null oid&gt;".
     * 
     * The maximum length of the returned string is 256 characters. If the string's length exceeds 256 characters, the string is truncated and terminated with a sequence of three periods ('...').
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilidstoa
     * @since windows5.0
     */
    static SnmpUtilIdsToA(Ids, IdLength) {
        result := DllCall("snmpapi.dll\SnmpUtilIdsToA", "uint*", Ids, "uint", IdLength, "char*")
        return result
    }

    /**
     * The SnmpUtilPrintOid function formats the specified object identifier (OID) and prints the result to the standard output device. This function is an element of the SNMP Utility API.
     * @remarks
     * The 
     * <b>SnmpUtilPrintOid</b> function can assist with the debugging of command-line SNMP applications. The function prints the object identifier as a sequence of numbers separated by periods ('.'); for example, 1.3.6.1.4.1.311.
     * @param {Pointer<AsnObjectIdentifier>} Oid Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to print.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilprintoid
     * @since windows5.0
     */
    static SnmpUtilPrintOid(Oid) {
        DllCall("snmpapi.dll\SnmpUtilPrintOid", "ptr", Oid)
    }

    /**
     * The SnmpUtilPrintAsnAny function prints the value of the Any parameter to the standard output. This function is an element of the SNMP Utility API.
     * @remarks
     * Use the 
     * <b>SnmpUtilPrintAsnAny</b> function for debugging and development purposes. This function does not generally print the data in a form that a manager application would typically need.
     * @param {Pointer<AsnAny>} pAny Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnany">AsnAny</a> structure for a value to print.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputilprintasnany
     * @since windows5.0
     */
    static SnmpUtilPrintAsnAny(pAny) {
        DllCall("snmpapi.dll\SnmpUtilPrintAsnAny", "ptr", pAny)
    }

    /**
     * The SnmpSvcGetUptime function retrieves the number of centiseconds that the SNMP service has been running. This function is an element of the SNMP Utility API.
     * @remarks
     * An extension agent should call the 
     * <b>SnmpSvcGetUptime</b> function only if the extension agent DLL is loaded within the address space of the SNMP service.
     * 
     * The SNMP extension agent DLL is encouraged to use the 
     * <b>SnmpSvcGetUptime</b> function to retrieve the number of centiseconds that the SNMP service has been running. Extension agents should use 
     * <b>SnmpSvcGetUptime</b> rather than calculate the uptime using the <i>dwUptimeReference</i> parameter. The service passes this parameter to the extension agent as the result of a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmpextensioninit">SnmpExtensionInit</a> function. Because the <i>dwUptimeReference</i> parameter stores the elapsed time as a <b>DWORD</b> value in milliseconds, the time can wrap to zero and reflect an inaccurate time interval.
     * 
     * An extension agent that sends traps must initialize the <i>timeStamp</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmpextensiontrap">SnmpExtensionTrap</a> function with the value returned by a call to the 
     * <b>SnmpSvcGetUptime</b> function.
     * @returns {Integer} The function returns a <b>DWORD</b> value that is the number of centiseconds the SNMP service has been running.
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmpsvcgetuptime
     * @since windows5.0
     */
    static SnmpSvcGetUptime() {
        result := DllCall("snmpapi.dll\SnmpSvcGetUptime", "uint")
        return result
    }

    /**
     * The SnmpSvcSetLogLevel function adjusts the level of detail of the debug output from the SNMP service and from SNMP extension agents using the SnmpUtilDbgPrint function. This function is an element of the SNMP Utility API.
     * @remarks
     * Extension agents are encouraged to use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmpsvcsetlogtype">SnmpSvcSetLogType</a> and 
     * <b>SnmpSvcSetLogLevel</b> functions during development to adjust the output of debugging information. Extension agents can integrate the information with the debug output from the SNMP service.
     * @param {Integer} nLogLevel Specifies a signed integer variable that indicates the level of detail of the debug output from the
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmpsvcsetloglevel
     * @since windows5.0
     */
    static SnmpSvcSetLogLevel(nLogLevel) {
        DllCall("snmpapi.dll\SnmpSvcSetLogLevel", "int", nLogLevel)
    }

    /**
     * The SnmpSvcSetLogType function adjusts the destination for the debug output from the SNMP service and from SNMP extension agents using the SnmpUtilDbgPrint function. This function is an element of the SNMP Utility API.
     * @remarks
     * Extension agents are encouraged to use the 
     * <b>SnmpSvcSetLogType</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmpsvcsetloglevel">SnmpSvcSetLogLevel</a> functions during development to adjust the output of debugging information. Extension agents can integrate the information with the debug output from the SNMP service.
     * @param {Integer} nLogType Specifies a signed integer variable that represents the destination for the debug output from the
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmpsvcsetlogtype
     * @since windows5.0
     */
    static SnmpSvcSetLogType(nLogType) {
        DllCall("snmpapi.dll\SnmpSvcSetLogType", "int", nLogType)
    }

    /**
     * The SnmpUtilDbgPrint function enables debugging output from the SNMP service. This function is an element of the SNMP Utility API.
     * @remarks
     * Extension agents are encouraged to use this function during development to enable debug output from the SNMP service.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmpsvcsetloglevel">SnmpSvcSetLogLevel</a> function to set the level of detail of the debug output from the SNMP service or from an extension agent's call to the 
     * <b>SnmpUtilDbgPrint</b> function. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmpsvcsetlogtype">SnmpSvcSetLogType</a> function to specify the destination for the debug output.
     * @param {Integer} nLogLevel 
     * @param {Pointer<Byte>} szFormat Pointer to a null-terminated format string that is similar to the standard C library function <b>printf</b> style.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/snmp/nf-snmp-snmputildbgprint
     * @since windows5.0
     */
    static SnmpUtilDbgPrint(nLogLevel, szFormat) {
        szFormat := szFormat is String? StrPtr(szFormat) : szFormat

        DllCall("snmpapi.dll\SnmpUtilDbgPrint", "int", nLogLevel, "ptr", szFormat, "CDecl ")
    }

    /**
     * The SnmpMgrOpen function initializes communications sockets and data structures, allowing communications with the specified SNMP agent. This function is an element of the SNMP Management API.
     * @remarks
     * If possible, use a host name to identify the SNMP agent in the <i>lpAgentAddress</i> parameter. Host names can be provided for agents only if TCP/IP is loaded and the names are TCP/IP host names. NetBIOS names cannot be supplied for IPX hosts.
     * 
     * The name and address of the SNMP target, or the string pointed to by the <i>lpAgentAddress</i> parameter, should conform to one of the following forms.
     * 					
     * 
     * <table>
     * <tr>
     * <th>Name/Address</th>
     * <th>Form (example)</th>
     * </tr>
     * <tr>
     * <td>Host Name</td>
     * <td>merlin or merlin.microsoft.com</td>
     * </tr>
     * <tr>
     * <td>IPv4 Address</td>
     * <td>157.57.8.160</td>
     * </tr>
     * <tr>
     * <td>IPv6 Address</td>
     * <td>3ffe:8311:ffff::b3ff:fe88:c33</td>
     * </tr>
     * <tr>
     * <td>MAC Address</td>
     * <td>00aa00bbccdd</td>
     * </tr>
     * <tr>
     * <td>IPX Address</td>
     * <td>00006112.00aa00bbccdd</td>
     * </tr>
     * </table>
     *  
     * 
     * Applications should not use the <b>LPSNMP_MGR_SESSION</b> pointer that is returned by this function to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrrequest">SnmpMgrRequest</a> function in the context of a different thread.
     * @param {Pointer<Byte>} lpAgentAddress Pointer to a <b>null</b>-terminated string that specifies a host name or an IP address. The host name must resolve to an IP address, an IPX address (in 8.12 notation), or an ethernet address. See the Remarks section for the acceptable forms for host names and IP addresses.
     * @param {Pointer<Byte>} lpAgentCommunity Pointer to a <b>null</b>-terminated string that specifies the SNMP community name to use when communicating with the agent that is identified by the <i>lpAgentAddress</i> parameter.
     * @param {Integer} nTimeOut Specifies the communications time-out in milliseconds.
     * @param {Integer} nRetries Specifies the communications retry count. The time-out that is specified in the <i>nTimeOut</i> parameter is doubled each time that a retry attempt is transmitted.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to an <b>LPSNMP_MGR_SESSION</b> structure. This structure is used internally and the programmer should not alter it. For more information, see the following Remarks section.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return the SNMP_MEM_ALLOC_ERROR error code, which indicates a memory allocation error.
     * 
     * This function may also return Windows Sockets error codes.
     * @see https://learn.microsoft.com/windows/win32/api/mgmtapi/nf-mgmtapi-snmpmgropen
     * @since windows5.0
     */
    static SnmpMgrOpen(lpAgentAddress, lpAgentCommunity, nTimeOut, nRetries) {
        lpAgentAddress := lpAgentAddress is String? StrPtr(lpAgentAddress) : lpAgentAddress
        lpAgentCommunity := lpAgentCommunity is String? StrPtr(lpAgentCommunity) : lpAgentCommunity

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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> can also return one of the following error codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/mgmtapi/nf-mgmtapi-snmpmgrctl
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
     * @remarks
     * <b>Windows Server 2003:  </b>SNMP manager applications can call 
     * <b>SnmpMgrClose</b> with a <b>NULL</b><i>session</i> parameter to clean up the resources that are associated with a successful call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrtraplisten">SnmpMgrTrapListen</a> function. Note, however, that if your application is a DLL, it should not call 
     * <b>SnmpMgrClose</b> from its 
     * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> entry-point function.<p class="note"><b>SnmpMgrClose</b> must not be called when the application DLL is in the process of unloading.
     * 
     * 
     * 
     * <b>Windows Server 2003:  </b><b>SnmpMgrClose</b> takes longer to execute under  Windows Server 2003 when compared to an identical call under Windows 2000. Specifically, a call to this API takes up to a second to execute under Windows Server 2003, whereas the same call takes around .3 milliseconds under Windows 2000. this may cause performance problems for Windows Server 2003 SNMP applications that call  <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgropen">SnmpMgrOpen</a> and <b>SnmpMgrClose</b> frequently.
     * 
     * <p class="note">To address this problem,  create an extra SNMP manager session by calling <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgropen">SnmpMgrOpen</a> on the local host during application startup, and keep it open for the duration of the application's lifetime. Closing the session manager will close all associated sessions, requiring only one call to <b>SnmpMgrClose</b>.
     * 
     * 
     * 
     * <b>Windows Server 2003 with SP1:  </b>The above issue does not apply to Windows 2003 Service Pack 1.
     * @param {Pointer<Void>} session Pointer to an internal structure that specifies the session to close. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * 
     *  This function may return Windows Sockets error codes.
     * @see https://learn.microsoft.com/windows/win32/api/mgmtapi/nf-mgmtapi-snmpmgrclose
     * @since windows5.0
     */
    static SnmpMgrClose(session) {
        result := DllCall("mgmtapi.dll\SnmpMgrClose", "ptr", session, "int")
        return result
    }

    /**
     * The SnmpMgrRequest function requests the specified operation be performed with the specified agent. This function is an element of the SNMP Management API.
     * @remarks
     * Retries and time-outs are supplied to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgropen">SnmpMgrOpen</a> function. Each variable in the variable bindings list must be initialized to type ASN_NULL for Get and Get Next requests.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which may return one of the following error codes.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-select">select</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mgmtapi/nf-mgmtapi-snmpmgrrequest
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
     * @remarks
     * If the function succeeds, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputiloidfree">SnmpUtilOidFree</a> function to free the memory allocated for the converted object identifier.
     * 
     * If an application passes a valid object identifier to 
     * <b>SnmpMgrStrToOid</b>, yet is unable to obtain the requested variable, then the syntax of the system group and object identifier is incorrect. This occurs because 
     * <b>SnmpMgrStrToOid</b> assumes that the object identifier is under the Internet MIB of the management subtree.
     * 
     * You must always precede the object identifier with a period (.) to obtain the correct system group (for example, ".1.3.6.1.2.1.1"). If an application passes the variable "1.3.6.1.2.1.1", 
     * <b>SnmpMgrStrToOid</b> cannot interpret the object identifier correctly.
     * @param {Pointer<Byte>} string Pointer to a null-terminated string to convert.
     * @param {Pointer<AsnObjectIdentifier>} oid Pointer to an object identifier variable to receive the converted value.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/mgmtapi/nf-mgmtapi-snmpmgrstrtooid
     * @since windows5.0
     */
    static SnmpMgrStrToOid(string, oid) {
        string := string is String? StrPtr(string) : string

        result := DllCall("mgmtapi.dll\SnmpMgrStrToOid", "ptr", string, "ptr", oid, "int")
        return result
    }

    /**
     * The SnmpMgrOidToStr function converts an internal object identifier structure to its string representation. This function is an element of the SNMP Management API.
     * @remarks
     * If the function succeeds, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemfree">SnmpUtilMemFree</a> function to free the memory allocated for the converted string.
     * @param {Pointer<AsnObjectIdentifier>} oid Pointer to an object identifier variable to convert.
     * @param {Pointer<Byte>} string Pointer to a null-terminated string to receive the converted value.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/mgmtapi/nf-mgmtapi-snmpmgroidtostr
     * @since windows5.0
     */
    static SnmpMgrOidToStr(oid, string) {
        result := DllCall("mgmtapi.dll\SnmpMgrOidToStr", "ptr", oid, "ptr", string, "int")
        return result
    }

    /**
     * The SnmpMgrTrapListen function registers the ability of an SNMP manager application to receive SNMP traps from the SNMP Trap Service. This function is an element of the SNMP Management API.
     * @remarks
     * It is important to note that for users who are not administrators, the 
     * <b>SnmpMgrTrapListen</b> function succeeds only if the SNMP trap service has been started.
     * 
     * The application must always call the 
     * <b>SnmpMgrTrapListen</b> function before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrgettrap">SnmpMgrGetTrap</a> function. This is because the event handle pointed to by the <i>phTrapAvailable</i> parameter enables the event-driven acquisition of SNMP traps. The SNMP Management API signals an application's event when the SNMP Trap Service delivers a trap.
     * 
     * The application can also poll the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrgettrap">SnmpMgrGetTrap</a> function for traps at regular intervals. In this case, the application should repeatedly call 
     * <b>SnmpMgrGetTrap</b> until the function returns zero.
     * 
     * <b>Windows Server 2003:  </b>SNMP manager applications can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrclose">SnmpMgrClose</a> with a <b>NULL</b><i>session</i> parameter to clean up resources associated with a successful call to the 
     * <b>SnmpMgrTrapListen</b> function. Note, however, that if your application is a DLL, it should not call 
     * <b>SnmpMgrClose</b> from its 
     * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> entry-point function.
     * @param {Pointer<Void>} phTrapAvailable Pointer to an event handle to receive an indication that there are traps available, and that the application should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrgettrap">SnmpMgrGetTrap</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which may return any of the following error codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/mgmtapi/nf-mgmtapi-snmpmgrtraplisten
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
     * @remarks
     * The application must always call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrtraplisten">SnmpMgrTrapListen</a> function before calling the 
     * <b>SnmpMgrGetTrap</b> function. This is because the event handle pointed to by the <i>phTrapAvailable</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrtraplisten">SnmpMgrTrapListen</a> function enables the event-driven acquisition of SNMP traps. The SNMP Management API signals an application's event when the SNMP Trap Service delivers a trap.
     * 
     * The application can also poll the 
     * <b>SnmpMgrGetTrap</b> function for traps at regular intervals. In this case, the application should repeatedly call 
     * <b>SnmpMgrGetTrap</b> until the function returns zero.
     * @param {Pointer<AsnObjectIdentifier>} enterprise Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-asnobjectidentifier">AsnObjectIdentifier</a> structure to receive the enterprise that generated the SNMP trap.
     * @param {Pointer<AsnOctetString>} IPAddress Pointer to a variable to receive the address of the agent that generated the SNMP trap.
     * @param {Pointer<UInt32>} genericTrap 
     * @param {Pointer<Int32>} specificTrap Pointer to a variable to receive an indication of the specific trap generated.
     * @param {Pointer<UInt32>} timeStamp Pointer to a variable to receive the time stamp.
     * @param {Pointer<SnmpVarBindList>} variableBindings Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/ns-snmp-snmpvarbindlist">SnmpVarBindList</a> structure to receive the variable bindings list.
     * @returns {Integer} If the function returns a trap, the return value is <b>TRUE</b>. The code for the error can be retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> immediately after the call.
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
     * @see https://learn.microsoft.com/windows/win32/api/mgmtapi/nf-mgmtapi-snmpmgrgettrap
     * @since windows5.0
     */
    static SnmpMgrGetTrap(enterprise, IPAddress, genericTrap, specificTrap, timeStamp, variableBindings) {
        result := DllCall("mgmtapi.dll\SnmpMgrGetTrap", "ptr", enterprise, "ptr", IPAddress, "uint*", genericTrap, "int*", specificTrap, "uint*", timeStamp, "ptr", variableBindings, "int")
        return result
    }

    /**
     * The SnmpMgrGetTrapEx function returns outstanding trap data that the caller has not received if trap reception is enabled.
     * @remarks
     * The application must always call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrtraplisten">SnmpMgrTrapListen</a> function before calling the 
     * <b>SnmpMgrGetTrapEx</b> function. This is because the event handle that is pointed to by the <i>phTrapAvailable</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgmtapi/nf-mgmtapi-snmpmgrtraplisten">SnmpMgrTrapListen</a> function enables the event-driven acquisition of SNMP traps. The SNMP Management API signals an application event when the SNMP Trap Service delivers a trap.
     * 
     * The application can also poll the 
     * <b>SnmpMgrGetTrapEx</b> function for traps at regular intervals. In this case, the application should repeatedly call 
     * <b>SnmpMgrGetTrapEx</b> until the function returns zero.
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
     * @returns {Integer} If the function returns a trap, the return value is nonzero.
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
     * @see https://learn.microsoft.com/windows/win32/api/mgmtapi/nf-mgmtapi-snmpmgrgettrapex
     * @since windows5.0
     */
    static SnmpMgrGetTrapEx(enterprise, agentAddress, sourceAddress, genericTrap, specificTrap, community, timeStamp, variableBindings) {
        result := DllCall("mgmtapi.dll\SnmpMgrGetTrapEx", "ptr", enterprise, "ptr", agentAddress, "ptr", sourceAddress, "uint*", genericTrap, "int*", specificTrap, "ptr", community, "uint*", timeStamp, "ptr", variableBindings, "int")
        return result
    }

    /**
     * The WinSNMP SnmpGetTranslateMode function returns the current setting of the entity and context translation mode to a WinSNMP application.
     * @remarks
     * The entity and context translation mode affects calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtocontext">SnmpStrToContext</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcontexttostr">SnmpContextToStr</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpentitytostr">SnmpEntityToStr</a> functions. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/setting-the-entity-and-context-translation-mode">Setting the Entity and Context Translation Mode</a>.
     * @param {Pointer<UInt32>} nTranslateMode 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. If 
     * <b>SnmpGetTranslateMode</b> fails, the value of the <i>nTranslateMode</i> parameter has no meaning for the application. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpgettranslatemode
     * @since windows5.0
     */
    static SnmpGetTranslateMode(nTranslateMode) {
        result := DllCall("wsnmp32.dll\SnmpGetTranslateMode", "uint*", nTranslateMode, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetTranslateMode function enables a WinSNMP application to change the entity and context translation mode. The entity and context translation mode affects the interpretation and return of WinSNMP input and output string parameters.
     * @remarks
     * The new entity and context translation mode affects subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtocontext">SnmpStrToContext</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcontexttostr">SnmpContextToStr</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpentitytostr">SnmpEntityToStr</a> functions. The WinSNMP application can change the entity and context translation mode again by making another call to 
     * <b>SnmpSetTranslateMode</b> with a different <i>nTranslateMode</i> value.
     * 
     * For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/setting-the-entity-and-context-translation-mode">Setting the Entity and Context Translation Mode</a>.
     * @param {Integer} nTranslateMode 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpsettranslatemode
     * @since windows5.0
     */
    static SnmpSetTranslateMode(nTranslateMode) {
        result := DllCall("wsnmp32.dll\SnmpSetTranslateMode", "uint", nTranslateMode, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpGetRetransmitMode function returns the current setting of the retransmission mode to a WinSNMP application.
     * @remarks
     * Typically a WinSNMP application, rather than an agent application, calls the 
     * <b>SnmpGetRetransmitMode</b> function. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-retransmission">About Retransmission</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/managing-the-retransmission-policy">Managing the Retransmission Policy</a>.
     * @param {Pointer<UInt32>} nRetransmitMode 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. If 
     * <b>SnmpGetRetransmitMode</b> fails, the value of the <i>nRetransmitMode</i> parameter has no meaning for the application. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpgetretransmitmode
     * @since windows5.0
     */
    static SnmpGetRetransmitMode(nRetransmitMode) {
        result := DllCall("wsnmp32.dll\SnmpGetRetransmitMode", "uint*", nRetransmitMode, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetRetransmitMode function enables a WinSNMP application to set the retransmission mode.
     * @remarks
     * Typically a WinSNMP manager application, rather than an agent application, calls the 
     * <b>SnmpSetRetransmitMode</b> function.
     * 
     * If a WinSNMP application sets the retransmission mode to SNMPAPI_OFF, the implementation does not initiate retransmission attempts for new SNMP communications operations. The new setting affects all subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a> function, until the WinSNMP application sets the retransmission mode back to SNMPAPI_ON.
     * 
     * Calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcancelmsg">SnmpCancelMsg</a> function is equivalent to calling the 
     * <b>SnmpSetRetransmitMode</b> function, for a specific SNMP message, with the retransmission mode equal to SNMPAPI_OFF.
     * 
     * <div class="alert"><b>Note</b>  If the implementation returns the error SNMPAPI_MODE_INVALID to a call to 
     * <b>SnmpSetRetransmitMode</b>, the WinSNMP application must execute the retransmission policy.</div>
     * <div> </div>
     * For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-retransmission">About Retransmission</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/managing-the-retransmission-policy">Managing the Retransmission Policy</a>.
     * @param {Integer} nRetransmitMode 
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpsetretransmitmode
     * @since windows5.0
     */
    static SnmpSetRetransmitMode(nRetransmitMode) {
        result := DllCall("wsnmp32.dll\SnmpSetRetransmitMode", "uint", nRetransmitMode, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpGetTimeout function returns the time-out value, in hundredths of a second, for the transmission of SNMP message requests.
     * @remarks
     * Typically a WinSNMP application, rather than an agent application, calls the 
     * <b>SnmpGetTimeout</b> function.
     * 
     * The time-out period is the interval between the application's call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a> function and its call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function.
     * 
     * A WinSNMP application can modify the time-out value with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsettimeout">SnmpSetTimeout</a> function.
     * 
     * The WinSNMP application can monitor the value of the <i>nActualRetry</i> parameter and compare it to the value of the <i>nPolicyRetry</i> parameter to optimize transmission performance. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-retransmission">About Retransmission</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/managing-the-retransmission-policy">Managing the Retransmission Policy</a>.
     * @param {Pointer} hEntity Handle to the destination management entity of interest.
     * @param {Pointer<UInt32>} nPolicyTimeout Pointer to an integer variable to receive the time-out value, in hundredths of a second, for the specified management entity. This is a value that the Microsoft WinSNMP implementation stores in a database. If you do not need the information returned in this parameter, <i>nPolicyRetry</i> must be a <b>NULL</b> pointer.
     * @param {Pointer<UInt32>} nActualTimeout Pointer to an integer variable to receive the last actual or estimated response interval for the destination entity, as reported by the implementation. If you do not need the information returned in this parameter, <i>nActualRetry</i> must be a <b>NULL</b> pointer. If this parameter is a valid pointer, the function returns 0. For additional information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpgettimeout
     * @since windows5.0
     */
    static SnmpGetTimeout(hEntity, nPolicyTimeout, nActualTimeout) {
        result := DllCall("wsnmp32.dll\SnmpGetTimeout", "ptr", hEntity, "uint*", nPolicyTimeout, "uint*", nActualTimeout, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetTimeout function enables a WinSNMP application to change the time-out value for the transmission of SNMP message requests.
     * @remarks
     * Typically a WinSNMP manager application, rather than an agent application, calls the 
     * <b>SnmpSetTimeout</b> function.
     * 
     * For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-retransmission">About Retransmission</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/managing-the-retransmission-policy">Managing the Retransmission Policy</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpsettimeout
     * @since windows5.0
     */
    static SnmpSetTimeout(hEntity, nPolicyTimeout) {
        result := DllCall("wsnmp32.dll\SnmpSetTimeout", "ptr", hEntity, "uint", nPolicyTimeout, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpGetRetry function returns the retry count value, in units, for the retransmission of SNMP message requests. The retry count applies to calls that a WinSNMP application makes to the SnmpSendMsg function for a specified management entity.
     * @remarks
     * Typically a WinSNMP application, rather than an agent application, calls the 
     * <b>SnmpGetRetry</b> function.
     * 
     * A WinSNMP application can modify the retry count value with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsetretry">SnmpSetRetry</a> function.
     * 
     * The WinSNMP application can monitor the value of the <i>nActualRetry</i> parameter and compare it to the value of the <i>nPolicyRetry</i> parameter to optimize transmission performance. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-retransmission">About Retransmission</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/managing-the-retransmission-policy">Managing the Retransmission Policy</a>.
     * @param {Pointer} hEntity Handle to the destination management entity of interest.
     * @param {Pointer<UInt32>} nPolicyRetry Pointer to an unsigned long integer variable to receive the retry count value for the specified management entity. This is a value that the Microsoft WinSNMP implementation stores in a database. If you do not need the information returned in this parameter, <i>nPolicyRetry</i> must be a <b>NULL</b> pointer.
     * @param {Pointer<UInt32>} nActualRetry Pointer to an unsigned long integer variable to receive the last actual or estimated retry count for the destination entity, as reported by the implementation. If you do not need the information returned in this parameter, <i>nActualRetry</i> must be a <b>NULL</b> pointer. If this parameter is a valid pointer, the function returns 0. For additional information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpgetretry
     * @since windows5.0
     */
    static SnmpGetRetry(hEntity, nPolicyRetry, nActualRetry) {
        result := DllCall("wsnmp32.dll\SnmpGetRetry", "ptr", hEntity, "uint*", nPolicyRetry, "uint*", nActualRetry, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetRetry function enables a WinSNMP application to change the retry count value for the retransmission of SNMP message requests.
     * @remarks
     * Typically a WinSNMP manager application, rather than an agent application, calls the 
     * <b>SnmpSetRetry</b> function.
     * 
     * For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-retransmission">About Retransmission</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/managing-the-retransmission-policy">Managing the Retransmission Policy</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpsetretry
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpgetvendorinfo
     * @since windows5.0
     */
    static SnmpGetVendorInfo(vendorInfo) {
        result := DllCall("wsnmp32.dll\SnmpGetVendorInfo", "ptr", vendorInfo, "uint")
        return result
    }

    /**
     * The SnmpStartup function notifies the Microsoft WinSNMP implementation that the WinSNMP application requires the implementation's services.
     * @remarks
     * A WinSNMP application must call the 
     * <b>SnmpStartup</b> function successfully at least once, before it calls any other WinSNMP function. If a WinSNMP application does call another WinSNMP function, before it successfully calls 
     * <b>SnmpStartup</b>, the implementation returns the error SNMPAPI_NOT_INITIALIZED.
     * 
     * The WinSNMP application can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> for error information, or retry 
     * <b>SnmpStartup</b> if a call to the 
     * <b>SnmpStartup</b> function fails. When 
     * <b>SnmpStartup</b> returns SNMPAPI_FAILURE, and a subsequent call to 
     * <b>SnmpGetLastError</b> returns SNMP_ALLOC_ERROR, the WinSNMP application can elect to wait. It can retry the call to 
     * <b>SnmpStartup</b> when the implementation has adequate free resources.
     * 
     * A WinSNMP application can call 
     * <b>SnmpStartup</b> multiple times. For example, it may need to retry the function call for the reasons discussed preceding. A WinSNMP application must also call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> at least once, as the last WinSNMP function call before it terminates. Multiple 
     * <b>SnmpStartup</b> calls do not require multiple 
     * <b>SnmpCleanup</b> calls.
     * 
     * For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/levels-of-snmp-support">Levels of SNMP Support</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-snmp-versions">About SNMP Versions</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpstartup
     * @since windows5.0
     */
    static SnmpStartup(nMajorVersion, nMinorVersion, nLevel, nTranslateMode, nRetransmitMode) {
        result := DllCall("wsnmp32.dll\SnmpStartup", "uint*", nMajorVersion, "uint*", nMinorVersion, "uint*", nLevel, "uint*", nTranslateMode, "uint*", nRetransmitMode, "uint")
        return result
    }

    /**
     * The SnmpCleanup function informs the Microsoft WinSNMP implementation that the calling WinSNMP application no longer requires the implementation's services.
     * @remarks
     * Before the WinSNMP application calls 
     * <b>SnmpCleanup</b>, it should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> function once for each session the implementation opens as a result of a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a> function.
     * 
     * When a WinSNMP application calls the 
     * <b>SnmpCleanup</b> function, the implementation deallocates all resources allocated to the application. However, it is recommended that a WinSNMP application free the specific resources that the implementation allocates for it with the WinSNMP function that corresponds to the resource. For additional information about freeing individual resources, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreeentity">SnmpFreeEntity</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreevbl">SnmpFreeVbl</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreecontext">SnmpFreeContext</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreepdu">SnmpFreePdu</a>.
     * 
     * If a WinSNMP application must perform an emergency exit, and it calls 
     * <b>SnmpCleanup</b> without freeing individual resources and without calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> for every open session, the implementation deallocates all resources allocated to the WinSNMP application. However, to enable this functionality in the implementation, the application must still call 
     * <b>SnmpCleanup</b>.
     * 
     * <b>SnmpCleanup</b> must not be called when the application DLL is in the process of unloading.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS. Until the WinSNMP application successfully recalls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function, any other call to a WinSNMP function returns SNMPAPI_FAILURE, with an extended error code of SNMPAPI_NOT_INITIALIZED.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE, but the WinSNMP application does not need to retry the call to 
     * <b>SnmpCleanup</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its<i> session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpcleanup
     * @since windows5.0
     */
    static SnmpCleanup() {
        result := DllCall("wsnmp32.dll\SnmpCleanup", "uint")
        return result
    }

    /**
     * The SnmpOpen function requests the Microsoft WinSNMP implementation to open a session for the WinSNMP application.
     * @remarks
     * The 
     * <b>SnmpOpen</b> function returns a unique handle to each open WinSNMP session within the calling WinSNMP application. The application must use the session handle that 
     * <b>SnmpOpen</b> returns in other WinSNMP function calls to facilitate allocation and deallocation of resources by the implementation. When the implementation allocates resources to an individual session, it performs an orderly release of resources in response to a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> for the session.
     * 
     * The 
     * <b>SnmpOpen</b> function passes to the implementation the handle to an application window and a notification message identifier. If the <i>wParam</i> component of the notification message specified by the <i>wMsg</i> parameter is equal to zero, the WinSNMP application must retrieve the incoming protocol data unit (PDU). The application does this by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function with the session handle returned by 
     * <b>SnmpOpen</b>. If the <i>wParam</i> parameter of the notification message is not equal to zero, it represents a WinSNMP error code. The error code applies to the PDU identified by the request identifier in the <i>lParam</i> parameter of the notification message.
     * 
     * One WinSNMP application can open multiple WinSNMP sessions. If an application opens multiple sessions using the same window handle, it is recommended that the WinSNMP application specify a unique <i>wMsg</i> parameter for each session.
     * 
     * It is recommended that a WinSNMP application call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> function once for each session that the implementation opens as a result of a call to the 
     * <b>SnmpOpen</b> function. If a WinSNMP application terminates unexpectedly, it must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> before it terminates to enable the implementation to deallocate all resources. The implementation treats one 
     * <b>SnmpCleanup</b> call as if it were a series of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> calls, one call for each session the implementation opens as a result of a call to 
     * <b>SnmpOpen</b>.
     * 
     * For information about opening a WinSNMP session and specifying the method used to inform the session of available SNMP messages and asynchronous events, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a>. When you call 
     * <b>SnmpCreateSession</b> you can specify a window notification message or an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nc-winsnmp-snmpapi_callback">SNMPAPI_CALLBACK</a> function to notify the session.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-sessions">WinSNMP Sessions</a>.
     * @param {Pointer<Void>} hWnd Handle to a window of the WinSNMP application to notify when an asynchronous request completes, or when trap notification occurs.
     * @param {Integer} wMsg Specifies an unsigned integer that identifies the notification message to send to the WinSNMP application window.
     * @returns {Pointer} If the function succeeds, the return value is a handle that identifies the WinSNMP session that the implementation opens for the calling application.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpopen
     * @since windows5.0
     */
    static SnmpOpen(hWnd, wMsg) {
        result := DllCall("wsnmp32.dll\SnmpOpen", "ptr", hWnd, "uint", wMsg, "ptr")
        return result
    }

    /**
     * The SnmpClose function enables the Microsoft WinSNMP implementation to deallocate memory, resources, and data structures associated with a WinSNMP session.
     * @remarks
     * It is recommended that a WinSNMP application call the 
     * <b>SnmpClose</b> function once for each session that the application opened using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a> function. If a WinSNMP application terminates unexpectedly, it must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> before it terminates to enable the implementation to deallocate all resources. The implementation processes one 
     * <b>SnmpCleanup</b> call as if it were a series of 
     * <b>SnmpClose</b> calls, one call for each session opened as a result of a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a>.
     * 
     * When the implementation closes a session it discards all outstanding incoming and outgoing asynchronous requests and replies for the session. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-sessions">WinSNMP Sessions</a>.
     * @param {Pointer} session Handle to the WinSNMP session to close.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpclose
     * @since windows5.0
     */
    static SnmpClose(session) {
        result := DllCall("wsnmp32.dll\SnmpClose", "ptr", session, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the SnmpSendMsg function to request that the Microsoft WinSNMP implementation transmit an SNMP protocol data unit (PDU), in the form of an SNMP message.
     * @remarks
     * The 
     * <b>SnmpSendMsg</b> function executes asynchronously and therefore returns immediately.
     * 
     * The implementation notifies the WinSNMP application when the asynchronous request is completed. The implementation does this by sending a notification message to the window specified by the <i>wMsg</i> and <i>hWnd</i> parameters, respectively, in the initial call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a> for the session. When the application window receives the notification message, the WinSNMP application must retrieve the incoming PDU. The application does this by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function with the session handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a>.
     * 
     * When a WinSNMP application calls the 
     * <b>SnmpSendMsg</b> function, the implementation determines which network transport protocol and SNMP version framework to use to complete the transmission request. The implementation determines this by matching its capabilities with properties associated with the requesting session and with the target management entity. This information is available from values in the implementation's database.
     * 
     * If a WinSNMP application requests functionality that is available under the SNMP version 2C framework (SNMPv2C), but the target entity uses the SNMP version 1 framework (SNMPv1), the implementation attempts to translate the request to SNMPv1. To do this, the implementation uses the procedures defined in RFC1908, "Coexistence between Version 1 and Version 2 of the Internet-standard Network Management Framework." If translation is not possible, 
     * <b>SnmpSendMsg</b> fails with the extended error code SNMPAPI_OPERATION_INVALID. This situation occurs, for example, when an application attempts to send a PDU with the <b>SNMP_PDU_InformRequest</b> data type to an SNMPv1 destination entity.
     * 
     * For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-programming-tasks">WinSNMP Programming Tasks</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-snmp-messages">About SNMP Messages</a>.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer} srcEntity Handle to the management entity that initiates the request to send the SNMP message.
     * @param {Pointer} dstEntity Handle to the target entity that will respond to the SNMP request.
     * @param {Pointer} context Handle to the context, (a set of managed object resources), that the target management entity controls.
     * @param {Pointer} PDU Handle to the protocol data unit that contains the SNMP operation request.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/network-transport-errors">Network Transport Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpsendmsg
     * @since windows5.0
     */
    static SnmpSendMsg(session, srcEntity, dstEntity, context, PDU) {
        result := DllCall("wsnmp32.dll\SnmpSendMsg", "ptr", session, "ptr", srcEntity, "ptr", dstEntity, "ptr", context, "ptr", PDU, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpRecvMsg function retrieves the results of a completed asynchronous request submitted by a call to the SnmpSendMsg function, in the form of an SNMP message.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a> function passes an application window handle and notification message identifier to the Microsoft WinSNMP implementation. When the application window receives the notification message specified by the <i>wMsg</i> parameter, the WinSNMP application must call the 
     * <b>SnmpRecvMsg</b> function with the session handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a> to retrieve an incoming protocol data unit (PDU). For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-snmp-messages">About SNMP Messages</a>.
     * 
     * The 
     * <b>SnmpRecvMsg</b> function instantiates four objects and allocates their resources: two entity handles, a context handle, and a PDU handle. The handle to the variable bindings list component of the returned PDU is not instantiated until the WinSNMP application calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetpdudata">SnmpGetPduData</a> function. When it no longer needs the resources 
     * <b>SnmpRecvMsg</b> returns, the WinSNMP application must free the individual resources using the WinSNMP function that corresponds to the resource. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreepdu">SnmpFreePdu</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreeentity">SnmpFreeEntity</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreecontext">SnmpFreeContext</a>.
     * 
     * When the implementation receives traps from an entity operating under the SNMP version 1 framework (SNMPv1), it translates the traps to the SNMP version 2C (SNMPv2C) format. Therefore, when 
     * <b>SnmpRecvMsg</b> delivers a trap it is always in the SNMPv2C format. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/translating-traps-from-snmpv1-to-snmpv2c">Translating Traps from SNMPv1 to SNMPv2C</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-programming-tasks">WinSNMP Programming Tasks</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/network-transport-errors">Network Transport Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmprecvmsg
     * @since windows5.0
     */
    static SnmpRecvMsg(session, srcEntity, dstEntity, context, PDU) {
        result := DllCall("wsnmp32.dll\SnmpRecvMsg", "ptr", session, "ptr*", srcEntity, "ptr*", dstEntity, "ptr*", context, "ptr*", PDU, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpRegister function registers or unregisters a WinSNMP application for trap and notification reception. The application can register and receive traps and notifications, or unregister and disable traps and notifications.
     * @remarks
     * Typically a WinSNMP manager application, rather than an agent application, calls the 
     * <b>SnmpRegister</b> function.
     * 
     * It is important to note that for users who are not administrators, the 
     * <b>SnmpRegister</b> function succeeds on Windows 2000 and Windows XP only if the SNMP trap service has been started.
     * 
     * If a WinSNMP application passes <b>NULL</b> in a call to the 
     * <b>SnmpRegister</b> function in the <i>srcEntity</i>, <i>dstEntity</i>, <i>context</i>, or <i>notification</i> parameters, the implementation does not use that parameter to filter traps and notifications from reaching the WinSNMP application. If an application passes <b>NULL</b> in all of the parameters mentioned previously, the implementation delivers all received notifications to the session.
     * 
     * If a WinSNMP application registers to receive a specific type of trap or notification, it must define an object identifier, that is, an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure, that corresponds to that type of trap. The <i>notification</i> parameter must point to this structure. RFC 1907, "Management Information Base for Version 2 of the Simple Network Management Protocol (SNMPv2)," defines trap and notification object identifiers. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/managing-traps-and-notifications">Managing Traps and Notifications</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/translating-traps-from-snmpv1-to-snmpv2c">Translating Traps from SNMPv1 to SNMPv2C</a>.
     * 
     * The implementation uses the value of the <i>notification</i> parameter as a pattern to match against received traps and notifications. For example, if the WinSNMP application passes n number of subidentifiers in the <i>notification</i> parameter, and the first n subidentifiers in a received trap match all the passed subidentifiers, then the trap object identifier is a match. If a received trap has fewer subidentifiers than n, the object identifier does not match. If there is a match, the implementation sends the trap or notification to the WinSNMP application.
     * 
     * If any or all of the <i>dstEntity</i>, <i>srcEntity</i>, or <i>context</i> parameters are <b>NULL</b>, the implementation may need to allocate resources on a subsequent call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function, for that function's corresponding parameters. When the WinSNMP application no longer needs the resources 
     * <b>SnmpRecvMsg</b> returns, the application must free the individual resources with the function that corresponds to the resource. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreeentity">SnmpFreeEntity</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreecontext">SnmpFreeContext</a>.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/multiple-trap-registrations">Multiple Trap Registrations</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/network-transport-errors">Network Transport Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpregister
     * @since windows5.0
     */
    static SnmpRegister(session, srcEntity, dstEntity, context, notification, state) {
        result := DllCall("wsnmp32.dll\SnmpRegister", "ptr", session, "ptr", srcEntity, "ptr", dstEntity, "ptr", context, "ptr", notification, "uint", state, "uint")
        return result
    }

    /**
     * The SnmpCreateSession function requests the Microsoft WinSNMP implementation to open a session for the WinSNMP application.
     * @remarks
     * The 
     * <b>SnmpCreateSession</b> function returns a unique handle to each open WinSNMP session within the calling WinSNMP application. The application must use the session handle that 
     * <b>SnmpCreateSession</b> returns in other WinSNMP function calls to facilitate allocation and deallocation of resources by the implementation.
     * 
     * It is recommended that a WinSNMP application call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> function once for each session that the implementation opens as a result of a call to the 
     * <b>SnmpCreateSession</b> function. If a WinSNMP application terminates unexpectedly, it must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> before it terminates to enable the implementation to deallocate all resources.
     * 
     * <h3><a id="Callback_Notifications"></a><a id="callback_notifications"></a><a id="CALLBACK_NOTIFICATIONS"></a>Callback Notifications</h3>
     * If the <i>fCallback</i> parameter is not <b>NULL</b> on a successful call to the 
     * <b>SnmpCreateSession</b> function, the implementation alerts the session to notifications using the callback function specified by the <i>fCallback</i> parameter.
     * 
     * Following is an example of a call to the 
     * <b>SnmpCreateSession</b> function, requesting that the implementation signal the session about messages and events using callback notifications.
     * 
     * <c>hSession = SnmpCreateSession (0, 0, myFunc, &lt;NULL|myData&gt;);</c>
     * 
     * <h3><a id="Window_Notification_Messages"></a><a id="window_notification_messages"></a><a id="WINDOW_NOTIFICATION_MESSAGES"></a>Window Notification Messages</h3>
     * The 
     * <b>SnmpCreateSession</b> function passes to the implementation the handle to an application window and a notification message identifier. When the application window receives the notification message specified by the <i>wMsg</i> parameter, the WinSNMP application must retrieve the incoming protocol data unit (PDU). The application does this by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function with the session handle returned by 
     * <b>SnmpCreateSession</b>.
     * 
     * One WinSNMP application can open multiple WinSNMP sessions. If an application opens multiple sessions using the same window handle, it is recommended that the WinSNMP application specify a unique <i>wMsg</i> parameter for each session.
     * 
     * Following is an example of a call to the 
     * <b>SnmpCreateSession</b> function, requesting that the implementation signal the session about messages and events using window notification messages.
     * 
     * <c>hSession = SnmpCreateSession (myWnd, myMsg, NULL, NULL);</c>
     * @param {Pointer<Void>} hWnd Handle to a window of the WinSNMP application to notify when an asynchronous request completes, or when trap notification occurs. This parameter is required for window notification messages for the session.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpcreatesession
     * @since windows5.0
     */
    static SnmpCreateSession(hWnd, wMsg, fCallBack, lpClientData) {
        result := DllCall("wsnmp32.dll\SnmpCreateSession", "ptr", hWnd, "uint", wMsg, "ptr", fCallBack, "ptr", lpClientData, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpListen function registers a WinSNMP application as an SNMP agent.
     * @remarks
     * When you specify an entity, you explicitly specify the address family, interface address, and port for the entity. This is because WinSNMP assigns these attributes to each WinSNMP entity as a result of a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> function. The implementation uses the address and port settings currently assigned to the entity specified by the <i>hEntity</i> parameter when it sends notifications to the agent application. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsetport">SnmpSetPort</a>.
     * 
     * When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> function for a WinSNMP session and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> function for a WinSNMP application, you must release all ports associated with WinSNMP agent applications.
     * 
     * For more information about SNMP management applications and agent applications, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/registering-an-snmp-agent-application">Registering an SNMP Agent Application</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-snmp">About SNMP</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmplisten
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
     * @remarks
     * Calling the 
     * <b>SnmpCancelMsg</b> function is equivalent to calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsetretransmitmode">SnmpSetRetransmitMode</a> function, for a specific SNMP message, with the retransmission mode equal to SNMPAPI_OFF.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/canceling-retransmission">Canceling Retransmission</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/managing-the-retransmission-policy">Managing the Retransmission Policy</a>.
     * @param {Pointer} session Handle to the WinSNMP session that submitted the SNMP request message (PDU) to be canceled.
     * @param {Integer} reqId Specifies a unique numeric value that identifies the PDU of interest. This parameter must match the request identifier (<b>request_id</b>) of the <i>PDU</i> parameter specified in the application's initial call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a> function.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpcancelmsg
     * @since windows5.0
     */
    static SnmpCancelMsg(session, reqId) {
        result := DllCall("wsnmp32.dll\SnmpCancelMsg", "ptr", session, "int", reqId, "uint")
        return result
    }

    /**
     * The SnmpStartupEx function notifies the Microsoft WinSNMP implementation that the WinSNMP application requires the implementation's services.
     * @remarks
     * A WinSNMP application must call the <b>SnmpStartupEx</b> 
     *    function successfully at least once, before it calls any other WinSNMP function. If a WinSNMP application  calls 
     *    another WinSNMP function before it successfully calls 
     *    <b>SnmpStartupEx</b>, the implementation returns the error 
     *    SNMPAPI_NOT_INITIALIZED.
     * 
     * The WinSNMP application can call 
     *    <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> for error information, or 
     *    retry <b>SnmpStartupEx</b> if a call to the 
     *    <b>SnmpStartupEx</b> function fails. When 
     *    <b>SnmpStartupEx</b> returns SNMPAPI_FAILURE, and a subsequent 
     *    call to <b>SnmpGetLastError</b> returns SNMP_ALLOC_ERROR, the 
     *    WinSNMP application can elect to wait. It can retry the call to 
     *    <b>SnmpStartupEx</b> when the implementation has adequate free 
     *    resources.
     * 
     * A WinSNMP application must call <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanupex">SnmpCleanupEx</a> for 
     *    each successful call to <b>SnmpStartupEx</b>. The WinSNMP 
     *    implementation performs the final cleanup where there are no outstanding successful calls to <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> or <b>SnmpStartupEx</b>.
     * 
     * For additional information, see 
     *    <a href="https://docs.microsoft.com/windows/desktop/SNMP/levels-of-snmp-support">Levels of SNMP Support</a> and 
     *    <a href="https://docs.microsoft.com/windows/desktop/SNMP/about-snmp-versions">About SNMP Versions</a>.
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
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a 
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartupex">SnmpStartupEx</a> function did not initialize correctly.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpstartupex
     * @since windows5.0
     */
    static SnmpStartupEx(nMajorVersion, nMinorVersion, nLevel, nTranslateMode, nRetransmitMode) {
        result := DllCall("wsnmp32.dll\SnmpStartupEx", "uint*", nMajorVersion, "uint*", nMinorVersion, "uint*", nLevel, "uint*", nTranslateMode, "uint*", nRetransmitMode, "uint")
        return result
    }

    /**
     * The SnmpCleanupEx function performs cleanup when there are no outstanding successful calls to SnmpStartup or SnmpStartupEx within a Windows SNMP (WinSNMP) application.
     * @remarks
     * Before the WinSNMP application calls 
     * <b>SnmpCleanupEx</b>, it should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> function once for each session the implementation opens as a result of a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a> function.
     * 
     * When a WinSNMP application calls the 
     * <b>SnmpCleanupEx</b> function, the implementation deallocates all resources allocated to the application if there are also no outstanding successful calls to  either <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartupex">SnmpStartupEx</a>. However, it is recommended that a WinSNMP application free the specific resources that the implementation allocates for it with the WinSNMP function that corresponds to the resource. For additional information about freeing individual resources, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreeentity">SnmpFreeEntity</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreevbl">SnmpFreeVbl</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreecontext">SnmpFreeContext</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreepdu">SnmpFreePdu</a>.
     * 
     * If a WinSNMP application must perform an emergency exit, and it calls 
     * <b>SnmpCleanupEx</b> without freeing individual resources and without calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> for every open session, the implementation deallocates all resources allocated to the WinSNMP application. However, to enable this functionality in the implementation, the application must still call 
     * <b>SnmpCleanupEx</b>.
     * 
     * <b>SnmpCleanupEx</b> must not be called when the application DLL is in the process of unloading.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS. Until the WinSNMP application successfully recalls the 
     * corresponding <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartupex">SnmpStartupEx</a> function and there are no additional outstanding successful calls to either <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> or <b>SnmpStartupEx</b>, any other call to a WinSNMP function within the same application returns SNMPAPI_FAILURE, with an extended error code of SNMPAPI_NOT_INITIALIZED.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE, but the WinSNMP application does not need to retry the call to 
     * <b>SnmpCleanupEx</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartupex">SnmpStartupEx</a> function did not complete successfully, or an unknown or undefined error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpcleanupex
     * @since windows5.0
     */
    static SnmpCleanupEx() {
        result := DllCall("wsnmp32.dll\SnmpCleanupEx", "uint")
        return result
    }

    /**
     * The WinSNMP SnmpStrToEntity function returns a handle to information about an SNMP management entity that is specific to the Microsoft WinSNMP implementation.
     * @remarks
     * The current setting of the entity and context translation mode determines the manner in which 
     * <b>SnmpStrToEntity</b> interprets the input string that identifies the management entity of interest. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/support-for-ipx-address-strings-in-winsnmp">Support for IPX Address Strings in WinSNMP</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/setting-the-entity-and-context-translation-mode">Setting the Entity and Context Translation Mode</a>.
     * 
     * The WinSNMP application should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreeentity">SnmpFreeEntity</a> function to release the entity handle allocated by the 
     * <b>SnmpStrToEntity</b> function. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * 
     * The 
     * <b>SnmpStrToEntity</b> function returns a valid entity handle that a WinSNMP application can use as the <i>srcEntity</i> or the <i>dstEntity</i> parameter in multiple WinSNMP functions. These functions include the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpregister">SnmpRegister</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpencodemsg">SnmpEncodeMsg</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpdecodemsg">SnmpDecodeMsg</a> functions.
     * 
     * The implementation returns the current entity and context translation mode in the <i>nTranslateMode</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function. A WinSNMP application can change the setting of the entity and context translation mode with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsettranslatemode">SnmpSetTranslateMode</a> function.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer<Byte>} string Pointer to a null-terminated string that identifies the SNMP management entity of interest. The current setting of the entity and context translation mode determines the manner in which 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpstrtoentity
     * @since windows5.0
     */
    static SnmpStrToEntity(session, string) {
        string := string is String? StrPtr(string) : string

        result := DllCall("wsnmp32.dll\SnmpStrToEntity", "ptr", session, "ptr", string, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpEntityToStr function returns a string that identifies an SNMP management entity.
     * @remarks
     * The current setting of the entity and context translation mode determines the type of output string 
     * <b>SnmpEntityToStr</b> returns. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/support-for-ipx-address-strings-in-winsnmp">Support for IPX Address Strings in WinSNMP</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/setting-the-entity-and-context-translation-mode">Setting the Entity and Context Translation Mode</a>.
     * 
     * When the entity and context translation mode is SNMPAPI_TRANSLATED, and an entry exists in the implementation's database, the implementation returns the associated user-friendly name of the management entity. If an entry does not exist for the management entity, 
     * <b>SnmpEntityToStr</b> returns the literal SNMP transport address of the management entity.
     * 
     * When the entity and context translation mode is SNMPAPI_UNTRANSLATED_V1 or SNMPAPI_UNTRANSLATED_V2, the Microsoft WinSNMP implementation also returns the literal SNMP transport address of the management entity.
     * @param {Pointer} entity Handle to the SNMP management entity of interest.
     * @param {Integer} size Specifies the size, in bytes, of the buffer pointed to by the <i>string</i> parameter. The WinSNMP application must allocate a buffer that is large enough to contain the output string.
     * @param {Pointer<Byte>} string Pointer to a buffer to receive the null-terminated string that identifies the SNMP management entity of interest.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes, including a terminating null byte, that 
     * <b>SnmpEntityToStr</b> returns in the <i>string</i> buffer. This value can be less than or equal to the value of the <i>size</i> parameter, but it cannot be greater.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpentitytostr
     * @since windows5.0
     */
    static SnmpEntityToStr(entity, size, string) {
        string := string is String? StrPtr(string) : string

        result := DllCall("wsnmp32.dll\SnmpEntityToStr", "ptr", entity, "uint", size, "ptr", string, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpFreeEntity function releases resources associated with an SNMP management entity.
     * @remarks
     * When the WinSNMP application calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> function, the Microsoft WinSNMP implementation frees all resources it allocated for the WinSNMP session. However, it is recommended that the WinSNMP application free individual resources by using the WinSNMP function that corresponds to the resource. For example, applications should call the 
     * <b>SnmpFreeEntity</b> function to release resources allocated by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> function. This reduces the implementation's work load, and should enhance the implementation's service to all applications.
     * 
     * For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * @param {Pointer} entity Handle to the SNMP management entity that will have its resources released.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpfreeentity
     * @since windows5.0
     */
    static SnmpFreeEntity(entity) {
        result := DllCall("wsnmp32.dll\SnmpFreeEntity", "ptr", entity, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpStrToContext function returns a handle to SNMP context information that is specific to the Microsoft WinSNMP implementation.
     * @remarks
     * The current setting of the entity and context translation mode determines the manner in which 
     * <b>SnmpStrToContext</b> interprets the input string structure. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/setting-the-entity-and-context-translation-mode">Setting the Entity and Context Translation Mode</a>.
     * 
     * The WinSNMP application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreecontext">SnmpFreeContext</a> function to release the context handle allocated by the 
     * <b>SnmpStrToContext</b> function. For additional information about releasing resources, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * 
     * The WinSNMP application should free the memory associated with the <b>ptr</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure pointed to by the <i>string</i> parameter. This is because the application defines and allocates the resources. For example, if the application allocated resources with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> function, it should use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function to deallocate the resources. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/freeing-winsnmp-descriptors">Freeing WinSNMP Descriptors</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure pointed to by the <i>string</i> parameter is <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpstrtocontext
     * @since windows5.0
     */
    static SnmpStrToContext(session, string) {
        result := DllCall("wsnmp32.dll\SnmpStrToContext", "ptr", session, "ptr", string, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpContextToStr function returns a string that identifies an SNMP context, which is a set of managed object resources. The function returns the string in an smiOCTETS structure.
     * @remarks
     * The current setting of the entity and context translation mode determines the type of output string 
     * <b>SnmpContextToStr</b> returns. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/setting-the-entity-and-context-translation-mode">Setting the Entity and Context Translation Mode</a>.
     * 
     * The WinSNMP application must provide the address of a valid 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure for the <i>string</i> parameter. If the 
     * <b>SnmpContextToStr</b> function completes successfully, the Microsoft WinSNMP implementation initializes the <b>len</b> and <b>ptr</b> members of the structure. The WinSNMP application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a> function to enable the implementation to free the resources for these members.
     * 
     * When the entity and context translation mode is SNMPAPI_TRANSLATED, and the entry exists in the implementation's database, the implementation returns the associated user-friendly name of the context. If an entry does not exist for the context name, 
     * <b>SnmpContextToStr</b> returns the SNMP community string.
     * 
     * When the entity and context translation mode is SNMPAPI_UNTRANSLATED_V1 or SNMPAPI_UNTRANSLATED_V2, the implementation also returns the SNMP community string.
     * @param {Pointer} context Handle to the SNMP context of interest.
     * @param {Pointer<smiOCTETS>} string Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure to receive the string that identifies the context of interest. The string can have a null-terminating byte.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpcontexttostr
     * @since windows5.0
     */
    static SnmpContextToStr(context, string) {
        result := DllCall("wsnmp32.dll\SnmpContextToStr", "ptr", context, "ptr", string, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpFreeContext function releases resources associated with an SNMP context, which is a set of managed object resources.
     * @remarks
     * When the WinSNMP application calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> function, the Microsoft WinSNMP implementation frees all resources it allocated for the WinSNMP session. However, it is recommended that the WinSNMP application free individual resources with the WinSNMP function that corresponds to the resource. For example, applications should call the 
     * <b>SnmpFreeContext</b> function to release resources allocated by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtocontext">SnmpStrToContext</a> function. This reduces the implementation's work load, and should enhance the service of the implementation to all applications.
     * 
     * For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * @param {Pointer} context Handle to the SNMP context that will have its resources released.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpfreecontext
     * @since windows5.0
     */
    static SnmpFreeContext(context) {
        result := DllCall("wsnmp32.dll\SnmpFreeContext", "ptr", context, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the SnmpSetPort function to change the port assigned to a destination entity. The SnmpSetPort function is an element of the WinSNMP API, version 2.0.
     * @remarks
     * The Microsoft WinSNMP implementation assigns a port to each management entity as a result of a WinSNMP application's call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> function. If the SNMPAPI_UNTRANSLATED mode is in effect when the implementation creates an entity, the implementation typically assigns the standard SNMP request port for the respective protocol family to the entity; for example, UDP 161 or IPX 36879. If the SNMPAPI_TRANSLATED mode is in effect, the implementation assigns the port specified for the entity in the WinSNMP database. To retrieve the current entity and context translation mode in effect for the implementation, an application can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgettranslatemode">SnmpGetTranslateMode</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/setting-the-entity-and-context-translation-mode">Setting the Entity and Context Translation Mode</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/the-winsnmp-database">The WinSNMP Database</a>.
     * 
     * A call to the 
     * <b>SnmpSetPort</b> function fails if the entity specified by the <i>hEntity</i> parameter is currently functioning in an agent role. This is because the entity has already been assigned to a port other than the one specified by the <i>nPort</i> parameter. To ensure assignment of an agent application to a specific port, a WinSNMP application can perform the following steps.
     * 
     * <ol>
     * <li>
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> as follows:
     * 
     * <c>hAgent = SnmpStrToEntity (hSession, &lt;addrString&gt;);</c>
     * 
     * </li>
     * <li>
     * Call <b>SnmpSetPort</b> as follows: 
     * 
     * <c>SnmpSetPort (hAgent, &lt;nPort&gt;);</c>
     * 
     * </li>
     * <li>
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmplisten">SnmpListen</a> as follows:
     * 
     * <c>SnmpListen (hAgent, SNMPAPI_ON);</c>
     * 
     * </li>
     * </ol>
     * where &lt;addrString&gt; contains the string representation of an IP address or an IPX address, and &lt;nPort&gt; contains the new port assignment for the agent application.
     * 
     * Note that an IPX address contains a network number that consists of eight hexadecimal digits (zero-filled if necessary); a separator (either ":", "." or " – "); and a node number that consists of 12 hexadecimal digits (zero-filled if necessary)—for example, 00000001:00081A0D01C2. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/support-for-ipx-address-strings-in-winsnmp">Support for IPX Address Strings in WinSNMP</a>.
     * @param {Pointer} hEntity Handle to a WinSNMP destination entity. This parameter can specify the handle to an entity acting in the role of an SNMP agent application as a result of a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmplisten">SnmpListen</a> function. For more information, see the following Remarks section.
     * @param {Integer} nPort Specifies an unsigned integer that identifies the new port assignment for the destination entity. If you specify a local address that is busy, or if you specify a remote address that is unavailable, a call to the 
     * <b>SnmpSetPort</b> function fails.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmplisten">SnmpListen</a> function. For more information, see the following Remarks section.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstrtoentity">SnmpStrToEntity</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpsetport
     * @since windows5.0
     */
    static SnmpSetPort(hEntity, nPort) {
        result := DllCall("wsnmp32.dll\SnmpSetPort", "ptr", hEntity, "uint", nPort, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpCreatePdu function creates and initializes an SNMP protocol data unit (PDU).
     * @remarks
     * A WinSNMP application must create a PDU before it calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a> or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpencodemsg">SnmpEncodeMsg</a> functions.
     * 
     * All of the parameters of the 
     * <b>SnmpCreatePdu</b> function are required. However, all parameters, except the <i>session</i> parameter, can be <b>NULL</b>. In this instance, the new PDU has the following default values.
     * 
     * <table>
     * <tr>
     * <th>Field</th>
     * <th>Contents</th>
     * </tr>
     * <tr>
     * <td><b>PDU_type</b></td>
     * <td><b>SNMP_PDU_GETNEXT</b></td>
     * </tr>
     * <tr>
     * <td><b>request_id</b></td>
     * <td>The implementation generates a numeric value.</td>
     * </tr>
     * <tr>
     * <td><b>error_status</b></td>
     * <td>SNMP_ERROR_NOERROR</td>
     * </tr>
     * <tr>
     * <td><b>error_index</b></td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td><b>varbindlist</b></td>
     * <td><b>NULL</b></td>
     * </tr>
     * </table>
     *  
     * 
     * The application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreepdu">SnmpFreePdu</a> function to release the resources that the 
     * <b>SnmpCreatePdu</b> function allocates for the new PDU.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Integer} PDU_type 
     * @param {Integer} request_id Specifies a unique numeric value that the WinSNMP application supplies to identify the PDU. If this parameter is <b>NULL</b>, the implementation assigns a value.
     * @param {Integer} error_status If the <i>PDU_type</i> parameter is equal to <b>SNMP_PDU_GETBULK</b>, this parameter specifies a value for the <b>non_repeaters</b> field of the PDU. For other PDU types, this parameter specifies a value for the <b>error_status</b> field of the PDU. This parameter can be <b>NULL</b>.
     * @param {Integer} error_index If the <i>PDU_type</i> parameter is equal to <b>SNMP_PDU_GETBULK</b>, this parameter specifies a value for the <b>max_repetitions</b> field of the PDU. For other PDU types, this parameter specifies a value for the <b>error_index</b> field of the PDU. This parameter can be <b>NULL</b>.
     * @param {Pointer} varbindlist Handle to a structure that represents an SNMP variable bindings list. This parameter can be <b>NULL</b>.
     * @returns {Pointer} If the function succeeds, the return value is the handle to a new SNMP PDU.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpcreatepdu
     * @since windows5.0
     */
    static SnmpCreatePdu(session, PDU_type, request_id, error_status, error_index, varbindlist) {
        result := DllCall("wsnmp32.dll\SnmpCreatePdu", "ptr", session, "uint", PDU_type, "int", request_id, "int", error_status, "int", error_index, "ptr", varbindlist, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpGetPduData function returns selected data fields from a specified SNMP protocol data unit (PDU).
     * @remarks
     * All parameters of the 
     * <b>SnmpGetPduData</b> function are required. However, all parameters, except the <i>PDU</i> parameter, can be <b>NULL</b>. In parameters that the application passes as <b>NULL</b>, the 
     * <b>SnmpGetPduData</b> function does not return a value.
     * 
     * The 
     * <b>SnmpGetPduData</b> function always returns a handle to a new variable bindings list object if the <i>varbindlist</i> parameter is not <b>NULL</b>. Additionally, if the <i>PDU</i> parameter specifies a new PDU, the function also attaches a handle to the new PDU.
     * 
     * When an application calls 
     * <b>SnmpGetPduData</b> with a <i>varbindlist</i> parameter that is not <b>NULL</b>, but the <i>PDU</i> parameter specifies an existing PDU, the function returns a handle to a new duplicate variable bindings list. The function call does not disturb the handle attached to the existing PDU. An existing PDU is one that an application creates with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatepdu">SnmpCreatePdu</a> function, or one that the application receives and then reads using a call to 
     * <b>SnmpGetPduData</b>.
     * 
     * When an application creates a PDU with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatepdu">SnmpCreatePdu</a>, or after the application reads a PDU using 
     * <b>SnmpGetPduData</b>, the Microsoft WinSNMP implementation expects that the application "knows" the values of the PDU fields. If an application reads a PDU a second time with 
     * <b>SnmpGetPduData</b>, the call results in a copy of the variable bindings list of the specified PDU. This type of call to 
     * <b>SnmpGetPduData</b> also duplicates the handle to the PDU.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpgetpdudata
     * @since windows5.0
     */
    static SnmpGetPduData(PDU, PDU_type, request_id, error_status, error_index, varbindlist) {
        result := DllCall("wsnmp32.dll\SnmpGetPduData", "ptr", PDU, "uint*", PDU_type, "int*", request_id, "uint*", error_status, "int*", error_index, "ptr*", varbindlist, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetPduData function updates selected data fields in the specified SNMP protocol data unit (PDU).
     * @remarks
     * All parameters of the 
     * <b>SnmpSetPduData</b> function are required. However, all parameters, except the <i>PDU</i> parameter, can be <b>NULL</b>. If the WinSNMP application passes <b>NULL</b> in a parameter, 
     * <b>SnmpSetPduData</b> does not update the corresponding field in the PDU. Because 
     * <b>SnmpSetPduData</b> passes parameters as pointers to values, an application can still update a PDU field with <b>NULL</b>.
     * 
     * The value of one PDU field can be valid alone, but may be invalidated in combination with values for other fields. The implementation validates the PDU and the other message elements when the application calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a> or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpencodemsg">SnmpEncodeMsg</a> functions. The implementation rejects invalid PDUs.
     * 
     * The only type of trap PDU you can update with a call to the 
     * <b>SnmpSetPduData</b> function is an SNMPv2C trap PDU.
     * @param {Pointer} PDU Handle to an SNMP PDU.
     * @param {Pointer<Int32>} PDU_type Pointer to a variable with a value to update the <b>PDU_type</b> field of the specified PDU. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Int32>} request_id Pointer to a variable with a value to update the <b>request_id</b> field of the specified PDU. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Int32>} non_repeaters If the <i>PDU_type</i> parameter is equal to <a href="https://docs.microsoft.com/windows/desktop/SNMP/snmp-variable-types-and-request-pdu-types">SNMP_PDU_GETBULK</a>, this parameter points to a variable with a value to update the <b>non_repeaters</b> field of the specified PDU. The Microsoft WinSNMP implementation ignores this parameter for other PDU types. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Int32>} max_repetitions If the <i>PDU_type</i> parameter is equal to <a href="https://docs.microsoft.com/windows/desktop/SNMP/snmp-variable-types-and-request-pdu-types">SNMP_PDU_GETBULK</a>, this parameter points to a variable with a value to update the <b>max_repetitions</b> field of the specified PDU. The implementation ignores this parameter for other PDU types. This parameter can also be <b>NULL</b>.
     * @param {Pointer<IntPtr>} varbindlist Pointer to a variable with a value that updates the handle to the variable bindings list field of the specified PDU. This parameter can also be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpsetpdudata
     * @since windows5.0
     */
    static SnmpSetPduData(PDU, PDU_type, request_id, non_repeaters, max_repetitions, varbindlist) {
        result := DllCall("wsnmp32.dll\SnmpSetPduData", "ptr", PDU, "int*", PDU_type, "int*", request_id, "int*", non_repeaters, "int*", max_repetitions, "ptr*", varbindlist, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpDuplicatePdu function duplicates the SNMP protocol data unit (PDU) that the PDU parameter identifies, allocating any necessary memory for the duplicate PDU.
     * @remarks
     * To release resources allocated by the 
     * <b>SnmpDuplicatePdu</b> function for a new PDU, a WinSNMP application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreepdu">SnmpFreePdu</a> function.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer} PDU Handle to the PDU to duplicate. The 
     * <b>SnmpDuplicatePdu</b> function provides a unique handle to each PDU within the calling application.
     * @returns {Pointer} If the function succeeds, the return value is a handle that identifies the new duplicate PDU.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpduplicatepdu
     * @since windows5.0
     */
    static SnmpDuplicatePdu(session, PDU) {
        result := DllCall("wsnmp32.dll\SnmpDuplicatePdu", "ptr", session, "ptr", PDU, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpFreePdu function releases resources associated with an SNMP protocol data unit (PDU) created by the SnmpCreatePdu or the SnmpDuplicatePdu function.
     * @remarks
     * If the application calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> function, the Microsoft WinSNMP implementation frees all resources it allocates for the WinSNMP session. However, it is recommended that the application free individual resources with the WinSNMP function that corresponds to the resource. This reduces the implementation's work load, and should enhance the implementation's service to all applications. The application should use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreevbl">SnmpFreeVbl</a> function to deallocate variable bindings list resources. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * 
     * Under WinSNMP, a variable binding entry exists only within a variable bindings list, even if the variable bindings list contains just one entry.
     * @param {Pointer} PDU Handle to the SNMP PDU to free.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpfreepdu
     * @since windows5.0
     */
    static SnmpFreePdu(PDU) {
        result := DllCall("wsnmp32.dll\SnmpFreePdu", "ptr", PDU, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpCreateVbl function creates a new variable bindings list for the calling WinSNMP application.
     * @remarks
     * The 
     * <b>SnmpCreateVbl</b> function uses the values of the <i>name</i> and <i>value</i> parameters to create and initialize the first variable binding entry of a new variable bindings list. If the <i>name</i> parameter is <b>NULL</b>, the Microsoft WinSNMP implementation ignores the <i>value</i> parameter and creates an empty variable bindings list.
     * 
     * If the <i>name</i> parameter is not <b>NULL</b>, but the <i>value</i> parameter is <b>NULL</b>, the implementation creates and initializes the first variable binding entry in the variable bindings list. It initializes the <b>syntax</b> member of the structure pointed to by the <i>value</i> parameter with the value SNMP_SYNTAX_NULL.
     * 
     * The WinSNMP application must release the resources associated with each variable bindings list. It should do this by matching each call to the 
     * <b>SnmpCreateVbl</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpduplicatevbl">SnmpDuplicateVbl</a> functions with a corresponding call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreevbl">SnmpFreeVbl</a> function. To avoid memory leaks, a WinSNMP application must call 
     * <b>SnmpFreeVbl</b> before it reuses the handle to a variable bindings list in a subsequent call to 
     * <b>SnmpCreateVbl</b> or 
     * <b>SnmpDuplicateVbl</b>. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer<smiOID>} name Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure that contains the variable name for the first variable binding entry. This parameter can be <b>NULL</b>. For additional information, see the following Remarks section.
     * @param {Pointer<smiVALUE>} value Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smivalue">smiVALUE</a> structure that contains a value to associate with the variable in the first variable binding entry. This parameter can be <b>NULL</b>. For additional information, see the following Remarks section.
     * @returns {Pointer} If the function succeeds, the return value is a handle to a new variable bindings list.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpcreatevbl
     * @since windows5.0
     */
    static SnmpCreateVbl(session, name, value) {
        result := DllCall("wsnmp32.dll\SnmpCreateVbl", "ptr", session, "ptr", name, "ptr", value, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpDuplicateVbl function copies a variable bindings list for the specified WinSNMP session. This function returns a handle to the copied variable bindings list and allocates any necessary memory for it.
     * @remarks
     * The 
     * <b>SnmpDuplicateVbl</b> function creates a new variable bindings list for the specified WinSNMP session. This function initializes the new list with a copy of the data in the source variable bindings list.
     * 
     * The handle the 
     * <b>SnmpDuplicateVbl</b> function returns is unique among the variable bindings list handles that are active within the WinSNMP application.
     * 
     * The WinSNMP application must release the resources associated with each variable bindings list. It should do this by matching each call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatevbl">SnmpCreateVbl</a> and 
     * <b>SnmpDuplicateVbl</b> functions with a corresponding call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreevbl">SnmpFreeVbl</a> function. To avoid memory leaks, a WinSNMP application must call 
     * <b>SnmpFreeVbl</b> before it reuses the handle to a variable bindings list in a subsequent call to 
     * <b>SnmpCreateVbl</b> or 
     * <b>SnmpDuplicateVbl</b>. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer} vbl Handle to the variable bindings list to copy. The source variable bindings list can be empty.
     * @returns {Pointer} If the function succeeds, the return value is a handle to a new variable bindings list.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpduplicatevbl
     * @since windows5.0
     */
    static SnmpDuplicateVbl(session, vbl) {
        result := DllCall("wsnmp32.dll\SnmpDuplicateVbl", "ptr", session, "ptr", vbl, "ptr")
        return result
    }

    /**
     * The WinSNMP SnmpFreeVbl function releases resources associated with a variable bindings list. These are resources allocated previously by a call to the SnmpCreateVbl function or the SnmpDuplicateVbl function in a WinSNMP application.
     * @remarks
     * The WinSNMP application must release the resources associated with each variable bindings list. It should do this by matching each call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatevbl">SnmpCreateVbl</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpduplicatevbl">SnmpDuplicateVbl</a> functions with a corresponding call to the 
     * <b>SnmpFreeVbl</b> function. To avoid memory leaks, a WinSNMP application must call 
     * <b>SnmpFreeVbl</b> before it reuses the handle to a variable bindings list in a subsequent call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatevbl">SnmpCreateVbl</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpduplicatevbl">SnmpDuplicateVbl</a>.
     * 
     * If the application calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> function, the Microsoft WinSNMP implementation frees all resources it allocates for the WinSNMP session. However, even if the application does not reuse a variable bindings list handle, it is recommended that the application free individual variable bindings resources with the 
     * <b>SnmpFreeVbl</b> function. This reduces the implementation's work load, and should enhance its service to all applications. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * @param {Pointer} vbl Handle to the variable bindings list to release.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpfreevbl
     * @since windows5.0
     */
    static SnmpFreeVbl(vbl) {
        result := DllCall("wsnmp32.dll\SnmpFreeVbl", "ptr", vbl, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the WinSNMP SnmpCountVbl function to enumerate the variable binding entries in the specified variable bindings list.
     * @remarks
     * The 
     * <b>SnmpCountVbl</b> function returns an unsigned integer value that is the maximum value the WinSNMP application can specify for the <i>index</i> parameter in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetvb">SnmpGetVb</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsetvb">SnmpSetVb</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpdeletevb">SnmpDeleteVb</a> functions.
     * @param {Pointer} vbl Handle to the variable bindings list to enumerate.
     * @returns {Integer} If the function succeeds, the return value is the count of variable binding entries in the variable bindings list.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpcountvbl
     * @since windows5.0
     */
    static SnmpCountVbl(vbl) {
        result := DllCall("wsnmp32.dll\SnmpCountVbl", "ptr", vbl, "uint")
        return result
    }

    /**
     * A WinSNMP application calls the SnmpGetVb function to retrieve information from a variable bindings list. This WinSNMP function retrieves a variable name and its associated value from the variable binding entry specified by the index parameter.
     * @remarks
     * The last three syntax types describe exception conditions under the SNMP version 2C(SNMPv2C) framework.
     * 
     * The 
     * <b>SnmpGetVb</b> function returns the variable name of the variable binding entry in the structure pointed to by the <i>name</i> parameter. It returns the variable's associated value in the structure pointed to by the <i>value</i> parameter.
     * 
     * On input, the 
     * <b>SnmpGetVb</b> function ignores the members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smivalue">smiVALUE</a> structures pointed to by the <i>name</i> and <i>value</i> parameters respectively. The Microsoft WinSNMP implementation overwrites the members if the function completes successfully.
     * 
     * Valid values for a WinSNMP application to use for the <i>index</i> parameter are as follows:
     * 
     * <ul>
     * <li>The return value from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcountvbl">SnmpCountVbl</a> function</li>
     * <li>The error index field of an <b>SNMP_PDU_RESPONSE</b> protocol data unit (PDU) returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function</li>
     * </ul>
     * The WinSNMP application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a> function to free resources allocated for the <b>ptr</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure pointed to by the <i>name</i> parameter. The application must also call the 
     * <b>SnmpFreeDescriptor</b> function to release resources allocated for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smivalue">smiVALUE</a> structure pointed to by the <i>value</i> parameter under the conditions following. If the <b>value</b> member is an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> or an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure, the application must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a> to free the resources allocated for these structures. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpgetvb
     * @since windows5.0
     */
    static SnmpGetVb(vbl, index, name, value) {
        result := DllCall("wsnmp32.dll\SnmpGetVb", "ptr", vbl, "uint", index, "ptr", name, "ptr", value, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpSetVb function changes variable binding entries in a variable bindings list. This function also appends new variable binding entries to an existing variable bindings list.
     * @remarks
     * Valid values for the <i>index</i> parameter range from zero to n. The value zero indicates an append operation. The value n is the total number of variable binding entries in the variable bindings list. A WinSNMP application should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcountvbl">SnmpCountVbl</a> function before it calls 
     * <b>SnmpSetVb</b> to obtain the total number of variable binding entries.
     * 
     * If the function successfully performs an update operation, the return value equals the value of the <i>index</i> parameter. If the function appends a variable binding entry, the return value is n + 1.
     * 
     * If the <i>name</i> parameter is not <b>NULL</b>, but the <i>value</i> parameter is <b>NULL</b>, the Microsoft WinSNMP implementation initializes the new variable binding entry with the <b>value</b> member set to <b>NULL</b> and with the <b>syntax</b> member set to <a href="https://docs.microsoft.com/windows/desktop/SNMP/snmp-variable-types-and-request-pdu-types">SNMP_SYNTAX_</a>.
     * 
     * If the <i>index</i> parameter is not equal to zero, and the <i>name</i> parameter is <b>NULL</b>, the Microsoft WinSNMP implementation updates only the value of the variable pointed to by the <i>index</i> parameter.
     * @param {Pointer} vbl Handle to the variable bindings list to update.
     * @param {Integer} index Specifies an unsigned long integer variable that contains the position of the variable binding entry, within the variable bindings list, if this is an update operation. If this is an append operation, this parameter must be equal to zero. For more information, see the following Remarks section.
     * @param {Pointer<smiOID>} name Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure that represents the name of the variable to append or change. For more information, see the following Remarks section.
     * @param {Pointer<smiVALUE>} value Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smivalue">smiVALUE</a> structure. The structure contains the value associated with the variable specified by the <i>name</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is the position of the updated or appended variable binding entry in the variable bindings list. For additional information, see the following Remarks section.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpsetvb
     * @since windows5.0
     */
    static SnmpSetVb(vbl, index, name, value) {
        result := DllCall("wsnmp32.dll\SnmpSetVb", "ptr", vbl, "uint", index, "ptr", name, "ptr", value, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpDeleteVb function removes a variable binding entry from a variable bindings list.
     * @remarks
     * A WinSNMP application can use the 
     * <b>SnmpDeleteVb</b> function to delete invalid variable binding entries. When an <a href="https://docs.microsoft.com/windows/desktop/SNMP/snmp-variable-types-and-request-pdu-types">SNMP_PDU_RESPONSE</a> protocol data unit (PDU) includes an error that indicates an invalid variable binding entry, the application can call 
     * <b>SnmpDeleteVb</b> to delete the entry. Then the application can resubmit the request PDU with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a> function, without the invalid variable binding entry in the variable bindings list. Request PDUs include the SNMP_PDU_GET, SNMP_PDU_GETNEXT, and SNMP_PDU_GETBULK PDU data types.
     * 
     * After the 
     * <b>SnmpDeleteVb</b> function deletes a variable binding entry, the index value of all entries after the deleted entry will decrement by one. A call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcountvbl">SnmpCountVbl</a> function returns the new total number of entries in the variable bindings list. The new total is one less than the count returned by a call to 
     * <b>SnmpCountVbl</b> before the current call to 
     * <b>SnmpDeleteVb</b>.
     * 
     * If a WinSNMP application calls the 
     * <b>SnmpDeleteVb</b> function and deletes the last variable binding entry in a variable bindings list, the result is an empty variable bindings list. The variable bindings list still has a valid handle and the WinSNMP application must release the handle with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreevbl">SnmpFreeVbl</a> function.
     * 
     * The following are valid values to use for the <i>index</i> parameter:
     * 
     * <ul>
     * <li>The return value from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcountvbl">SnmpCountVbl</a> function</li>
     * <li>The error index field of an <a href="https://docs.microsoft.com/windows/desktop/SNMP/snmp-variable-types-and-request-pdu-types">SNMP_PDU_RESPONSE</a> PDU returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function</li>
     * </ul>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpdeletevb
     * @since windows5.0
     */
    static SnmpDeleteVb(vbl, index) {
        result := DllCall("wsnmp32.dll\SnmpDeleteVb", "ptr", vbl, "uint", index, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpGetLastError function returns the calling application's last-error code value. The value indicates the reason why the last function call executed by the WinSNMP application failed.
     * @remarks
     * A WinSNMP application must call 
     * <b>SnmpGetLastError</b> immediately after a function fails, to retrieve the last-error code. If another function fails, it overwrites the last-error code set by the most recently failed function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-error-codes">WinSNMP Error Codes</a>.
     * 
     * Although the <i>session</i> parameter accommodates both multithread and single-thread Windows operating environments, the potential still exists for the last-error code from one thread to overwrite the last-error code from another thread.
     * 
     * Note that 
     * <b>SnmpGetLastError</b> must be able to return the last-error code to a WinSNMP application under the following conditions:
     * 
     * <ul>
     * <li>After the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function fails</li>
     * <li>Before the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a> function creates any WinSNMP sessions for the instance of the application</li>
     * <li>After the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> function closes all WinSNMP sessions for the instance of the application</li>
     * <li>After the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcleanup">SnmpCleanup</a> function disconnects the WinSNMP application from the Microsoft WinSNMP implementation</li>
     * </ul>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function fails, 
     * <b>SnmpGetLastError</b> returns the last WinSNMP error that occurred.
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpgetlasterror
     * @since windows5.0
     */
    static SnmpGetLastError(session) {
        result := DllCall("wsnmp32.dll\SnmpGetLastError", "ptr", session, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpStrToOid function converts the dotted numeric string format of an SNMP object identifier, for example, &quot;1.2.3.4.5.6&quot;, to its internal binary representation.
     * @remarks
     * The WinSNMP application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a> function to free resources allocated for the <b>ptr</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure pointed to by the <i>dstOID</i> parameter. On input, 
     * <b>SnmpFreeDescriptor</b> ignores the members of this 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure. The Microsoft WinSNMP implementation overwrites the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> members if the function completes successfully.
     * 
     * The 
     * <b>SnmpStrToOid</b> function fails and returns the SNMPAPI_OID_INVALID error code if the <i>string</i> parameter meets one of the following conditions:
     * 
     * <ul>
     * <li>Is not <b>null</b>-terminated.</li>
     * <li>Is not the textual form of a valid object identifier.</li>
     * <li>Is insufficient in length; all object identifiers must have two subidentifiers.</li>
     * <li>Exceeds the MAXOBJIDSTRSIZE of 1408 bytes.</li>
     * </ul>
     * For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/freeing-winsnmp-descriptors">Freeing WinSNMP Descriptors</a>.
     * @param {Pointer<Byte>} string Pointer to a <b>null</b>-terminated object identifier string to convert.
     * @param {Pointer<smiOID>} dstOID Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure that receives the converted value.
     * @returns {Integer} If the function succeeds, the return value is the number of subidentifiers in the converted object identifier. This number is also the value of the <b>len</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure pointed to by the <i>dstOID</i> parameter.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpstrtooid
     * @since windows5.0
     */
    static SnmpStrToOid(string, dstOID) {
        string := string is String? StrPtr(string) : string

        result := DllCall("wsnmp32.dll\SnmpStrToOid", "ptr", string, "ptr", dstOID, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpOidToStr function converts the internal binary representation of an SNMP object identifier to its dotted numeric string format, for example, to &quot;1.2.3.4.5.6&quot;.
     * @remarks
     * It is recommended that a WinSNMP application specify, with the <i>size</i> parameter, a string buffer of MAXOBJIDSTRSIZE length (1408 bytes). This ensures that the output buffer is large enough to hold the converted string. Because the converted string is usually less than MAXOBJIDSTRSIZE, the WinSNMP application can copy the converted string to a smaller buffer. The application can then reuse or free the memory that it allocated for the initial buffer. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * @param {Pointer<smiOID>} srcOID Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure with an object identifier to convert.
     * @param {Integer} size Specifies the size, in bytes, of the buffer indicated by the <i>string</i> parameter. For more information, see the following Remarks section.
     * @param {Pointer<Byte>} string Pointer to a buffer to receive the converted string object identifier that specifies the SNMP management entity.
     * @returns {Integer} If the function succeeds, the return value is the length, in bytes, of the string that the WinSNMP application writes to the <i>string</i> parameter. The return value includes a <b>null</b>-terminating byte. This value may be less than or equal to the value of the <i>size</i> parameter, but it may not be greater.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpoidtostr
     * @since windows5.0
     */
    static SnmpOidToStr(srcOID, size, string) {
        string := string is String? StrPtr(string) : string

        result := DllCall("wsnmp32.dll\SnmpOidToStr", "ptr", srcOID, "uint", size, "ptr", string, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpOidCopy function copies an SNMP object identifier, allocating any necessary memory for the copy.
     * @remarks
     * On input, the 
     * <b>SnmpOidCopy</b> function ignores the members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure pointed to by the <i>dstOID</i> parameter. The Microsoft WinSNMP implementation overwrites the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> members if the function completes successfully.
     * 
     * The WinSNMP application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a> function to enable the implementation to free resources allocated for the <b>ptr</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure pointed to by the <i>dstOID</i> parameter. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/freeing-winsnmp-descriptors">Freeing WinSNMP Descriptors</a>.
     * @param {Pointer<smiOID>} srcOID Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure to copy.
     * @param {Pointer<smiOID>} dstOID Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure to receive a copy of the object identifier specified by the <i>srcOID</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is the number of subidentifiers in the copied object identifier. This number is also the value of the <b>len</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structure pointed to by the <i>dstOID</i> parameter.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpoidcopy
     * @since windows5.0
     */
    static SnmpOidCopy(srcOID, dstOID) {
        result := DllCall("wsnmp32.dll\SnmpOidCopy", "ptr", srcOID, "ptr", dstOID, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpOidCompare function lexicographically compares two SNMP object identifiers, up to the length specified by the maxlen parameter.
     * @remarks
     * A WinSNMP application can call the 
     * <b>SnmpOidCompare</b> function to determine whether two object identifiers have common prefixes.
     * 
     * If the <i>maxlen</i> parameter is not equal to zero, and not greater than MAXOBJIDSIZE, the value of <i>maxlen</i> sets the upper limit for the number of subidentifiers to compare. The maximum number of subidentifiers that the 
     * <b>SnmpOidCompare</b> function compares defaults to whichever is the smallest number—the <i>maxlen</i> parameter, or the <b>len</b> member of one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structures pointed to by the <i>xOID</i> and <i>yOID</i> parameters.
     * 
     * If the <i>maxlen</i> parameter is equal to zero, the maximum number of subidentifiers that the 
     * <b>SnmpOidCompare</b> function compares defaults to the number that is the smaller of the <b>len</b> members of the two 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structures.
     * 
     * The value of the <i>result</i> parameter will indicate that <i>xOID</i> equals <i>yOID</i> if the two 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structures are lexicographically equal and one of the following occurs:
     * 
     * <ul>
     * <li><b>SnmpOidCompare</b> compares a <i>maxlen</i> number of subidentifiers.</li>
     * <li><b>SnmpOidCompare</b> compares the maximum number of subidentifiers, and the <b>len</b> members of both 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioid">smiOID</a> structures are equal, but less than the <i>maxlen</i> parameter.</li>
     * </ul>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpoidcompare
     * @since windows5.0
     */
    static SnmpOidCompare(xOID, yOID, maxlen, result) {
        result := DllCall("wsnmp32.dll\SnmpOidCompare", "ptr", xOID, "ptr", yOID, "uint", maxlen, "int*", result, "uint")
        return result
    }

    /**
     * The Microsoft WinSNMP implementation uses the parameters passed in the WinSNMP SnmpEncodeMsg function to encode an SNMP message.
     * @remarks
     * The first five parameters passed to the 
     * <b>SnmpEncodeMsg</b> function are the same parameters that are passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a> function.
     * 
     * The WinSNMP application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a> function to free resources allocated for the <b>ptr</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure. This is the structure pointed to by the <i>msgBufDesc</i> parameter. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * 
     * On input, the 
     * <b>SnmpEncodeMsg</b> function ignores the members of the structure pointed to by the <i>msgBufDesc</i> parameter. The implementation overwrites the members of the structure if the function completes successfully.
     * 
     * The implementation verifies the format of the first five input parameters. If one of the parameters is invalid, 
     * <b>SnmpEncodeMsg</b> returns SNMPAPI_FAILURE, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> returns an extended error code.
     * @param {Pointer} session Handle to the WinSNMP session.
     * @param {Pointer} srcEntity Handle to the management entity that initiates the request to encode the SNMP message.
     * @param {Pointer} dstEntity Handle to the target management entity.
     * @param {Pointer} context Handle to the context (a set of managed object resources) that the target management entity controls.
     * @param {Pointer} pdu Handle to the PDU that contains the SNMP operation request.
     * @param {Pointer<smiOCTETS>} msgBufDesc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure that receives the encoded SNMP message.
     * @returns {Integer} If the function succeeds, the return value is the length, in bytes, of the encoded SNMP message. This number is also the value of the <b>len</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure pointed to by the <i>msgBufDesc</i> parameter.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. For additional information, see the following Remarks section. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpencodemsg
     * @since windows5.0
     */
    static SnmpEncodeMsg(session, srcEntity, dstEntity, context, pdu, msgBufDesc) {
        result := DllCall("wsnmp32.dll\SnmpEncodeMsg", "ptr", session, "ptr", srcEntity, "ptr", dstEntity, "ptr", context, "ptr", pdu, "ptr", msgBufDesc, "uint")
        return result
    }

    /**
     * The WinSNMP SnmpDecodeMsg function decodes an encoded SNMP message into its components. This function performs the opposite action of the WinSNMP SnmpEncodeMsg function.
     * @remarks
     * The Microsoft WinSNMP implementation returns a value of zero in the <i>srcEntity</i> and the <i>dstEntity</i> parameters when an application submits an SNMPv1 or an SNMPv2C message to the 
     * <b>SnmpDecodeMsg</b> function. This is because the message format does not include the address information necessary to create WinSNMP entity resources.
     * 
     * The Microsoft WinSNMP implementation allocates resources to the WinSNMP application as a result of a successful call to the 
     * <b>SnmpDecodeMsg</b> function. It is recommended that the WinSNMP application free individual resources with the WinSNMP function that corresponds to the resource. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/freeing-winsnmp-descriptors">Freeing WinSNMP Descriptors</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
     * @param {Pointer} session Handle to the WinSNMP session. This parameter is required. For additional information, see the following Remarks section.
     * @param {Pointer<IntPtr>} srcEntity Pointer to a variable that receives a handle to the source management entity. For more information, see the following Remarks section.
     * @param {Pointer<IntPtr>} dstEntity Pointer to a variable that receives a handle to the target management entity. For more information, see the following Remarks section.
     * @param {Pointer<IntPtr>} context Pointer to a variable that receives a handle to the context (a set of managed object resources) that the target management entity controls.
     * @param {Pointer<IntPtr>} pdu Pointer to a variable that receives a handle to the SNMP protocol data unit (PDU).
     * @param {Pointer<smiOCTETS>} msgBufDesc Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure that contains the SNMP message to decode into its components. The <b>len</b> member of the structure specifies the maximum number of bytes to process; the <b>ptr</b> member points to the encoded SNMP message.
     * @returns {Integer} If the function succeeds, the return value is the number of decoded bytes. This value can be equal to, or less than, the <b>len</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/ns-winsnmp-smioctets">smiOCTETS</a> structure pointed to by the <i>msgBufDesc</i> parameter.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a>. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpdecodemsg
     * @since windows5.0
     */
    static SnmpDecodeMsg(session, srcEntity, dstEntity, context, pdu, msgBufDesc) {
        result := DllCall("wsnmp32.dll\SnmpDecodeMsg", "ptr", session, "ptr*", srcEntity, "ptr*", dstEntity, "ptr*", context, "ptr*", pdu, "ptr", msgBufDesc, "uint")
        return result
    }

    /**
     * A WinSNMP application uses the SnmpFreeDescriptor function to inform the Microsoft WinSNMP implementation that it no longer requires access to a descriptor object.
     * @remarks
     * The implementation allocates and deallocates memory for output descriptor objects with variable lengths. This memory allocation and deallocation are restricted to the implementation, except for the interface that the 
     * <b>SnmpFreeDescriptor</b> function provides. For additional information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SNMP/freeing-winsnmp-descriptors">Freeing WinSNMP Descriptors</a>.
     * 
     * The implementation returns the SNMPAPI_OPERATION_INVALID error code if the <i>descriptor</i> parameter specifies a memory allocation that the implementation released in a prior call to 
     * <b>SnmpFreeDescriptor</b>. The function returns the same error code if the <i>descriptor</i> parameter specifies a memory allocation that the implementation did not make for the calling WinSNMP application.
     * @param {Integer} syntax Specifies the syntax data type of the target descriptor object.
     * @param {Pointer<smiOCTETS>} descriptor Pointer to an <b>smiOPAQUE</b> structure that contains the target descriptor object to release.
     * @returns {Integer} If the function succeeds, the return value is SNMPAPI_SUCCESS.
     * 
     * If the function fails, the return value is SNMPAPI_FAILURE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpgetlasterror">SnmpGetLastError</a> specifying a <b>NULL</b> value in its <i>session</i> parameter. The 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpstartup">SnmpStartup</a> function did not complete successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nf-winsnmp-snmpfreedescriptor
     * @since windows5.0
     */
    static SnmpFreeDescriptor(syntax, descriptor) {
        result := DllCall("wsnmp32.dll\SnmpFreeDescriptor", "uint", syntax, "ptr", descriptor, "uint")
        return result
    }

;@endregion Methods
}
