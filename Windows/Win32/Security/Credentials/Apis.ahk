#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class Credentials {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MAX_CREDENTIAL_BLOB_SIZE => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MAX_USERNAME_LENGTH => 513

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MAX_DOMAIN_TARGET_NAME_LENGTH => 337

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SMARTCARD => 49

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_SMARTCARD_READER => "{50dd5230-ba8a-11d1-bf5d-0000f805f530}"

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_ATR_LENGTH => 33

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PROTOCOL_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PROTOCOL_T0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PROTOCOL_T1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PROTOCOL_RAW => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PROTOCOL_DEFAULT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PROTOCOL_OPTIMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_POWER_DOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_COLD_RESET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_WARM_RESET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_ATTR_STRING_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_SMARTCARD_READERS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_VENDOR_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_COMMUNICATIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_PROTOCOL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_POWER_MGMT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_SECURITY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_MECHANICAL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_VENDOR_DEFINED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_IFD_PROTOCOL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_ICC_STATE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_PERF => 32766

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_CLASS_SYSTEM => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_T0_HEADER_LENGTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_T0_CMD_LENGTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_T1_PROLOGUE_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_T1_EPILOGUE_LENGTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_T1_EPILOGUE_LENGTH_LRC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_T1_MAX_IFS => 254

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_ABSENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PRESENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SWALLOWED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_POWERED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_NEGOTIABLE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SPECIFIC => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_SWALLOWS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_EJECTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_CONFISCATES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_CONTACTLESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_SERIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_PARALELL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_KEYBOARD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_SCSI => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_IDE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_USB => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_PCMCIA => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_TPM => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_NFC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_UICC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_NGC => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_EMBEDDEDSE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_READER_TYPE_VENDOR => 240

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOGON_FAILURE => -1073741715

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WRONG_PASSWORD => -1073741718

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PASSWORD_EXPIRED => -1073741711

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PASSWORD_MUST_CHANGE => -1073741276

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DOWNGRADE_DETECTED => -1073740920

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AUTHENTICATION_FIREWALL_FAILED => -1073740781

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCOUNT_DISABLED => -1073741710

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCOUNT_RESTRICTION => -1073741714

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCOUNT_LOCKED_OUT => -1073741260

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCOUNT_EXPIRED => -1073741421

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOGON_TYPE_NOT_GRANTED => -1073741477

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_LOGON_SESSION => -1073741729

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_USER => -1073741724

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MAX_STRING_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MAX_GENERIC_TARGET_NAME_LENGTH => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MAX_TARGETNAME_NAMESPACE_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MAX_TARGETNAME_ATTRIBUTE_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MAX_VALUE_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MAX_ATTRIBUTES => 64

    /**
     * @type {String}
     */
    static CRED_SESSION_WILDCARD_NAME_W => "*Session"

    /**
     * @type {String}
     */
    static CRED_SESSION_WILDCARD_NAME_A => "*Session"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_DOMAIN_NAMESPACE_W => "Domain"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_DOMAIN_NAMESPACE_A => "Domain"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_W => "LegacyGeneric"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_A => "LegacyGeneric"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_TARGET_W => "target"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_TARGET_A => "target"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_NAME_W => "name"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_NAME_A => "name"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_BATCH_W => "batch"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_BATCH_A => "batch"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_W => "interactive"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_A => "interactive"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_SERVICE_W => "service"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_SERVICE_A => "service"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_NETWORK_W => "network"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_NETWORK_A => "network"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_W => "networkcleartext"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_A => "networkcleartext"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_W => "remoteinteractive"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_A => "remoteinteractive"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_W => "cachedinteractive"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_A => "cachedinteractive"

    /**
     * @type {String}
     */
    static CRED_SESSION_WILDCARD_NAME => "*Session"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_DOMAIN_NAMESPACE => "Domain"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_NAME => "name"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_TARGET => "target"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_BATCH => "batch"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE => "interactive"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_SERVICE => "service"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_NETWORK => "network"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT => "networkcleartext"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE => "remoteinteractive"

    /**
     * @type {String}
     */
    static CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE => "cachedinteractive"

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_LOGON_TYPES_MASK => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TI_SERVER_FORMAT_UNKNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TI_DOMAIN_FORMAT_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TI_ONLY_PASSWORD_REQUIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TI_USERNAME_TARGET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TI_CREATE_EXPLICIT_CRED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TI_WORKGROUP_MEMBER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TI_DNSTREE_IS_DFS_SERVER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TI_VALID_FLAGS => 61567

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_HASH_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_MAX_MESSAGE_LENGTH => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_MAX_CAPTION_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_MAX_GENERIC_TARGET_LENGTH => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_MAX_DOMAIN_TARGET_LENGTH => 337

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_MAX_USERNAME_LENGTH => 513

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_USE_V2 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_IGNORE_CLOUDAUTHORITY_NAME => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_DOWNLEVEL_HELLO_AS_SMART_CARD => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static BACK_BUTTON_IDENTIFY_AUTH_PACKAGE => 3402629121

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FOOTER_LINK_AUTHPACKAGE_ID => 212664322

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_PICKERSCREEN_AUTHPACKAGE_ID => 212664323

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PRESERVE_CREDENTIAL_BLOB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_CACHE_TARGET_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_ALLOW_NAME_RESOLUTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PROTECT_AS_SELF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PROTECT_TO_SYSTEM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_UNPROTECT_AS_SELF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_UNPROTECT_ALLOW_TO_SYSTEM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SCOPE_TERMINAL => 1

    /**
     * @type {String}
     */
    static SCARD_ALL_READERS => "SCard$AllReaders\u000000"

    /**
     * @type {String}
     */
    static SCARD_DEFAULT_READERS => "SCard$DefaultReaders\u000000"

    /**
     * @type {String}
     */
    static SCARD_LOCAL_READERS => "SCard$LocalReaders\u000000"

    /**
     * @type {String}
     */
    static SCARD_SYSTEM_READERS => "SCard$SystemReaders\u000000"

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PROVIDER_PRIMARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PROVIDER_CSP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_PROVIDER_KSP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_UNPOWERED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SHARE_EXCLUSIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SHARE_SHARED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SHARE_DIRECT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_LEAVE_CARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_RESET_CARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_UNPOWER_CARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_EJECT_CARD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SC_DLG_MINIMAL_UI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SC_DLG_NO_UI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SC_DLG_FORCE_UI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCERR_NOCARDNAME => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SCERR_NOGUIDS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_AUDIT_CHV_FAILURE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_AUDIT_CHV_SUCCESS => 1

    /**
     * @type {String}
     */
    static CREDSSP_NAME => "CREDSSP"

    /**
     * @type {String}
     */
    static TS_SSP_NAME_A => "TSSSP"

    /**
     * @type {String}
     */
    static TS_SSP_NAME => "TSSSP"

    /**
     * @type {String}
     */
    static szOID_TS_KP_TS_SERVER_AUTH => "1.3.6.1.4.1.311.54.1.2"

    /**
     * @type {Integer (UInt32)}
     */
    static CREDSSP_SERVER_AUTH_NEGOTIATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREDSSP_SERVER_AUTH_CERTIFICATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREDSSP_SERVER_AUTH_LOOPBACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ALT_ATTR => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_C_FULL_IDENT_TOKEN => 2147483781

    /**
     * @type {Integer (UInt32)}
     */
    static CREDSSP_CRED_EX_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CREDSSP_FLAG_REDIRECT => 1
;@endregion Constants

;@region Methods
    /**
     * Prerequisite API to call to determine if the operation will be successful prior.
     * @param {Integer} keyCredentialManagerOperationType The intended operation from the <a href="../keycredmgr/ne-keycredmgr-keycredentialmanageroperationtype.md">KeyCredentialManagerOperationType</a>.
     * @param {Pointer<BOOL>} isReady If the operational prerequisite will succeed (True) or (False).
     * @param {Pointer<Integer>} keyCredentialManagerOperationErrorStates Additional feedback about isReady represented by <a href="../keycredmgr/ne-keycredmgr-keycredentialmanageroperationerrorstates.md">KeyCredentialManagerOperationErrorStates</a>.
     * @returns {HRESULT} Returns an HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//keycredmgr/nf-keycredmgr-keycredentialmanagergetoperationerrorstates
     */
    static KeyCredentialManagerGetOperationErrorStates(keyCredentialManagerOperationType, isReady, keyCredentialManagerOperationErrorStates) {
        keyCredentialManagerOperationErrorStatesMarshal := keyCredentialManagerOperationErrorStates is VarRef ? "int*" : "ptr"

        result := DllCall("KeyCredMgr.dll\KeyCredentialManagerGetOperationErrorStates", "int", keyCredentialManagerOperationType, "ptr", isReady, keyCredentialManagerOperationErrorStatesMarshal, keyCredentialManagerOperationErrorStates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * API to perform the requested WHFB operation.
     * @param {HWND} hWndOwner Window handle of the calling app.
     * @param {Integer} keyCredentialManagerOperationType The intended operation from the <a href="https://docs.microsoft.com/en-us/windows/win32/api/keycredmgr/ne-keycredmgr-keycredentialmanageroperationtype">KeyCredentialManagerOperationType</a>.
     * @returns {HRESULT} Returns an HRESULT
     * @see https://docs.microsoft.com/windows/win32/api//keycredmgr/nf-keycredmgr-keycredentialmanagershowuioperation
     */
    static KeyCredentialManagerShowUIOperation(hWndOwner, keyCredentialManagerOperationType) {
        hWndOwner := hWndOwner is Win32Handle ? NumGet(hWndOwner, "ptr") : hWndOwner

        result := DllCall("KeyCredMgr.dll\KeyCredentialManagerShowUIOperation", "ptr", hWndOwner, "int", keyCredentialManagerOperationType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * API to get a unique identifier of the users enrollment.
     * @param {Pointer<Pointer<KeyCredentialManagerInfo>>} keyCredentialManagerInfo Pointer to a pointer variable that receives a <a href="../keycredmgr/nf-keycredmgr-keycredentialmanagerfreeinformation.md">KeyCredentialManagerFreeInformation</a> function.
     * @returns {HRESULT} Returns an HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//keycredmgr/nf-keycredmgr-keycredentialmanagergetinformation
     */
    static KeyCredentialManagerGetInformation(keyCredentialManagerInfo) {
        result := DllCall("KeyCredMgr.dll\KeyCredentialManagerGetInformation", "ptr*", keyCredentialManagerInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * API to free the KeyCredentialManagerInfo pointer variable from the KeyCredentialManagerGetInformation call.
     * @param {Pointer<KeyCredentialManagerInfo>} keyCredentialManagerInfo Pointer variable to <a href="../keycredmgr/ns-keycredmgr-keycredentialmanagerinfo.md">KeyCredentialManagerInfo</a> data structure returned by the <a href="../keycredmgr/nf-keycredmgr-keycredentialmanagergetinformation.md">KeyCredentialManagerGetInformation</a> API.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//keycredmgr/nf-keycredmgr-keycredentialmanagerfreeinformation
     */
    static KeyCredentialManagerFreeInformation(keyCredentialManagerInfo) {
        DllCall("KeyCredMgr.dll\KeyCredentialManagerFreeInformation", "ptr", keyCredentialManagerInfo)
    }

    /**
     * Creates a new credential or modifies an existing credential in the user's credential set.
     * @param {Pointer<CREDENTIALW>} Credential A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credentiala">CREDENTIAL</a> structure to be written.
     * @param {Integer} Flags Flags that control the function's operation. The following flag is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PRESERVE_CREDENTIAL_BLOB"></a><a id="cred_preserve_credential_blob"></a><dl>
     * <dt><b>CRED_PRESERVE_CREDENTIAL_BLOB</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential BLOB from an existing credential is preserved with the same credential name and credential type. The <b>CredentialBlobSize</b> of the passed in <i>Credential</i> structure must be zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get a more specific status code. The following status codes can be returned.
     * 
     * Other smart card errors can be returned when writing a CRED_TYPE_CERTIFICATE credential.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certain fields cannot be changed in an existing credential. This error is returned if a field does not match the value in a protected field of the existing credential.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A value that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_USERNAME</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>UserName</b> member of the passed in <i>Credential</i> structure is not valid. For a description of valid user name syntax, see the definition of that member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CRED_PRESERVE_CREDENTIAL_BLOB was specified and there is no existing credential by the same <b>TargetName</b> and <b>Type</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NO_READERS_AVAILABLE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CRED_TYPE_CERTIFICATE credential being written requires the smart card reader to be available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NO_SMARTCARD or SCARD_W_REMOVED_CARD</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A CRED_TYPE_CERTIFICATE credential being written requires the smart card to be inserted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_WRONG_CHV</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wrong PIN was supplied for the CRED_TYPE_CERTIFICATE credential being written.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credwritew
     * @since windows5.1.2600
     */
    static CredWriteW(Credential, Flags) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredWriteW", "ptr", Credential, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new credential or modifies an existing credential in the user's credential set.
     * @param {Pointer<CREDENTIALA>} Credential A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credentiala">CREDENTIAL</a> structure to be written.
     * @param {Integer} Flags Flags that control the function's operation. The following flag is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PRESERVE_CREDENTIAL_BLOB"></a><a id="cred_preserve_credential_blob"></a><dl>
     * <dt><b>CRED_PRESERVE_CREDENTIAL_BLOB</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential BLOB from an existing credential is preserved with the same credential name and credential type. The <b>CredentialBlobSize</b> of the passed in <i>Credential</i> structure must be zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get a more specific status code. The following status codes can be returned.
     * 
     * Other smart card errors can be returned when writing a CRED_TYPE_CERTIFICATE credential.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certain fields cannot be changed in an existing credential. This error is returned if a field does not match the value in a protected field of the existing credential.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A value that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_USERNAME</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>UserName</b> member of the passed in <i>Credential</i> structure is not valid. For a description of valid user name syntax, see the definition of that member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CRED_PRESERVE_CREDENTIAL_BLOB was specified and there is no existing credential by the same <b>TargetName</b> and <b>Type</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NO_READERS_AVAILABLE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CRED_TYPE_CERTIFICATE credential being written requires the smart card reader to be available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NO_SMARTCARD or SCARD_W_REMOVED_CARD</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A CRED_TYPE_CERTIFICATE credential being written requires the smart card to be inserted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_WRONG_CHV</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wrong PIN was supplied for the CRED_TYPE_CERTIFICATE credential being written.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credwritea
     * @since windows5.1.2600
     */
    static CredWriteA(Credential, Flags) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredWriteA", "ptr", Credential, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads a credential from the user's credential set.
     * @param {PWSTR} TargetName Pointer to a null-terminated string that contains the name of the credential to read.
     * @param {Integer} Type Type of the credential to read. <i>Type</i> must be one of the CRED_TYPE_* defined types.
     * @param {Pointer<Pointer<CREDENTIALW>>} Credential Pointer to a single allocated block buffer to return the credential.
     * Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned:
     * 
     * <ul>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * No credential exists with the specified <i>TargetName</i>.
     * 								
     * 
     * </li>
     * <li>ERROR_NO_SUCH_LOGON_SESSION 
     * 
     * 
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </li>
     * <li>ERROR_INVALID_FLAGS 
     * 
     * 
     * A flag that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credreadw
     * @since windows5.1.2600
     */
    static CredReadW(TargetName, Type, Credential) {
        static Flags := 0 ;Reserved parameters must always be NULL

        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredReadW", "ptr", TargetName, "uint", Type, "uint", Flags, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads a credential from the user's credential set.
     * @param {PSTR} TargetName Pointer to a null-terminated string that contains the name of the credential to read.
     * @param {Integer} Type Type of the credential to read. <i>Type</i> must be one of the CRED_TYPE_* defined types.
     * @param {Pointer<Pointer<CREDENTIALA>>} Credential Pointer to a single allocated block buffer to return the credential.
     * Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned:
     * 
     * <ul>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * No credential exists with the specified <i>TargetName</i>.
     * 								
     * 
     * </li>
     * <li>ERROR_NO_SUCH_LOGON_SESSION 
     * 
     * 
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </li>
     * <li>ERROR_INVALID_FLAGS 
     * 
     * 
     * A flag that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credreada
     * @since windows5.1.2600
     */
    static CredReadA(TargetName, Type, Credential) {
        static Flags := 0 ;Reserved parameters must always be NULL

        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredReadA", "ptr", TargetName, "uint", Type, "uint", Flags, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the credentials from the user's credential set.
     * @param {PWSTR} Filter Pointer to a <b>null</b>-terminated string that contains the filter for the returned credentials. Only credentials with a <i>TargetName</i> matching the filter will be returned. The filter specifies a name prefix followed by an asterisk. For instance, the filter "FRED*" will return all credentials with a <i>TargetName</i> beginning with the string "FRED".
     * 
     * 
     * If <b>NULL</b> is specified, all credentials will be returned.
     * @param {Pointer<Integer>} Count Count of the credentials returned in the <i>Credentials</i> array.
     * @param {Pointer<Pointer<Pointer<CREDENTIALW>>>} Credential Pointer to an array of pointers to credentials.
     * The returned credential is a single allocated block. Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * <dt>1168 (0x490)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No credential exists matching the specified <i>Filter</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * <dt>1312 (0x520)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * <dt>1004 (0x3EC)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A flag that is not valid was specified for the <i>Flags</i> parameter, or <b>CRED_ENUMERATE_ALL_CREDENTIALS</b> is specified for the <i>Flags</i> parameter and the <i>Filter</i> parameter is not <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credenumeratew
     * @since windows5.1.2600
     */
    static CredEnumerateW(Filter, Count, Credential) {
        static Flags := 0 ;Reserved parameters must always be NULL

        Filter := Filter is String ? StrPtr(Filter) : Filter

        CountMarshal := Count is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredEnumerateW", "ptr", Filter, "uint", Flags, CountMarshal, Count, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the credentials from the user's credential set.
     * @param {PSTR} Filter Pointer to a <b>null</b>-terminated string that contains the filter for the returned credentials. Only credentials with a <i>TargetName</i> matching the filter will be returned. The filter specifies a name prefix followed by an asterisk. For instance, the filter "FRED*" will return all credentials with a <i>TargetName</i> beginning with the string "FRED".
     * 
     * 
     * If <b>NULL</b> is specified, all credentials will be returned.
     * @param {Pointer<Integer>} Count Count of the credentials returned in the <i>Credentials</i> array.
     * @param {Pointer<Pointer<Pointer<CREDENTIALA>>>} Credential Pointer to an array of pointers to credentials.
     * The returned credential is a single allocated block. Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * <dt>1168 (0x490)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No credential exists matching the specified <i>Filter</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * <dt>1312 (0x520)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * <dt>1004 (0x3EC)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A flag that is not valid was specified for the <i>Flags</i> parameter, or <b>CRED_ENUMERATE_ALL_CREDENTIALS</b> is specified for the <i>Flags</i> parameter and the <i>Filter</i> parameter is not <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credenumeratea
     * @since windows5.1.2600
     */
    static CredEnumerateA(Filter, Count, Credential) {
        static Flags := 0 ;Reserved parameters must always be NULL

        Filter := Filter is String ? StrPtr(Filter) : Filter

        CountMarshal := Count is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredEnumerateA", "ptr", Filter, "uint", Flags, CountMarshal, Count, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes domain credentials to the user's credential set.
     * @param {Pointer<CREDENTIAL_TARGET_INFORMATIONW>} TargetInfo Identifies the target server. At least one of the naming members must be non-<b>NULL</b> and can be <b>NetbiosServerName</b>, <b>DnsServerName</b>, <b>NetbiosDomainName</b>, <b>DnsDomainName</b>, or <b>DnsTreeName</b>.
     * @param {Pointer<CREDENTIALW>} Credential Credential to be written. 
     * 
     * 
     * 
     * 
     * The credential must be one that matches <i>TargetInfo</i> For instance, if the <b>TargetName</b> is a wildcard DNS name, then the <b>TargetName</b> member of the credential must be a postfix of the <b>DnsServerName</b> member from the <i>TargetInfo</i>.
     * @param {Integer} Flags Flags to control the operation of the API. The following flag is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PRESERVE_CREDENTIAL_BLOB"></a><a id="cred_preserve_credential_blob"></a><dl>
     * <dt><b>CRED_PRESERVE_CREDENTIAL_BLOB</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential BLOB should be preserved from the already existing credential with the same credential name and credential type. The <b>CredentialBlobSize</b> of the passed in <i>Credential</i> structure must be zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get a more specific status code. The following status codes can be returned.
     * 
     * Other smart card errors can be returned when writing a CRED_TYPE_CERTIFICATE credential.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are not valid. Either none of the naming parameters were specified, or the credential specified did not have the <b>Type</b> member set to CRED_TYPE_DOMAIN_PASSWORD or CRED_TYPE_DOMAIN_CERTIFICATE, or the <i>Credential</i> does not match the <i>TargetInfo</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A value that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_USERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>UserName</b> member of the passed in <i>Credential</i> structure is not valid. For a description of valid syntaxes, see the definition of that member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CRED_PRESERVE_CREDENTIAL_BLOB was specified and there is no existing credential by the same <b>TargetName</b> and <b>Type</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NO_READERS_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CRED_TYPE_CERTIFICATE credential being written requires the smart card reader to be available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NO_SMARTCARD or SCARD_W_REMOVED_CARD: The CRED_TYPE_CERTIFICATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential being written requires the smart card to be inserted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_WRONG_CHV</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wrong PIN was supplied for the CRED_TYPE_CERTIFICATE credential being written.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credwritedomaincredentialsw
     * @since windows5.1.2600
     */
    static CredWriteDomainCredentialsW(TargetInfo, Credential, Flags) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredWriteDomainCredentialsW", "ptr", TargetInfo, "ptr", Credential, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes domain credentials to the user's credential set.
     * @param {Pointer<CREDENTIAL_TARGET_INFORMATIONA>} TargetInfo Identifies the target server. At least one of the naming members must be non-<b>NULL</b> and can be <b>NetbiosServerName</b>, <b>DnsServerName</b>, <b>NetbiosDomainName</b>, <b>DnsDomainName</b>, or <b>DnsTreeName</b>.
     * @param {Pointer<CREDENTIALA>} Credential Credential to be written. 
     * 
     * 
     * 
     * 
     * The credential must be one that matches <i>TargetInfo</i> For instance, if the <b>TargetName</b> is a wildcard DNS name, then the <b>TargetName</b> member of the credential must be a postfix of the <b>DnsServerName</b> member from the <i>TargetInfo</i>.
     * @param {Integer} Flags Flags to control the operation of the API. The following flag is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PRESERVE_CREDENTIAL_BLOB"></a><a id="cred_preserve_credential_blob"></a><dl>
     * <dt><b>CRED_PRESERVE_CREDENTIAL_BLOB</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential BLOB should be preserved from the already existing credential with the same credential name and credential type. The <b>CredentialBlobSize</b> of the passed in <i>Credential</i> structure must be zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get a more specific status code. The following status codes can be returned.
     * 
     * Other smart card errors can be returned when writing a CRED_TYPE_CERTIFICATE credential.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are not valid. Either none of the naming parameters were specified, or the credential specified did not have the <b>Type</b> member set to CRED_TYPE_DOMAIN_PASSWORD or CRED_TYPE_DOMAIN_CERTIFICATE, or the <i>Credential</i> does not match the <i>TargetInfo</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A value that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_USERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>UserName</b> member of the passed in <i>Credential</i> structure is not valid. For a description of valid syntaxes, see the definition of that member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CRED_PRESERVE_CREDENTIAL_BLOB was specified and there is no existing credential by the same <b>TargetName</b> and <b>Type</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NO_READERS_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CRED_TYPE_CERTIFICATE credential being written requires the smart card reader to be available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NO_SMARTCARD or SCARD_W_REMOVED_CARD: The CRED_TYPE_CERTIFICATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential being written requires the smart card to be inserted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_WRONG_CHV</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wrong PIN was supplied for the CRED_TYPE_CERTIFICATE credential being written.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credwritedomaincredentialsa
     * @since windows5.1.2600
     */
    static CredWriteDomainCredentialsA(TargetInfo, Credential, Flags) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredWriteDomainCredentialsA", "ptr", TargetInfo, "ptr", Credential, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads the domain credentials from the user's credential set.
     * @param {Pointer<CREDENTIAL_TARGET_INFORMATIONW>} TargetInfo Target information that identifies the target server. At least one of the naming members must not be <b>NULL</b>: NetbiosServerName, DnsServerName, NetbiosDomainName, DnsDomainName or DnsTreeName.
     * @param {Integer} Flags Flags controlling the operation of the function. 
     * 
     * 
     * 
     * 
     * The following flag is defined:
     * 
     * CRED_CACHE_TARGET_INFORMATION
     * 
     * Cache the TargetInfo for a subsequent read using <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credgettargetinfoa">CredGetTargetInfo</a>.
     * @param {Pointer<Integer>} Count Count of the credentials returned in the <i>Credentials</i> array.
     * @param {Pointer<Pointer<Pointer<CREDENTIALW>>>} Credential Pointer to an array of pointers to credentials. The most specific existing credential matching the <i>TargetInfo</i> is returned. If credentials of various types (for example, CRED_TYPE_DOMAIN_PASSWORD and CRED_TYPE_DOMAIN_CERTIFICATE credentials) exist, one of each type is returned. If a connection were to be made to the named target, this most-specific credential would be used. 
     * 
     * 
     * 
     * 
     * Only those credential types specified by the <i>TargetInfo</i>.CredTypes array are returned. The returned <i>Credentials</i> array is sorted in the same order as the <i>TargetInfo</i>.CredTypes array. That is, authentication packages specify a preferred credential type by specifying it earlier in the <i>TargetInfo</i>.CredTypes array.If <i>TargetInfo</i>.CredTypeCount is zero, the <i>Credentials</i> array is returned in the following sorted order:
     * 
     * <ul>
     * <li>CRED_TYPE_DOMAIN_CERTIFICATE</li>
     * <li>CRED_TYPE_DOMAIN_PASSWORD</li>
     * </ul>
     * 
     * 
     * The returned buffer is a single allocated block. Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned:
     * 
     * <ul>
     * <li>ERROR_INVALID_PARAMETER 
     * 
     * 
     * None of the naming parameters were specified.
     * 
     * </li>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * There are no credentials matching the specified naming parameters.
     * 
     * </li>
     * <li>ERROR_NO_SUCH_LOGON_SESSION 
     * 
     * 
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </li>
     * <li>ERROR_INVALID_FLAGS 
     * 
     * 
     * A flag that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credreaddomaincredentialsw
     * @since windows5.1.2600
     */
    static CredReadDomainCredentialsW(TargetInfo, Flags, Count, Credential) {
        CountMarshal := Count is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredReadDomainCredentialsW", "ptr", TargetInfo, "uint", Flags, CountMarshal, Count, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads the domain credentials from the user's credential set.
     * @param {Pointer<CREDENTIAL_TARGET_INFORMATIONA>} TargetInfo Target information that identifies the target server. At least one of the naming members must not be <b>NULL</b>: NetbiosServerName, DnsServerName, NetbiosDomainName, DnsDomainName or DnsTreeName.
     * @param {Integer} Flags Flags controlling the operation of the function. 
     * 
     * 
     * 
     * 
     * The following flag is defined:
     * 
     * CRED_CACHE_TARGET_INFORMATION
     * 
     * Cache the TargetInfo for a subsequent read using <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credgettargetinfoa">CredGetTargetInfo</a>.
     * @param {Pointer<Integer>} Count Count of the credentials returned in the <i>Credentials</i> array.
     * @param {Pointer<Pointer<Pointer<CREDENTIALA>>>} Credential Pointer to an array of pointers to credentials. The most specific existing credential matching the <i>TargetInfo</i> is returned. If credentials of various types (for example, CRED_TYPE_DOMAIN_PASSWORD and CRED_TYPE_DOMAIN_CERTIFICATE credentials) exist, one of each type is returned. If a connection were to be made to the named target, this most-specific credential would be used. 
     * 
     * 
     * 
     * 
     * Only those credential types specified by the <i>TargetInfo</i>.CredTypes array are returned. The returned <i>Credentials</i> array is sorted in the same order as the <i>TargetInfo</i>.CredTypes array. That is, authentication packages specify a preferred credential type by specifying it earlier in the <i>TargetInfo</i>.CredTypes array.If <i>TargetInfo</i>.CredTypeCount is zero, the <i>Credentials</i> array is returned in the following sorted order:
     * 
     * <ul>
     * <li>CRED_TYPE_DOMAIN_CERTIFICATE</li>
     * <li>CRED_TYPE_DOMAIN_PASSWORD</li>
     * </ul>
     * 
     * 
     * The returned buffer is a single allocated block. Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned:
     * 
     * <ul>
     * <li>ERROR_INVALID_PARAMETER 
     * 
     * 
     * None of the naming parameters were specified.
     * 
     * </li>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * There are no credentials matching the specified naming parameters.
     * 
     * </li>
     * <li>ERROR_NO_SUCH_LOGON_SESSION 
     * 
     * 
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </li>
     * <li>ERROR_INVALID_FLAGS 
     * 
     * 
     * A flag that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credreaddomaincredentialsa
     * @since windows5.1.2600
     */
    static CredReadDomainCredentialsA(TargetInfo, Flags, Count, Credential) {
        CountMarshal := Count is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredReadDomainCredentialsA", "ptr", TargetInfo, "uint", Flags, CountMarshal, Count, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a credential from the user's credential set.
     * @param {PWSTR} TargetName Pointer to a null-terminated string that contains the name of the credential to delete.
     * @param {Integer} Type Type of the credential to delete. Must be one of the CRED_TYPE_* defined types. For a list of the defined types, see the <b>Type</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credentiala">CREDENTIAL</a> structure.
     * 
     * If the value of this parameter is <b>CRED_TYPE_DOMAIN_EXTENDED</b>, this function can delete a credential that specifies a user name when there are multiple credentials for the same target. The value of the <i>TargetName</i> parameter must specify the user name as <i>Target</i><b>|</b><i>UserName</i>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned:
     * 						
     * 
     * <ul>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * There is no credential with the specified <i>TargetName</i>.
     * 								
     * 
     * </li>
     * <li>ERROR_NO_SUCH_LOGON_SESSION 
     * 
     * 
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </li>
     * <li>ERROR_INVALID_FLAGS 
     * 
     * 
     * A flag that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creddeletew
     * @since windows5.1.2600
     */
    static CredDeleteW(TargetName, Type) {
        static Flags := 0 ;Reserved parameters must always be NULL

        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredDeleteW", "ptr", TargetName, "uint", Type, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a credential from the user's credential set.
     * @param {PSTR} TargetName Pointer to a null-terminated string that contains the name of the credential to delete.
     * @param {Integer} Type Type of the credential to delete. Must be one of the CRED_TYPE_* defined types. For a list of the defined types, see the <b>Type</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credentiala">CREDENTIAL</a> structure.
     * 
     * If the value of this parameter is <b>CRED_TYPE_DOMAIN_EXTENDED</b>, this function can delete a credential that specifies a user name when there are multiple credentials for the same target. The value of the <i>TargetName</i> parameter must specify the user name as <i>Target</i><b>|</b><i>UserName</i>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned:
     * 						
     * 
     * <ul>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * There is no credential with the specified <i>TargetName</i>.
     * 								
     * 
     * </li>
     * <li>ERROR_NO_SUCH_LOGON_SESSION 
     * 
     * 
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </li>
     * <li>ERROR_INVALID_FLAGS 
     * 
     * 
     * A flag that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creddeletea
     * @since windows5.1.2600
     */
    static CredDeleteA(TargetName, Type) {
        static Flags := 0 ;Reserved parameters must always be NULL

        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredDeleteA", "ptr", TargetName, "uint", Type, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * CredRename is no longer supported.
     * @param {PWSTR} OldTargetName Pointer to a null-terminated string that contains the current name of the credential to be renamed.
     * @param {PWSTR} NewTargetName Pointer to a null-terminated string that contains the new name for the credential.
     * @param {Integer} Type Type of the credential to rename. Must be one of the CRED_TYPE_* defines.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned:
     * 
     * <ul>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * There is no credential with the specified <i>OldTargetName</i>.
     * 
     * </li>
     * <li>ERROR_ALREADY_EXISTS 
     * 
     * 
     * There is already a credential or type <i>Type</i> and named <i>NewTargetName</i>.
     * 
     * </li>
     * <li>ERROR_NO_SUCH_LOGON_SESSION 
     * 
     * 
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </li>
     * <li>ERROR_INVALID_FLAGS 
     * 
     * 
     * A flag that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credrenamew
     * @since windows5.1.2600
     */
    static CredRenameW(OldTargetName, NewTargetName, Type) {
        static Flags := 0 ;Reserved parameters must always be NULL

        OldTargetName := OldTargetName is String ? StrPtr(OldTargetName) : OldTargetName
        NewTargetName := NewTargetName is String ? StrPtr(NewTargetName) : NewTargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredRenameW", "ptr", OldTargetName, "ptr", NewTargetName, "uint", Type, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * CredRename is no longer supported.
     * @param {PSTR} OldTargetName Pointer to a null-terminated string that contains the current name of the credential to be renamed.
     * @param {PSTR} NewTargetName Pointer to a null-terminated string that contains the new name for the credential.
     * @param {Integer} Type Type of the credential to rename. Must be one of the CRED_TYPE_* defines.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status codes can be returned:
     * 
     * <ul>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * There is no credential with the specified <i>OldTargetName</i>.
     * 
     * </li>
     * <li>ERROR_ALREADY_EXISTS 
     * 
     * 
     * There is already a credential or type <i>Type</i> and named <i>NewTargetName</i>.
     * 
     * </li>
     * <li>ERROR_NO_SUCH_LOGON_SESSION 
     * 
     * 
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * 
     * </li>
     * <li>ERROR_INVALID_FLAGS 
     * 
     * 
     * A flag that is not valid was specified for the <i>Flags</i> parameter.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credrenamea
     * @since windows5.1.2600
     */
    static CredRenameA(OldTargetName, NewTargetName, Type) {
        static Flags := 0 ;Reserved parameters must always be NULL

        OldTargetName := OldTargetName is String ? StrPtr(OldTargetName) : OldTargetName
        NewTargetName := NewTargetName is String ? StrPtr(NewTargetName) : NewTargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredRenameA", "ptr", OldTargetName, "ptr", NewTargetName, "uint", Type, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CredGetTargetInfo function retrieves all known target name information for the named target computer.
     * @param {PWSTR} TargetName Pointer to a null-terminated string that contains the name of the target computer for which information is to be retrieved.
     * @param {Integer} Flags Flags controlling the operation of the function. The following flag can be used: 
     * 
     * 
     * 
     * 
     * CRED_ALLOW_NAME_RESOLUTION
     * 
     * If no target information can be found for <i>TargetName</i> name resolution is done on <i>TargetName</i> to convert it to other forms. If target information exists for any of those other forms, it is returned. Currently only DNS name resolution is done.
     * 
     * This is useful if the application does not call an authentication package directly. The application can pass the <i>TargetName</i> to another layer of software to authenticate to the server, and that layer of software might resolve the name and pass the resolved name to the authentication package. As such, there will be no target information for the original <i>TargetName</i>.
     * @param {Pointer<Pointer<CREDENTIAL_TARGET_INFORMATIONW>>} TargetInfo Pointer to a single allocated block buffer to contain the target information. At least one of the returned members of <i>TargetInfo</i> will be non-NULL. Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status code can be returned:
     * 
     * <ul>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * Target information for the named server is not available.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credgettargetinfow
     * @since windows5.1.2600
     */
    static CredGetTargetInfoW(TargetName, Flags, TargetInfo) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredGetTargetInfoW", "ptr", TargetName, "uint", Flags, "ptr*", TargetInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CredGetTargetInfo function retrieves all known target name information for the named target computer.
     * @param {PSTR} TargetName Pointer to a null-terminated string that contains the name of the target computer for which information is to be retrieved.
     * @param {Integer} Flags Flags controlling the operation of the function. The following flag can be used: 
     * 
     * 
     * 
     * 
     * CRED_ALLOW_NAME_RESOLUTION
     * 
     * If no target information can be found for <i>TargetName</i> name resolution is done on <i>TargetName</i> to convert it to other forms. If target information exists for any of those other forms, it is returned. Currently only DNS name resolution is done.
     * 
     * This is useful if the application does not call an authentication package directly. The application can pass the <i>TargetName</i> to another layer of software to authenticate to the server, and that layer of software might resolve the name and pass the resolved name to the authentication package. As such, there will be no target information for the original <i>TargetName</i>.
     * @param {Pointer<Pointer<CREDENTIAL_TARGET_INFORMATIONA>>} TargetInfo Pointer to a single allocated block buffer to contain the target information. At least one of the returned members of <i>TargetInfo</i> will be non-NULL. Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} The function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status code can be returned:
     * 
     * <ul>
     * <li>ERROR_NOT_FOUND 
     * 
     * 
     * Target information for the named server is not available.
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credgettargetinfoa
     * @since windows5.1.2600
     */
    static CredGetTargetInfoA(TargetName, Flags, TargetInfo) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredGetTargetInfoA", "ptr", TargetName, "uint", Flags, "ptr*", TargetInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CredMarshalCredential function transforms a credential into a text string.
     * @param {Integer} CredType Type of the credential to marshal.
     * @param {Pointer<Void>} Credential Credential to marshal. 
     * 
     * 
     * This is one of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ne-wincred-cred_marshal_type">CRED_MARSHAL_TYPE</a> values.
     * 
     * If <i>CredType</i> is <i>CertCredential</i>, <i>Credential</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-cert_credential_info">CERT_CREDENTIAL_INFO</a> structure.
     * 
     * If <i>CredType</i> is <i>UsernameTargetCredential</i>, <i>Credential</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-username_target_credential_info">USERNAME_TARGET_CREDENTIAL_INFO</a> structure.
     * @param {Pointer<PWSTR>} MarshaledCredential Pointer to a <b>null</b>-terminated 
     * 						string that contains the marshaled credential. The caller should free the returned buffer using <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} This function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status code can be returned:
     * 
     * ERROR_INVALID_PARAMETER
     * 
     * <i>CredType</i> is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credmarshalcredentialw
     * @since windows5.1.2600
     */
    static CredMarshalCredentialW(CredType, Credential, MarshaledCredential) {
        CredentialMarshal := Credential is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredMarshalCredentialW", "int", CredType, CredentialMarshal, Credential, "ptr", MarshaledCredential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CredMarshalCredential function transforms a credential into a text string.
     * @param {Integer} CredType Type of the credential to marshal.
     * @param {Pointer<Void>} Credential Credential to marshal. 
     * 
     * 
     * This is one of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ne-wincred-cred_marshal_type">CRED_MARSHAL_TYPE</a> values.
     * 
     * If <i>CredType</i> is <i>CertCredential</i>, <i>Credential</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-cert_credential_info">CERT_CREDENTIAL_INFO</a> structure.
     * 
     * If <i>CredType</i> is <i>UsernameTargetCredential</i>, <i>Credential</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-username_target_credential_info">USERNAME_TARGET_CREDENTIAL_INFO</a> structure.
     * @param {Pointer<PSTR>} MarshaledCredential Pointer to a <b>null</b>-terminated 
     * 						string that contains the marshaled credential. The caller should free the returned buffer using <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} This function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status code can be returned:
     * 
     * ERROR_INVALID_PARAMETER
     * 
     * <i>CredType</i> is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credmarshalcredentiala
     * @since windows5.1.2600
     */
    static CredMarshalCredentialA(CredType, Credential, MarshaledCredential) {
        CredentialMarshal := Credential is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredMarshalCredentialA", "int", CredType, CredentialMarshal, Credential, "ptr", MarshaledCredential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CredUnmarshalCredential function transforms a marshaled credential back into its original form.
     * @param {PWSTR} MarshaledCredential Pointer to a null-terminated string that contains the marshaled credential.
     * @param {Pointer<Integer>} CredType Type of credential specified by <i>MarshaledCredential</i>. 
     * 
     * 
     * This is one of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ne-wincred-cred_marshal_type">CRED_MARSHAL_TYPE</a> values.
     * @param {Pointer<Pointer<Void>>} Credential Pointer to the unmarshaled credential. If <i>CredType</i> returns <i>CertCredential</i>, the returned pointer is to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-cert_credential_info">CERT_CREDENTIAL_INFO</a> structure. If <i>CredType</i> returns <i>UsernameTargetCredential</i>, the returned pointer is to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-username_target_credential_info">USERNAME_TARGET_CREDENTIAL_INFO</a> structure.
     * 
     * The caller should free the returned buffer using <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} This function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status code can be returned:
     * 
     * ERROR_INVALID_PARAMETER
     * 
     * <i>MarshaledCredential</i> is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credunmarshalcredentialw
     * @since windows5.1.2600
     */
    static CredUnmarshalCredentialW(MarshaledCredential, CredType, Credential) {
        MarshaledCredential := MarshaledCredential is String ? StrPtr(MarshaledCredential) : MarshaledCredential

        CredTypeMarshal := CredType is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredUnmarshalCredentialW", "ptr", MarshaledCredential, CredTypeMarshal, CredType, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CredUnmarshalCredential function transforms a marshaled credential back into its original form.
     * @param {PSTR} MarshaledCredential Pointer to a null-terminated string that contains the marshaled credential.
     * @param {Pointer<Integer>} CredType Type of credential specified by <i>MarshaledCredential</i>. 
     * 
     * 
     * This is one of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ne-wincred-cred_marshal_type">CRED_MARSHAL_TYPE</a> values.
     * @param {Pointer<Pointer<Void>>} Credential Pointer to the unmarshaled credential. If <i>CredType</i> returns <i>CertCredential</i>, the returned pointer is to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-cert_credential_info">CERT_CREDENTIAL_INFO</a> structure. If <i>CredType</i> returns <i>UsernameTargetCredential</i>, the returned pointer is to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-username_target_credential_info">USERNAME_TARGET_CREDENTIAL_INFO</a> structure.
     * 
     * The caller should free the returned buffer using <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a>.
     * @returns {BOOL} This function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status code can be returned:
     * 
     * ERROR_INVALID_PARAMETER
     * 
     * <i>MarshaledCredential</i> is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credunmarshalcredentiala
     * @since windows5.1.2600
     */
    static CredUnmarshalCredentialA(MarshaledCredential, CredType, Credential) {
        MarshaledCredential := MarshaledCredential is String ? StrPtr(MarshaledCredential) : MarshaledCredential

        CredTypeMarshal := CredType is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredUnmarshalCredentialA", "ptr", MarshaledCredential, CredTypeMarshal, CredType, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a specified user name string is a marshaled credential previously marshaled by CredMarshalCredential.
     * @param {PWSTR} MarshaledCredential Pointer to a null-terminated string that contains the marshaled credential.
     * @returns {BOOL} This function returns <b>TRUE</b> if <i>MarshaledCredential</i> is a marshaled credential and <b>FALSE</b> if it is not.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credismarshaledcredentialw
     * @since windows5.1.2600
     */
    static CredIsMarshaledCredentialW(MarshaledCredential) {
        MarshaledCredential := MarshaledCredential is String ? StrPtr(MarshaledCredential) : MarshaledCredential

        result := DllCall("ADVAPI32.dll\CredIsMarshaledCredentialW", "ptr", MarshaledCredential, "int")
        return result
    }

    /**
     * Determines whether a specified user name string is a marshaled credential previously marshaled by CredMarshalCredential.
     * @param {PSTR} MarshaledCredential Pointer to a null-terminated string that contains the marshaled credential.
     * @returns {BOOL} This function returns <b>TRUE</b> if <i>MarshaledCredential</i> is a marshaled credential and <b>FALSE</b> if it is not.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credismarshaledcredentiala
     * @since windows5.1.2600
     */
    static CredIsMarshaledCredentialA(MarshaledCredential) {
        MarshaledCredential := MarshaledCredential is String ? StrPtr(MarshaledCredential) : MarshaledCredential

        result := DllCall("ADVAPI32.dll\CredIsMarshaledCredentialA", "ptr", MarshaledCredential, "int")
        return result
    }

    /**
     * Converts an authentication buffer returned by a call to the CredUIPromptForWindowsCredentials function into a string user name and password.
     * @param {Integer} dwFlags Setting the value of this parameter to <b>CRED_PACK_PROTECTED_CREDENTIALS</b> specifies that the function attempts to decrypt the credentials in the authentication buffer. If the credential  cannot be decrypted, the function returns <b>FALSE</b>, and a call to the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function will return the value <b>ERROR_NOT_CAPABLE</b>.
     * 
     * How the decryption is done depends on the format of the authentication buffer.
     * 
     * If the authentication buffer is a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure, the function can decrypt the buffer if it is encrypted by using <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentityex">SspiEncryptAuthIdentityEx</a> with the SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON option.
     * 
     * If the authentication buffer is one of the marshaled KERB_*_LOGON structures, the function decrypts the password before returning it in the <i>pszPassword</i> buffer.
     * @param {Pointer} pAuthBuffer A pointer to the authentication buffer to be converted.
     * 
     * This buffer is typically the output of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credpackauthenticationbuffera">CredPackAuthenticationBuffer</a> function. This must be one of the following types:<ul>
     * <li>A <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure for identity credentials. The function does not accept other <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structures.</li>
     * <li>A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_interactive_logon">KERB_INTERACTIVE_LOGON</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_interactive_unlock_logon">KERB_INTERACTIVE_UNLOCK_LOGON</a>  structure for password credentials.</li>
     * <li>A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_logon">KERB_CERTIFICATE_LOGON</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_unlock_logon">KERB_CERTIFICATE_UNLOCK_LOGON</a>  structure for smart card certificate credentials.</li>
     * <li>GENERIC_CRED for generic credentials.</li>
     * </ul>
     * @param {Integer} cbAuthBuffer The size, in bytes, of the <i>pAuthBuffer</i> buffer.
     * @param {PWSTR} pszUserName A pointer to a null-terminated string that receives the user name.
     * 
     * This string can be a marshaled credential. See Remarks.
     * @param {Pointer<Integer>} pcchMaxUserName A pointer to a <b>DWORD</b> value that specifies the size, in characters, of the <i>pszUserName</i> buffer. On output, if the buffer is not of sufficient size, specifies the required size, in characters, of the  <i>pszUserName</i> buffer. The size includes terminating null character.
     * @param {PWSTR} pszDomainName A pointer to a null-terminated string that receives the name of the user's domain.
     * @param {Pointer<Integer>} pcchMaxDomainName A pointer to a <b>DWORD</b> value that specifies the size, in characters, of the <i>pszDomainName</i> buffer. On output, if the buffer is not of sufficient size, specifies the required size, in characters, of the  <i>pszDomainName</i> buffer. The size includes the terminating null character. The required size can be zero if there is no domain name.
     * @param {PWSTR} pszPassword A pointer to a null-terminated string that receives the password.
     * @param {Pointer<Integer>} pcchMaxPassword A pointer to a <b>DWORD</b> value that specifies the size, in characters, of the <i>pszPassword</i> buffer. On output, if the buffer is not of sufficient size, specifies the required size, in characters, of the  <i>pszPassword</i> buffer. The size includes the terminating null character.  
     * 
     * This string can be a marshaled credential. See Remarks.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. The following table shows common values for the <b>GetLastError</b> function.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_NOT_CAPABLE</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CRED_PACK_PROTECTED_CREDENTIALS was passed as the value of the <i>dwFlags</i> parameter, but this function cannot decrypt the credential because the security context used to protect the password is different from the security context of the caller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_INSUFFICIENT_BUFFER</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the output buffers, <i>pszUserName</i>, <i>pszDomainName</i>, or <i>pszPassword</i>,  was of insufficient size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_NOT_SUPPORTED</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authentication buffer is not of a supported type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credunpackauthenticationbufferw
     * @since windows6.0.6000
     */
    static CredUnPackAuthenticationBufferW(dwFlags, pAuthBuffer, cbAuthBuffer, pszUserName, pcchMaxUserName, pszDomainName, pcchMaxDomainName, pszPassword, pcchMaxPassword) {
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszDomainName := pszDomainName is String ? StrPtr(pszDomainName) : pszDomainName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        pcchMaxUserNameMarshal := pcchMaxUserName is VarRef ? "uint*" : "ptr"
        pcchMaxDomainNameMarshal := pcchMaxDomainName is VarRef ? "uint*" : "ptr"
        pcchMaxPasswordMarshal := pcchMaxPassword is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("credui.dll\CredUnPackAuthenticationBufferW", "uint", dwFlags, "ptr", pAuthBuffer, "uint", cbAuthBuffer, "ptr", pszUserName, pcchMaxUserNameMarshal, pcchMaxUserName, "ptr", pszDomainName, pcchMaxDomainNameMarshal, pcchMaxDomainName, "ptr", pszPassword, pcchMaxPasswordMarshal, pcchMaxPassword, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts an authentication buffer returned by a call to the CredUIPromptForWindowsCredentials function into a string user name and password.
     * @param {Integer} dwFlags Setting the value of this parameter to <b>CRED_PACK_PROTECTED_CREDENTIALS</b> specifies that the function attempts to decrypt the credentials in the authentication buffer. If the credential  cannot be decrypted, the function returns <b>FALSE</b>, and a call to the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function will return the value <b>ERROR_NOT_CAPABLE</b>.
     * 
     * How the decryption is done depends on the format of the authentication buffer.
     * 
     * If the authentication buffer is a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure, the function can decrypt the buffer if it is encrypted by using <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentityex">SspiEncryptAuthIdentityEx</a> with the SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON option.
     * 
     * If the authentication buffer is one of the marshaled KERB_*_LOGON structures, the function decrypts the password before returning it in the <i>pszPassword</i> buffer.
     * @param {Pointer} pAuthBuffer A pointer to the authentication buffer to be converted.
     * 
     * This buffer is typically the output of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credpackauthenticationbuffera">CredPackAuthenticationBuffer</a> function. This must be one of the following types:<ul>
     * <li>A <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure for identity credentials. The function does not accept other <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structures.</li>
     * <li>A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_interactive_logon">KERB_INTERACTIVE_LOGON</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_interactive_unlock_logon">KERB_INTERACTIVE_UNLOCK_LOGON</a>  structure for password credentials.</li>
     * <li>A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_logon">KERB_CERTIFICATE_LOGON</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_unlock_logon">KERB_CERTIFICATE_UNLOCK_LOGON</a>  structure for smart card certificate credentials.</li>
     * <li>GENERIC_CRED for generic credentials.</li>
     * </ul>
     * @param {Integer} cbAuthBuffer The size, in bytes, of the <i>pAuthBuffer</i> buffer.
     * @param {PSTR} pszUserName A pointer to a null-terminated string that receives the user name.
     * 
     * This string can be a marshaled credential. See Remarks.
     * @param {Pointer<Integer>} pcchlMaxUserName A pointer to a <b>DWORD</b> value that specifies the size, in characters, of the <i>pszUserName</i> buffer. On output, if the buffer is not of sufficient size, specifies the required size, in characters, of the  <i>pszUserName</i> buffer. The size includes terminating null character.
     * @param {PSTR} pszDomainName A pointer to a null-terminated string that receives the name of the user's domain.
     * @param {Pointer<Integer>} pcchMaxDomainName A pointer to a <b>DWORD</b> value that specifies the size, in characters, of the <i>pszDomainName</i> buffer. On output, if the buffer is not of sufficient size, specifies the required size, in characters, of the  <i>pszDomainName</i> buffer. The size includes the terminating null character. The required size can be zero if there is no domain name.
     * @param {PSTR} pszPassword A pointer to a null-terminated string that receives the password.
     * @param {Pointer<Integer>} pcchMaxPassword A pointer to a <b>DWORD</b> value that specifies the size, in characters, of the <i>pszPassword</i> buffer. On output, if the buffer is not of sufficient size, specifies the required size, in characters, of the  <i>pszPassword</i> buffer. The size includes the terminating null character.  
     * 
     * This string can be a marshaled credential. See Remarks.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. The following table shows common values for the <b>GetLastError</b> function.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_NOT_CAPABLE</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CRED_PACK_PROTECTED_CREDENTIALS was passed as the value of the <i>dwFlags</i> parameter, but this function cannot decrypt the credential because the security context used to protect the password is different from the security context of the caller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_INSUFFICIENT_BUFFER</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the output buffers, <i>pszUserName</i>, <i>pszDomainName</i>, or <i>pszPassword</i>,  was of insufficient size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_NOT_SUPPORTED</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authentication buffer is not of a supported type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credunpackauthenticationbuffera
     * @since windows6.0.6000
     */
    static CredUnPackAuthenticationBufferA(dwFlags, pAuthBuffer, cbAuthBuffer, pszUserName, pcchlMaxUserName, pszDomainName, pcchMaxDomainName, pszPassword, pcchMaxPassword) {
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszDomainName := pszDomainName is String ? StrPtr(pszDomainName) : pszDomainName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        pcchlMaxUserNameMarshal := pcchlMaxUserName is VarRef ? "uint*" : "ptr"
        pcchMaxDomainNameMarshal := pcchMaxDomainName is VarRef ? "uint*" : "ptr"
        pcchMaxPasswordMarshal := pcchMaxPassword is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("credui.dll\CredUnPackAuthenticationBufferA", "uint", dwFlags, "ptr", pAuthBuffer, "uint", cbAuthBuffer, "ptr", pszUserName, pcchlMaxUserNameMarshal, pcchlMaxUserName, "ptr", pszDomainName, pcchMaxDomainNameMarshal, pcchMaxDomainName, "ptr", pszPassword, pcchMaxPasswordMarshal, pcchMaxPassword, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a string user name and password into an authentication buffer.
     * @param {Integer} dwFlags Specifies how the credential should be packed. This can be a combination of the following flags. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PACK_PROTECTED_CREDENTIALS"></a><a id="cred_pack_protected_credentials"></a><dl>
     * <dt><b>CRED_PACK_PROTECTED_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypts the credential so that it can only be decrypted by processes in the caller's logon session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PACK_WOW_BUFFER"></a><a id="cred_pack_wow_buffer"></a><dl>
     * <dt><b>CRED_PACK_WOW_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypts the credential in a WOW buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PACK_GENERIC_CREDENTIALS"></a><a id="cred_pack_generic_credentials"></a><dl>
     * <dt><b>CRED_PACK_GENERIC_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypts the credential in a CRED_GENERIC buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PACK_ID_PROVIDER_CREDENTIALS"></a><a id="cred_pack_id_provider_credentials"></a><dl>
     * <dt><b>CRED_PACK_ID_PROVIDER_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Encrypts the credential of an online identity into a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure.  If CRED_PACK_GENERIC_CREDENTIALS and CRED_PACK_ID_PROVIDER_CREDENTIALS are not set, encrypts the credentials in a KERB_INTERACTIVE_LOGON buffer.
     * 
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pszUserName A pointer to a null-terminated string that specifies the user name to be converted. For domain users, the string must be in the following format:
     * 
     * <i>DomainName</i><b>\\</b><i>UserName</i>
     * 
     * For online identities, if the credential is a plaintext password, the user name format is <i>ProviderName</i><b>\\</b><i>UserName</i>. If the credential is a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure, the user name is an encoded string that is the <i>UserName</i> parameter output of a function call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencodeauthidentityasstrings">SspiEncodeAuthIdentityAsStrings</a>.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a> or certificate credentials, the user name is an encoded string that is the output of a function call to <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credmarshalcredentiala">CredMarshalCredential</a> with the CertCredential option.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>Online identities are not supported.
     * @param {PWSTR} pszPassword A pointer to a null-terminated string that specifies the password to be converted.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> credentials, the password is an encoded string that is in the <i>ppszPackedCredentialsString</i> output of a function call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencodeauthidentityasstrings">SspiEncodeAuthIdentityAsStrings</a>.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a>  credentials, this is the <i>smart card</i> PIN.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>Online identities are not supported.
     * @param {Pointer} pPackedCredentials A pointer to an array of bytes that, on output, receives the packed authentication buffer. This parameter can be <b>NULL</b> to receive the required buffer size in the <i>pcbPackedCredentials</i> parameter.
     * @param {Pointer<Integer>} pcbPackedCredentials A pointer to a <b>DWORD</b> value that specifies the size, in bytes, of the <i>pPackedCredentials</i> buffer. On output, if the buffer is not of sufficient size, specifies the required size, in bytes, of the  <i>pPackedCredentials</i> buffer.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function, which may return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer provided by <i>pPackedCredentials</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credpackauthenticationbufferw
     * @since windows6.0.6000
     */
    static CredPackAuthenticationBufferW(dwFlags, pszUserName, pszPassword, pPackedCredentials, pcbPackedCredentials) {
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        pcbPackedCredentialsMarshal := pcbPackedCredentials is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("credui.dll\CredPackAuthenticationBufferW", "uint", dwFlags, "ptr", pszUserName, "ptr", pszPassword, "ptr", pPackedCredentials, pcbPackedCredentialsMarshal, pcbPackedCredentials, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a string user name and password into an authentication buffer.
     * @param {Integer} dwFlags Specifies how the credential should be packed. This can be a combination of the following flags. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PACK_PROTECTED_CREDENTIALS"></a><a id="cred_pack_protected_credentials"></a><dl>
     * <dt><b>CRED_PACK_PROTECTED_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypts the credential so that it can only be decrypted by processes in the caller's logon session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PACK_WOW_BUFFER"></a><a id="cred_pack_wow_buffer"></a><dl>
     * <dt><b>CRED_PACK_WOW_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypts the credential in a WOW buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PACK_GENERIC_CREDENTIALS"></a><a id="cred_pack_generic_credentials"></a><dl>
     * <dt><b>CRED_PACK_GENERIC_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypts the credential in a CRED_GENERIC buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PACK_ID_PROVIDER_CREDENTIALS"></a><a id="cred_pack_id_provider_credentials"></a><dl>
     * <dt><b>CRED_PACK_ID_PROVIDER_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Encrypts the credential of an online identity into a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure.  If CRED_PACK_GENERIC_CREDENTIALS and CRED_PACK_ID_PROVIDER_CREDENTIALS are not set, encrypts the credentials in a KERB_INTERACTIVE_LOGON buffer.
     * 
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSTR} pszUserName A pointer to a null-terminated string that specifies the user name to be converted. For domain users, the string must be in the following format:
     * 
     * <i>DomainName</i><b>\\</b><i>UserName</i>
     * 
     * For online identities, if the credential is a plaintext password, the user name format is <i>ProviderName</i><b>\\</b><i>UserName</i>. If the credential is a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure, the user name is an encoded string that is the <i>UserName</i> parameter output of a function call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencodeauthidentityasstrings">SspiEncodeAuthIdentityAsStrings</a>.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a> or certificate credentials, the user name is an encoded string that is the output of a function call to <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credmarshalcredentiala">CredMarshalCredential</a> with the CertCredential option.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>Online identities are not supported.
     * @param {PSTR} pszPassword A pointer to a null-terminated string that specifies the password to be converted.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> credentials, the password is an encoded string that is in the <i>ppszPackedCredentialsString</i> output of a function call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencodeauthidentityasstrings">SspiEncodeAuthIdentityAsStrings</a>.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a>  credentials, this is the <i>smart card</i> PIN.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>Online identities are not supported.
     * @param {Pointer} pPackedCredentials A pointer to an array of bytes that, on output, receives the packed authentication buffer. This parameter can be <b>NULL</b> to receive the required buffer size in the <i>pcbPackedCredentials</i> parameter.
     * @param {Pointer<Integer>} pcbPackedCredentials A pointer to a <b>DWORD</b> value that specifies the size, in bytes, of the <i>pPackedCredentials</i> buffer. On output, if the buffer is not of sufficient size, specifies the required size, in bytes, of the  <i>pPackedCredentials</i> buffer.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function, which may return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer provided by <i>pPackedCredentials</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credpackauthenticationbuffera
     * @since windows6.0.6000
     */
    static CredPackAuthenticationBufferA(dwFlags, pszUserName, pszPassword, pPackedCredentials, pcbPackedCredentials) {
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        pcbPackedCredentialsMarshal := pcbPackedCredentials is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("credui.dll\CredPackAuthenticationBufferA", "uint", dwFlags, "ptr", pszUserName, "ptr", pszPassword, "ptr", pPackedCredentials, pcbPackedCredentialsMarshal, pcbPackedCredentials, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Encrypts the specified credentials so that only the current security context can decrypt them.
     * @param {BOOL} fAsSelf Set to <b>TRUE</b> to specify that the credentials are encrypted in the security context of the current process. Set to <b>FALSE</b> to specify that credentials are encrypted in the security context of the calling thread security context.
     * @param {PWSTR} pszCredentials A pointer to a string that specifies the credentials to encrypt. The function encrypts the number of characters provided in the <i>cchCredentials</i> parameter.
     * @param {Integer} cchCredentials The size, in characters, of the <i>pszCredentials</i> buffer.
     * @param {PWSTR} pszProtectedCredentials A pointer to a string that, on output, receives the encrypted credentials.
     * @param {Pointer<Integer>} pcchMaxChars The size, in characters of the <i>pszProtectedCredentials</i> buffer. On output, if the <i>pszProtectedCredentials</i> is not of sufficient size to receive the encrypted credentials, this parameter specifies the required size, in characters, of the <i>pszProtectedCredentials</i> buffer.
     * @param {Pointer<Integer>} ProtectionType A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ne-wincred-cred_protection_type">CRED_PROTECTION_TYPE</a> enumeration type that, on output, specifies the type of protection provided.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credprotectw
     * @since windows6.0.6000
     */
    static CredProtectW(fAsSelf, pszCredentials, cchCredentials, pszProtectedCredentials, pcchMaxChars, ProtectionType) {
        pszCredentials := pszCredentials is String ? StrPtr(pszCredentials) : pszCredentials
        pszProtectedCredentials := pszProtectedCredentials is String ? StrPtr(pszProtectedCredentials) : pszProtectedCredentials

        pcchMaxCharsMarshal := pcchMaxChars is VarRef ? "uint*" : "ptr"
        ProtectionTypeMarshal := ProtectionType is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredProtectW", "int", fAsSelf, "ptr", pszCredentials, "uint", cchCredentials, "ptr", pszProtectedCredentials, pcchMaxCharsMarshal, pcchMaxChars, ProtectionTypeMarshal, ProtectionType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Encrypts the specified credentials so that only the current security context can decrypt them.
     * @param {BOOL} fAsSelf Set to <b>TRUE</b> to specify that the credentials are encrypted in the security context of the current process. Set to <b>FALSE</b> to specify that credentials are encrypted in the security context of the calling thread security context.
     * @param {PSTR} pszCredentials A pointer to a string that specifies the credentials to encrypt. The function encrypts the number of characters provided in the <i>cchCredentials</i> parameter.
     * @param {Integer} cchCredentials The size, in characters, of the <i>pszCredentials</i> buffer.
     * @param {PSTR} pszProtectedCredentials A pointer to a string that, on output, receives the encrypted credentials.
     * @param {Pointer<Integer>} pcchMaxChars The size, in characters of the <i>pszProtectedCredentials</i> buffer. On output, if the <i>pszProtectedCredentials</i> is not of sufficient size to receive the encrypted credentials, this parameter specifies the required size, in characters, of the <i>pszProtectedCredentials</i> buffer.
     * @param {Pointer<Integer>} ProtectionType A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ne-wincred-cred_protection_type">CRED_PROTECTION_TYPE</a> enumeration type that, on output, specifies the type of protection provided.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credprotecta
     * @since windows6.0.6000
     */
    static CredProtectA(fAsSelf, pszCredentials, cchCredentials, pszProtectedCredentials, pcchMaxChars, ProtectionType) {
        pszCredentials := pszCredentials is String ? StrPtr(pszCredentials) : pszCredentials
        pszProtectedCredentials := pszProtectedCredentials is String ? StrPtr(pszProtectedCredentials) : pszProtectedCredentials

        pcchMaxCharsMarshal := pcchMaxChars is VarRef ? "uint*" : "ptr"
        ProtectionTypeMarshal := ProtectionType is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredProtectA", "int", fAsSelf, "ptr", pszCredentials, "uint", cchCredentials, "ptr", pszProtectedCredentials, pcchMaxCharsMarshal, pcchMaxChars, ProtectionTypeMarshal, ProtectionType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decrypts credentials that were previously encrypted by using the CredProtect function.
     * @param {BOOL} fAsSelf Set to <b>TRUE</b> to specify that the credentials were encrypted in the security context of the current process. Set to <b>FALSE</b> to specify that credentials were encrypted in the security context of the calling thread security context.
     * @param {PWSTR} pszProtectedCredentials A pointer to a string that specifies the encrypted credentials.
     * @param {Integer} cchProtectedCredentials The size, in characters, of the <i>pszProtectedCredentials</i> buffer.
     * @param {PWSTR} pszCredentials A pointer to a string that, on output, receives the decrypted credentials.
     * @param {Pointer<Integer>} pcchMaxChars The size, in characters of the <i>pszCredentials</i> buffer. On output, if the <i>pszCredentials</i> is not of sufficient size to receive the encrypted credentials, this parameter specifies the required size, in characters, of the <i>pszCredentials</i> buffer.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. The following table shows common values for the <b>GetLastError</b> function.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_NOT_CAPABLE</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security context used to encrypt the credentials is different from the security context used to decrypt the credentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_INSUFFICIENT_BUFFER</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pszCredentials</i> buffer was of insufficient size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credunprotectw
     * @since windows6.0.6000
     */
    static CredUnprotectW(fAsSelf, pszProtectedCredentials, cchProtectedCredentials, pszCredentials, pcchMaxChars) {
        pszProtectedCredentials := pszProtectedCredentials is String ? StrPtr(pszProtectedCredentials) : pszProtectedCredentials
        pszCredentials := pszCredentials is String ? StrPtr(pszCredentials) : pszCredentials

        pcchMaxCharsMarshal := pcchMaxChars is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredUnprotectW", "int", fAsSelf, "ptr", pszProtectedCredentials, "uint", cchProtectedCredentials, "ptr", pszCredentials, pcchMaxCharsMarshal, pcchMaxChars, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decrypts credentials that were previously encrypted by using the CredProtect function.
     * @param {BOOL} fAsSelf Set to <b>TRUE</b> to specify that the credentials were encrypted in the security context of the current process. Set to <b>FALSE</b> to specify that credentials were encrypted in the security context of the calling thread security context.
     * @param {PSTR} pszProtectedCredentials A pointer to a string that specifies the encrypted credentials.
     * @param {Integer} cchProtectedCredentials The size, in characters, of the <i>pszProtectedCredentials</i> buffer.
     * @param {PSTR} pszCredentials A pointer to a string that, on output, receives the decrypted credentials.
     * @param {Pointer<Integer>} pcchMaxChars The size, in characters of the <i>pszCredentials</i> buffer. On output, if the <i>pszCredentials</i> is not of sufficient size to receive the encrypted credentials, this parameter specifies the required size, in characters, of the <i>pszCredentials</i> buffer.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. The following table shows common values for the <b>GetLastError</b> function.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_NOT_CAPABLE</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security context used to encrypt the credentials is different from the security context used to decrypt the credentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_INSUFFICIENT_BUFFER</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pszCredentials</i> buffer was of insufficient size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credunprotecta
     * @since windows6.0.6000
     */
    static CredUnprotectA(fAsSelf, pszProtectedCredentials, cchProtectedCredentials, pszCredentials, pcchMaxChars) {
        pszProtectedCredentials := pszProtectedCredentials is String ? StrPtr(pszProtectedCredentials) : pszProtectedCredentials
        pszCredentials := pszCredentials is String ? StrPtr(pszCredentials) : pszCredentials

        pcchMaxCharsMarshal := pcchMaxChars is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredUnprotectA", "int", fAsSelf, "ptr", pszProtectedCredentials, "uint", cchProtectedCredentials, "ptr", pszCredentials, pcchMaxCharsMarshal, pcchMaxChars, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Specifies whether the specified credentials are encrypted by a previous call to the CredProtect function.
     * @param {PWSTR} pszProtectedCredentials A pointer to a null-terminated string that specifies the credentials to test.
     * @param {Pointer<Integer>} pProtectionType A pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ne-wincred-cred_protection_type">CRED_PROTECTION_TYPE</a> enumeration that specifies whether the credentials specified in the <i>pszProtectedCredentials</i> parameter are protected.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credisprotectedw
     * @since windows6.0.6000
     */
    static CredIsProtectedW(pszProtectedCredentials, pProtectionType) {
        pszProtectedCredentials := pszProtectedCredentials is String ? StrPtr(pszProtectedCredentials) : pszProtectedCredentials

        pProtectionTypeMarshal := pProtectionType is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredIsProtectedW", "ptr", pszProtectedCredentials, pProtectionTypeMarshal, pProtectionType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Specifies whether the specified credentials are encrypted by a previous call to the CredProtect function.
     * @param {PSTR} pszProtectedCredentials A pointer to a null-terminated string that specifies the credentials to test.
     * @param {Pointer<Integer>} pProtectionType A pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ne-wincred-cred_protection_type">CRED_PROTECTION_TYPE</a> enumeration that specifies whether the credentials specified in the <i>pszProtectedCredentials</i> parameter are protected.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * For extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credisprotecteda
     * @since windows6.0.6000
     */
    static CredIsProtectedA(pszProtectedCredentials, pProtectionType) {
        pszProtectedCredentials := pszProtectedCredentials is String ? StrPtr(pszProtectedCredentials) : pszProtectedCredentials

        pProtectionTypeMarshal := pProtectionType is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredIsProtectedA", "ptr", pszProtectedCredentials, pProtectionTypeMarshal, pProtectionType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the Credentials Management (CredMan) database for the set of generic credentials that are associated with the current logon session and that best match the specified target resource.
     * @param {PWSTR} TargetName A pointer to a null-terminated string that contains the name of the target resource for which to find credentials.
     * @param {Integer} Type The type of credentials to search for. Currently, this function supports only <b>CRED_TYPE_GENERIC</b>.
     * @param {Integer} Flags Reserved.
     * @param {Pointer<Pointer<CREDENTIALW>>} Credential The address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credentiala">CREDENTIAL</a> structure that specifies the set of credentials this function finds.
     * 
     * When you have finished using this structure, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a> function.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credfindbestcredentialw
     * @since windows6.0.6000
     */
    static CredFindBestCredentialW(TargetName, Type, Flags, Credential) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredFindBestCredentialW", "ptr", TargetName, "uint", Type, "uint", Flags, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the Credentials Management (CredMan) database for the set of generic credentials that are associated with the current logon session and that best match the specified target resource.
     * @param {PSTR} TargetName A pointer to a null-terminated string that contains the name of the target resource for which to find credentials.
     * @param {Integer} Type The type of credentials to search for. Currently, this function supports only <b>CRED_TYPE_GENERIC</b>.
     * @param {Integer} Flags Reserved.
     * @param {Pointer<Pointer<CREDENTIALA>>} Credential The address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credentiala">CREDENTIAL</a> structure that specifies the set of credentials this function finds.
     * 
     * When you have finished using this structure, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credfree">CredFree</a> function.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credfindbestcredentiala
     * @since windows6.0.6000
     */
    static CredFindBestCredentialA(TargetName, Type, Flags, Credential) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredFindBestCredentialA", "ptr", TargetName, "uint", Type, "uint", Flags, "ptr*", Credential, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CredGetSessionTypes function returns the maximum persistence supported by the current logon session. A separate maximum persistence is returned for each credential type.
     * @param {Integer} MaximumPersistCount Number of elements in the <i>MaximumPersist</i> array. Use CRED_TYPE_MAXIMUM to return all of the currently defined credential types.
     * @param {Pointer<Integer>} MaximumPersist Pointer to an array to return the persistence values in. The passed in array should be <i>MaximumPersistCount</i> elements long. On return, each element specifies the maximum persistence supported by the corresponding credential type.
     * 
     * The caller should use one of the following defines to index into the array:
     * 
     * <ul>
     * <li>CRED_TYPE_GENERIC</li>
     * <li>CRED_TYPE_DOMAIN_PASSWORD</li>
     * <li>CRED_TYPE_DOMAIN_CERTIFICATE</li>
     * </ul>
     * That is, <i>MaximumPersist</i>[CRED_TYPE_GENERIC] specifies the maximum persistence supported for generic credentials. 
     * 
     * 
     * The following values can be returned in each element of the array.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PERSIST_NONE"></a><a id="cred_persist_none"></a><dl>
     * <dt><b>CRED_PERSIST_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No credential can be stored. This value will be returned if the credential type is not supported or has been disabled by policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PERSIST_SESSION"></a><a id="cred_persist_session"></a><dl>
     * <dt><b>CRED_PERSIST_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only a session-specific credential can be stored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PERSIST_LOCAL_MACHINE"></a><a id="cred_persist_local_machine"></a><dl>
     * <dt><b>CRED_PERSIST_LOCAL_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Session-specific and computer-specific credentials can be stored.
     * 
     * 
     * <b>Windows XP:  </b>This credential cannot be stored for sessions in which the profile is not loaded.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRED_PERSIST_ENTERPRISE"></a><a id="cred_persist_enterprise"></a><dl>
     * <dt><b>CRED_PERSIST_ENTERPRISE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any credential can be stored.
     * 
     * 
     * <b>Windows XP:  </b>This credential cannot be stored for sessions in which the profile is not loaded.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} This function returns <b>TRUE</b> on success and <b>FALSE</b> on failure. The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function can be called to get a more specific status code. The following status code can be returned:
     * 
     * ERROR_NO_SUCH_LOGON_SESSION
     * 
     * The logon session does not exist or there is no credential set associated with this logon session. Network logon sessions do not have an associated credential set.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credgetsessiontypes
     * @since windows5.1.2600
     */
    static CredGetSessionTypes(MaximumPersistCount, MaximumPersist) {
        MaximumPersistMarshal := MaximumPersist is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CredGetSessionTypes", "uint", MaximumPersistCount, MaximumPersistMarshal, MaximumPersist, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CredFree function frees a buffer returned by any of the credentials management functions.
     * @param {Pointer<Void>} Buffer Pointer to the buffer to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-credfree
     * @since windows5.1.2600
     */
    static CredFree(Buffer) {
        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        DllCall("ADVAPI32.dll\CredFree", BufferMarshal, Buffer)
    }

    /**
     * Creates and displays a configurable dialog box that accepts credentials information from a user.
     * @param {Pointer<CREDUI_INFOW>} pUiInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure that contains information for customizing the appearance of the dialog box.
     * @param {PWSTR} pszTargetName A pointer to a null-terminated string that contains  the name of the target for the credentials, typically a server name. For Distributed File System (DFS) connections, this string is of the form <i>ServerName</i>&#92;<i>ShareName</i>. This parameter is used to identify target information when storing and retrieving credentials.
     * @param {Integer} dwAuthError Specifies why the credential dialog box is needed. A caller can pass this Windows error parameter, returned by another authentication call, to allow the dialog box to accommodate certain errors. For example, if the password expired status code is passed, the dialog box could prompt the user to change the password on the account.
     * @param {PWSTR} pszUserName A pointer to a null-terminated string that contains the user name for the credentials. If a nonzero-length string is passed, the <i>UserName</i> option of the dialog box is prefilled with the string. In the case of credentials other than <i>UserName</i>/<i>Password</i>, a marshaled format of the credential can be passed in. This string is created by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credmarshalcredentiala">CredMarshalCredential</a>.
     * 
     * This function copies the user-supplied name to this buffer, copying a maximum of <i>ulUserNameMaxChars</i> characters. This format can be converted to <i>UserName</i>/<i>Password</i> format by using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduiparseusernamea">CredUIParseUsername</a>. A marshaled format can be passed directly to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP).
     * 
     * If the CREDUI_FLAGS_DO_NOT_PERSIST flag is not specified, the value returned in this parameter is of a form that should not be inspected, printed, or persisted other than passing it to <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduiparseusernamea">CredUIParseUsername</a>. The subsequent results of <b>CredUIParseUsername</b> can  be passed only to a client-side authentication function such as <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnectiona">WNetAddConnection</a> or an SSP function.
     * 
     * If no domain or server is specified as part of this parameter, the value of the  <b>pszTargetName</b> parameter is used as the domain to form a <i>DomainName</i>&#92;<i>UserName</i> pair. On output, this parameter receives a string that contains that <i>DomainName</i>&#92;<i>UserName</i> pair.
     * @param {Integer} ulUserNameBufferSize The maximum number of characters that can be copied to <i>pszUserName</i> including the terminating null character.
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_USERNAME_LENGTH does not include the terminating null character.</div>
     * <div> </div>
     * @param {PWSTR} pszPassword A pointer to a null-terminated string that contains the password for the credentials. If a nonzero-length string is specified for <i>pszPassword</i>, the password option of the dialog box will be prefilled with the string.
     * 
     * This function copies the user-supplied password to this buffer, copying a maximum of <i>ulPasswordMaxChars</i> characters. If the CREDUI_FLAGS_DO_NOT_PERSIST flag is not specified, the value returned in this parameter is of a form that should not be inspected, printed, or persisted other than passing it to a client-side authentication function such as <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnectiona">WNetAddConnection</a> or an SSP function.
     * 
     * When you have finished using the password, clear the password from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} ulPasswordBufferSize The maximum number of characters that can be copied to <i>pszPassword</i> including the terminating null character.
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_PASSWORD_LENGTH does not include the terminating null character.</div>
     * <div> </div>
     * @param {Pointer<BOOL>} save A pointer to a <b>BOOL</b> that specifies the initial state of the <b>Save</b> check box and receives the state of the <b>Save</b> check box after the user has responded to the dialog box. If this value is not <b>NULL</b>  and <b>CredUIPromptForCredentials</b> returns NO_ERROR, then <i>pfSave</i> returns the state of the <b>Save</b> check box when the user chose <b>OK</b> in the dialog box.
     * 
     * If the CREDUI_FLAGS_PERSIST flag is specified, the <b>Save</b> check box is not displayed, but is considered to be selected.
     * 
     * If the CREDUI_FLAGS_DO_NOT_PERSIST flag is specified and CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX is not specified, the <b>Save</b> check box is not displayed, but is considered to be cleared.
     * 
     * An application that needs to use CredUI to prompt the user for credentials, but does not need the credential management services provided by the credential manager, can use <i>pfSave</i> to receive the state of the <b>Save</b> check box after the user closes the dialog box. To do this, the caller must specify CREDUI_FLAGS_DO_NOT_PERSIST and  CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX in <i>dwFlags</i>. When CREDUI_FLAGS_DO_NOT_PERSIST and  CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX are set, the application is responsible for examining *<i>pfSave</i> after the function returns, and if *<i>pfSave</i> is <b>TRUE</b>,  then the application must take the appropriate action to save the user credentials within the resources of the application.
     * @param {Integer} dwFlags 
     * @returns {Integer} The return value is a <b>DWORD</b> and can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User chose <b>Cancel</b>. The <i>pszUserName</i> and <i>pszPassword</i> parameters have not changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This status is returned for any of the flag configurations that are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>pszTargetName</i> is <b>NULL</b>, the empty string, or longer than CREDUI_MAX_DOMAIN_LENGTH, or <i>pUiInfo</i> is not <b>NULL</b> and the <a href="/windows/desktop/api/wincred/ns-wincred-credui_infoa">CredUI_INFO</a> structure pointed to did not meet one of the following requirements:
     * 
     * <ul>
     * <li>The <b>cbSize</b> member must be one.</li>
     * <li>If the <b>hbmBanner</b> member is not <b>NULL</b>, it must be of type OBJ_BITMAP.</li>
     * <li>If the <b>pszMessageText</b> member is not <b>NULL</b>, it must not be greater than CREDUI_MAX_MESSAGE_LENGTH.</li>
     * <li>If the <b>pszCaptionText</b> member is not <b>NULL</b>, it must not be greater than CREDUI_MAX_CAPTION_LENGTH.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential manager cannot be used. Typically, this error is handled by calling <a href="/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</a> and passing in the CREDUI_FLAGS_DO_NOT_PERSIST flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User chose <b>OK</b>. The  <i>pszUserName</i>, <i>pszPassword</i>, and <i>pfSave</i> parameters will return the values documented earlier.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduipromptforcredentialsw
     * @since windows5.1.2600
     */
    static CredUIPromptForCredentialsW(pUiInfo, pszTargetName, dwAuthError, pszUserName, ulUserNameBufferSize, pszPassword, ulPasswordBufferSize, save, dwFlags) {
        static pContext := 0 ;Reserved parameters must always be NULL

        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := DllCall("credui.dll\CredUIPromptForCredentialsW", "ptr", pUiInfo, "ptr", pszTargetName, "ptr", pContext, "uint", dwAuthError, "ptr", pszUserName, "uint", ulUserNameBufferSize, "ptr", pszPassword, "uint", ulPasswordBufferSize, "ptr", save, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Creates and displays a configurable dialog box that accepts credentials information from a user.
     * @param {Pointer<CREDUI_INFOA>} pUiInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure that contains information for customizing the appearance of the dialog box.
     * @param {PSTR} pszTargetName A pointer to a null-terminated string that contains  the name of the target for the credentials, typically a server name. For Distributed File System (DFS) connections, this string is of the form <i>ServerName</i>&#92;<i>ShareName</i>. This parameter is used to identify target information when storing and retrieving credentials.
     * @param {Integer} dwAuthError Specifies why the credential dialog box is needed. A caller can pass this Windows error parameter, returned by another authentication call, to allow the dialog box to accommodate certain errors. For example, if the password expired status code is passed, the dialog box could prompt the user to change the password on the account.
     * @param {PSTR} pszUserName A pointer to a null-terminated string that contains the user name for the credentials. If a nonzero-length string is passed, the <i>UserName</i> option of the dialog box is prefilled with the string. In the case of credentials other than <i>UserName</i>/<i>Password</i>, a marshaled format of the credential can be passed in. This string is created by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credmarshalcredentiala">CredMarshalCredential</a>.
     * 
     * This function copies the user-supplied name to this buffer, copying a maximum of <i>ulUserNameMaxChars</i> characters. This format can be converted to <i>UserName</i>/<i>Password</i> format by using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduiparseusernamea">CredUIParseUsername</a>. A marshaled format can be passed directly to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP).
     * 
     * If the CREDUI_FLAGS_DO_NOT_PERSIST flag is not specified, the value returned in this parameter is of a form that should not be inspected, printed, or persisted other than passing it to <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduiparseusernamea">CredUIParseUsername</a>. The subsequent results of <b>CredUIParseUsername</b> can  be passed only to a client-side authentication function such as <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnectiona">WNetAddConnection</a> or an SSP function.
     * 
     * If no domain or server is specified as part of this parameter, the value of the  <b>pszTargetName</b> parameter is used as the domain to form a <i>DomainName</i>&#92;<i>UserName</i> pair. On output, this parameter receives a string that contains that <i>DomainName</i>&#92;<i>UserName</i> pair.
     * @param {Integer} ulUserNameBufferSize The maximum number of characters that can be copied to <i>pszUserName</i> including the terminating null character.
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_USERNAME_LENGTH does not include the terminating null character.</div>
     * <div> </div>
     * @param {PSTR} pszPassword A pointer to a null-terminated string that contains the password for the credentials. If a nonzero-length string is specified for <i>pszPassword</i>, the password option of the dialog box will be prefilled with the string.
     * 
     * This function copies the user-supplied password to this buffer, copying a maximum of <i>ulPasswordMaxChars</i> characters. If the CREDUI_FLAGS_DO_NOT_PERSIST flag is not specified, the value returned in this parameter is of a form that should not be inspected, printed, or persisted other than passing it to a client-side authentication function such as <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnectiona">WNetAddConnection</a> or an SSP function.
     * 
     * When you have finished using the password, clear the password from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} ulPasswordBufferSize The maximum number of characters that can be copied to <i>pszPassword</i> including the terminating null character.
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_PASSWORD_LENGTH does not include the terminating null character.</div>
     * <div> </div>
     * @param {Pointer<BOOL>} save A pointer to a <b>BOOL</b> that specifies the initial state of the <b>Save</b> check box and receives the state of the <b>Save</b> check box after the user has responded to the dialog box. If this value is not <b>NULL</b>  and <b>CredUIPromptForCredentials</b> returns NO_ERROR, then <i>pfSave</i> returns the state of the <b>Save</b> check box when the user chose <b>OK</b> in the dialog box.
     * 
     * If the CREDUI_FLAGS_PERSIST flag is specified, the <b>Save</b> check box is not displayed, but is considered to be selected.
     * 
     * If the CREDUI_FLAGS_DO_NOT_PERSIST flag is specified and CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX is not specified, the <b>Save</b> check box is not displayed, but is considered to be cleared.
     * 
     * An application that needs to use CredUI to prompt the user for credentials, but does not need the credential management services provided by the credential manager, can use <i>pfSave</i> to receive the state of the <b>Save</b> check box after the user closes the dialog box. To do this, the caller must specify CREDUI_FLAGS_DO_NOT_PERSIST and  CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX in <i>dwFlags</i>. When CREDUI_FLAGS_DO_NOT_PERSIST and  CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX are set, the application is responsible for examining *<i>pfSave</i> after the function returns, and if *<i>pfSave</i> is <b>TRUE</b>,  then the application must take the appropriate action to save the user credentials within the resources of the application.
     * @param {Integer} dwFlags 
     * @returns {Integer} The return value is a <b>DWORD</b> and can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User chose <b>Cancel</b>. The <i>pszUserName</i> and <i>pszPassword</i> parameters have not changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This status is returned for any of the flag configurations that are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>pszTargetName</i> is <b>NULL</b>, the empty string, or longer than CREDUI_MAX_DOMAIN_LENGTH, or <i>pUiInfo</i> is not <b>NULL</b> and the <a href="/windows/desktop/api/wincred/ns-wincred-credui_infoa">CredUI_INFO</a> structure pointed to did not meet one of the following requirements:
     * 
     * <ul>
     * <li>The <b>cbSize</b> member must be one.</li>
     * <li>If the <b>hbmBanner</b> member is not <b>NULL</b>, it must be of type OBJ_BITMAP.</li>
     * <li>If the <b>pszMessageText</b> member is not <b>NULL</b>, it must not be greater than CREDUI_MAX_MESSAGE_LENGTH.</li>
     * <li>If the <b>pszCaptionText</b> member is not <b>NULL</b>, it must not be greater than CREDUI_MAX_CAPTION_LENGTH.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential manager cannot be used. Typically, this error is handled by calling <a href="/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</a> and passing in the CREDUI_FLAGS_DO_NOT_PERSIST flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User chose <b>OK</b>. The  <i>pszUserName</i>, <i>pszPassword</i>, and <i>pfSave</i> parameters will return the values documented earlier.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduipromptforcredentialsa
     * @since windows5.1.2600
     */
    static CredUIPromptForCredentialsA(pUiInfo, pszTargetName, dwAuthError, pszUserName, ulUserNameBufferSize, pszPassword, ulPasswordBufferSize, save, dwFlags) {
        static pContext := 0 ;Reserved parameters must always be NULL

        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := DllCall("credui.dll\CredUIPromptForCredentialsA", "ptr", pUiInfo, "ptr", pszTargetName, "ptr", pContext, "uint", dwAuthError, "ptr", pszUserName, "uint", ulUserNameBufferSize, "ptr", pszPassword, "uint", ulPasswordBufferSize, "ptr", save, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Creates and displays a configurable dialog box that allows users to supply credential information by using any credential provider installed on the local computer.
     * @param {Pointer<CREDUI_INFOW>} pUiInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure that contains information for customizing the appearance of the dialog box that this function displays. 
     *    
     * 
     * 
     * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is not <b>NULL</b>, this function displays a modal dialog box centered on the parent window.
     * 
     * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is <b>NULL</b>, the function displays a dialog box centered on the screen.
     * 
     * This function ignores the  <b>hbmBanner</b> member of the <b>CREDUI_INFO</b> structure.
     * @param {Integer} dwAuthError A Windows error code, defined in Winerror.h, that is displayed in the dialog box. If credentials previously collected were not valid, the caller uses this parameter to pass the error message from the API that collected the credentials (for example, Winlogon) to this function. The corresponding error message is formatted and displayed in the dialog box. Set the  value of this parameter to zero to display no error message.
     * @param {Pointer<Integer>} pulAuthPackage On input, the value of this parameter is used to specify the authentication package for which the credentials in the <i>pvInAuthBuffer</i> buffer are serialized. If the value of <i>pvInAuthBuffer</i> is <b>NULL</b> and the <b>CREDUIWIN_AUTHPACKAGE_ONLY</b> flag is set in the <i>dwFlags</i> parameter, only credential providers capable of serializing credentials for the specified authentication package are to be enumerated. 
     * 
     * 
     * 
     * To get the appropriate value to use for this parameter on input, call the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage">LsaLookupAuthenticationPackage</a> function and use the value of the <i>AuthenticationPackage</i> parameter  of that function.
     * 
     * On output, this parameter specifies the authentication package for which the credentials in the <i>ppvOutAuthBuffer</i> buffer are serialized.
     * @param {Pointer} pvInAuthBuffer A pointer to a credential BLOB that is used to populate the credential fields in the dialog box. Set the value of this parameter to <b>NULL</b> to leave the credential fields empty.
     * @param {Integer} ulInAuthBufferSize The size, in bytes, of the <i>pvInAuthBuffer</i> buffer.
     * @param {Pointer<Pointer<Void>>} ppvOutAuthBuffer The address of a pointer that, on output, specifies the credential BLOB. For Kerberos, NTLM, or Negotiate credentials, call the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credunpackauthenticationbuffera">CredUnPackAuthenticationBuffer</a> function to convert this BLOB to string representations of the credentials.  
     * 
     * When you have finished using the credential BLOB, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function, and free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} pulOutAuthBufferSize The size, in bytes, of the <i>ppvOutAuthBuffer</i> buffer.
     * @param {Pointer<BOOL>} pfSave A pointer to a Boolean value that, on input, specifies whether the <b>Save</b> check box is selected in the dialog box that this function displays. On output, the value of this parameter specifies whether the <b>Save</b> check box was selected when the user clicks the <b>Submit</b> button in the dialog box. Set this parameter to <b>NULL</b> to ignore the <b>Save</b> check box.
     * 
     * This parameter is ignored if the <b>CREDUIWIN_CHECKBOX</b> flag is not set in the <i>dwFlags</i> parameter.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, the function returns <b>ERROR_SUCCESS</b>. If the function is canceled by the user, it returns <b>ERROR_CANCELLED</b>. Any other return value indicates that the function failed to load.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduipromptforwindowscredentialsw
     * @since windows6.0.6000
     */
    static CredUIPromptForWindowsCredentialsW(pUiInfo, dwAuthError, pulAuthPackage, pvInAuthBuffer, ulInAuthBufferSize, ppvOutAuthBuffer, pulOutAuthBufferSize, pfSave, dwFlags) {
        pulAuthPackageMarshal := pulAuthPackage is VarRef ? "uint*" : "ptr"
        pulOutAuthBufferSizeMarshal := pulOutAuthBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("credui.dll\CredUIPromptForWindowsCredentialsW", "ptr", pUiInfo, "uint", dwAuthError, pulAuthPackageMarshal, pulAuthPackage, "ptr", pvInAuthBuffer, "uint", ulInAuthBufferSize, "ptr*", ppvOutAuthBuffer, pulOutAuthBufferSizeMarshal, pulOutAuthBufferSize, "ptr", pfSave, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Creates and displays a configurable dialog box that allows users to supply credential information by using any credential provider installed on the local computer.
     * @param {Pointer<CREDUI_INFOA>} pUiInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure that contains information for customizing the appearance of the dialog box that this function displays. 
     *    
     * 
     * 
     * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is not <b>NULL</b>, this function displays a modal dialog box centered on the parent window.
     * 
     * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is <b>NULL</b>, the function displays a dialog box centered on the screen.
     * 
     * This function ignores the  <b>hbmBanner</b> member of the <b>CREDUI_INFO</b> structure.
     * @param {Integer} dwAuthError A Windows error code, defined in Winerror.h, that is displayed in the dialog box. If credentials previously collected were not valid, the caller uses this parameter to pass the error message from the API that collected the credentials (for example, Winlogon) to this function. The corresponding error message is formatted and displayed in the dialog box. Set the  value of this parameter to zero to display no error message.
     * @param {Pointer<Integer>} pulAuthPackage On input, the value of this parameter is used to specify the authentication package for which the credentials in the <i>pvInAuthBuffer</i> buffer are serialized. If the value of <i>pvInAuthBuffer</i> is <b>NULL</b> and the <b>CREDUIWIN_AUTHPACKAGE_ONLY</b> flag is set in the <i>dwFlags</i> parameter, only credential providers capable of serializing credentials for the specified authentication package are to be enumerated. 
     * 
     * 
     * 
     * To get the appropriate value to use for this parameter on input, call the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage">LsaLookupAuthenticationPackage</a> function and use the value of the <i>AuthenticationPackage</i> parameter  of that function.
     * 
     * On output, this parameter specifies the authentication package for which the credentials in the <i>ppvOutAuthBuffer</i> buffer are serialized.
     * @param {Pointer} pvInAuthBuffer A pointer to a credential BLOB that is used to populate the credential fields in the dialog box. Set the value of this parameter to <b>NULL</b> to leave the credential fields empty.
     * @param {Integer} ulInAuthBufferSize The size, in bytes, of the <i>pvInAuthBuffer</i> buffer.
     * @param {Pointer<Pointer<Void>>} ppvOutAuthBuffer The address of a pointer that, on output, specifies the credential BLOB. For Kerberos, NTLM, or Negotiate credentials, call the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credunpackauthenticationbuffera">CredUnPackAuthenticationBuffer</a> function to convert this BLOB to string representations of the credentials.  
     * 
     * When you have finished using the credential BLOB, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function, and free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} pulOutAuthBufferSize The size, in bytes, of the <i>ppvOutAuthBuffer</i> buffer.
     * @param {Pointer<BOOL>} pfSave A pointer to a Boolean value that, on input, specifies whether the <b>Save</b> check box is selected in the dialog box that this function displays. On output, the value of this parameter specifies whether the <b>Save</b> check box was selected when the user clicks the <b>Submit</b> button in the dialog box. Set this parameter to <b>NULL</b> to ignore the <b>Save</b> check box.
     * 
     * This parameter is ignored if the <b>CREDUIWIN_CHECKBOX</b> flag is not set in the <i>dwFlags</i> parameter.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, the function returns <b>ERROR_SUCCESS</b>. If the function is canceled by the user, it returns <b>ERROR_CANCELLED</b>. Any other return value indicates that the function failed to load.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduipromptforwindowscredentialsa
     * @since windows6.0.6000
     */
    static CredUIPromptForWindowsCredentialsA(pUiInfo, dwAuthError, pulAuthPackage, pvInAuthBuffer, ulInAuthBufferSize, ppvOutAuthBuffer, pulOutAuthBufferSize, pfSave, dwFlags) {
        pulAuthPackageMarshal := pulAuthPackage is VarRef ? "uint*" : "ptr"
        pulOutAuthBufferSizeMarshal := pulOutAuthBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("credui.dll\CredUIPromptForWindowsCredentialsA", "ptr", pUiInfo, "uint", dwAuthError, pulAuthPackageMarshal, pulAuthPackage, "ptr", pvInAuthBuffer, "uint", ulInAuthBufferSize, "ptr*", ppvOutAuthBuffer, pulOutAuthBufferSizeMarshal, pulOutAuthBufferSize, "ptr", pfSave, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The CredUIParseUserName function extracts the domain and user account name from a fully qualified user name.
     * @param {PWSTR} UserName Pointer to a <b>null</b>-terminated string that contains the user name to be parsed. The name must be in UPN or down-level format, or a certificate. Typically, <i>UserName</i> is received from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsw">CredUIPromptForCredentials</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduicmdlinepromptforcredentialsw">CredUICmdLinePromptForCredentials</a>.
     * @param {PWSTR} user Pointer to a <b>null</b>-terminated string that receives the user account name.
     * @param {Integer} userBufferSize Maximum number of characters to write to the <i>pszUser</i> string including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_USERNAME_LENGTH does NOT include the terminating <b>null</b> character.</div>
     * <div> </div>
     * @param {PWSTR} domain Pointer to a <b>null</b>-terminated string that receives the domain name. If <i>pszUserName</i> specifies a certificate, <i>pszDomain</i> will be <b>NULL</b>.
     * @param {Integer} domainBufferSize Maximum number of characters to write to the <i>pszDomain</i> string including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_DOMAIN_TARGET_LENGTH does NOT include the terminating <b>null</b> character.</div>
     * <div> </div>
     * @returns {Integer} This function returns the following:
     * 
     * <ul>
     * <li>NO_ERROR 
     * 
     * 
     * The user name is valid.
     * 
     * </li>
     * <li>ERROR_INVALID_ACCOUNT_NAME 
     * 
     * 
     * The user name is not valid.
     * 
     * </li>
     * <li>ERROR_INSUFFICIENT_BUFFER 
     * 
     * 
     * One of the buffers is too small.
     * 
     * </li>
     * <li>ERROR_INVALID_PARAMETER 
     * 
     * 
     * <ul>
     * <li><i>ulUserMaxChars</i> or <i>ulDomainMaxChars</i> is zero.</li>
     * <li><i>pszUserName</i>, <i>pszUser</i>, or <i>pszDomain</i> is <b>NULL</b>.</li>
     * </ul>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduiparseusernamew
     * @since windows5.1.2600
     */
    static CredUIParseUserNameW(UserName, user, userBufferSize, domain, domainBufferSize) {
        UserName := UserName is String ? StrPtr(UserName) : UserName
        user := user is String ? StrPtr(user) : user
        domain := domain is String ? StrPtr(domain) : domain

        result := DllCall("credui.dll\CredUIParseUserNameW", "ptr", UserName, "ptr", user, "uint", userBufferSize, "ptr", domain, "uint", domainBufferSize, "uint")
        return result
    }

    /**
     * The CredUIParseUserName function extracts the domain and user account name from a fully qualified user name.
     * @param {PSTR} userName Pointer to a <b>null</b>-terminated string that contains the user name to be parsed. The name must be in UPN or down-level format, or a certificate. Typically, <i>pszUserName</i> is received from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentials</a>.
     * @param {PSTR} user Pointer to a <b>null</b>-terminated string that receives the user account name.
     * @param {Integer} userBufferSize Maximum number of characters to write to the <i>pszUser</i> string including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_USERNAME_LENGTH does NOT include the terminating <b>null</b> character.</div>
     * <div> </div>
     * @param {PSTR} domain Pointer to a <b>null</b>-terminated string that receives the domain name. If <i>pszUserName</i> specifies a certificate, <i>pszDomain</i> will be <b>NULL</b>.
     * @param {Integer} domainBufferSize Maximum number of characters to write to the <i>pszDomain</i> string including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_DOMAIN_TARGET_LENGTH does NOT include the terminating <b>null</b> character.</div>
     * <div> </div>
     * @returns {Integer} This function returns the following:
     * 
     * <ul>
     * <li>NO_ERROR 
     * 
     * 
     * The user name is valid.
     * 
     * </li>
     * <li>ERROR_INVALID_ACCOUNT_NAME 
     * 
     * 
     * The user name is not valid.
     * 
     * </li>
     * <li>ERROR_INSUFFICIENT_BUFFER 
     * 
     * 
     * One of the buffers is too small.
     * 
     * </li>
     * <li>ERROR_INVALID_PARAMETER 
     * 
     * 
     * <ul>
     * <li><i>ulUserMaxChars</i> or <i>ulDomainMaxChars</i> is zero.</li>
     * <li><i>pszUserName</i>, <i>pszUser</i>, or <i>pszDomain</i> is <b>NULL</b>.</li>
     * </ul>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduiparseusernamea
     * @since windows5.1.2600
     */
    static CredUIParseUserNameA(userName, user, userBufferSize, domain, domainBufferSize) {
        userName := userName is String ? StrPtr(userName) : userName
        user := user is String ? StrPtr(user) : user
        domain := domain is String ? StrPtr(domain) : domain

        result := DllCall("credui.dll\CredUIParseUserNameA", "ptr", userName, "ptr", user, "uint", userBufferSize, "ptr", domain, "uint", domainBufferSize, "uint")
        return result
    }

    /**
     * Prompts for and accepts credential information from a user working in a command-line (console) application. The name and password typed by the user are passed back to the calling application for verification.
     * @param {PWSTR} pszTargetName A pointer to a <b>null</b>-terminated string that contains the name of the target for the credentials, typically a server name. For DFS connections, this string is of the form <i>ServerName</i><b>\\</b><i>ShareName</i>. The <i>pszTargetName</i> parameter is used to identify the target information and is used to store and retrieve the credential.
     * @param {Integer} dwAuthError Specifies why prompting for credentials is needed. A caller can pass this Windows error parameter, returned by another authentication call, to allow the dialog box to accommodate certain errors. For example, if the password expired status code is passed, the dialog box prompts the user to change the password on the account.
     * @param {PWSTR} UserName A pointer to a <b>null</b>-terminated string that contains the credential user name. If a nonzero-length string is specified for <i>pszUserName</i>, the user will be prompted only for the password. In the case of credentials other than user name/password, a marshaled format of the credential can be passed in. This string is created by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credmarshalcredentiala">CredMarshalCredential</a>. 
     * 
     * 
     * 
     * 
     * This function writes the user-supplied name to this buffer, copying a maximum of <i>ulUserNameMaxChars</i> characters. The string in this format can be converted to the user name/password format by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduiparseusernamea">CredUIParseUsername</a> function. The string in its marshaled format can be passed directly to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP).
     * 
     * If the CREDUI_FLAGS_DO_NOT_PERSIST flag is not specified, the value returned in this parameter is of a form that should not be inspected, printed, or persisted other than passing it to <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduiparseusernamea">CredUIParseUsername</a>. The subsequent results of <b>CredUIParseUsername</b> can  be passed only to a client-side authentication API such as <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnectiona">WNetAddConnection</a> or the SSP API.
     * @param {Integer} ulUserBufferSize The maximum number of characters that can be copied to <i>pszUserName</i> including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_USERNAME_LENGTH does not include the terminating <b>null</b> character.</div>
     * <div> </div>
     * @param {PWSTR} pszPassword A pointer to a <b>null</b>-terminated string that contains the password for the credentials. If a nonzero-length string is specified for <i>pszPassword</i>, the password parameter will be prefilled with the string. 
     * 
     * 
     * 
     * 
     * This function writes the user-supplied password to this buffer, copying a maximum of <i>ulPasswordMaxChars</i> characters. If the CREDUI_FLAGS_DO_NOT_PERSIST flag is not specified, the value returned in this parameter is of a form that should not be inspected, printed, or persisted other than passing it to a client-side authentication function such as <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnectiona">WNetAddConnection</a> or an SSP function.
     * 
     * When you have finished using the password, clear the password from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} ulPasswordBufferSize The maximum number of characters that can be copied to <i>pszPassword</i> including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_PASSWORD_LENGTH does not include the terminating <b>null</b> character.</div>
     * <div> </div>
     * @param {Pointer<BOOL>} pfSave A pointer to a <b>BOOL</b> that specifies the initial state of the <b>Save</b> message and receives the state of the <b>Save</b> message after the user has responded to the command prompt. If <i>pfSave</i> is not <b>NULL</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</a> returns NO_ERROR, <i>pfSave</i> returns the state of the <b>Save</b> message. If the CREDUI_FLAGS_PERSIST flag is specified, the <b>Save</b> message is not displayed but is considered to be "y". If the CREDUI_FLAGS_DO_NOT_PERSIST flag is specified and CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX is not specified, the <b>Save</b> message is not displayed but is considered to be "n".
     * @param {Integer} dwFlags 
     * @returns {Integer} The return value is a <b>DWORD</b> and can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This status is returned for any of the flag combinations that are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>pszTargetName</i> is <b>NULL</b>, the empty string, or longer than CREDUI_MAX_DOMAIN_LENGTH, or <i>pUiInfo</i> is not <b>NULL</b> and the <a href="/windows/desktop/api/wincred/ns-wincred-credui_infoa">CredUI_INFO</a> structure pointed to did not meet one of the following requirements: 
     * 
     * <ul>
     * <li>The <b>cbSize</b> member must be one.</li>
     * <li>If the <b>hbmBanner</b> member is not <b>NULL</b>, it must be of type OBJ_BITMAP.</li>
     * <li>If the <b>pszMessageText</b> member is not <b>NULL</b>, it must not be greater than CREDUI_MAX_MESSAGE_LENGTH.</li>
     * <li>If the <b>pszCaptionText</b> member is not <b>NULL</b>, it must not be greater than CREDUI_MAX_CAPTION_LENGTH.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential manager cannot be used. Typically, this error is handled by calling <a href="/windows/desktop/api/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentials</a> and passing in the CREDUI_FLAGS_DO_NOT_PERSIST flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User chose <b>OK</b>. The <i>pszUserName</i>, <i>pszPassword</i>, and <i>pfSave</i> variables will return the values documented earlier.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduicmdlinepromptforcredentialsw
     * @since windows5.1.2600
     */
    static CredUICmdLinePromptForCredentialsW(pszTargetName, dwAuthError, UserName, ulUserBufferSize, pszPassword, ulPasswordBufferSize, pfSave, dwFlags) {
        static pContext := 0 ;Reserved parameters must always be NULL

        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        UserName := UserName is String ? StrPtr(UserName) : UserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := DllCall("credui.dll\CredUICmdLinePromptForCredentialsW", "ptr", pszTargetName, "ptr", pContext, "uint", dwAuthError, "ptr", UserName, "uint", ulUserBufferSize, "ptr", pszPassword, "uint", ulPasswordBufferSize, "ptr", pfSave, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Prompts for and accepts credential information from a user working in a command-line (console) application. The name and password typed by the user are passed back to the calling application for verification.
     * @param {PSTR} pszTargetName A pointer to a <b>null</b>-terminated string that contains the name of the target for the credentials, typically a server name. For DFS connections, this string is of the form <i>ServerName</i><b>\\</b><i>ShareName</i>. The <i>pszTargetName</i> parameter is used to identify the target information and is used to store and retrieve the credential.
     * @param {Integer} dwAuthError Specifies why prompting for credentials is needed. A caller can pass this Windows error parameter, returned by another authentication call, to allow the dialog box to accommodate certain errors. For example, if the password expired status code is passed, the dialog box prompts the user to change the password on the account.
     * @param {PSTR} UserName A pointer to a <b>null</b>-terminated string that contains the credential user name. If a nonzero-length string is specified for <i>pszUserName</i>, the user will be prompted only for the password. In the case of credentials other than user name/password, a marshaled format of the credential can be passed in. This string is created by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credmarshalcredentiala">CredMarshalCredential</a>. 
     * 
     * 
     * 
     * 
     * This function writes the user-supplied name to this buffer, copying a maximum of <i>ulUserNameMaxChars</i> characters. The string in this format can be converted to the user name/password format by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduiparseusernamea">CredUIParseUsername</a> function. The string in its marshaled format can be passed directly to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP).
     * 
     * If the CREDUI_FLAGS_DO_NOT_PERSIST flag is not specified, the value returned in this parameter is of a form that should not be inspected, printed, or persisted other than passing it to <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduiparseusernamea">CredUIParseUsername</a>. The subsequent results of <b>CredUIParseUsername</b> can  be passed only to a client-side authentication API such as <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnectiona">WNetAddConnection</a> or the SSP API.
     * @param {Integer} ulUserBufferSize The maximum number of characters that can be copied to <i>pszUserName</i> including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_USERNAME_LENGTH does not include the terminating <b>null</b> character.</div>
     * <div> </div>
     * @param {PSTR} pszPassword A pointer to a <b>null</b>-terminated string that contains the password for the credentials. If a nonzero-length string is specified for <i>pszPassword</i>, the password parameter will be prefilled with the string. 
     * 
     * 
     * 
     * 
     * This function writes the user-supplied password to this buffer, copying a maximum of <i>ulPasswordMaxChars</i> characters. If the CREDUI_FLAGS_DO_NOT_PERSIST flag is not specified, the value returned in this parameter is of a form that should not be inspected, printed, or persisted other than passing it to a client-side authentication function such as <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnectiona">WNetAddConnection</a> or an SSP function.
     * 
     * When you have finished using the password, clear the password from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} ulPasswordBufferSize The maximum number of characters that can be copied to <i>pszPassword</i> including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  CREDUI_MAX_PASSWORD_LENGTH does not include the terminating <b>null</b> character.</div>
     * <div> </div>
     * @param {Pointer<BOOL>} pfSave A pointer to a <b>BOOL</b> that specifies the initial state of the <b>Save</b> message and receives the state of the <b>Save</b> message after the user has responded to the command prompt. If <i>pfSave</i> is not <b>NULL</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</a> returns NO_ERROR, <i>pfSave</i> returns the state of the <b>Save</b> message. If the CREDUI_FLAGS_PERSIST flag is specified, the <b>Save</b> message is not displayed but is considered to be "y". If the CREDUI_FLAGS_DO_NOT_PERSIST flag is specified and CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX is not specified, the <b>Save</b> message is not displayed but is considered to be "n".
     * @param {Integer} dwFlags 
     * @returns {Integer} The return value is a <b>DWORD</b> and can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This status is returned for any of the flag combinations that are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>pszTargetName</i> is <b>NULL</b>, the empty string, or longer than CREDUI_MAX_DOMAIN_LENGTH, or <i>pUiInfo</i> is not <b>NULL</b> and the <a href="/windows/desktop/api/wincred/ns-wincred-credui_infoa">CredUI_INFO</a> structure pointed to did not meet one of the following requirements: 
     * 
     * <ul>
     * <li>The <b>cbSize</b> member must be one.</li>
     * <li>If the <b>hbmBanner</b> member is not <b>NULL</b>, it must be of type OBJ_BITMAP.</li>
     * <li>If the <b>pszMessageText</b> member is not <b>NULL</b>, it must not be greater than CREDUI_MAX_MESSAGE_LENGTH.</li>
     * <li>If the <b>pszCaptionText</b> member is not <b>NULL</b>, it must not be greater than CREDUI_MAX_CAPTION_LENGTH.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential manager cannot be used. Typically, this error is handled by calling <a href="/windows/desktop/api/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentials</a> and passing in the CREDUI_FLAGS_DO_NOT_PERSIST flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User chose <b>OK</b>. The <i>pszUserName</i>, <i>pszPassword</i>, and <i>pfSave</i> variables will return the values documented earlier.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduicmdlinepromptforcredentialsa
     * @since windows5.1.2600
     */
    static CredUICmdLinePromptForCredentialsA(pszTargetName, dwAuthError, UserName, ulUserBufferSize, pszPassword, ulPasswordBufferSize, pfSave, dwFlags) {
        static pContext := 0 ;Reserved parameters must always be NULL

        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        UserName := UserName is String ? StrPtr(UserName) : UserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := DllCall("credui.dll\CredUICmdLinePromptForCredentialsA", "ptr", pszTargetName, "ptr", pContext, "uint", dwAuthError, "ptr", UserName, "uint", ulUserBufferSize, "ptr", pszPassword, "uint", ulPasswordBufferSize, "ptr", pfSave, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Is called after CredUIPromptForCredentials or CredUICmdLinePromptForCredentials, to confirm the validity of the credential harvested.
     * @param {PWSTR} pszTargetName Pointer to a <b>null</b>-terminated string that contains the name of the target for the credentials, typically a domain or server application name. This must be the same value passed as <i>pszTargetName</i> to <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentials</a>
     * @param {BOOL} bConfirm Specifies whether the credentials returned from the prompt function are valid. If <b>TRUE</b>, the credentials are stored in the credential manager as defined by <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentials</a>. If <b>FALSE</b>, the credentials are not stored and various pieces of memory are cleaned up.
     * @returns {Integer} Status of the operation is returned. The caller can check this status to determine whether the credential confirm operation succeeded. Most applications ignore this status code because the application's connection to the resource has already been done. The operation can fail because the credential was not found on the list of credentials awaiting confirmation, or because the attempt to write or delete the credential failed. Failure to find the credential on the list can occur because the credential was never queued or as a result of too many credentials being queued. Up to five credentials can be queued before older ones are discarded as newer ones are queued.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR - (zero)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Confirm operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject credential could not be found on the confirmation waiting list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt to confirm a waiting credential failed because the credential contained data that was not valid or was inconsistent.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduiconfirmcredentialsw
     * @since windows5.1.2600
     */
    static CredUIConfirmCredentialsW(pszTargetName, bConfirm) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := DllCall("credui.dll\CredUIConfirmCredentialsW", "ptr", pszTargetName, "int", bConfirm, "uint")
        return result
    }

    /**
     * Is called after CredUIPromptForCredentials or CredUICmdLinePromptForCredentials, to confirm the validity of the credential harvested.
     * @param {PSTR} pszTargetName Pointer to a <b>null</b>-terminated string that contains the name of the target for the credentials, typically a domain or server application name. This must be the same value passed as <i>pszTargetName</i> to <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentials</a>
     * @param {BOOL} bConfirm Specifies whether the credentials returned from the prompt function are valid. If <b>TRUE</b>, the credentials are stored in the credential manager as defined by <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentials</a>. If <b>FALSE</b>, the credentials are not stored and various pieces of memory are cleaned up.
     * @returns {Integer} Status of the operation is returned. The caller can check this status to determine whether the credential confirm operation succeeded. Most applications ignore this status code because the application's connection to the resource has already been done. The operation can fail because the credential was not found on the list of credentials awaiting confirmation, or because the attempt to write or delete the credential failed. Failure to find the credential on the list can occur because the credential was never queued or as a result of too many credentials being queued. Up to five credentials can be queued before older ones are discarded as newer ones are queued.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR - (zero)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Confirm operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject credential could not be found on the confirmation waiting list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt to confirm a waiting credential failed because the credential contained data that was not valid or was inconsistent.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduiconfirmcredentialsa
     * @since windows5.1.2600
     */
    static CredUIConfirmCredentialsA(pszTargetName, bConfirm) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := DllCall("credui.dll\CredUIConfirmCredentialsA", "ptr", pszTargetName, "int", bConfirm, "uint")
        return result
    }

    /**
     * The CredUIStoreSSOCredW function stores a single logon credential.
     * @param {PWSTR} pszRealm Pointer to a <b>null</b>-terminated string that specifies the realm. If this parameter is <b>NULL</b>, the default realm is used.
     * @param {PWSTR} pszUsername Pointer to a <b>null</b>-terminated string that specifies the user's name.
     * @param {PWSTR} pszPassword Pointer to a <b>null</b>-terminated string that specifies the user's password. When you have finished using the password, clear the password from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {BOOL} bPersist Boolean value that specifies whether the credentials are persisted. If this value is <b>TRUE</b>, the credentials are persisted. If this value is <b>FALSE</b>, the credentials are not persisted.
     * @returns {Integer} The return value is a <b>DWORD</b>. A return value of ERROR_SUCCESS indicates the function was successful.
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduistoressocredw
     * @since windows5.1.2600
     */
    static CredUIStoreSSOCredW(pszRealm, pszUsername, pszPassword, bPersist) {
        pszRealm := pszRealm is String ? StrPtr(pszRealm) : pszRealm
        pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := DllCall("credui.dll\CredUIStoreSSOCredW", "ptr", pszRealm, "ptr", pszUsername, "ptr", pszPassword, "int", bPersist, "uint")
        return result
    }

    /**
     * The CredUIReadSSOCredW function retrieves the user name for a single logon credential.
     * @param {PWSTR} pszRealm Pointer to a <b>null</b>-terminated string that specifies the realm. If this parameter is <b>NULL</b>, the default realm is used.
     * @param {Pointer<PWSTR>} ppszUsername Pointer to a pointer to a <b>null</b>-terminated string. When you have finished using the string, free <i>ppszUsername</i> by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {Integer} The return value is a <b>DWORD</b>. The following table lists the possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincred/nf-wincred-creduireadssocredw
     * @since windows5.1.2600
     */
    static CredUIReadSSOCredW(pszRealm, ppszUsername) {
        pszRealm := pszRealm is String ? StrPtr(pszRealm) : pszRealm

        result := DllCall("credui.dll\CredUIReadSSOCredW", "ptr", pszRealm, "ptr", ppszUsername, "uint")
        return result
    }

    /**
     * Establishes the resource manager context (the scope) within which database operations are performed.
     * @param {Integer} dwScope 
     * @param {Pointer<Pointer>} phContext A handle to the established <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. This handle can now be supplied to other functions attempting to do work within this context.
     * @returns {Integer} If the function succeeds, the function returns SCARD_S_SUCCESS. 
     * 
     * If the function fails, it returns an error code. For more information, see <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardestablishcontext
     * @since windows5.1.2600
     */
    static SCardEstablishContext(dwScope, phContext) {
        static pvReserved1 := 0, pvReserved2 := 0 ;Reserved parameters must always be NULL

        phContextMarshal := phContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("WinSCard.dll\SCardEstablishContext", "uint", dwScope, "ptr", pvReserved1, "ptr", pvReserved2, phContextMarshal, phContext, "int")
        return result
    }

    /**
     * Closes an established resource manager context, freeing any resources allocated under that context, including SCARDHANDLE objects and memory allocated using the SCARD_AUTOALLOCATE length designator.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardreleasecontext
     * @since windows5.1.2600
     */
    static SCardReleaseContext(hContext) {
        result := DllCall("WinSCard.dll\SCardReleaseContext", "ptr", hContext, "int")
        return result
    }

    /**
     * Determines whether a smart card context handle is valid.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context can be set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @returns {Integer} This function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_S_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hContext</i> parameter is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hContext</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other values</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardisvalidcontext
     * @since windows5.1.2600
     */
    static SCardIsValidContext(hContext) {
        result := DllCall("WinSCard.dll\SCardIsValidContext", "ptr", hContext, "int")
        return result
    }

    /**
     * Provides the list of reader groups that have previously been introduced to the system.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. 
     * 
     * If this parameter is set to <b>NULL</b>, the search for reader groups is not limited to any context.
     * @param {PSTR} mszGroups Multi-string that lists the reader groups defined to the system and available to the current user on the current <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">terminal</a>. If this value is <b>NULL</b>, <b>SCardListReaderGroups</b> ignores the buffer length supplied in <i>pcchGroups</i>, writes the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>pcchGroups</i>, and returns a success code.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcchGroups Length of the <i>mszGroups</i> buffer in characters, and receives the actual length of the multi-string structure, including all trailing <b>null</b> characters. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>mszGroups</i> is converted to a pointer to a byte pointer, and receives the address of a block of memory containing the multi-string structure. This block of memory must be deallocated with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistreadergroupsa
     * @since windows5.1.2600
     */
    static SCardListReaderGroupsA(hContext, mszGroups, pcchGroups) {
        mszGroups := mszGroups is String ? StrPtr(mszGroups) : mszGroups

        pcchGroupsMarshal := pcchGroups is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListReaderGroupsA", "ptr", hContext, "ptr", mszGroups, pcchGroupsMarshal, pcchGroups, "int")
        return result
    }

    /**
     * Provides the list of reader groups that have previously been introduced to the system.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. 
     * 
     * If this parameter is set to <b>NULL</b>, the search for reader groups is not limited to any context.
     * @param {PWSTR} mszGroups Multi-string that lists the reader groups defined to the system and available to the current user on the current <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">terminal</a>. If this value is <b>NULL</b>, <b>SCardListReaderGroups</b> ignores the buffer length supplied in <i>pcchGroups</i>, writes the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>pcchGroups</i>, and returns a success code.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcchGroups Length of the <i>mszGroups</i> buffer in characters, and receives the actual length of the multi-string structure, including all trailing <b>null</b> characters. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>mszGroups</i> is converted to a pointer to a byte pointer, and receives the address of a block of memory containing the multi-string structure. This block of memory must be deallocated with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistreadergroupsw
     * @since windows5.1.2600
     */
    static SCardListReaderGroupsW(hContext, mszGroups, pcchGroups) {
        mszGroups := mszGroups is String ? StrPtr(mszGroups) : mszGroups

        pcchGroupsMarshal := pcchGroups is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListReaderGroupsW", "ptr", hContext, "ptr", mszGroups, pcchGroupsMarshal, pcchGroups, "int")
        return result
    }

    /**
     * Provides the list of readers within a set of named reader groups, eliminating duplicates.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. 
     * 
     * If this parameter is set to <b>NULL</b>, the search for readers is not limited to any context.
     * @param {PSTR} mszGroups Names of the reader groups defined to the system, as a multi-string. Use a <b>NULL</b> value to list all readers in the system (that is, the SCard$AllReaders group).
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSTR} mszReaders Multi-string that lists the card readers within the supplied reader groups. If this value is <b>NULL</b>, <b>SCardListReaders</b> ignores the buffer length supplied in <i>pcchReaders</i>, writes the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>pcchReaders</i>, and returns a success code.
     * @param {Pointer<Integer>} pcchReaders Length of the <i>mszReaders</i> buffer in characters. This parameter receives the actual length of the multi-string structure, including all trailing <b>null</b> characters. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>mszReaders</i> is converted to a pointer to a byte pointer, and receives the address of a block of memory containing the multi-string structure. This block of memory must be deallocated with <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Group contains no readers</b></dt>
     * <dt>2148532270 (0x8010002E)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_E_NO_READERS_AVAILABLE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Specified reader is not currently available for use</b></dt>
     * <dt>2148532247 (0x80100017)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_E_READER_UNAVAILABLE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistreadersa
     * @since windows5.1.2600
     */
    static SCardListReadersA(hContext, mszGroups, mszReaders, pcchReaders) {
        mszGroups := mszGroups is String ? StrPtr(mszGroups) : mszGroups
        mszReaders := mszReaders is String ? StrPtr(mszReaders) : mszReaders

        pcchReadersMarshal := pcchReaders is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListReadersA", "ptr", hContext, "ptr", mszGroups, "ptr", mszReaders, pcchReadersMarshal, pcchReaders, "int")
        return result
    }

    /**
     * Provides the list of readers within a set of named reader groups, eliminating duplicates.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. 
     * 
     * If this parameter is set to <b>NULL</b>, the search for readers is not limited to any context.
     * @param {PWSTR} mszGroups Names of the reader groups defined to the system, as a multi-string. Use a <b>NULL</b> value to list all readers in the system (that is, the SCard$AllReaders group).
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} mszReaders Multi-string that lists the card readers within the supplied reader groups. If this value is <b>NULL</b>, <b>SCardListReaders</b> ignores the buffer length supplied in <i>pcchReaders</i>, writes the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>pcchReaders</i>, and returns a success code.
     * @param {Pointer<Integer>} pcchReaders Length of the <i>mszReaders</i> buffer in characters. This parameter receives the actual length of the multi-string structure, including all trailing <b>null</b> characters. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>mszReaders</i> is converted to a pointer to a byte pointer, and receives the address of a block of memory containing the multi-string structure. This block of memory must be deallocated with <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Group contains no readers</b></dt>
     * <dt>2148532270 (0x8010002E)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_E_NO_READERS_AVAILABLE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Specified reader is not currently available for use</b></dt>
     * <dt>2148532247 (0x80100017)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_E_READER_UNAVAILABLE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistreadersw
     * @since windows5.1.2600
     */
    static SCardListReadersW(hContext, mszGroups, mszReaders, pcchReaders) {
        mszGroups := mszGroups is String ? StrPtr(mszGroups) : mszGroups
        mszReaders := mszReaders is String ? StrPtr(mszReaders) : mszReaders

        pcchReadersMarshal := pcchReaders is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListReadersW", "ptr", hContext, "ptr", mszGroups, "ptr", mszReaders, pcchReadersMarshal, pcchReaders, "int")
        return result
    }

    /**
     * Searches the smart card database and provides a list of named cards previously introduced to the system by the user.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * 
     * If this parameter is set to <b>NULL</b>, the search for cards is not limited to any context.
     * @param {Pointer<Integer>} pbAtr Address of an ATR string to compare to known cards, or <b>NULL</b> if no ATR matching is to be performed.
     * @param {Pointer<Guid>} rgquidInterfaces Array of identifiers (GUIDs), or <b>NULL</b> if no interface matching is to be performed. When an array is supplied, a card name will be returned only if all the specified identifiers are supported by the card.
     * @param {Integer} cguidInterfaceCount Number of entries in the <i>rgguidInterfaces</i> array. If <i>rgguidInterfaces</i> is <b>NULL</b>, then this value is ignored.
     * @param {PSTR} mszCards Multi-string that lists the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart cards</a> found. If this value is <b>NULL</b>, <b>SCardListCards</b> ignores the buffer length supplied in <i>pcchCards</i>, returning the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>pcchCards</i> and a success code.
     * @param {Pointer<Integer>} pcchCards Length of the <i>mszCards</i> buffer in characters. Receives the actual length of the multi-string structure, including all trailing <b>null</b> characters. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>mszCards</i> is converted to a pointer to a byte pointer, and receives the address of a block of memory containing the multi-string structure. This block of memory must be deallocated with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistcardsa
     * @since windows5.1.2600
     */
    static SCardListCardsA(hContext, pbAtr, rgquidInterfaces, cguidInterfaceCount, mszCards, pcchCards) {
        mszCards := mszCards is String ? StrPtr(mszCards) : mszCards

        pbAtrMarshal := pbAtr is VarRef ? "char*" : "ptr"
        pcchCardsMarshal := pcchCards is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListCardsA", "ptr", hContext, pbAtrMarshal, pbAtr, "ptr", rgquidInterfaces, "uint", cguidInterfaceCount, "ptr", mszCards, pcchCardsMarshal, pcchCards, "int")
        return result
    }

    /**
     * Searches the smart card database and provides a list of named cards previously introduced to the system by the user.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * 
     * If this parameter is set to <b>NULL</b>, the search for cards is not limited to any context.
     * @param {Pointer<Integer>} pbAtr Address of an ATR string to compare to known cards, or <b>NULL</b> if no ATR matching is to be performed.
     * @param {Pointer<Guid>} rgquidInterfaces Array of identifiers (GUIDs), or <b>NULL</b> if no interface matching is to be performed. When an array is supplied, a card name will be returned only if all the specified identifiers are supported by the card.
     * @param {Integer} cguidInterfaceCount Number of entries in the <i>rgguidInterfaces</i> array. If <i>rgguidInterfaces</i> is <b>NULL</b>, then this value is ignored.
     * @param {PWSTR} mszCards Multi-string that lists the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart cards</a> found. If this value is <b>NULL</b>, <b>SCardListCards</b> ignores the buffer length supplied in <i>pcchCards</i>, returning the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>pcchCards</i> and a success code.
     * @param {Pointer<Integer>} pcchCards Length of the <i>mszCards</i> buffer in characters. Receives the actual length of the multi-string structure, including all trailing <b>null</b> characters. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>mszCards</i> is converted to a pointer to a byte pointer, and receives the address of a block of memory containing the multi-string structure. This block of memory must be deallocated with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistcardsw
     * @since windows5.1.2600
     */
    static SCardListCardsW(hContext, pbAtr, rgquidInterfaces, cguidInterfaceCount, mszCards, pcchCards) {
        mszCards := mszCards is String ? StrPtr(mszCards) : mszCards

        pbAtrMarshal := pbAtr is VarRef ? "char*" : "ptr"
        pcchCardsMarshal := pcchCards is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListCardsW", "ptr", hContext, pbAtrMarshal, pbAtr, "ptr", rgquidInterfaces, "uint", cguidInterfaceCount, "ptr", mszCards, pcchCardsMarshal, pcchCards, "int")
        return result
    }

    /**
     * Provides a list of interfaces supplied by a given card.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szCard Name of the smart card already introduced to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card subsystem</a>.
     * @param {Pointer<Guid>} pguidInterfaces Array of interface identifiers (GUIDs) that indicate the interfaces supported by the smart card. If this value is <b>NULL</b>, <b>SCardListInterfaces</b> ignores the array length supplied in <i>pcguidInterfaces</i>, returning the size of the array that would have been returned if this parameter had not been <b>NULL</b> to <i>pcguidInterfaces</i> and a success code.
     * @param {Pointer<Integer>} pcguidInterfaces Size of the <i>pcguidInterfaces</i> array, and receives the actual size of the returned array. If the array size is specified as SCARD_AUTOALLOCATE, then <i>pcguidInterfaces</i> is converted to a pointer to a GUID pointer, and receives the address of a block of memory containing the array. This block of memory must be deallocated with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistinterfacesa
     * @since windows5.1.2600
     */
    static SCardListInterfacesA(hContext, szCard, pguidInterfaces, pcguidInterfaces) {
        szCard := szCard is String ? StrPtr(szCard) : szCard

        pcguidInterfacesMarshal := pcguidInterfaces is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListInterfacesA", "ptr", hContext, "ptr", szCard, "ptr", pguidInterfaces, pcguidInterfacesMarshal, pcguidInterfaces, "int")
        return result
    }

    /**
     * Provides a list of interfaces supplied by a given card.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szCard Name of the smart card already introduced to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card subsystem</a>.
     * @param {Pointer<Guid>} pguidInterfaces Array of interface identifiers (GUIDs) that indicate the interfaces supported by the smart card. If this value is <b>NULL</b>, <b>SCardListInterfaces</b> ignores the array length supplied in <i>pcguidInterfaces</i>, returning the size of the array that would have been returned if this parameter had not been <b>NULL</b> to <i>pcguidInterfaces</i> and a success code.
     * @param {Pointer<Integer>} pcguidInterfaces Size of the <i>pcguidInterfaces</i> array, and receives the actual size of the returned array. If the array size is specified as SCARD_AUTOALLOCATE, then <i>pcguidInterfaces</i> is converted to a pointer to a GUID pointer, and receives the address of a block of memory containing the array. This block of memory must be deallocated with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistinterfacesw
     * @since windows5.1.2600
     */
    static SCardListInterfacesW(hContext, szCard, pguidInterfaces, pcguidInterfaces) {
        szCard := szCard is String ? StrPtr(szCard) : szCard

        pcguidInterfacesMarshal := pcguidInterfaces is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListInterfacesW", "ptr", hContext, "ptr", szCard, "ptr", pguidInterfaces, pcguidInterfacesMarshal, pcguidInterfaces, "int")
        return result
    }

    /**
     * Returns the identifier (GUID) of the primary service provider for a given card.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szCard Name of the card defined to the system.
     * @param {Pointer<Guid>} pguidProviderId Identifier (GUID) of the primary service provider. This provider may be activated using COM, and will supply access to other services in the card.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetproviderida
     * @since windows5.1.2600
     */
    static SCardGetProviderIdA(hContext, szCard, pguidProviderId) {
        szCard := szCard is String ? StrPtr(szCard) : szCard

        result := DllCall("WinSCard.dll\SCardGetProviderIdA", "ptr", hContext, "ptr", szCard, "ptr", pguidProviderId, "int")
        return result
    }

    /**
     * Returns the identifier (GUID) of the primary service provider for a given card.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> for the query. The resource manager context can be set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szCard Name of the card defined to the system.
     * @param {Pointer<Guid>} pguidProviderId Identifier (GUID) of the primary service provider. This provider may be activated using COM, and will supply access to other services in the card.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetprovideridw
     * @since windows5.1.2600
     */
    static SCardGetProviderIdW(hContext, szCard, pguidProviderId) {
        szCard := szCard is String ? StrPtr(szCard) : szCard

        result := DllCall("WinSCard.dll\SCardGetProviderIdW", "ptr", hContext, "ptr", szCard, "ptr", pguidProviderId, "int")
        return result
    }

    /**
     * Returns the name of the module (dynamic link library) that contains the provider for a given card name and provider type.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context can be set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This value can be <b>NULL</b> if the call to <b>SCardGetCardTypeProviderName</b> is not directed to a specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
     * @param {PSTR} szCardName Name of the card type with which this provider name is associated.
     * @param {Integer} dwProviderId Identifier for the provider associated with this card type. 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_PRIMARY"></a><a id="scard_provider_primary"></a><dl>
     * <dt><b>SCARD_PROVIDER_PRIMARY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card's</a> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary service provider</a> as a GUID string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_CSP"></a><a id="scard_provider_csp"></a><dl>
     * <dt><b>SCARD_PROVIDER_CSP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_KSP"></a><a id="scard_provider_ksp"></a><dl>
     * <dt><b>SCARD_PROVIDER_KSP</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the smart card <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key storage provider</a> (KSP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_CARD_MODULE"></a><a id="scard_provider_card_module"></a><dl>
     * <dt><b>SCARD_PROVIDER_CARD_MODULE</b></dt>
     * <dt>0x80000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the card module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSTR} szProvider String variable to receive the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">provider name</a> upon successful completion of this function.
     * @param {Pointer<Integer>} pcchProvider Pointer to <b>DWORD</b> value. On input, <i>pcchProvider</i> supplies the length of the <i>szProvider</i> buffer in characters. If this value is SCARD_AUTOALLOCATE, then <i>szProvider</i> is converted to a pointer to a byte pointer and receives the address of a block of memory containing the string. This block of memory must be deallocated by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>. 
     * 
     * 
     * 
     * 
     * On output, this value represents the actual number of characters, including the <b>null</b> terminator, in the <i>szProvider</i> variable.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetcardtypeprovidernamea
     * @since windows5.1.2600
     */
    static SCardGetCardTypeProviderNameA(hContext, szCardName, dwProviderId, szProvider, pcchProvider) {
        szCardName := szCardName is String ? StrPtr(szCardName) : szCardName
        szProvider := szProvider is String ? StrPtr(szProvider) : szProvider

        pcchProviderMarshal := pcchProvider is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetCardTypeProviderNameA", "ptr", hContext, "ptr", szCardName, "uint", dwProviderId, "ptr", szProvider, pcchProviderMarshal, pcchProvider, "int")
        return result
    }

    /**
     * Returns the name of the module (dynamic link library) that contains the provider for a given card name and provider type.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context can be set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This value can be <b>NULL</b> if the call to <b>SCardGetCardTypeProviderName</b> is not directed to a specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
     * @param {PWSTR} szCardName Name of the card type with which this provider name is associated.
     * @param {Integer} dwProviderId Identifier for the provider associated with this card type. 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_PRIMARY"></a><a id="scard_provider_primary"></a><dl>
     * <dt><b>SCARD_PROVIDER_PRIMARY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card's</a> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary service provider</a> as a GUID string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_CSP"></a><a id="scard_provider_csp"></a><dl>
     * <dt><b>SCARD_PROVIDER_CSP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_KSP"></a><a id="scard_provider_ksp"></a><dl>
     * <dt><b>SCARD_PROVIDER_KSP</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the smart card <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key storage provider</a> (KSP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_CARD_MODULE"></a><a id="scard_provider_card_module"></a><dl>
     * <dt><b>SCARD_PROVIDER_CARD_MODULE</b></dt>
     * <dt>0x80000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the card module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} szProvider String variable to receive the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">provider name</a> upon successful completion of this function.
     * @param {Pointer<Integer>} pcchProvider Pointer to <b>DWORD</b> value. On input, <i>pcchProvider</i> supplies the length of the <i>szProvider</i> buffer in characters. If this value is SCARD_AUTOALLOCATE, then <i>szProvider</i> is converted to a pointer to a byte pointer and receives the address of a block of memory containing the string. This block of memory must be deallocated by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>. 
     * 
     * 
     * 
     * 
     * On output, this value represents the actual number of characters, including the <b>null</b> terminator, in the <i>szProvider</i> variable.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetcardtypeprovidernamew
     * @since windows5.1.2600
     */
    static SCardGetCardTypeProviderNameW(hContext, szCardName, dwProviderId, szProvider, pcchProvider) {
        szCardName := szCardName is String ? StrPtr(szCardName) : szCardName
        szProvider := szProvider is String ? StrPtr(szProvider) : szProvider

        pcchProviderMarshal := pcchProvider is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetCardTypeProviderNameW", "ptr", hContext, "ptr", szCardName, "uint", dwProviderId, "ptr", szProvider, pcchProviderMarshal, pcchProvider, "int")
        return result
    }

    /**
     * Introduces a reader group to the smart card subsystem. However, the reader group is not created until the group is specified when adding a reader to the smart card database.
     * @param {Pointer} hContext Supplies the handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. If this parameter is <b>NULL</b>, the scope of the resource manager is SCARD_SCOPE_SYSTEM.
     * @param {PSTR} szGroupName Supplies the display name to be assigned to the new reader group.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardintroducereadergroupa
     * @since windows5.1.2600
     */
    static SCardIntroduceReaderGroupA(hContext, szGroupName) {
        szGroupName := szGroupName is String ? StrPtr(szGroupName) : szGroupName

        result := DllCall("WinSCard.dll\SCardIntroduceReaderGroupA", "ptr", hContext, "ptr", szGroupName, "int")
        return result
    }

    /**
     * Introduces a reader group to the smart card subsystem. However, the reader group is not created until the group is specified when adding a reader to the smart card database.
     * @param {Pointer} hContext Supplies the handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. If this parameter is <b>NULL</b>, the scope of the resource manager is SCARD_SCOPE_SYSTEM.
     * @param {PWSTR} szGroupName Supplies the display name to be assigned to the new reader group.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardintroducereadergroupw
     * @since windows5.1.2600
     */
    static SCardIntroduceReaderGroupW(hContext, szGroupName) {
        szGroupName := szGroupName is String ? StrPtr(szGroupName) : szGroupName

        result := DllCall("WinSCard.dll\SCardIntroduceReaderGroupW", "ptr", hContext, "ptr", szGroupName, "int")
        return result
    }

    /**
     * Removes a previously introduced smart card reader group from the smart card subsystem. Although this function automatically clears all readers from the group, it does not affect the existence of the individual readers in the database.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szGroupName Display name of the reader group to be removed. System-defined reader groups cannot be removed from the database.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardforgetreadergroupa
     * @since windows5.1.2600
     */
    static SCardForgetReaderGroupA(hContext, szGroupName) {
        szGroupName := szGroupName is String ? StrPtr(szGroupName) : szGroupName

        result := DllCall("WinSCard.dll\SCardForgetReaderGroupA", "ptr", hContext, "ptr", szGroupName, "int")
        return result
    }

    /**
     * Removes a previously introduced smart card reader group from the smart card subsystem. Although this function automatically clears all readers from the group, it does not affect the existence of the individual readers in the database.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szGroupName Display name of the reader group to be removed. System-defined reader groups cannot be removed from the database.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardforgetreadergroupw
     * @since windows5.1.2600
     */
    static SCardForgetReaderGroupW(hContext, szGroupName) {
        szGroupName := szGroupName is String ? StrPtr(szGroupName) : szGroupName

        result := DllCall("WinSCard.dll\SCardForgetReaderGroupW", "ptr", hContext, "ptr", szGroupName, "int")
        return result
    }

    /**
     * Introduces a new name for an existing smart card reader.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szReaderName Display name to be assigned to the reader.
     * @param {PSTR} szDeviceName System name of the smart card reader, for example, "MyReader 01".
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardintroducereadera
     * @since windows5.1.2600
     */
    static SCardIntroduceReaderA(hContext, szReaderName, szDeviceName) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName
        szDeviceName := szDeviceName is String ? StrPtr(szDeviceName) : szDeviceName

        result := DllCall("WinSCard.dll\SCardIntroduceReaderA", "ptr", hContext, "ptr", szReaderName, "ptr", szDeviceName, "int")
        return result
    }

    /**
     * Introduces a new name for an existing smart card reader.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szReaderName Display name to be assigned to the reader.
     * @param {PWSTR} szDeviceName System name of the smart card reader, for example, "MyReader 01".
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardintroducereaderw
     * @since windows5.1.2600
     */
    static SCardIntroduceReaderW(hContext, szReaderName, szDeviceName) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName
        szDeviceName := szDeviceName is String ? StrPtr(szDeviceName) : szDeviceName

        result := DllCall("WinSCard.dll\SCardIntroduceReaderW", "ptr", hContext, "ptr", szReaderName, "ptr", szDeviceName, "int")
        return result
    }

    /**
     * Removes a previously introduced reader from control by the smart card subsystem. It is removed from the smart card database, including from any reader group that it may have been added to.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szReaderName Display name of the reader to be removed from the smart card database.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardforgetreadera
     * @since windows5.1.2600
     */
    static SCardForgetReaderA(hContext, szReaderName) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName

        result := DllCall("WinSCard.dll\SCardForgetReaderA", "ptr", hContext, "ptr", szReaderName, "int")
        return result
    }

    /**
     * Removes a previously introduced reader from control by the smart card subsystem. It is removed from the smart card database, including from any reader group that it may have been added to.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szReaderName Display name of the reader to be removed from the smart card database.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardforgetreaderw
     * @since windows5.1.2600
     */
    static SCardForgetReaderW(hContext, szReaderName) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName

        result := DllCall("WinSCard.dll\SCardForgetReaderW", "ptr", hContext, "ptr", szReaderName, "int")
        return result
    }

    /**
     * Adds a reader to a reader group.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szReaderName Display name of the reader that you are adding.
     * @param {PSTR} szGroupName Display name of the group to which you are adding the reader.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardaddreadertogroupa
     * @since windows5.1.2600
     */
    static SCardAddReaderToGroupA(hContext, szReaderName, szGroupName) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName
        szGroupName := szGroupName is String ? StrPtr(szGroupName) : szGroupName

        result := DllCall("WinSCard.dll\SCardAddReaderToGroupA", "ptr", hContext, "ptr", szReaderName, "ptr", szGroupName, "int")
        return result
    }

    /**
     * Adds a reader to a reader group.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szReaderName Display name of the reader that you are adding.
     * @param {PWSTR} szGroupName Display name of the group to which you are adding the reader.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardaddreadertogroupw
     * @since windows5.1.2600
     */
    static SCardAddReaderToGroupW(hContext, szReaderName, szGroupName) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName
        szGroupName := szGroupName is String ? StrPtr(szGroupName) : szGroupName

        result := DllCall("WinSCard.dll\SCardAddReaderToGroupW", "ptr", hContext, "ptr", szReaderName, "ptr", szGroupName, "int")
        return result
    }

    /**
     * Removes a reader from an existing reader group. This function has no effect on the reader.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szReaderName Display name of the reader to be removed.
     * @param {PSTR} szGroupName Display name of the group from which the reader should be removed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardremovereaderfromgroupa
     * @since windows5.1.2600
     */
    static SCardRemoveReaderFromGroupA(hContext, szReaderName, szGroupName) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName
        szGroupName := szGroupName is String ? StrPtr(szGroupName) : szGroupName

        result := DllCall("WinSCard.dll\SCardRemoveReaderFromGroupA", "ptr", hContext, "ptr", szReaderName, "ptr", szGroupName, "int")
        return result
    }

    /**
     * Removes a reader from an existing reader group. This function has no effect on the reader.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szReaderName Display name of the reader to be removed.
     * @param {PWSTR} szGroupName Display name of the group from which the reader should be removed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ALL_READERS"></a><a id="scard_all_readers"></a><dl>
     * <dt><b>SCARD_ALL_READERS</b></dt>
     * <dt>TEXT("SCard$AllReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group used when no group name is provided when listing readers. Returns a list of all readers, regardless of what group or groups the readers are in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_DEFAULT_READERS"></a><a id="scard_default_readers"></a><dl>
     * <dt><b>SCARD_DEFAULT_READERS</b></dt>
     * <dt>TEXT("SCard$DefaultReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default group to which all readers are added when introduced into the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LOCAL_READERS"></a><a id="scard_local_readers"></a><dl>
     * <dt><b>SCARD_LOCAL_READERS</b></dt>
     * <dt>TEXT("SCard$LocalReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SYSTEM_READERS"></a><a id="scard_system_readers"></a><dl>
     * <dt><b>SCARD_SYSTEM_READERS</b></dt>
     * <dt>TEXT("SCard$SystemReaders\000")</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused legacy value. This is an internally managed group that cannot be modified by using any reader group APIs. It is intended to be used for enumeration only.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardremovereaderfromgroupw
     * @since windows5.1.2600
     */
    static SCardRemoveReaderFromGroupW(hContext, szReaderName, szGroupName) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName
        szGroupName := szGroupName is String ? StrPtr(szGroupName) : szGroupName

        result := DllCall("WinSCard.dll\SCardRemoveReaderFromGroupW", "ptr", hContext, "ptr", szReaderName, "ptr", szGroupName, "int")
        return result
    }

    /**
     * Introduces a smart card to the smart card subsystem (for the active user) by adding it to the smart card database.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szCardName Name by which the user can recognize the card.
     * @param {Pointer<Guid>} pguidPrimaryProvider Pointer to the identifier (GUID) for the smart card's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary service provider</a>.
     * @param {Pointer<Guid>} rgguidInterfaces Array of identifiers (GUIDs) that identify the interfaces supported by the smart card.
     * @param {Integer} dwInterfaceCount Number of identifiers in the <i>rgguidInterfaces</i> array.
     * @param {Pointer<Integer>} pbAtr <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ATR string</a> that can be used for matching purposes when querying the smart card database (for more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardlistcardsa">SCardListCards</a>). The length of this string is determined by normal ATR parsing.
     * @param {Pointer<Integer>} pbAtrMask Optional bitmask to use when comparing the ATRs of smart cards to the ATR supplied in <i>pbAtr</i>. If this value is non-<b>NULL</b>, it must point to a string of bytes the same length as the ATR string supplied in <i>pbAtr</i>. When a given ATR string <i>A</i> is compared to the ATR supplied in <i>pbAtr</i>, it matches if and only if <i>A &amp; M</i> = <i>pbAtr</i>, where <i>M</i> is the supplied mask, and <i>&amp;</i> represents bitwise AND.
     * @param {Integer} cbAtrLen Length of the ATR and optional ATR mask. If this value is zero, then the length of the ATR is determined by normal ATR parsing. This value cannot be zero if a <i>pbAtr</i> value is supplied.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardintroducecardtypea
     * @since windows5.1.2600
     */
    static SCardIntroduceCardTypeA(hContext, szCardName, pguidPrimaryProvider, rgguidInterfaces, dwInterfaceCount, pbAtr, pbAtrMask, cbAtrLen) {
        szCardName := szCardName is String ? StrPtr(szCardName) : szCardName

        pbAtrMarshal := pbAtr is VarRef ? "char*" : "ptr"
        pbAtrMaskMarshal := pbAtrMask is VarRef ? "char*" : "ptr"

        result := DllCall("WinSCard.dll\SCardIntroduceCardTypeA", "ptr", hContext, "ptr", szCardName, "ptr", pguidPrimaryProvider, "ptr", rgguidInterfaces, "uint", dwInterfaceCount, pbAtrMarshal, pbAtr, pbAtrMaskMarshal, pbAtrMask, "uint", cbAtrLen, "int")
        return result
    }

    /**
     * Introduces a smart card to the smart card subsystem (for the active user) by adding it to the smart card database.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szCardName Name by which the user can recognize the card.
     * @param {Pointer<Guid>} pguidPrimaryProvider Pointer to the identifier (GUID) for the smart card's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary service provider</a>.
     * @param {Pointer<Guid>} rgguidInterfaces Array of identifiers (GUIDs) that identify the interfaces supported by the smart card.
     * @param {Integer} dwInterfaceCount Number of identifiers in the <i>rgguidInterfaces</i> array.
     * @param {Pointer<Integer>} pbAtr <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ATR string</a> that can be used for matching purposes when querying the smart card database (for more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardlistcardsa">SCardListCards</a>). The length of this string is determined by normal ATR parsing.
     * @param {Pointer<Integer>} pbAtrMask Optional bitmask to use when comparing the ATRs of smart cards to the ATR supplied in <i>pbAtr</i>. If this value is non-<b>NULL</b>, it must point to a string of bytes the same length as the ATR string supplied in <i>pbAtr</i>. When a given ATR string <i>A</i> is compared to the ATR supplied in <i>pbAtr</i>, it matches if and only if <i>A &amp; M</i> = <i>pbAtr</i>, where <i>M</i> is the supplied mask, and <i>&amp;</i> represents bitwise AND.
     * @param {Integer} cbAtrLen Length of the ATR and optional ATR mask. If this value is zero, then the length of the ATR is determined by normal ATR parsing. This value cannot be zero if a <i>pbAtr</i> value is supplied.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardintroducecardtypew
     * @since windows5.1.2600
     */
    static SCardIntroduceCardTypeW(hContext, szCardName, pguidPrimaryProvider, rgguidInterfaces, dwInterfaceCount, pbAtr, pbAtrMask, cbAtrLen) {
        szCardName := szCardName is String ? StrPtr(szCardName) : szCardName

        pbAtrMarshal := pbAtr is VarRef ? "char*" : "ptr"
        pbAtrMaskMarshal := pbAtrMask is VarRef ? "char*" : "ptr"

        result := DllCall("WinSCard.dll\SCardIntroduceCardTypeW", "ptr", hContext, "ptr", szCardName, "ptr", pguidPrimaryProvider, "ptr", rgguidInterfaces, "uint", dwInterfaceCount, pbAtrMarshal, pbAtr, pbAtrMaskMarshal, pbAtrMask, "uint", cbAtrLen, "int")
        return result
    }

    /**
     * Specifies the name of the module (dynamic link library) containing the provider for a given card name and provider type.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context can be set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This value can be <b>NULL</b> if the call to <b>SCardSetCardTypeProviderName</b> is not directed to a specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
     * @param {PSTR} szCardName Name of the card type with which this <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">provider name</a> is associated.
     * @param {Integer} dwProviderId Identifier for the provider associated with this card type. 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_PRIMARY"></a><a id="scard_provider_primary"></a><dl>
     * <dt><b>SCARD_PROVIDER_PRIMARY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card's</a> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary service provider</a> as a GUID string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_CSP"></a><a id="scard_provider_csp"></a><dl>
     * <dt><b>SCARD_PROVIDER_CSP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_KSP"></a><a id="scard_provider_ksp"></a><dl>
     * <dt><b>SCARD_PROVIDER_KSP</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the smart card <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key storage provider</a> (KSP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_CARD_MODULE"></a><a id="scard_provider_card_module"></a><dl>
     * <dt><b>SCARD_PROVIDER_CARD_MODULE</b></dt>
     * <dt>0x80000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the card module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSTR} szProvider A string that contains the provider name that is representing the CSP.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardsetcardtypeprovidernamea
     * @since windows5.1.2600
     */
    static SCardSetCardTypeProviderNameA(hContext, szCardName, dwProviderId, szProvider) {
        szCardName := szCardName is String ? StrPtr(szCardName) : szCardName
        szProvider := szProvider is String ? StrPtr(szProvider) : szProvider

        result := DllCall("WinSCard.dll\SCardSetCardTypeProviderNameA", "ptr", hContext, "ptr", szCardName, "uint", dwProviderId, "ptr", szProvider, "int")
        return result
    }

    /**
     * Specifies the name of the module (dynamic link library) containing the provider for a given card name and provider type.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context can be set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This value can be <b>NULL</b> if the call to <b>SCardSetCardTypeProviderName</b> is not directed to a specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
     * @param {PWSTR} szCardName Name of the card type with which this <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">provider name</a> is associated.
     * @param {Integer} dwProviderId Identifier for the provider associated with this card type. 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_PRIMARY"></a><a id="scard_provider_primary"></a><dl>
     * <dt><b>SCARD_PROVIDER_PRIMARY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card's</a> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary service provider</a> as a GUID string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_CSP"></a><a id="scard_provider_csp"></a><dl>
     * <dt><b>SCARD_PROVIDER_CSP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_KSP"></a><a id="scard_provider_ksp"></a><dl>
     * <dt><b>SCARD_PROVIDER_KSP</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the smart card <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key storage provider</a> (KSP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROVIDER_CARD_MODULE"></a><a id="scard_provider_card_module"></a><dl>
     * <dt><b>SCARD_PROVIDER_CARD_MODULE</b></dt>
     * <dt>0x80000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function retrieves the name of the card module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} szProvider A string that contains the provider name that is representing the CSP.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardsetcardtypeprovidernamew
     * @since windows5.1.2600
     */
    static SCardSetCardTypeProviderNameW(hContext, szCardName, dwProviderId, szProvider) {
        szCardName := szCardName is String ? StrPtr(szCardName) : szCardName
        szProvider := szProvider is String ? StrPtr(szProvider) : szProvider

        result := DllCall("WinSCard.dll\SCardSetCardTypeProviderNameW", "ptr", hContext, "ptr", szCardName, "uint", dwProviderId, "ptr", szProvider, "int")
        return result
    }

    /**
     * Removes an introduced smart card from the smart card subsystem.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szCardName Display name of the card to be removed from the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card database</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardforgetcardtypea
     * @since windows5.1.2600
     */
    static SCardForgetCardTypeA(hContext, szCardName) {
        szCardName := szCardName is String ? StrPtr(szCardName) : szCardName

        result := DllCall("WinSCard.dll\SCardForgetCardTypeA", "ptr", hContext, "ptr", szCardName, "int")
        return result
    }

    /**
     * Removes an introduced smart card from the smart card subsystem.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szCardName Display name of the card to be removed from the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card database</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardforgetcardtypew
     * @since windows5.1.2600
     */
    static SCardForgetCardTypeW(hContext, szCardName) {
        szCardName := szCardName is String ? StrPtr(szCardName) : szCardName

        result := DllCall("WinSCard.dll\SCardForgetCardTypeW", "ptr", hContext, "ptr", szCardName, "int")
        return result
    }

    /**
     * Releases memory that has been returned from the resource manager using the SCARD_AUTOALLOCATE length designator.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> returned from <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>, or <b>NULL</b> if the creating function also specified <b>NULL</b> for its <i>hContext</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/smart-card-database-query-functions">Smart Card Database Query Functions</a>.
     * @param {Pointer<Void>} pvMem Memory block to be released.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardfreememory
     * @since windows5.1.2600
     */
    static SCardFreeMemory(hContext, pvMem) {
        pvMemMarshal := pvMem is VarRef ? "ptr" : "ptr"

        result := DllCall("WinSCard.dll\SCardFreeMemory", "ptr", hContext, pvMemMarshal, pvMem, "int")
        return result
    }

    /**
     * Returns an event handle when an event signals that the smart card resource manager is started.
     * @returns {HANDLE} The function returns an event HANDLE if it succeeds or <b>NULL</b> if it fails.
     * 
     *  If the function fails, the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function provides information on the cause of the failure.
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardaccessstartedevent
     * @since windows5.1.2600
     */
    static SCardAccessStartedEvent() {
        A_LastError := 0

        result := DllCall("WinSCard.dll\SCardAccessStartedEvent", "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Decrements the reference count for a handle acquired by a previous call to the SCardAccessStartedEvent function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardreleasestartedevent
     * @since windows5.1.2600
     */
    static SCardReleaseStartedEvent() {
        DllCall("WinSCard.dll\SCardReleaseStartedEvent")
    }

    /**
     * Searches the readers listed in the rgReaderStates parameter for a card with an ATR string that matches one of the card names specified in mszCards, returning immediately with the result.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {PSTR} mszCards A multiple string that contains the names of the cards to search for.
     * @param {Pointer<SCARD_READERSTATEA>} rgReaderStates An array of <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_readerstatea">SCARD_READERSTATE</a> structures that, on input, specify the readers to search and that, on output, receives the result.
     * @param {Integer} cReaders The number of elements in the <i>rgReaderStates</i> array.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlocatecardsa
     * @since windows5.1.2600
     */
    static SCardLocateCardsA(hContext, mszCards, rgReaderStates, cReaders) {
        mszCards := mszCards is String ? StrPtr(mszCards) : mszCards

        result := DllCall("WinSCard.dll\SCardLocateCardsA", "ptr", hContext, "ptr", mszCards, "ptr", rgReaderStates, "uint", cReaders, "int")
        return result
    }

    /**
     * Searches the readers listed in the rgReaderStates parameter for a card with an ATR string that matches one of the card names specified in mszCards, returning immediately with the result.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {PWSTR} mszCards A multiple string that contains the names of the cards to search for.
     * @param {Pointer<SCARD_READERSTATEW>} rgReaderStates An array of <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_readerstatea">SCARD_READERSTATE</a> structures that, on input, specify the readers to search and that, on output, receives the result.
     * @param {Integer} cReaders The number of elements in the <i>rgReaderStates</i> array.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlocatecardsw
     * @since windows5.1.2600
     */
    static SCardLocateCardsW(hContext, mszCards, rgReaderStates, cReaders) {
        mszCards := mszCards is String ? StrPtr(mszCards) : mszCards

        result := DllCall("WinSCard.dll\SCardLocateCardsW", "ptr", hContext, "ptr", mszCards, "ptr", rgReaderStates, "uint", cReaders, "int")
        return result
    }

    /**
     * Searches the readers listed in the rgReaderStates parameter for a card with a name that matches one of the card names contained in one of the SCARD_ATRMASK structures specified by the rgAtrMasks parameter.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {Pointer<SCARD_ATRMASK>} rgAtrMasks Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_atrmask">SCARD_ATRMASK</a> structures that contain the names of the cards for which to search.
     * @param {Integer} cAtrs Number of elements in the <i>rgAtrMasks</i> array.
     * @param {Pointer<SCARD_READERSTATEA>} rgReaderStates Array of <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_readerstatea">SCARD_READERSTATE</a> structures that specify the readers to search, and receive the result.
     * @param {Integer} cReaders Number of elements in the <i>rgReaderStates</i> array.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlocatecardsbyatra
     * @since windows5.1.2600
     */
    static SCardLocateCardsByATRA(hContext, rgAtrMasks, cAtrs, rgReaderStates, cReaders) {
        result := DllCall("WinSCard.dll\SCardLocateCardsByATRA", "ptr", hContext, "ptr", rgAtrMasks, "uint", cAtrs, "ptr", rgReaderStates, "uint", cReaders, "int")
        return result
    }

    /**
     * Searches the readers listed in the rgReaderStates parameter for a card with a name that matches one of the card names contained in one of the SCARD_ATRMASK structures specified by the rgAtrMasks parameter.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {Pointer<SCARD_ATRMASK>} rgAtrMasks Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_atrmask">SCARD_ATRMASK</a> structures that contain the names of the cards for which to search.
     * @param {Integer} cAtrs Number of elements in the <i>rgAtrMasks</i> array.
     * @param {Pointer<SCARD_READERSTATEW>} rgReaderStates Array of <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_readerstatea">SCARD_READERSTATE</a> structures that specify the readers to search, and receive the result.
     * @param {Integer} cReaders Number of elements in the <i>rgReaderStates</i> array.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlocatecardsbyatrw
     * @since windows5.1.2600
     */
    static SCardLocateCardsByATRW(hContext, rgAtrMasks, cAtrs, rgReaderStates, cReaders) {
        result := DllCall("WinSCard.dll\SCardLocateCardsByATRW", "ptr", hContext, "ptr", rgAtrMasks, "uint", cAtrs, "ptr", rgReaderStates, "uint", cReaders, "int")
        return result
    }

    /**
     * Blocks execution until the current availability of the cards in a specific set of readers changes.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function.
     * @param {Integer} dwTimeout The maximum amount of time, in milliseconds, to wait for an action. A value of zero causes the function to return immediately. A value of INFINITE causes this function never to time out.
     * @param {Pointer<SCARD_READERSTATEA>} rgReaderStates An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_readerstatea">SCARD_READERSTATE</a> structures that specify the readers to watch, and that receives the result.
     * 
     * To be notified of the arrival of a new smart card reader, set the <b>szReader</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_readerstatea">SCARD_READERSTATE</a> structure to "\\\\?PnP?\\Notification", and set all of the other members of that structure to zero.
     * 
     * <div class="alert"><b>Important</b>  Each member of each structure in this array must be initialized to zero and then set to specific values as necessary. If this is not done, the function will fail in situations that involve remote card readers.</div>
     * <div> </div>
     * @param {Integer} cReaders The number of elements in the <i>rgReaderStates</i> array.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetstatuschangea
     * @since windows5.1.2600
     */
    static SCardGetStatusChangeA(hContext, dwTimeout, rgReaderStates, cReaders) {
        result := DllCall("WinSCard.dll\SCardGetStatusChangeA", "ptr", hContext, "uint", dwTimeout, "ptr", rgReaderStates, "uint", cReaders, "int")
        return result
    }

    /**
     * Blocks execution until the current availability of the cards in a specific set of readers changes.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function.
     * @param {Integer} dwTimeout The maximum amount of time, in milliseconds, to wait for an action. A value of zero causes the function to return immediately. A value of INFINITE causes this function never to time out.
     * @param {Pointer<SCARD_READERSTATEW>} rgReaderStates An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_readerstatea">SCARD_READERSTATE</a> structures that specify the readers to watch, and that receives the result.
     * 
     * To be notified of the arrival of a new smart card reader, set the <b>szReader</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-scard_readerstatea">SCARD_READERSTATE</a> structure to "\\\\?PnP?\\Notification", and set all of the other members of that structure to zero.
     * 
     * <div class="alert"><b>Important</b>  Each member of each structure in this array must be initialized to zero and then set to specific values as necessary. If this is not done, the function will fail in situations that involve remote card readers.</div>
     * <div> </div>
     * @param {Integer} cReaders The number of elements in the <i>rgReaderStates</i> array.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetstatuschangew
     * @since windows5.1.2600
     */
    static SCardGetStatusChangeW(hContext, dwTimeout, rgReaderStates, cReaders) {
        result := DllCall("WinSCard.dll\SCardGetStatusChangeW", "ptr", hContext, "uint", dwTimeout, "ptr", rgReaderStates, "uint", cReaders, "int")
        return result
    }

    /**
     * Terminates all outstanding actions within a specific resource manager context.
     * @param {Pointer} hContext Handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardcancel
     * @since windows5.1.2600
     */
    static SCardCancel(hContext) {
        result := DllCall("WinSCard.dll\SCardCancel", "ptr", hContext, "int")
        return result
    }

    /**
     * Establishes a connection (using a specific resource manager context) between the calling application and a smart card contained by a specific reader. If no card exists in the specified reader, an error is returned.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {PSTR} szReader The name of the reader that contains the target card.
     * @param {Integer} dwShareMode A flag that indicates whether other applications may form connections to the card.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SHARE_SHARED"></a><a id="scard_share_shared"></a><dl>
     * <dt><b>SCARD_SHARE_SHARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This application is willing to share the card with other applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SHARE_EXCLUSIVE"></a><a id="scard_share_exclusive"></a><dl>
     * <dt><b>SCARD_SHARE_EXCLUSIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This application is not willing to share the card with other applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SHARE_DIRECT"></a><a id="scard_share_direct"></a><dl>
     * <dt><b>SCARD_SHARE_DIRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This application is allocating the reader for its private use, and will be controlling it directly. No other applications are allowed access to it.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwPreferredProtocols A bitmask of acceptable protocols for the connection. Possible values may be combined with the <b>OR</b> operation.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T0"></a><a id="scard_protocol_t0"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a> is an acceptable protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T1"></a><a id="scard_protocol_t1"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> is an acceptable protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This parameter may be zero only if <i>dwShareMode</i> is set to SCARD_SHARE_DIRECT. In this case, no protocol negotiation will be performed by the drivers until an IOCTL_SMARTCARD_SET_PROTOCOL control directive is sent with <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardcontrol">SCardControl</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer>} phCard A handle that identifies the connection to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a> in the designated reader.
     * @param {Pointer<Integer>} pdwActiveProtocol A flag that indicates the established active protocol.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T0"></a><a id="scard_protocol_t0"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a> is the active protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T1"></a><a id="scard_protocol_t1"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> is the active protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_UNDEFINED"></a><a id="scard_protocol_undefined"></a><dl>
     * <dt><b>SCARD_PROTOCOL_UNDEFINED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_SHARE_DIRECT has been specified, so that no protocol negotiation has occurred. It is possible that there is no card in the reader.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reader was unable to connect to the card.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardconnecta
     * @since windows5.1.2600
     */
    static SCardConnectA(hContext, szReader, dwShareMode, dwPreferredProtocols, phCard, pdwActiveProtocol) {
        szReader := szReader is String ? StrPtr(szReader) : szReader

        phCardMarshal := phCard is VarRef ? "ptr*" : "ptr"
        pdwActiveProtocolMarshal := pdwActiveProtocol is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardConnectA", "ptr", hContext, "ptr", szReader, "uint", dwShareMode, "uint", dwPreferredProtocols, phCardMarshal, phCard, pdwActiveProtocolMarshal, pdwActiveProtocol, "int")
        return result
    }

    /**
     * Establishes a connection (using a specific resource manager context) between the calling application and a smart card contained by a specific reader. If no card exists in the specified reader, an error is returned.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {PWSTR} szReader The name of the reader that contains the target card.
     * @param {Integer} dwShareMode A flag that indicates whether other applications may form connections to the card.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SHARE_SHARED"></a><a id="scard_share_shared"></a><dl>
     * <dt><b>SCARD_SHARE_SHARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This application is willing to share the card with other applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SHARE_EXCLUSIVE"></a><a id="scard_share_exclusive"></a><dl>
     * <dt><b>SCARD_SHARE_EXCLUSIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This application is not willing to share the card with other applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SHARE_DIRECT"></a><a id="scard_share_direct"></a><dl>
     * <dt><b>SCARD_SHARE_DIRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This application is allocating the reader for its private use, and will be controlling it directly. No other applications are allowed access to it.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwPreferredProtocols A bitmask of acceptable protocols for the connection. Possible values may be combined with the <b>OR</b> operation.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T0"></a><a id="scard_protocol_t0"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a> is an acceptable protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T1"></a><a id="scard_protocol_t1"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> is an acceptable protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This parameter may be zero only if <i>dwShareMode</i> is set to SCARD_SHARE_DIRECT. In this case, no protocol negotiation will be performed by the drivers until an IOCTL_SMARTCARD_SET_PROTOCOL control directive is sent with <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardcontrol">SCardControl</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer>} phCard A handle that identifies the connection to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a> in the designated reader.
     * @param {Pointer<Integer>} pdwActiveProtocol A flag that indicates the established active protocol.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T0"></a><a id="scard_protocol_t0"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a> is the active protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T1"></a><a id="scard_protocol_t1"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> is the active protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_UNDEFINED"></a><a id="scard_protocol_undefined"></a><dl>
     * <dt><b>SCARD_PROTOCOL_UNDEFINED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_SHARE_DIRECT has been specified, so that no protocol negotiation has occurred. It is possible that there is no card in the reader.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_E_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reader was unable to connect to the card.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardconnectw
     * @since windows5.1.2600
     */
    static SCardConnectW(hContext, szReader, dwShareMode, dwPreferredProtocols, phCard, pdwActiveProtocol) {
        szReader := szReader is String ? StrPtr(szReader) : szReader

        phCardMarshal := phCard is VarRef ? "ptr*" : "ptr"
        pdwActiveProtocolMarshal := pdwActiveProtocol is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardConnectW", "ptr", hContext, "ptr", szReader, "uint", dwShareMode, "uint", dwPreferredProtocols, phCardMarshal, phCard, pdwActiveProtocolMarshal, pdwActiveProtocol, "int")
        return result
    }

    /**
     * Reestablishes an existing connection between the calling application and a smart card.
     * @param {Pointer} hCard Reference value obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>.
     * @param {Integer} dwShareMode Flag that indicates whether other applications may form connections to this card.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SHARE_SHARED"></a><a id="scard_share_shared"></a><dl>
     * <dt><b>SCARD_SHARE_SHARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This application will share this card with other applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SHARE_EXCLUSIVE"></a><a id="scard_share_exclusive"></a><dl>
     * <dt><b>SCARD_SHARE_EXCLUSIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This application will not share this card with other applications.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwPreferredProtocols Bitmask of acceptable protocols for this connection. Possible values may be combined with the <b>OR</b> operation. 
     * 
     * 
     * 
     * The value of this parameter should include the current protocol. Attempting to reconnect with a protocol other than the current protocol will result in an error.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T0"></a><a id="scard_protocol_t0"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a> is an acceptable protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T1"></a><a id="scard_protocol_t1"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> is an acceptable protocol.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwInitialization Type of initialization that should be performed on the card.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LEAVE_CARD"></a><a id="scard_leave_card"></a><dl>
     * <dt><b>SCARD_LEAVE_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not do anything special on reconnect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_RESET_CARD"></a><a id="scard_reset_card"></a><dl>
     * <dt><b>SCARD_RESET_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reset the card (Warm Reset).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_UNPOWER_CARD"></a><a id="scard_unpower_card"></a><dl>
     * <dt><b>SCARD_UNPOWER_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Power down the card and reset it (Cold Reset).
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwActiveProtocol Flag that indicates the established active protocol.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T0"></a><a id="scard_protocol_t0"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a> is the active protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T1"></a><a id="scard_protocol_t1"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> is the active protocol.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardreconnect
     * @since windows5.1.2600
     */
    static SCardReconnect(hCard, dwShareMode, dwPreferredProtocols, dwInitialization, pdwActiveProtocol) {
        pdwActiveProtocolMarshal := pdwActiveProtocol is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardReconnect", "ptr", hCard, "uint", dwShareMode, "uint", dwPreferredProtocols, "uint", dwInitialization, pdwActiveProtocolMarshal, pdwActiveProtocol, "int")
        return result
    }

    /**
     * Terminates a connection previously opened between the calling application and a smart card in the target reader.
     * @param {Pointer} hCard Reference value obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>.
     * @param {Integer} dwDisposition Action to take on the card in the connected reader on close. 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LEAVE_CARD"></a><a id="scard_leave_card"></a><dl>
     * <dt><b>SCARD_LEAVE_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not do anything special.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_RESET_CARD"></a><a id="scard_reset_card"></a><dl>
     * <dt><b>SCARD_RESET_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reset the card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_UNPOWER_CARD"></a><a id="scard_unpower_card"></a><dl>
     * <dt><b>SCARD_UNPOWER_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Power down the card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_EJECT_CARD"></a><a id="scard_eject_card"></a><dl>
     * <dt><b>SCARD_EJECT_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Eject the card.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scarddisconnect
     * @since windows5.1.2600
     */
    static SCardDisconnect(hCard, dwDisposition) {
        result := DllCall("WinSCard.dll\SCardDisconnect", "ptr", hCard, "uint", dwDisposition, "int")
        return result
    }

    /**
     * Starts a transaction.
     * @param {Pointer} hCard A reference value obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>.
     * @returns {Integer} If the function succeeds, it returns <b>SCARD_S_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * If another process or thread has reset the card, SCARD_W_RESET_CARD is returned as expected.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function returns <b>SCARD_S_SUCCESS</b> even if another process or thread has reset the card. To determine whether the card has been reset, call the <a href="/windows/desktop/api/winscard/nf-winscard-scardstatusa">SCardStatus</a> function immediately after calling this function.
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardbegintransaction
     * @since windows5.1.2600
     */
    static SCardBeginTransaction(hCard) {
        result := DllCall("WinSCard.dll\SCardBeginTransaction", "ptr", hCard, "int")
        return result
    }

    /**
     * Completes a previously declared transaction, allowing other applications to resume interactions with the card.
     * @param {Pointer} hCard Reference value obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>. This value would also have been used in an earlier call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardbegintransaction">SCardBeginTransaction</a>.
     * @param {Integer} dwDisposition Action to take on the card in the connected reader on close. 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_EJECT_CARD"></a><a id="scard_eject_card"></a><dl>
     * <dt><b>SCARD_EJECT_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Eject the card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_LEAVE_CARD"></a><a id="scard_leave_card"></a><dl>
     * <dt><b>SCARD_LEAVE_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not do anything special.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_RESET_CARD"></a><a id="scard_reset_card"></a><dl>
     * <dt><b>SCARD_RESET_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reset the card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_UNPOWER_CARD"></a><a id="scard_unpower_card"></a><dl>
     * <dt><b>SCARD_UNPOWER_CARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Power down the card.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the function returns <b>SCARD_S_SUCCESS</b>. 
     * 
     * If the function fails, it returns an error code. For more information, see <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.   Possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_RESET_CARD</b></dt>
     * <dt>0x80100068L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction was released. Any future communication with the card requires a call to the <a href="/windows/desktop/api/winscard/nf-winscard-scardreconnect">SCardReconnect</a> function.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>The transaction was not released. The application must immediately call the <a href="/windows/desktop/api/winscard/nf-winscard-scarddisconnect">SCardDisconnect</a>, <a href="/windows/desktop/api/winscard/nf-winscard-scardreconnect">SCardReconnect</a>, or <a href="/windows/desktop/api/winscard/nf-winscard-scardreleasecontext">SCardReleaseContext</a> function to avoid an existing transaction blocking other threads and processes from communicating with the smart card.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardendtransaction
     * @since windows5.1.2600
     */
    static SCardEndTransaction(hCard, dwDisposition) {
        result := DllCall("WinSCard.dll\SCardEndTransaction", "ptr", hCard, "uint", dwDisposition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} hCard 
     * @param {Pointer<Integer>} pdwState 
     * @param {Pointer<Integer>} pdwProtocol 
     * @param {Pointer} pbAtr 
     * @param {Pointer<Integer>} pcbAtrLen 
     * @returns {Integer} 
     */
    static SCardState(hCard, pdwState, pdwProtocol, pbAtr, pcbAtrLen) {
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"
        pdwProtocolMarshal := pdwProtocol is VarRef ? "uint*" : "ptr"
        pcbAtrLenMarshal := pcbAtrLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardState", "ptr", hCard, pdwStateMarshal, pdwState, pdwProtocolMarshal, pdwProtocol, "ptr", pbAtr, pcbAtrLenMarshal, pcbAtrLen, "int")
        return result
    }

    /**
     * Provides the current status of a smart card in a reader.
     * @param {Pointer} hCard Reference value returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>.
     * @param {PSTR} mszReaderNames List of display names (multiple string) by which the currently connected reader is known.
     * @param {Pointer<Integer>} pcchReaderLen On input, supplies the length of the <i>szReaderName</i> buffer. 
     * 
     * 
     * 
     * 
     * On output, receives the actual length (in characters) of the reader name list, including the trailing <b>NULL</b> character. If this buffer length is specified as SCARD_AUTOALLOCATE, then <i>szReaderName</i> is converted to a pointer to a byte pointer, and it receives the address of a block of memory that contains the multiple-string structure.
     * @param {Pointer<Integer>} pdwState Current <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">state</a> of the smart card in the reader. Upon success, it receives one of the following state indicators. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ABSENT"></a><a id="scard_absent"></a><dl>
     * <dt><b>SCARD_ABSENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no card in the reader.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PRESENT"></a><a id="scard_present"></a><dl>
     * <dt><b>SCARD_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a card in the reader, but it has not been moved into position for use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SWALLOWED"></a><a id="scard_swallowed"></a><dl>
     * <dt><b>SCARD_SWALLOWED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a card in the reader in position for use. The card is not powered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_POWERED"></a><a id="scard_powered"></a><dl>
     * <dt><b>SCARD_POWERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Power is being provided to the card, but the reader driver is unaware of the mode of the card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_NEGOTIABLE"></a><a id="scard_negotiable"></a><dl>
     * <dt><b>SCARD_NEGOTIABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The card has been reset and is awaiting PTS negotiation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SPECIFIC"></a><a id="scard_specific"></a><dl>
     * <dt><b>SCARD_SPECIFIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The card has been reset and specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">communication protocols</a> have been established.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwProtocol Current protocol, if any. The returned value is meaningful only if the returned value of <i>pdwState</i> is SCARD_SPECIFICMODE.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_RAW"></a><a id="scard_protocol_raw"></a><dl>
     * <dt><b>SCARD_PROTOCOL_RAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Raw Transfer protocol is in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T0"></a><a id="scard_protocol_t0"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ISO 7816/3 <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a> protocol is in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T1"></a><a id="scard_protocol_t1"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ISO 7816/3 <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> protocol is in use.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pbAtr Pointer to a 32-byte buffer that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ATR string</a> from the currently inserted card, if available.
     * @param {Pointer<Integer>} pcbAtrLen On input, supplies the length of the <i>pbAtr</i> buffer. On output, receives the number of bytes in the ATR string (32 bytes maximum). If this buffer length is specified as SCARD_AUTOALLOCATE, then <i>pbAtr</i> is converted to a pointer to a byte pointer, and it receives the address of a block of memory that contains the multiple-string structure.
     * @returns {Integer} If the function successfully provides the current status of a <a href="/windows/desktop/SecGloss/s-gly">smart card</a> in a <a href="/windows/desktop/SecGloss/r-gly">reader</a>, the return value is SCARD_S_SUCCESS.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardstatusa
     * @since windows5.1.2600
     */
    static SCardStatusA(hCard, mszReaderNames, pcchReaderLen, pdwState, pdwProtocol, pbAtr, pcbAtrLen) {
        mszReaderNames := mszReaderNames is String ? StrPtr(mszReaderNames) : mszReaderNames

        pcchReaderLenMarshal := pcchReaderLen is VarRef ? "uint*" : "ptr"
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"
        pdwProtocolMarshal := pdwProtocol is VarRef ? "uint*" : "ptr"
        pbAtrMarshal := pbAtr is VarRef ? "char*" : "ptr"
        pcbAtrLenMarshal := pcbAtrLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardStatusA", "ptr", hCard, "ptr", mszReaderNames, pcchReaderLenMarshal, pcchReaderLen, pdwStateMarshal, pdwState, pdwProtocolMarshal, pdwProtocol, pbAtrMarshal, pbAtr, pcbAtrLenMarshal, pcbAtrLen, "int")
        return result
    }

    /**
     * Provides the current status of a smart card in a reader.
     * @param {Pointer} hCard Reference value returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>.
     * @param {PWSTR} mszReaderNames List of display names (multiple string) by which the currently connected reader is known.
     * @param {Pointer<Integer>} pcchReaderLen On input, supplies the length of the <i>szReaderName</i> buffer. 
     * 
     * 
     * 
     * 
     * On output, receives the actual length (in characters) of the reader name list, including the trailing <b>NULL</b> character. If this buffer length is specified as SCARD_AUTOALLOCATE, then <i>szReaderName</i> is converted to a pointer to a byte pointer, and it receives the address of a block of memory that contains the multiple-string structure.
     * @param {Pointer<Integer>} pdwState Current <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">state</a> of the smart card in the reader. Upon success, it receives one of the following state indicators. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ABSENT"></a><a id="scard_absent"></a><dl>
     * <dt><b>SCARD_ABSENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no card in the reader.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PRESENT"></a><a id="scard_present"></a><dl>
     * <dt><b>SCARD_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a card in the reader, but it has not been moved into position for use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SWALLOWED"></a><a id="scard_swallowed"></a><dl>
     * <dt><b>SCARD_SWALLOWED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a card in the reader in position for use. The card is not powered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_POWERED"></a><a id="scard_powered"></a><dl>
     * <dt><b>SCARD_POWERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Power is being provided to the card, but the reader driver is unaware of the mode of the card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_NEGOTIABLE"></a><a id="scard_negotiable"></a><dl>
     * <dt><b>SCARD_NEGOTIABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The card has been reset and is awaiting PTS negotiation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_SPECIFIC"></a><a id="scard_specific"></a><dl>
     * <dt><b>SCARD_SPECIFIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The card has been reset and specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">communication protocols</a> have been established.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwProtocol Current protocol, if any. The returned value is meaningful only if the returned value of <i>pdwState</i> is SCARD_SPECIFICMODE.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_RAW"></a><a id="scard_protocol_raw"></a><dl>
     * <dt><b>SCARD_PROTOCOL_RAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Raw Transfer protocol is in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T0"></a><a id="scard_protocol_t0"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ISO 7816/3 <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a> protocol is in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_PROTOCOL_T1"></a><a id="scard_protocol_t1"></a><dl>
     * <dt><b>SCARD_PROTOCOL_T1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ISO 7816/3 <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> protocol is in use.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pbAtr Pointer to a 32-byte buffer that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ATR string</a> from the currently inserted card, if available.
     * @param {Pointer<Integer>} pcbAtrLen On input, supplies the length of the <i>pbAtr</i> buffer. On output, receives the number of bytes in the ATR string (32 bytes maximum). If this buffer length is specified as SCARD_AUTOALLOCATE, then <i>pbAtr</i> is converted to a pointer to a byte pointer, and it receives the address of a block of memory that contains the multiple-string structure.
     * @returns {Integer} If the function successfully provides the current status of a <a href="/windows/desktop/SecGloss/s-gly">smart card</a> in a <a href="/windows/desktop/SecGloss/r-gly">reader</a>, the return value is SCARD_S_SUCCESS.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardstatusw
     * @since windows5.1.2600
     */
    static SCardStatusW(hCard, mszReaderNames, pcchReaderLen, pdwState, pdwProtocol, pbAtr, pcbAtrLen) {
        mszReaderNames := mszReaderNames is String ? StrPtr(mszReaderNames) : mszReaderNames

        pcchReaderLenMarshal := pcchReaderLen is VarRef ? "uint*" : "ptr"
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"
        pdwProtocolMarshal := pdwProtocol is VarRef ? "uint*" : "ptr"
        pbAtrMarshal := pbAtr is VarRef ? "char*" : "ptr"
        pcbAtrLenMarshal := pcbAtrLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardStatusW", "ptr", hCard, "ptr", mszReaderNames, pcchReaderLenMarshal, pcchReaderLen, pdwStateMarshal, pdwState, pdwProtocolMarshal, pdwProtocol, pbAtrMarshal, pbAtr, pcbAtrLenMarshal, pcbAtrLen, "int")
        return result
    }

    /**
     * Sends a service request to the smart card and expects to receive data back from the card.
     * @param {Pointer} hCard A reference value returned from 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a> function.
     * @param {Pointer<SCARD_IO_REQUEST>} pioSendPci A pointer to the protocol header structure for the instruction. This buffer is in the format of an <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/scard-io-request">SCARD_IO_REQUEST</a> structure, followed by the specific protocol control information (PCI). 
     * 
     * 
     * 
     * 
     * For the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a>, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a>, and Raw protocols, the PCI structure is constant. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card subsystem</a> supplies a global T=0, T=1, or Raw PCI structure, which you can reference by using the symbols SCARD_PCI_T0, SCARD_PCI_T1, and SCARD_PCI_RAW respectively.
     * @param {Pointer} pbSendBuffer A pointer to the actual data to be written to the card. 
     * 
     * For T=0, the data parameters are placed into the address pointed to by <i>pbSendBuffer</i> according to the following structure:
     * 
     * 
     * ```cpp
     * struct {
     *     BYTE
     *         bCla,   // the instruction class
     *         bIns,   // the instruction code 
     *         bP1,    // parameter to the instruction
     *         bP2,    // parameter to the instruction
     *         bP3;    // size of I/O transfer
     * } CmdBytes;
     * 
     * ```
     * 
     * 
     * 
     * The data sent to the card should immediately follow the send buffer. In the special case where no data is sent to the card and no data is expected in return, <b>bP3</b> is not sent.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="bCla"></a><a id="bcla"></a><a id="BCLA"></a><dl>
     * <dt><b><b>bCla</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The T=0 instruction class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="bIns"></a><a id="bins"></a><a id="BINS"></a><dl>
     * <dt><b><b>bIns</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An instruction code in the T=0 instruction class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="bP1__bP2"></a><a id="bp1__bp2"></a><a id="BP1__BP2"></a><dl>
     * <dt><b><b>bP1</b>, <b>bP2</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reference codes that complete the instruction code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="bP3"></a><a id="bp3"></a><a id="BP3"></a><dl>
     * <dt><b><b>bP3</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of data bytes to be transmitted during the command, per ISO 7816-4, Section 8.2.1.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} cbSendLength The length, in bytes, of the <i>pbSendBuffer</i> parameter. 
     * 
     * 
     * 
     * 
     * For T=0, in the special case where no data is sent to the card and no data expected in return, this length must reflect that the <b>bP3</b> member is not being sent; the length should be <c>sizeof(CmdBytes)  - sizeof(BYTE)</c>.
     * @param {Pointer<SCARD_IO_REQUEST>} pioRecvPci Pointer to the protocol header structure for the instruction, followed by a buffer in which to receive any returned protocol control information (PCI) specific to the protocol in use. This parameter can be <b>NULL</b> if no  PCI is returned.
     * @param {Pointer} pbRecvBuffer Pointer to any data returned from the card. 
     * 
     * 
     * 
     * 
     * For T=0, the data is immediately followed by the SW1 and SW2 status bytes. If no data is returned from the card, then this buffer will only contain the SW1 and SW2 status bytes.
     * @param {Pointer<Integer>} pcbRecvLength Supplies the length, in bytes, of the <i>pbRecvBuffer</i> parameter and receives the actual number of bytes received from the smart card. 
     * 
     * 
     * This value cannot be SCARD_AUTOALLOCATE because <b>SCardTransmit</b> does not support SCARD_AUTOALLOCATE.
     * 
     * For T=0, the receive buffer must be at least two bytes long to receive the SW1 and SW2 status bytes.
     * @returns {Integer} If the function successfully sends a service request to the <a href="/windows/desktop/SecGloss/s-gly">smart card</a>, the return value is SCARD_S_SUCCESS.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardtransmit
     * @since windows5.1.2600
     */
    static SCardTransmit(hCard, pioSendPci, pbSendBuffer, cbSendLength, pioRecvPci, pbRecvBuffer, pcbRecvLength) {
        pcbRecvLengthMarshal := pcbRecvLength is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardTransmit", "ptr", hCard, "ptr", pioSendPci, "ptr", pbSendBuffer, "uint", cbSendLength, "ptr", pioRecvPci, "ptr", pbRecvBuffer, pcbRecvLengthMarshal, pcbRecvLength, "int")
        return result
    }

    /**
     * Retrieves the number of transmit operations that have completed since the specified card reader was inserted.
     * @param {Pointer} hCard A handle to a smart card obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>.
     * @param {Pointer<Integer>} pcTransmitCount A pointer to the number of transmit operations that have completed since the specified card reader was inserted.
     * @returns {Integer} If the function succeeds, it returns <b>SCARD_S_SUCCESS</b>. 
     * 
     * If the function fails, it returns an error code. For more information, see <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgettransmitcount
     * @since windows6.0.6000
     */
    static SCardGetTransmitCount(hCard, pcTransmitCount) {
        pcTransmitCountMarshal := pcTransmitCount is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetTransmitCount", "ptr", hCard, pcTransmitCountMarshal, pcTransmitCount, "int")
        return result
    }

    /**
     * Gives you direct control of the reader. You can call it any time after a successful call to SCardConnect and before a successful call to SCardDisconnect.
     * @param {Pointer} hCard Reference value returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>.
     * @param {Integer} dwControlCode Control code for the operation. This value identifies the specific operation to be performed.
     * @param {Pointer} lpInBuffer Pointer to a buffer that contains the data required to perform the operation. This parameter can be <b>NULL</b> if the <i>dwControlCode</i> parameter specifies an operation that does not require input data.
     * @param {Integer} cbInBufferSize Size, in bytes, of the buffer pointed to by <i>lpInBuffer</i>.
     * @param {Pointer} lpOutBuffer Pointer to a buffer that receives the operation's output data. This parameter can be <b>NULL</b> if the <i>dwControlCode</i> parameter specifies an operation that does not produce output data.
     * @param {Integer} cbOutBufferSize Size, in bytes, of the buffer pointed to by <i>lpOutBuffer</i>.
     * @param {Pointer<Integer>} lpBytesReturned Pointer to a <b>DWORD</b> that receives the size, in bytes, of the data stored into the buffer pointed to by <i>lpOutBuffer</i>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardcontrol
     * @since windows5.1.2600
     */
    static SCardControl(hCard, dwControlCode, lpInBuffer, cbInBufferSize, lpOutBuffer, cbOutBufferSize, lpBytesReturned) {
        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardControl", "ptr", hCard, "uint", dwControlCode, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpOutBuffer, "uint", cbOutBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "int")
        return result
    }

    /**
     * Retrieves the current reader attributes for the given handle. It does not affect the state of the reader, driver, or card.
     * @param {Pointer} hCard Reference value returned from <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>.
     * @param {Integer} dwAttrId Identifier for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> to get. The following table lists possible values for <i>dwAttrId</i>. These values are read-only. Note that vendors may not support all attributes. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_ATR_STRING"></a><a id="scard_attr_atr_string"></a><dl>
     * <dt><b>SCARD_ATTR_ATR_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Answer to reset (ATR) string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CHANNEL_ID"></a><a id="scard_attr_channel_id"></a><dl>
     * <dt><b>SCARD_ATTR_CHANNEL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>DWORD</b> encoded as 0x<i>DDDDCCCC</i>, where <i>DDDD</i> = data channel type and <i>CCCC</i> = channel number: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The following encodings are defined for <i>DDDD</i>:</li>
     * <li>0x01 serial I/O; <i>CCCC</i> is a port number.</li>
     * <li>0x02 parallel I/O; <i>CCCC</i> is a port number.</li>
     * <li>0x04 PS/2 keyboard port; <i>CCCC</i> is zero.</li>
     * <li>0x08 SCSI; <i>CCCC</i> is SCSI ID number.</li>
     * <li>0x10 IDE; <i>CCCC</i> is device number.</li>
     * <li>0x20 USB; <i>CCCC</i> is device number.</li>
     * <li>0xF<i>y</i> vendor-defined interface with <i>y</i> in the range zero through 15; <i>CCCC</i> is vendor defined.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CHARACTERISTICS"></a><a id="scard_attr_characteristics"></a><dl>
     * <dt><b>SCARD_ATTR_CHARACTERISTICS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>DWORD</b> indicating which mechanical characteristics are supported. If zero, no special characteristics are supported. Note that multiple bits can be set: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>0x00000001 Card swallowing mechanism</li>
     * <li>0x00000002 Card ejection mechanism</li>
     * <li>0x00000004 Card capture mechanism</li>
     * </ul>
     * All other values are reserved for future use (RFU).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_BWT"></a><a id="scard_attr_current_bwt"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_BWT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current block waiting time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_CLK"></a><a id="scard_attr_current_clk"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_CLK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current clock rate, in kHz.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_CWT"></a><a id="scard_attr_current_cwt"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_CWT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current character waiting time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_D"></a><a id="scard_attr_current_d"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_D</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bit rate conversion factor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_EBC_ENCODING"></a><a id="scard_attr_current_ebc_encoding"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_EBC_ENCODING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current error block control encoding. 
     * 
     * 
     * 
     * 
     * 0 = longitudinal redundancy check (LRC)
     * 
     * 1 = cyclical redundancy check (CRC)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_F"></a><a id="scard_attr_current_f"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_F</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Clock conversion factor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_IFSC"></a><a id="scard_attr_current_ifsc"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_IFSC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current byte size for information field size card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_IFSD"></a><a id="scard_attr_current_ifsd"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_IFSD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current byte size for information field size device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_N"></a><a id="scard_attr_current_n"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_N</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current guard time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_PROTOCOL_TYPE"></a><a id="scard_attr_current_protocol_type"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_PROTOCOL_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>DWORD</b> encoded as 0x0<i>rrrpppp</i> where <i>rrr</i> is RFU and should be 0x000. <i>pppp</i> encodes the current protocol type. Whichever bit has been set indicates which ISO protocol is currently in use. (For example, if bit zero is set, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0 protocol</a> is in effect.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_CURRENT_W"></a><a id="scard_attr_current_w"></a><dl>
     * <dt><b>SCARD_ATTR_CURRENT_W</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current work waiting time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_DEFAULT_CLK"></a><a id="scard_attr_default_clk"></a><dl>
     * <dt><b>SCARD_ATTR_DEFAULT_CLK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default clock rate, in kHz.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_DEFAULT_DATA_RATE"></a><a id="scard_attr_default_data_rate"></a><dl>
     * <dt><b>SCARD_ATTR_DEFAULT_DATA_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default data rate, in bps.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_DEVICE_FRIENDLY_NAME"></a><a id="scard_attr_device_friendly_name"></a><dl>
     * <dt><b>SCARD_ATTR_DEVICE_FRIENDLY_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reader's display name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_DEVICE_IN_USE"></a><a id="scard_attr_device_in_use"></a><dl>
     * <dt><b>SCARD_ATTR_DEVICE_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved for future use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_DEVICE_SYSTEM_NAME"></a><a id="scard_attr_device_system_name"></a><dl>
     * <dt><b>SCARD_ATTR_DEVICE_SYSTEM_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reader's system name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_DEVICE_UNIT"></a><a id="scard_attr_device_unit"></a><dl>
     * <dt><b>SCARD_ATTR_DEVICE_UNIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Instance of this vendor's reader attached to the computer. The first instance will be device unit 0, the next will be unit 1 (if it is the same brand of reader) and so on. Two different brands of readers will both have zero for this value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_ICC_INTERFACE_STATUS"></a><a id="scard_attr_icc_interface_status"></a><dl>
     * <dt><b>SCARD_ATTR_ICC_INTERFACE_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Single byte. Zero if <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a> electrical contact is not active; nonzero if contact is active.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_ICC_PRESENCE"></a><a id="scard_attr_icc_presence"></a><dl>
     * <dt><b>SCARD_ATTR_ICC_PRESENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Single byte indicating smart card presence: 
     * 
     * 
     * 
     * 
     * 0 = not present
     * 
     * 1 = card present but not swallowed (applies only if reader supports smart card swallowing)
     * 
     * 2 = card present (and swallowed if reader supports smart card swallowing)
     * 
     * 4 = card confiscated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_ICC_TYPE_PER_ATR"></a><a id="scard_attr_icc_type_per_atr"></a><dl>
     * <dt><b>SCARD_ATTR_ICC_TYPE_PER_ATR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Single byte indicating smart card type: 
     * 
     * 
     * 
     * 
     * 0 = unknown type
     * 
     * 1 = 7816 Asynchronous
     * 
     * 2 = 7816 Synchronous
     * 
     * Other values RFU.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_MAX_CLK"></a><a id="scard_attr_max_clk"></a><dl>
     * <dt><b>SCARD_ATTR_MAX_CLK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Maximum clock rate, in kHz.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_MAX_DATA_RATE"></a><a id="scard_attr_max_data_rate"></a><dl>
     * <dt><b>SCARD_ATTR_MAX_DATA_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Maximum data rate, in bps.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_MAX_IFSD"></a><a id="scard_attr_max_ifsd"></a><dl>
     * <dt><b>SCARD_ATTR_MAX_IFSD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Maximum bytes for information file size device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_POWER_MGMT_SUPPORT"></a><a id="scard_attr_power_mgmt_support"></a><dl>
     * <dt><b>SCARD_ATTR_POWER_MGMT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Zero if device does not support power down while smart card is inserted. Nonzero otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_PROTOCOL_TYPES"></a><a id="scard_attr_protocol_types"></a><dl>
     * <dt><b>SCARD_ATTR_PROTOCOL_TYPES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>DWORD</b> encoded as 0x0<i>rrrpppp</i> where <i>rrr</i> is RFU and should be 0x000. <i>pppp</i> encodes the supported protocol types. A '1' in a given bit position indicates support for the associated ISO protocol, so if bits zero and one are set, both <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=0</a> and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> protocols are supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_VENDOR_IFD_SERIAL_NO"></a><a id="scard_attr_vendor_ifd_serial_no"></a><dl>
     * <dt><b>SCARD_ATTR_VENDOR_IFD_SERIAL_NO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Vendor-supplied interface device serial number.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_VENDOR_IFD_TYPE"></a><a id="scard_attr_vendor_ifd_type"></a><dl>
     * <dt><b>SCARD_ATTR_VENDOR_IFD_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Vendor-supplied interface device type (model designation of reader).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_VENDOR_IFD_VERSION"></a><a id="scard_attr_vendor_ifd_version"></a><dl>
     * <dt><b>SCARD_ATTR_VENDOR_IFD_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Vendor-supplied interface device version (<b>DWORD</b> in the form 0x<i>MMmmbbbb</i> where <i>MM</i> = major version, <i>mm</i> = minor version, and <i>bbbb</i> = build number).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_VENDOR_NAME"></a><a id="scard_attr_vendor_name"></a><dl>
     * <dt><b>SCARD_ATTR_VENDOR_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Vendor name.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pbAttr Pointer to a buffer that receives the attribute whose ID is supplied in <i>dwAttrId</i>. If this value is <b>NULL</b>, <b>SCardGetAttrib</b> ignores the buffer length supplied in <i>pcbAttrLen</i>, writes the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>pcbAttrLen</i>, and returns a success code.
     * @param {Pointer<Integer>} pcbAttrLen Length of the <i>pbAttr</i> buffer in bytes, and receives the actual length of the received attribute If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>pbAttr</i> is converted to a pointer to a byte pointer, and receives the address of a block of memory containing the attribute. This block of memory must be deallocated with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a>.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Attribute value not supported.</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ERROR_NOT_SUPPORTED.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetattrib
     * @since windows5.1.2600
     */
    static SCardGetAttrib(hCard, dwAttrId, pbAttr, pcbAttrLen) {
        pcbAttrLenMarshal := pcbAttrLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetAttrib", "ptr", hCard, "uint", dwAttrId, "ptr", pbAttr, pcbAttrLenMarshal, pcbAttrLen, "int")
        return result
    }

    /**
     * Sets the given reader attribute for the given handle.
     * @param {Pointer} hCard Reference value returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a>.
     * @param {Integer} dwAttrId Identifier for the attribute to set. The values are write-only. Note that vendors may not support all attributes. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_ATTR_SUPRESS_T1_IFS_REQUEST"></a><a id="scard_attr_supress_t1_ifs_request"></a><dl>
     * <dt><b>SCARD_ATTR_SUPRESS_T1_IFS_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppress sending of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">T=1</a> IFSD packet from the reader to the card. (Can be used if the currently inserted card does not support an IFSD request.)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pbAttr Pointer to a buffer that supplies the attribute whose ID is supplied in <i>dwAttrId</i>.
     * @param {Integer} cbAttrLen Length (in bytes) of the attribute value in the <i>pbAttr</i> buffer.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardsetattrib
     * @since windows5.1.2600
     */
    static SCardSetAttrib(hCard, dwAttrId, pbAttr, cbAttrLen) {
        result := DllCall("WinSCard.dll\SCardSetAttrib", "ptr", hCard, "uint", dwAttrId, "ptr", pbAttr, "uint", cbAttrLen, "int")
        return result
    }

    /**
     * Displays the smart card Select Card dialog box.
     * @param {Pointer<OPENCARDNAME_EXA>} param0 
     * @returns {Integer} If the function successfully displays the 
     * 						<b>Select Card</b> dialog box, the return value is SCARD_S_SUCCESS.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scarduidlgselectcarda
     * @since windows5.1.2600
     */
    static SCardUIDlgSelectCardA(param0) {
        result := DllCall("SCARDDLG.dll\SCardUIDlgSelectCardA", "ptr", param0, "int")
        return result
    }

    /**
     * Displays the smart card Select Card dialog box.
     * @param {Pointer<OPENCARDNAME_EXW>} param0 
     * @returns {Integer} If the function successfully displays the 
     * 						<b>Select Card</b> dialog box, the return value is SCARD_S_SUCCESS.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scarduidlgselectcardw
     * @since windows5.1.2600
     */
    static SCardUIDlgSelectCardW(param0) {
        result := DllCall("SCARDDLG.dll\SCardUIDlgSelectCardW", "ptr", param0, "int")
        return result
    }

    /**
     * The GetOpenCardName function displays the smart card &quot;select card&quot; dialog box.
     * @param {Pointer<OPENCARDNAMEA>} param0 
     * @returns {Integer} The function returns different values depending on whether it succeeds or fails.
     * 						
     * 						
     * 					
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-getopencardnamea
     * @since windows5.1.2600
     */
    static GetOpenCardNameA(param0) {
        result := DllCall("SCARDDLG.dll\GetOpenCardNameA", "ptr", param0, "int")
        return result
    }

    /**
     * The GetOpenCardName function displays the smart card &quot;select card&quot; dialog box.
     * @param {Pointer<OPENCARDNAMEW>} param0 
     * @returns {Integer} The function returns different values depending on whether it succeeds or fails.
     * 						
     * 						
     * 					
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-getopencardnamew
     * @since windows5.1.2600
     */
    static GetOpenCardNameW(param0) {
        result := DllCall("SCARDDLG.dll\GetOpenCardNameW", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static SCardDlgExtendedError() {
        result := DllCall("SCARDDLG.dll\SCardDlgExtendedError", "int")
        return result
    }

    /**
     * Retrieves the value portion of a name-value pair from the global cache maintained by the Smart Card Resource Manager.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {Pointer<Guid>} CardIdentifier A pointer to a value that uniquely identifies a smart card. The name-value pair that this function reads from the global cache is associated with this smart card.
     * @param {Integer} FreshnessCounter The current revision of the cached data.
     * @param {PSTR} LookupName A pointer to a null-terminated string that contains the name portion of the name-value pair for which to retrieve the value portion.
     * @param {Pointer} Data A pointer to an array of byte values that contain the value portion of the name-value pair specified by the <i>LookupName</i> parameter.
     * @param {Pointer<Integer>} DataLen A pointer to the size, in bytes, of the <i>Data</i> buffer.
     * @returns {Integer} If the function succeeds, it returns <b>SCARD_S_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following error codes. For more information, see <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_CACHE_ITEM_NOT_FOUND</b></dt>
     * <dt>0x80100070</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified name-value pair was not found in the global cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_CACHE_ITEM_STALE</b></dt>
     * <dt>0x80100071</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified name-value pair was older than requested and has been deleted from the cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardreadcachea
     * @since windows6.0.6000
     */
    static SCardReadCacheA(hContext, CardIdentifier, FreshnessCounter, LookupName, Data, DataLen) {
        LookupName := LookupName is String ? StrPtr(LookupName) : LookupName

        DataLenMarshal := DataLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardReadCacheA", "ptr", hContext, "ptr", CardIdentifier, "uint", FreshnessCounter, "ptr", LookupName, "ptr", Data, DataLenMarshal, DataLen, "int")
        return result
    }

    /**
     * Retrieves the value portion of a name-value pair from the global cache maintained by the Smart Card Resource Manager.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {Pointer<Guid>} CardIdentifier A pointer to a value that uniquely identifies a smart card. The name-value pair that this function reads from the global cache is associated with this smart card.
     * @param {Integer} FreshnessCounter The current revision of the cached data.
     * @param {PWSTR} LookupName A pointer to a null-terminated string that contains the name portion of the name-value pair for which to retrieve the value portion.
     * @param {Pointer} Data A pointer to an array of byte values that contain the value portion of the name-value pair specified by the <i>LookupName</i> parameter.
     * @param {Pointer<Integer>} DataLen A pointer to the size, in bytes, of the <i>Data</i> buffer.
     * @returns {Integer} If the function succeeds, it returns <b>SCARD_S_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following error codes. For more information, see <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_CACHE_ITEM_NOT_FOUND</b></dt>
     * <dt>0x80100070</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified name-value pair was not found in the global cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_CACHE_ITEM_STALE</b></dt>
     * <dt>0x80100071</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified name-value pair was older than requested and has been deleted from the cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardreadcachew
     * @since windows6.0.6000
     */
    static SCardReadCacheW(hContext, CardIdentifier, FreshnessCounter, LookupName, Data, DataLen) {
        LookupName := LookupName is String ? StrPtr(LookupName) : LookupName

        DataLenMarshal := DataLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardReadCacheW", "ptr", hContext, "ptr", CardIdentifier, "uint", FreshnessCounter, "ptr", LookupName, "ptr", Data, DataLenMarshal, DataLen, "int")
        return result
    }

    /**
     * Writes a name-value pair from a smart card to the global cache maintained by the Smart Card Resource Manager.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {Pointer<Guid>} CardIdentifier A pointer to a value that uniquely identifies the smart card from which the name-value pair was read.
     * @param {Integer} FreshnessCounter The current revision of the cached data.
     * @param {PSTR} LookupName A pointer to a null-terminated string that contains the name portion of the name-value pair to write to the global cache.
     * @param {Pointer} Data A pointer to an array of byte values that contain the value portion of the name-value pair to write to the global cache.
     * @param {Integer} DataLen The size, in bytes, of the <i>Data</i> buffer.
     * @returns {Integer} If the function succeeds, it returns <b>SCARD_S_SUCCESS</b>. 
     * 
     * If the function fails, it returns one of the following error codes. For more information, see <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_CACHE_ITEM_TOO_BIG</b></dt>
     * <dt>0x80100072</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the specified name-value pair exceeds the maximum size defined for the global cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardwritecachea
     * @since windows6.0.6000
     */
    static SCardWriteCacheA(hContext, CardIdentifier, FreshnessCounter, LookupName, Data, DataLen) {
        LookupName := LookupName is String ? StrPtr(LookupName) : LookupName

        result := DllCall("WinSCard.dll\SCardWriteCacheA", "ptr", hContext, "ptr", CardIdentifier, "uint", FreshnessCounter, "ptr", LookupName, "ptr", Data, "uint", DataLen, "int")
        return result
    }

    /**
     * Writes a name-value pair from a smart card to the global cache maintained by the Smart Card Resource Manager.
     * @param {Pointer} hContext A handle that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a>. The resource manager context is set by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a>.
     * @param {Pointer<Guid>} CardIdentifier A pointer to a value that uniquely identifies the smart card from which the name-value pair was read.
     * @param {Integer} FreshnessCounter The current revision of the cached data.
     * @param {PWSTR} LookupName A pointer to a null-terminated string that contains the name portion of the name-value pair to write to the global cache.
     * @param {Pointer} Data A pointer to an array of byte values that contain the value portion of the name-value pair to write to the global cache.
     * @param {Integer} DataLen The size, in bytes, of the <i>Data</i> buffer.
     * @returns {Integer} If the function succeeds, it returns <b>SCARD_S_SUCCESS</b>. 
     * 
     * If the function fails, it returns one of the following error codes. For more information, see <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCARD_W_CACHE_ITEM_TOO_BIG</b></dt>
     * <dt>0x80100072</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the specified name-value pair exceeds the maximum size defined for the global cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardwritecachew
     * @since windows6.0.6000
     */
    static SCardWriteCacheW(hContext, CardIdentifier, FreshnessCounter, LookupName, Data, DataLen) {
        LookupName := LookupName is String ? StrPtr(LookupName) : LookupName

        result := DllCall("WinSCard.dll\SCardWriteCacheW", "ptr", hContext, "ptr", CardIdentifier, "uint", FreshnessCounter, "ptr", LookupName, "ptr", Data, "uint", DataLen, "int")
        return result
    }

    /**
     * Gets an icon of the smart card reader for a given reader's name.
     * @param {Pointer} hContext Handle that identifies the resource manager context for the query. You can set the resource manager context by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szReaderName Reader name. You can get this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardlistreadersa">SCardListReaders</a> function.
     * @param {Pointer} pbIcon Pointer to a buffer that contains a BLOB of the smart card reader icon as read from the icon file. If this value is <b>NULL</b>, the function ignores the buffer length supplied in the <i>pcbIcon</i> parameter, writes the length of the buffer that would have been returned to <i>pcbIcon</i> if this parameter had not been NULL, and returns a success code.
     * @param {Pointer<Integer>} pcbIcon Length, in characters, of the <i>pbIcon</i> buffer. This parameter receives the actual length of the received attribute. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>pbIcon</i> is converted from a pointer to a byte pointer and receives the address of a block of memory that contains the attribute. This block of memory must be deallocated with the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a> function.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetreadericona
     * @since windows8.0
     */
    static SCardGetReaderIconA(hContext, szReaderName, pbIcon, pcbIcon) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName

        pcbIconMarshal := pcbIcon is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetReaderIconA", "ptr", hContext, "ptr", szReaderName, "ptr", pbIcon, pcbIconMarshal, pcbIcon, "int")
        return result
    }

    /**
     * Gets an icon of the smart card reader for a given reader's name.
     * @param {Pointer} hContext Handle that identifies the resource manager context for the query. You can set the resource manager context by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szReaderName Reader name. You can get this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardlistreadersa">SCardListReaders</a> function.
     * @param {Pointer} pbIcon Pointer to a buffer that contains a BLOB of the smart card reader icon as read from the icon file. If this value is <b>NULL</b>, the function ignores the buffer length supplied in the <i>pcbIcon</i> parameter, writes the length of the buffer that would have been returned to <i>pcbIcon</i> if this parameter had not been NULL, and returns a success code.
     * @param {Pointer<Integer>} pcbIcon Length, in characters, of the <i>pbIcon</i> buffer. This parameter receives the actual length of the received attribute. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>pbIcon</i> is converted from a pointer to a byte pointer and receives the address of a block of memory that contains the attribute. This block of memory must be deallocated with the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a> function.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetreadericonw
     * @since windows8.0
     */
    static SCardGetReaderIconW(hContext, szReaderName, pbIcon, pcbIcon) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName

        pcbIconMarshal := pcbIcon is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetReaderIconW", "ptr", hContext, "ptr", szReaderName, "ptr", pbIcon, pcbIconMarshal, pcbIcon, "int")
        return result
    }

    /**
     * Gets the device type identifier of the card reader for the given reader name. This function does not affect the state of the reader.
     * @param {Pointer} hContext Handle that identifies the resource manager context for the query. You can set the resource manager context by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. This parameter cannot be NULL.
     * @param {PSTR} szReaderName Reader name. You can get this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardlistreadersa">SCardListReaders</a> function.
     * @param {Pointer<Integer>} pdwDeviceTypeId The actual device type identifier. The list of reader types returned by this function are listed under <b>ReaderType</b> member in the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/smclib/ns-smclib-_scard_reader_capabilities">SCARD_READER_CAPABILITIES</a> structure.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetdevicetypeida
     * @since windows8.0
     */
    static SCardGetDeviceTypeIdA(hContext, szReaderName, pdwDeviceTypeId) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName

        pdwDeviceTypeIdMarshal := pdwDeviceTypeId is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetDeviceTypeIdA", "ptr", hContext, "ptr", szReaderName, pdwDeviceTypeIdMarshal, pdwDeviceTypeId, "int")
        return result
    }

    /**
     * Gets the device type identifier of the card reader for the given reader name. This function does not affect the state of the reader.
     * @param {Pointer} hContext Handle that identifies the resource manager context for the query. You can set the resource manager context by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. This parameter cannot be NULL.
     * @param {PWSTR} szReaderName Reader name. You can get this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardlistreadersa">SCardListReaders</a> function.
     * @param {Pointer<Integer>} pdwDeviceTypeId The actual device type identifier. The list of reader types returned by this function are listed under <b>ReaderType</b> member in the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/smclib/ns-smclib-_scard_reader_capabilities">SCARD_READER_CAPABILITIES</a> structure.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetdevicetypeidw
     * @since windows8.0
     */
    static SCardGetDeviceTypeIdW(hContext, szReaderName, pdwDeviceTypeId) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName

        pdwDeviceTypeIdMarshal := pdwDeviceTypeId is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetDeviceTypeIdW", "ptr", hContext, "ptr", szReaderName, pdwDeviceTypeIdMarshal, pdwDeviceTypeId, "int")
        return result
    }

    /**
     * Gets the device instance identifier of the card reader for the given reader name. This function does not affect the state of the reader.
     * @param {Pointer} hContext Handle that identifies the resource manager context for the query. You can set the resource manager context by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szReaderName Reader name. You can get this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardlistreadersa">SCardListReaders</a> function.
     * @param {PSTR} szDeviceInstanceId Buffer that receives the device instance ID of the reader. If this value is <b>NULL</b>, the function ignores the buffer length supplied in <i>cchDeviceInstanceId</i> parameter, writes the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>cchDeviceInstanceId</i>, and returns a success code.
     * @param {Pointer<Integer>} pcchDeviceInstanceId Length, in characters, of the <i>szDeviceInstanceId</i> buffer, including the <b>NULL</b> terminator. If the buffer length is specified as SCARD_AUTOALLOCATE, then the <i>szDeviceInstanceId</i> parameter is converted to a pointer to a byte pointer, and receives the address of a block of memory containing the instance id. This block of memory must be deallocated with the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a> function.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetreaderdeviceinstanceida
     * @since windows8.0
     */
    static SCardGetReaderDeviceInstanceIdA(hContext, szReaderName, szDeviceInstanceId, pcchDeviceInstanceId) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName
        szDeviceInstanceId := szDeviceInstanceId is String ? StrPtr(szDeviceInstanceId) : szDeviceInstanceId

        pcchDeviceInstanceIdMarshal := pcchDeviceInstanceId is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetReaderDeviceInstanceIdA", "ptr", hContext, "ptr", szReaderName, "ptr", szDeviceInstanceId, pcchDeviceInstanceIdMarshal, pcchDeviceInstanceId, "int")
        return result
    }

    /**
     * Gets the device instance identifier of the card reader for the given reader name. This function does not affect the state of the reader.
     * @param {Pointer} hContext Handle that identifies the resource manager context for the query. You can set the resource manager context by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szReaderName Reader name. You can get this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardlistreadersa">SCardListReaders</a> function.
     * @param {PWSTR} szDeviceInstanceId Buffer that receives the device instance ID of the reader. If this value is <b>NULL</b>, the function ignores the buffer length supplied in <i>cchDeviceInstanceId</i> parameter, writes the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>cchDeviceInstanceId</i>, and returns a success code.
     * @param {Pointer<Integer>} pcchDeviceInstanceId Length, in characters, of the <i>szDeviceInstanceId</i> buffer, including the <b>NULL</b> terminator. If the buffer length is specified as SCARD_AUTOALLOCATE, then the <i>szDeviceInstanceId</i> parameter is converted to a pointer to a byte pointer, and receives the address of a block of memory containing the instance id. This block of memory must be deallocated with the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a> function.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardgetreaderdeviceinstanceidw
     * @since windows8.0
     */
    static SCardGetReaderDeviceInstanceIdW(hContext, szReaderName, szDeviceInstanceId, pcchDeviceInstanceId) {
        szReaderName := szReaderName is String ? StrPtr(szReaderName) : szReaderName
        szDeviceInstanceId := szDeviceInstanceId is String ? StrPtr(szDeviceInstanceId) : szDeviceInstanceId

        pcchDeviceInstanceIdMarshal := pcchDeviceInstanceId is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardGetReaderDeviceInstanceIdW", "ptr", hContext, "ptr", szReaderName, "ptr", szDeviceInstanceId, pcchDeviceInstanceIdMarshal, pcchDeviceInstanceId, "int")
        return result
    }

    /**
     * Gets the list of readers that have provided a device instance identifier. This function does not affect the state of the reader.
     * @param {Pointer} hContext Handle that identifies the resource manager context for the query. You can set the resource manager context by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. This parameter cannot be <b>NULL</b>.
     * @param {PSTR} szDeviceInstanceId Device instance ID of the reader. You can get this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardgetreaderdeviceinstanceida">SCardGetReaderDeviceInstanceId</a> function with the reader name or by calling the <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdigetdeviceinstanceida">SetupDiGetDeviceInstanceId</a> function from the DDK.
     * @param {PSTR} mszReaders A multi-string that contain the smart card readers within the supplied device instance identifier. If this value is <b>NULL</b>, then the function ignores the buffer length supplied in the <i>pcchReaders</i> parameter, writes the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>pcchReaders</i>, and returns a success code.
     * @param {Pointer<Integer>} pcchReaders The length, in characters, of the <i>mszReaders</i> buffer. This parameter receives the actual length of the multiple-string structure, including all terminating null characters. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>mszReaders</i> is converted to a pointer to a byte pointer, and receives the address of a block of memory that contains the multiple-string structure. When you have finished using this memory, deallocated it by using the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a> function.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistreaderswithdeviceinstanceida
     * @since windows8.0
     */
    static SCardListReadersWithDeviceInstanceIdA(hContext, szDeviceInstanceId, mszReaders, pcchReaders) {
        szDeviceInstanceId := szDeviceInstanceId is String ? StrPtr(szDeviceInstanceId) : szDeviceInstanceId
        mszReaders := mszReaders is String ? StrPtr(mszReaders) : mszReaders

        pcchReadersMarshal := pcchReaders is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListReadersWithDeviceInstanceIdA", "ptr", hContext, "ptr", szDeviceInstanceId, "ptr", mszReaders, pcchReadersMarshal, pcchReaders, "int")
        return result
    }

    /**
     * Gets the list of readers that have provided a device instance identifier. This function does not affect the state of the reader.
     * @param {Pointer} hContext Handle that identifies the resource manager context for the query. You can set the resource manager context by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} szDeviceInstanceId Device instance ID of the reader. You can get this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardgetreaderdeviceinstanceida">SCardGetReaderDeviceInstanceId</a> function with the reader name or by calling the <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdigetdeviceinstanceida">SetupDiGetDeviceInstanceId</a> function from the DDK.
     * @param {PWSTR} mszReaders A multi-string that contain the smart card readers within the supplied device instance identifier. If this value is <b>NULL</b>, then the function ignores the buffer length supplied in the <i>pcchReaders</i> parameter, writes the length of the buffer that would have been returned if this parameter had not been <b>NULL</b> to <i>pcchReaders</i>, and returns a success code.
     * @param {Pointer<Integer>} pcchReaders The length, in characters, of the <i>mszReaders</i> buffer. This parameter receives the actual length of the multiple-string structure, including all terminating null characters. If the buffer length is specified as SCARD_AUTOALLOCATE, then <i>mszReaders</i> is converted to a pointer to a byte pointer, and receives the address of a block of memory that contains the multiple-string structure. When you have finished using this memory, deallocated it by using the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardfreememory">SCardFreeMemory</a> function.
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardlistreaderswithdeviceinstanceidw
     * @since windows8.0
     */
    static SCardListReadersWithDeviceInstanceIdW(hContext, szDeviceInstanceId, mszReaders, pcchReaders) {
        szDeviceInstanceId := szDeviceInstanceId is String ? StrPtr(szDeviceInstanceId) : szDeviceInstanceId
        mszReaders := mszReaders is String ? StrPtr(mszReaders) : mszReaders

        pcchReadersMarshal := pcchReaders is VarRef ? "uint*" : "ptr"

        result := DllCall("WinSCard.dll\SCardListReadersWithDeviceInstanceIdW", "ptr", hContext, "ptr", szDeviceInstanceId, "ptr", mszReaders, pcchReadersMarshal, pcchReaders, "int")
        return result
    }

    /**
     * Writes event messages to the Windows application log Microsoft-Windows-SmartCard-Audit/Authentication.
     * @param {Pointer} hContext Handle that identifies the resource manager context. The resource manager context can be set by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> function. This parameter cannot be <b>NULL</b>.
     * @param {Integer} dwEvent The event to log.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_AUDIT_CHV_FAILURE"></a><a id="scard_audit_chv_failure"></a><dl>
     * <dt><b>SCARD_AUDIT_CHV_FAILURE</b></dt>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A smart card holder verification (CHV) attempt failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCARD_AUDIT_CHV_SUCCESS"></a><a id="scard_audit_chv_success"></a><dl>
     * <dt><b>SCARD_AUDIT_CHV_SUCCESS</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A smart card holder verification (CHV) attempt succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns different values depending on whether it succeeds or fails.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SCARD_S_SUCCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error code. For more information, see 
     * <a href="/windows/desktop/SecAuthN/authentication-return-values">Smart Card Return Values</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winscard/nf-winscard-scardaudit
     * @since windows8.0
     */
    static SCardAudit(hContext, dwEvent) {
        result := DllCall("WinSCard.dll\SCardAudit", "ptr", hContext, "uint", dwEvent, "int")
        return result
    }

;@endregion Methods
}
