#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS.ahk" { NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS }
#Import ".\FORCE_LEVEL_FLAGS.ahk" { FORCE_LEVEL_FLAGS }
#Import ".\DSREG_JOIN_INFO.ahk" { DSREG_JOIN_INFO }
#Import ".\MSA_INFO_ACCOUNT_TYPE.ahk" { MSA_INFO_ACCOUNT_TYPE }
#Import ".\NET_USER_ENUM_FILTER_FLAGS.ahk" { NET_USER_ENUM_FILTER_FLAGS }
#Import ".\HLOG.ahk" { HLOG }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\NET_VALIDATE_PASSWORD_TYPE.ahk" { NET_VALIDATE_PASSWORD_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NET_JOIN_DOMAIN_JOIN_OPTIONS.ahk" { NET_JOIN_DOMAIN_JOIN_OPTIONS }
#Import ".\NET_COMPUTER_NAME_TYPE.ahk" { NET_COMPUTER_NAME_TYPE }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\NETSETUP_NAME_TYPE.ahk" { NETSETUP_NAME_TYPE }
#Import "..\..\Security\PSID.ahk" { PSID }
#Import ".\NETSETUP_JOIN_STATUS.ahk" { NETSETUP_JOIN_STATUS }
#Import ".\NETSETUP_PROVISION.ahk" { NETSETUP_PROVISION }
#Import ".\NETSETUP_PROVISIONING_PARAMS.ahk" { NETSETUP_PROVISIONING_PARAMS }
#Import ".\NET_REQUEST_PROVISION_OPTIONS.ahk" { NET_REQUEST_PROVISION_OPTIONS }
#Import ".\NET_SERVER_TYPE.ahk" { NET_SERVER_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */

;@region Functions
/**
 * The NetUserAdd function adds a user account and assigns a password and privilege level.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the user container is used to perform the access check for this function. The caller must be able to create child objects of the user class.
 * 
 * Server users must use a system in which the server creates a system account for the new user. The creation of this account is controlled by several parameters in the server's LanMan.ini file.
 * 
 * If the newly added user already exists as a system user, the <b>usri1_home_dir</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_1">USER_INFO_1</a> structure is ignored.
 * 
 * When you call the 
 * <b>NetUserAdd</b> function and specify information level 1, the call initializes the additional members in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_2">USER_INFO_2</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_3">USER_INFO_3</a>, and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_4">USER_INFO_4</a> structures to their default values. You can change the default values by making subsequent calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function. The default values supplied are listed following. (The prefix usriX indicates that the member can begin with multiple prefixes, for example, usri2_ or usri4_.)
 * 
 * <table>
 * <tr>
 * <th>Member</th>
 * <th>Default Value</th>
 * </tr>
 * <tr>
 * <td>usriX_auth_flags</td>
 * <td>None (0)</td>
 * </tr>
 * <tr>
 * <td>usriX_full_name</td>
 * <td>None (null string)</td>
 * </tr>
 * <tr>
 * <td>usriX_usr_comment</td>
 * <td>None (null string)</td>
 * </tr>
 * <tr>
 * <td>usriX_parms</td>
 * <td>None (null string)</td>
 * </tr>
 * <tr>
 * <td>usriX_workstations</td>
 * <td>All (null string)</td>
 * </tr>
 * <tr>
 * <td>usriX_acct_expires</td>
 * <td>Never (TIMEQ_FOREVER)</td>
 * </tr>
 * <tr>
 * <td>usriX_max_storage</td>
 * <td>Unlimited (USER_MAXSTORAGE_UNLIMITED)</td>
 * </tr>
 * <tr>
 * <td>usriX_logon_hours</td>
 * <td>Logon allowed at any time (each element 0xFF; all bits set to 1)</td>
 * </tr>
 * <tr>
 * <td>usriX_logon_server</td>
 * <td>Any domain controller (\\*)</td>
 * </tr>
 * <tr>
 * <td>usriX_country_code</td>
 * <td>0</td>
 * </tr>
 * <tr>
 * <td>usriX_code_page</td>
 * <td>0</td>
 * </tr>
 * </table>
 *  
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used. 
 * 
 * 
 * 
 * 
 * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err Pointer to a value that receives the index of the first member of the user information structure that causes ERROR_INVALID_PARAMETER. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupExists</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The group already exists.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserExists</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user account already exists.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_PasswordTooShort</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The password is shorter than required. (The password could also be too long, be too recent in its change history, not have enough unique characters, or not meet another password policy requirement.)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netuseradd
 * @since windows5.0
 */
export NetUserAdd(servername, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUserAdd", "ptr", servername, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetUserEnum function retrieves information about all user accounts on a server.
 * @remarks
 * The
 * 				<b>NetUserEnum</b> function retrieves information about all user accounts on a specified remote server or the local computer.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netquerydisplayinformation">NetQueryDisplayInformation</a> function can be used to quickly enumerate user, computer, or global group account information for display in user interfaces .
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If you call the <b>NetUserEnum</b> function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The <b>NetUserEnum</b> function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomains">LsaEnumerateTrustedDomains</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomainsex">LsaEnumerateTrustedDomainsEx</a> function can be used to retrieve the names and SIDs of domains trusted by a Local Security Authority (LSA) policy object.
 * 
 * The 
 * <b>NetUserEnum</b> function does not return all system users. It returns only those users who have been added with a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function. There is no guarantee that the list of users will be returned in sorted order.
 * 
 * If you call 
 * the <b>NetUserEnum</b> function and specify information level 1, 2, or 3,  for the <i>level</i> parameter, the password member of each structure retrieved is set to <b>NULL</b> to maintain password security.  
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * The <b>NetUserEnum</b> function does not support a <i>level</i> parameter of 4 and the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_4">USER_INFO_4</a> structure. The <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> 
 * 		function supports a <i>level</i> parameter of 4 and the <b>USER_INFO_4</b> structure.
 * @param {PWSTR} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {NET_USER_ENUM_FILTER_FLAGS} filter A value that specifies the user account types to be included in the enumeration. A value of zero indicates that all normal user, trust data, and machine account data should be included.
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. 
 * 
 * The buffer for this data is allocated by the system and the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to free the allocated memory when the data returned is no longer needed. Note that you must free the buffer even if the <b>NetUserEnum</b> function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen The preferred maximum length, in bytes, of the returned data. If you specify MAX_PREFERRED_LENGTH, the <b>NetUserEnum</b> function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread A pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint. If your application is communicating with a Windows 2000 or later domain controller, you should consider using the 
 * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-ldap-provider">ADSI LDAP Provider</a> to retrieve this type of data more efficiently. The ADSI LDAP Provider implements a set of ADSI objects that support various ADSI interfaces. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-system-providers">ADSI Service Providers</a>. 
 * 
 * 
 * 
 * 
 * <b>LAN Manager:  </b>If the call is to a computer that is running LAN Manager 2.<i>x</i>, the <i>totalentries</i> parameter will always reflect the total number of entries in the database no matter where it is in the resume sequence.
 * @param {Pointer<Integer>} resume_handle A pointer to a value that contains a resume handle which is used to continue an existing user search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, then no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system call level is not correct. This error is returned if the <i>level</i> parameter is set to a value not supported. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_BufTooSmall</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is too small to contain an entry. No information has been written to the buffer. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netuserenum
 * @since windows5.0
 */
export NetUserEnum(servername, level, filter, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resume_handleMarshal := resume_handle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUserEnum", "ptr", servername, "uint", level, NET_USER_ENUM_FILTER_FLAGS, filter, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resume_handleMarshal, resume_handle, UInt32)
    return result
}

/**
 * The NetUserGetInfo function retrieves information about a particular user account on a server.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the User object is used to perform the access check for this function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If the information level specified in the <i>level</i> parameter is set to 24, the <i>servername</i> parameter specified must resolve to the local computer. If the <i>servername</i> resolves to a remote computer or to a domain controller, the <b>NetUserGetInfo</b>  function will fail.
 * @param {PWSTR} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} username A pointer to a constant string that specifies the name of the user account for which to return information. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_NETPATH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network path specified in the <i>servername</i> parameter was not found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusergetinfo
 * @since windows5.1.2600
 */
export NetUserGetInfo(servername, username, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    username := username is String ? StrPtr(username) : username

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUserGetInfo", "ptr", servername, "ptr", username, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetUserSetInfo function sets the parameters of a user account.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the User object is used to perform the access check for this function.
 * 
 * Only users or applications having administrative privileges can call the 
 * <b>NetUserSetInfo</b> function to change a user's password. When an administrator calls 
 * <b>NetUserSetInfo</b>, the only restriction applied is that the new password length must be consistent with system modals. A user or application that knows a user's current password can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserchangepassword">NetUserChangePassword</a> function to change the password. For more information about calling functions that require administrator privileges, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * Members of the Administrators local group can set any modifiable user account elements. All users can set the <b>usri2_country_code</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_2">USER_INFO_2</a> structure (and the <b>usri1024_country_code</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_1024">USER_INFO_1024</a> structure) for their own accounts.
 * 
 * A member of the Account Operator's local group cannot set details for an Administrators class account, give an existing account Administrator privilege, or change the operator privilege of any account. If you attempt to change the privilege level or disable the last account with Administrator privilege in the security database, (the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory), the 
 * <b>NetUserSetInfo</b> function fails and returns NERR_LastAdmin.
 * 
 * To set the following user account control flags, the following <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">privileges</a> and <a href="https://docs.microsoft.com/windows/desktop/AD/control-access-rights">control access rights</a> are required.
 * 
 * <table>
 * <tr>
 * <th>Account control flag</th>
 * <th>Privilege or right required</th>
 * </tr>
 * <tr>
 * <td>UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION</td>
 * <td>SeEnableDelegationPrivilege privilege, which is granted to Administrators by default. </td>
 * </tr>
 * <tr>
 * <td>UF_TRUSTED_FOR_DELEGATION</td>
 * <td>SeEnableDelegationPrivilege.</td>
 * </tr>
 * <tr>
 * <td>UF_PASSWD_NOTREQD</td>
 * <td>"Update password not required" control access right on the Domain object, which is granted to authenticated users by default.</td>
 * </tr>
 * <tr>
 * <td>UF_DONT_EXPIRE_PASSWD</td>
 * <td>"Unexpire password" control access right on the Domain object, which is granted to authenticated users by default.</td>
 * </tr>
 * <tr>
 * <td>UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED</td>
 * <td>"Enable per user reversibly encrypted password" control access right on the Domain object, which is granted to authenticated users by default.</td>
 * </tr>
 * <tr>
 * <td>UF_SERVER_TRUST_ACCOUNT</td>
 * <td>"Add/remove replica in domain" control access right on the Domain object, which is granted to Administrators by default.</td>
 * </tr>
 * </table>
 *  
 * 
 * For a list of privilege constants, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Authorization  Constants</a>.
 * 
 * The correct way to specify the new name for an account is to call 
 * <b>NetUserSetInfo</b> with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_0">USER_INFO_0</a> and to specify the new value using the <b>usri0_name</b> member. If you call 
 * <b>NetUserSetInfo</b> with other information levels and specify a value using a <b>usriX_name</b> member, the value is ignored.
 * 
 * Note that calls to 
 * <b>NetUserSetInfo</b> can change the home directory only for user accounts that the network server creates.
 * 
 * If the 
 * <b>NetUserSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the user information structure that is invalid. (A user information structure begins with USER_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix usri*_ indicates that the member can begin with multiple prefixes, for example, usri10_ or usri1003_.)
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>USER_NAME_PARMNUM</td>
 * <td>usri*_name</td>
 * </tr>
 * <tr>
 * <td>USER_PASSWORD_PARMNUM</td>
 * <td>usri*_password</td>
 * </tr>
 * <tr>
 * <td>USER_PASSWORD_AGE_PARMNUM</td>
 * <td>usri*_password_age</td>
 * </tr>
 * <tr>
 * <td>USER_PRIV_PARMNUM</td>
 * <td>usri*_priv</td>
 * </tr>
 * <tr>
 * <td>USER_HOME_DIR_PARMNUM</td>
 * <td>usri*_home_dir</td>
 * </tr>
 * <tr>
 * <td>USER_COMMENT_PARMNUM</td>
 * <td>usri*_comment</td>
 * </tr>
 * <tr>
 * <td>USER_FLAGS_PARMNUM</td>
 * <td>usri*_flags</td>
 * </tr>
 * <tr>
 * <td>USER_SCRIPT_PATH_PARMNUM</td>
 * <td>usri*_script_path</td>
 * </tr>
 * <tr>
 * <td>USER_AUTH_FLAGS_PARMNUM</td>
 * <td>usri*_auth_flags</td>
 * </tr>
 * <tr>
 * <td>USER_FULL_NAME_PARMNUM</td>
 * <td>usri*_full_name</td>
 * </tr>
 * <tr>
 * <td>USER_USR_COMMENT_PARMNUM</td>
 * <td>usri*_usr_comment</td>
 * </tr>
 * <tr>
 * <td>USER_PARMS_PARMNUM</td>
 * <td>usri*_parms</td>
 * </tr>
 * <tr>
 * <td>USER_WORKSTATIONS_PARMNUM</td>
 * <td>usri*_workstations</td>
 * </tr>
 * <tr>
 * <td>USER_LAST_LOGON_PARMNUM</td>
 * <td>usri*_last_logon</td>
 * </tr>
 * <tr>
 * <td>USER_LAST_LOGOFF_PARMNUM</td>
 * <td>usri*_last_logoff</td>
 * </tr>
 * <tr>
 * <td>USER_ACCT_EXPIRES_PARMNUM</td>
 * <td>usri*_acct_expires</td>
 * </tr>
 * <tr>
 * <td>USER_MAX_STORAGE_PARMNUM</td>
 * <td>usri*_max_storage</td>
 * </tr>
 * <tr>
 * <td>USER_UNITS_PER_WEEK_PARMNUM</td>
 * <td>usri*_units_per_week</td>
 * </tr>
 * <tr>
 * <td>USER_LOGON_HOURS_PARMNUM</td>
 * <td>usri*_logon_hours</td>
 * </tr>
 * <tr>
 * <td>USER_PAD_PW_COUNT_PARMNUM</td>
 * <td>usri*_bad_pw_count</td>
 * </tr>
 * <tr>
 * <td>USER_NUM_LOGONS_PARMNUM</td>
 * <td>usri*_num_logons</td>
 * </tr>
 * <tr>
 * <td>USER_LOGON_SERVER_PARMNUM</td>
 * <td>usri*_logon_server</td>
 * </tr>
 * <tr>
 * <td>USER_COUNTRY_CODE_PARMNUM</td>
 * <td>usri*_country_code</td>
 * </tr>
 * <tr>
 * <td>USER_CODE_PAGE_PARMNUM</td>
 * <td>usri*_code_page</td>
 * </tr>
 * <tr>
 * <td>USER_PRIMARY_GROUP_PARMNUM</td>
 * <td>usri*_primary_group_id</td>
 * </tr>
 * <tr>
 * <td>USER_PROFILE_PARMNUM</td>
 * <td>usri*_profile</td>
 * </tr>
 * <tr>
 * <td>USER_HOME_DIR_DRIVE_PARMNUM</td>
 * <td>usri*_home_dir_drive</td>
 * </tr>
 * </table>
 *  
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * The 
 * <b>NetUserSetInfo</b> function does not control how the password parameters are secured when sent over the network to a remote server to change a user password. Any encryption of these parameters is handled by the Remote Procedure Call (RPC) mechanism supported by the network redirector that provides the network transport. Encryption is also controlled  by the security mechanisms supported by the local computer and the security mechanisms supported by remote network server specified in the <i>servername</i>   parameter. For more details on security when the Microsoft network redirector is used and the remote network server is running Microsoft Windows, see the protocol documentation for <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rpce/290c38b1-92fe-4229-91e6-4fc376610c15">MS-RPCE</a> and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-samr/4df07fab-1bbc-452f-8e92-7853a3c7e380">MS-SAMR</a>.
 * @param {PWSTR} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} username A pointer to a constant string that specifies the name of the user account for which to set information. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf A pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err A pointer to a value that receives the index of the first member of the user information structure that causes ERROR_INVALID_PARAMETER. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
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
 * One of the function parameters is invalid. For more information, see the following Remarks section.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SpeGroupOp</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is not allowed on specified special groups, which are user groups, admin groups, local groups, or guest groups.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_LastAdmin</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is not allowed on the last administrative account.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_BadPassword</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The share name or password is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_PasswordTooShort</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The password is shorter than required. (The password could also be too long, be too recent in its change history, not have enough unique characters, or not meet another password policy requirement.)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusersetinfo
 * @since windows5.0
 */
export NetUserSetInfo(servername, username, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername
    username := username is String ? StrPtr(username) : username

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUserSetInfo", "ptr", servername, "ptr", username, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetUserDel function deletes a user account from a server.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the User object is used to perform the access check for this function.
 * 
 * An account cannot be deleted while a user or application is accessing a server resource. If the user was added to the system with a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function, deleting the user also deletes the user's system account.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} username Pointer to a constant string that specifies the name of the user account to delete. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netuserdel
 * @since windows5.0
 */
export NetUserDel(servername, username) {
    servername := servername is String ? StrPtr(servername) : servername
    username := username is String ? StrPtr(username) : username

    result := DllCall("NETAPI32.dll\NetUserDel", "ptr", servername, "ptr", username, UInt32)
    return result
}

/**
 * The NetUserGetGroups function retrieves a list of global groups to which a specified user belongs.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the User object is used to perform the access check for this function.
 * 
 * To retrieve a list of the local groups to which a user belongs, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetlocalgroups">NetUserGetLocalGroups</a> function. Network groups are separate and distinct from Windows NT system groups.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @param {PWSTR} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} username A pointer to a constant string that specifies the name of the user to search for in each group account. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the buffer that receives the data. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen The preferred maximum length, in bytes, of returned data. If MAX_PREFERRED_LENGTH is specified, the function allocates the amount of memory required for the data. If another value is specified in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread A pointer to a value that receives the count of elements actually retrieved.
 * @param {Pointer<Integer>} totalentries A pointer to a value that receives the total number of entries that could have been retrieved.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access rights to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_NETPATH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network path was not found. This error is returned if the <i>servername</i> parameter could not be found. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system call level is not correct. This error is returned if the <i>level</i> parameter was specified as a value other than 0 or 1. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The name syntax is incorrect. This error is returned if the <i>servername</i> parameter has leading or trailing blanks or contains an illegal character. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory was available to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InternalError</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user could not be found. This error is returned if the <i>username</i> could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusergetgroups
 * @since windows5.0
 */
export NetUserGetGroups(servername, username, level, bufptr, prefmaxlen, entriesread, totalentries) {
    servername := servername is String ? StrPtr(servername) : servername
    username := username is String ? StrPtr(username) : username

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUserGetGroups", "ptr", servername, "ptr", username, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, UInt32)
    return result
}

/**
 * The NetUserSetGroups function sets global group memberships for a specified user account.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the User object is used to perform the access check for this function.
 * 
 * To grant a user membership in one existing global group, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupadduser">NetGroupAddUser</a> function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @param {PWSTR} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} username A pointer to a constant string that specifies the name of the user for which to set global group memberships. For more information, see the Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf A pointer to the buffer that specifies the data. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Integer} num_entries The number of entries contained in the array pointed to by the <i>buf</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system call level is not correct. This error is returned if the <i>level</i> parameter was specified as a value other than 0 or 1. 
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
 * A parameter passed was not valid. This error is returned if the <i>num_entries</i> parameter was not valid. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory was available to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The group group name specified by the <b>grui0_name</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-group_users_info_0">GROUP_USERS_INFO_0</a> structure or <b>grui1_name</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-group_users_info_1">GROUP_USERS_INFO_1</a> structure pointed to by the <i>buf</i> parameter does not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InternalError</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusersetgroups
 * @since windows5.0
 */
export NetUserSetGroups(servername, username, level, buf, num_entries) {
    servername := servername is String ? StrPtr(servername) : servername
    username := username is String ? StrPtr(username) : username

    bufMarshal := buf is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUserSetGroups", "ptr", servername, "ptr", username, "uint", level, bufMarshal, buf, "uint", num_entries, UInt32)
    return result
}

/**
 * The NetUserGetLocalGroups function retrieves a list of local groups to which a specified user belongs.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Domain object is used to perform the access check for this function. The caller must have  Read Property permission on the Domain object.
 * 
 * To retrieve a list of global groups to which a specified user belongs, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetgroups">NetUserGetGroups</a> function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @param {PWSTR} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} username A pointer to a constant string that specifies the name of the user for which to return local group membership information. If the string is of the form <i>DomainName</i>&#92;<i>UserName</i> the user name is expected to be found on that domain. If the string is of the form <i>UserName</i>, the user name is expected to be found on the server specified by the <i>servername</i> parameter. For more information, see the Remarks section.
 * @param {Integer} level The information level of the data. This parameter can be the following value. 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="0"></a><dl>
 * <dt><b>0</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Return the names of the local groups to which the user belongs. The <i>bufptr</i> parameter points to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_users_info_0">LOCALGROUP_USERS_INFO_0</a> structures.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} flags A bitmask of flags that affect the operation. Currently, only the value defined is <b>LG_INCLUDE_INDIRECT</b>. If this bit is set, the function also returns the names of the local groups in which the user is indirectly a member (that is, the user has membership in a global group that is itself a member of one or more local groups).
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with <b>ERROR_MORE_DATA</b>.
 * @param {Integer} prefmaxlen The preferred maximum length, in bytes, of the returned data. If <b>MAX_PREFERRED_LENGTH</b> is specified in this parameter, the function allocates the amount of memory required for the data. If another value is specified in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns <b>ERROR_MORE_DATA</b>. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread A pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access rights to the requested information. This error is also returned if the <i>servername</i> parameter has a trailing blank.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system call level is not correct. This error is returned if the <i>level</i> parameter was not specified as 0. 
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
 * A parameter is incorrect. This error is returned if the <i>flags</i> parameter contains a value other than <b>LG_INCLUDE_INDIRECT</b>. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory was available to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_DCNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The domain controller could not be found. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user could not be found. This error is returned if the <i>username</i> could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_SERVER_UNAVAILABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The RPC server is unavailable. This error is returned if the <i>servername</i> parameter could not be found. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusergetlocalgroups
 * @since windows5.0
 */
export NetUserGetLocalGroups(servername, username, level, flags, bufptr, prefmaxlen, entriesread, totalentries) {
    servername := servername is String ? StrPtr(servername) : servername
    username := username is String ? StrPtr(username) : username

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUserGetLocalGroups", "ptr", servername, "ptr", username, "uint", level, "uint", flags, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, UInt32)
    return result
}

/**
 * The NetUserModalsGet function retrieves global information for all users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user modal functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsdomain">IADsDomain</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Domain object is used to perform the access check for this function.
 * 
 * To retrieve the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">security identifier</a> (SID) of the domain to which the computer belongs, call the 
 * <b>NetUserModalsGet</b> function specifying a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_modals_info_2">USER_MODALS_INFO_2</a> structure and <b>NULL</b> in the <i>servername</i> parameter. If the computer isn't a member of a domain, the function returns a <b>NULL</b> pointer.
 * @param {PWSTR} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. 
 * 
 * The buffer for this data is allocated by the system and the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to free the allocated memory when the data returned is no longer needed. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_NETPATH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network path was not found. This error is returned if the <i>servername</i> parameter could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system call level is not correct. This error is returned if the <i>level </i> parameter is not one of the supported values.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file name, directory name, or volume label syntax is incorrect. This error is returned if the <i>servername</i> parameter syntax is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WRONG_TARGET_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The target account name is incorrect. This error is returned for a logon failure to a remote <i>servername</i> parameter running on Windows Vista.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusermodalsget
 * @since windows5.0
 */
export NetUserModalsGet(servername, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUserModalsGet", "ptr", servername, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetUserModalsSet function sets global information for all users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user modal functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsdomain">IADsDomain</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Domain object is used to perform the access check for this function. Typically, callers must have write access to the entire object for calls to this function to succeed.
 * 
 * If the 
 * <b>NetUserModalsSet</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the information structure that is invalid. (The information structure begins with USER_MODALS_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix usrmod*_ indicates that the member can begin with multiple prefixes, for example, usrmod2_ or usrmod1002_.)
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>MODALS_MIN_PASSWD_LEN_PARMNUM</td>
 * <td>usrmod*_min_passwd_len</td>
 * </tr>
 * <tr>
 * <td>MODALS_MAX_PASSWD_AGE_PARMNUM</td>
 * <td>usrmod*_max_passwd_age</td>
 * </tr>
 * <tr>
 * <td>MODALS_MIN_PASSWD_AGE_PARMNUM</td>
 * <td>usrmod*_min_passwd_age</td>
 * </tr>
 * <tr>
 * <td>MODALS_FORCE_LOGOFF_PARMNUM</td>
 * <td>usrmod*_force_logoff</td>
 * </tr>
 * <tr>
 * <td>MODALS_PASSWD_HIST_LEN_PARMNUM</td>
 * <td>usrmod*_password_hist_len</td>
 * </tr>
 * <tr>
 * <td>MODALS_ROLE_PARMNUM</td>
 * <td>usrmod*_role</td>
 * </tr>
 * <tr>
 * <td>MODALS_PRIMARY_PARMNUM</td>
 * <td>usrmod*_primary</td>
 * </tr>
 * <tr>
 * <td>MODALS_DOMAIN_NAME_PARMNUM</td>
 * <td>usrmod*_domain_name</td>
 * </tr>
 * <tr>
 * <td>MODALS_DOMAIN_ID_PARMNUM</td>
 * <td>usrmod*_domain_id</td>
 * </tr>
 * <tr>
 * <td>MODALS_LOCKOUT_DURATION_PARMNUM</td>
 * <td>usrmod*_lockout_duration</td>
 * </tr>
 * <tr>
 * <td>MODALS_LOCKOUT_OBSERVATION_WINDOW_PARMNUM</td>
 * <td>usrmod*_lockout_observation_window</td>
 * </tr>
 * <tr>
 * <td>MODALS_LOCKOUT_THRESHOLD_PARMNUM</td>
 * <td>usrmod*_lockout_threshold</td>
 * </tr>
 * </table>
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err Pointer to a value that receives the index of the first member of the information structure that causes ERROR_INVALID_PARAMETER. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
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
 * The specified parameter is invalid. For more information, see the following Remarks section.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusermodalsset
 * @since windows5.0
 */
export NetUserModalsSet(servername, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUserModalsSet", "ptr", servername, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetUserChangePassword function changes a user's password for a specified network server or domain.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same result you can achieve by calling the network management user functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If an application calls the <b>NetUserChangePassword</b> function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. A user can change his or her own password. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the User object is used to perform the access check for this function. In addition, the caller must have the "Change password" <a href="https://docs.microsoft.com/windows/desktop/AD/control-access-rights">control access right</a> on the User object. This right is granted to Anonymous Logon and Everyone by default. 
 * 
 * Note that for the function to succeed, the <i>oldpassword</i> parameter must match the password as it currently exists.
 * 
 * In some cases, the process that calls the 
 * <b>NetUserChangePassword</b> function must also have the SE_CHANGE_NOTIFY_NAME privilege enabled; otherwise, 
 * <b>NetUserChangePassword</b> fails and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_ACCESS_DENIED. This privilege is not required for the 
 * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a> or for accounts that are members of the administrators group. By default, SE_CHANGE_NOTIFY_NAME is enabled for all users, but some administrators may disable the privilege for everyone. For more information about account privileges, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">Privileges</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Authorization Constants</a>.
 * 
 * See 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/forcing-a-user-to-change-the-logon-password">Forcing a User to Change the Logon Password</a> for a code sample that demonstrates how to force a user to change the logon password on the next logon using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * The 
 * <b>NetUserChangePassword</b> function does not control how the <i>oldpassword</i> and <i>newpassword</i> parameters are secured when sent over the network to a remote server. Any encryption of these parameters is handled by the Remote Procedure Call (RPC) mechanism supported by the network redirector that provides the network transport. Encryption is also controlled  by the security mechanisms supported by the local computer and the security mechanisms supported by remote network server or domain specified in the <i>domainname</i>   parameter. For more details on security when the Microsoft network redirector is used and the remote network server is running Microsoft Windows, see the protocol documentation for <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rpce/290c38b1-92fe-4229-91e6-4fc376610c15">MS-RPCE</a>, <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-samr/4df07fab-1bbc-452f-8e92-7853a3c7e380">MS-SAMR</a>, <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-spng/f377a379-c24f-4a0f-a3eb-0d835389e28a">MS-SPNG</a>, and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-nlmp/b38c36ed-2804-4868-a9ff-8dd3182128e4">MS-NLMP</a>.
 * @param {PWSTR} domainname A pointer to a constant string that specifies the DNS or NetBIOS name of a remote server or domain on which the function is to execute. If this parameter is <b>NULL</b>, the logon domain of the caller is used.
 * @param {PWSTR} username A pointer to a constant string that specifies a user name. The 
 * <b>NetUserChangePassword</b> function changes the password for the specified user.
 * 
 * If this parameter is <b>NULL</b>, the logon name of the caller is used. For more information, see the following Remarks section.
 * @param {PWSTR} oldpassword A pointer to a constant string that specifies the user's old password.
 * @param {PWSTR} newpassword A pointer to a constant string that specifies the user's new password.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user has entered an invalid password.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_PasswordTooShort</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The password is shorter than required. (The password could also be too long, be too recent in its change history, not have enough unique characters, or not meet another password policy requirement.)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netuserchangepassword
 * @since windows5.0
 */
export NetUserChangePassword(domainname, username, oldpassword, newpassword) {
    domainname := domainname is String ? StrPtr(domainname) : domainname
    username := username is String ? StrPtr(username) : username
    oldpassword := oldpassword is String ? StrPtr(oldpassword) : oldpassword
    newpassword := newpassword is String ? StrPtr(newpassword) : newpassword

    A_LastError := 0

    result := DllCall("NETAPI32.dll\NetUserChangePassword", "ptr", domainname, "ptr", username, "ptr", oldpassword, "ptr", newpassword, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The NetGroupAdd function creates a global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the user container is used to perform the access check for this function. The caller must be able to create child objects of the group class. Typically, callers must also have write access to the entire object for calls to this function to succeed.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to a buffer that contains the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err Pointer to a value that receives the index of the first member of the global group information structure in error when ERROR_INVALID_PARAMETER is returned. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetinfo">NetGroupSetInfo</a> function.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupExists</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The global group already exists.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SpeGroupOp</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupadd
 * @since windows5.0
 */
export NetGroupAdd(servername, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGroupAdd", "ptr", servername, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetGroupAddUser function gives an existing user account membership in an existing global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Group object is used to perform the access check for this function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} GroupName Pointer to a constant string that specifies the name of the global group in which the user is to be given membership. For more information, see the following Remarks section.
 * @param {PWSTR} username Pointer to a constant string that specifies the name of the user to be given membership in the global group. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SpeGroupOp</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The global group name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupadduser
 * @since windows5.0
 */
export NetGroupAddUser(servername, GroupName, username) {
    servername := servername is String ? StrPtr(servername) : servername
    GroupName := GroupName is String ? StrPtr(GroupName) : GroupName
    username := username is String ? StrPtr(username) : username

    result := DllCall("NETAPI32.dll\NetGroupAddUser", "ptr", servername, "ptr", GroupName, "ptr", username, UInt32)
    return result
}

/**
 * The NetGroupEnum function retrieves information about each global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container. 
 * 
 * To determine the exact total number of groups, you must enumerate the entire tree, which can be a costly operation. To enumerate the entire tree, use the <i>resume_handle</i> parameter to continue the enumeration for consecutive calls, and use the <i>entriesread</i> parameter to accumulate the total number of groups. If your application is communicating with a domain controller, you should consider using the 
 * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-ldap-provider">ADSI LDAP Provider</a> to retrieve this type of data more efficiently. The ADSI LDAP Provider implements a set of ADSI objects that support various ADSI interfaces. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-system-providers">ADSI Service Providers</a>.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the buffer to receive the global group information structure. The format of this data depends on the value of the <i>level</i> parameter. 
 * 
 * 
 * 
 * 
 * The system allocates the memory for this buffer. You must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to deallocate the memory. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen Specifies the preferred maximum length of the returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required to hold the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread Pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. The total number of entries is only a hint. For more information about determining the exact number of entries, see the following Remarks section.
 * @param {Pointer<Pointer>} resume_handle Pointer to a variable that contains a resume handle that is used to continue the global group enumeration. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupenum
 * @since windows5.0
 */
export NetGroupEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resume_handleMarshal := resume_handle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGroupEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resume_handleMarshal, resume_handle, UInt32)
    return result
}

/**
 * The NetGroupGetInfo function retrieves information about a particular global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Group object is used to perform the access check for this function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname Pointer to a constant string that specifies the name of the global group for which to retrieve information. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the address of the buffer that receives the global group information structure. The format of this data depends on the value of the <i>level</i> parameter. The system allocates the memory for this buffer. You must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to deallocate the memory. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The global group name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupgetinfo
 * @since windows5.0
 */
export NetGroupGetInfo(servername, groupname, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGroupGetInfo", "ptr", servername, "ptr", groupname, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetGroupSetInfo function sets the parameters of a global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * 
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Group object is used to perform the access check for this function. Typically, callers must have write access to the entire object for calls to this function to succeed.
 * 
 * The correct way to set the new name of a global group is to call the 
 * <b>NetGroupSetInfo</b> function, using a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-group_info_0">GROUP_INFO_0</a> structure. Specify the new value in the <b>grpi0_name</b> member. If you use a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-group_info_1">GROUP_INFO_1</a> structure and specify the value in the <b>grpi1_name</b> member, the new name value is ignored.
 * 
 * If the 
 * <b>NetGroupSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the group information structure that is invalid. (A group information structure begins with GROUP_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix grpi*_ indicates that the member can begin with multiple prefixes, for example, grpi1_ or grpi2_.)
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>GROUP_NAME_PARMNUM</td>
 * <td>grpi*_name</td>
 * </tr>
 * <tr>
 * <td>GROUP_COMMENT_PARMNUM</td>
 * <td>grpi*_comment</td>
 * </tr>
 * <tr>
 * <td>GROUP_ATTRIBUTES_PARMNUM</td>
 * <td>grpi*_attributes</td>
 * </tr>
 * </table>
 *  
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname Pointer to a constant string that specifies the name of the global group for which to set information. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to a buffer that contains the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err Pointer to a value that receives the index of the first member of the group information structure in error following an ERROR_INVALID_PARAMETER error code. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
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
 * One of the function parameters is invalid. For more information, see the following Remarks section.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The global group name could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SpeGroupOp</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupsetinfo
 * @since windows5.0
 */
export NetGroupSetInfo(servername, groupname, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGroupSetInfo", "ptr", servername, "ptr", groupname, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetGroupDel function deletes a global group from the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Group object is used to perform the access check for this function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname Pointer to a constant string that specifies the name of the global group account to delete. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SpeGroupOp</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The global group name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupdel
 * @since windows5.0
 */
export NetGroupDel(servername, groupname) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    result := DllCall("NETAPI32.dll\NetGroupDel", "ptr", servername, "ptr", groupname, UInt32)
    return result
}

/**
 * The NetGroupDelUser function removes a user from a particular global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Group object is used to perform the access check for this function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} GroupName Pointer to a constant string that specifies the name of the global group from which the user's membership should be removed. For more information, see the following Remarks section.
 * @param {PWSTR} Username Pointer to a constant string that specifies the name of the user to remove from the global group. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SpeGroupOp</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The global group name could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotInGroup</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not belong to this global group.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupdeluser
 * @since windows5.0
 */
export NetGroupDelUser(servername, GroupName, Username) {
    servername := servername is String ? StrPtr(servername) : servername
    GroupName := GroupName is String ? StrPtr(GroupName) : GroupName
    Username := Username is String ? StrPtr(Username) : Username

    result := DllCall("NETAPI32.dll\NetGroupDelUser", "ptr", servername, "ptr", GroupName, "ptr", Username, UInt32)
    return result
}

/**
 * The NetGroupGetUsers function retrieves a list of the members in a particular global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Group object is used to perform the access check for this function.
 * 
 * To grant one user membership in an existing global group, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupadduser">NetGroupAddUser</a> function. To remove a user from a global group, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupdeluser">NetGroupDelUser</a> function. For information about replacing the membership of a global group, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetusers">NetGroupSetUsers</a>.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname A pointer to a constant string that specifies the name of the global group whose members are to be listed. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the address of the buffer that receives the information structure. The system allocates the memory for this buffer. You must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to deallocate the memory. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen The preferred maximum length of the returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required to hold the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread A pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position.
 * @param {Pointer<Pointer>} ResumeHandle A pointer to a variable that contains a resume handle that is used to continue an existing user enumeration. The handle should be zero on the first call and left unchanged for subsequent calls. If <i>ResumeHandle</i> parameter is <b>NULL</b>, no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system call level is not correct. This error is returned if the <i>level</i> parameter was specified as a value other than 0 or 1. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory was available to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The global group name in the structure pointed to by <i>bufptr</i> parameter could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InternalError</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupgetusers
 * @since windows5.0
 */
export NetGroupGetUsers(servername, groupname, level, bufptr, prefmaxlen, entriesread, totalentries, ResumeHandle) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    ResumeHandleMarshal := ResumeHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGroupGetUsers", "ptr", servername, "ptr", groupname, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, ResumeHandleMarshal, ResumeHandle, UInt32)
    return result
}

/**
 * The NetGroupSetUsers function sets the membership for the specified global group.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Group object is used to perform the access check for this function.
 * 
 * You can replace the global group membership with an entirely new list of members by calling the 
 * <b>NetGroupSetUsers</b> function. The typical sequence of steps to perform this follows.
 * 
 * <p class="proch"><b>To replace the global group membership</b>
 * 
 * <ol>
 * <li>Call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupgetusers">NetGroupGetUsers</a> function to retrieve the current membership list.</li>
 * <li>Modify the returned membership list to reflect the new membership.</li>
 * <li>Call the 
 * <b>NetGroupSetUsers</b> function to replace the old membership list with the new membership list.</li>
 * </ol>
 * To grant one user membership in an existing global group, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupadduser">NetGroupAddUser</a> function. To remove a user from a global group, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupdeluser">NetGroupDelUser</a> function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname A pointer to a constant string that specifies the name of the global group of interest. For more information, see the Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf A pointer to the buffer that contains the data. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Integer} totalentries The number of entries in the buffer pointed to by the <i>buf</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system call level is not correct. This error is returned if the <i>level</i> parameter was specified as a value other than 0 or 1. 
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
 * A parameter passed was not valid. This error is returned if the <i>totalentries</i> parameter was not valid. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory was available to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The global group name could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InternalError</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SpeGroupOp</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupsetusers
 * @since windows5.0
 */
export NetGroupSetUsers(servername, groupname, level, buf, totalentries) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    bufMarshal := buf is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGroupSetUsers", "ptr", servername, "ptr", groupname, "uint", level, bufMarshal, buf, "uint", totalentries, UInt32)
    return result
}

/**
 * The NetLocalGroupAdd function creates a local group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the user container is used to perform the access check for this function. The caller must be able to create child objects of the group class.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If the 
 * <b>NetLocalGroupAdd</b> function returns <b>ERROR_INVALID_PARAMETER</b> and a <b>NULL</b> pointer was not passed in <i>parm_err</i> parameter, on return the <i>parm_err</i> parameter indicates the first member of the local group information structure that is invalid. The format of the local group information structure is specified in the <i>level</i> parameter. A pointer to the local group information structure is passed in <i>buf</i> parameter. The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>LOCALGROUP_NAME_PARMNUM</td>
 * <td>
 * If the <i>level</i> parameter was 0, the <b>lgrpi0_name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_0">LOCALGROUP_INFO_0</a> 
 * 		 structure was invalid.
 * 
 * If the <i>level</i> parameter was 1, the <b>lgrpi1_name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_1">LOCALGROUP_INFO_1</a> 
 * 		 structure was invalid.  
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>LOCALGROUP_COMMENT_PARMNUM</td>
 * <td>
 * If the <i>level</i> parameter was 1, the <b>lgrpi1_comment</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_1">LOCALGROUP_INFO_1</a> 
 * 		 structure was invalid.  
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * When making requests to a domain controller and Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same results as the network management local group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf A pointer to a buffer that contains the local group information structure. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err A pointer to a value that receives the index of the first member of the local group information structure to cause the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the Remarks section in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupsetinfo">NetLocalGroupSetInfo</a> topic.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the appropriate
 *         access to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ALIAS_EXISTS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified local group already exists. This error is returned if the group name member in the structure pointed to by the <i>buf</i> parameter is already in use as an alias.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A <i>level</i> parameter is invalid. 
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
 * A parameter is incorrect. This error is returned if one or more of the members in the structure pointed to by the <i>buf</i> parameter is invalid. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupExists</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The group name exists. This error is returned if the group name member in the structure pointed to by the <i>buf</i> parameter is already in use as a group name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserExists</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name exists. This error is returned if the group name member in the structure pointed to by the <i>buf</i> parameter is already in use as a user name.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupadd
 * @since windows5.0
 */
export NetLocalGroupAdd(servername, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetLocalGroupAdd", "ptr", servername, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetLocalGroupAddMember function is obsolete. You should use the NetLocalGroupAddMembers function instead.
 * @param {PWSTR} servername TBD
 * @param {PWSTR} groupname TBD
 * @param {PSID} membersid TBD
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupaddmember
 */
export NetLocalGroupAddMember(servername, groupname, membersid) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    result := DllCall("NETAPI32.dll\NetLocalGroupAddMember", "ptr", servername, "ptr", groupname, PSID, membersid, UInt32)
    return result
}

/**
 * The NetLocalGroupEnum function returns information about each local group account on the specified server.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container. 
 * 
 * To determine the exact total number of local groups, you must enumerate the entire tree, which can be a costly operation. To enumerate the entire tree, use the <i>resumehandle</i> parameter to continue the enumeration for consecutive calls, and use the <i>entriesread</i> parameter to accumulate the total number of local groups. If your application is communicating with a domain controller, you should consider using the 
 * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-ldap-provider">ADSI LDAP Provider</a> to retrieve this type of data more efficiently. The ADSI LDAP Provider implements a set of ADSI objects that support various ADSI interfaces. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-system-providers">ADSI Service Providers</a>.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the address of the buffer that receives the information structure. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen Specifies the preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread Pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries Pointer to a value that receives the approximate total number of entries that could have been enumerated from the current resume position. The total number of entries is only a hint. For more information about determining the exact number of entries, see the following Remarks section.
 * @param {Pointer<Pointer>} resumehandle Pointer to a value that contains a resume handle that is used to continue an existing local group search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, then no resume handle is stored. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_BufTooSmall</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The return buffer is too small.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupenum
 * @since windows5.0
 */
export NetLocalGroupEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resumehandleMarshal := resumehandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetLocalGroupEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resumehandleMarshal, resumehandle, UInt32)
    return result
}

/**
 * The NetLocalGroupGetInfo function retrieves information about a particular local group account on a server.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the LocalGroup object is used to perform the access check for this function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname Pointer to a constant string that specifies the name of the local group account for which the information will be retrieved. For more information, see the following Remarks section.
 * @param {Integer} level Specifies the information level of the data. This parameter can be the following value. 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="1"></a><dl>
 * <dt><b>1</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Return the comment associated with the local group. The <i>bufptr</i> parameter points to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_1">LOCALGROUP_INFO_1</a> structure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the address of the buffer that receives the return information structure. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified local group does not exist.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupgetinfo
 * @since windows5.0
 */
export NetLocalGroupGetInfo(servername, groupname, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetLocalGroupGetInfo", "ptr", servername, "ptr", groupname, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetLocalGroupSetInfo function changes the name of an existing local group. The function also associates a comment with a local group.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the LocalGroup object is used to perform the access check for this function. Typically, callers must have write access to the entire object for calls to this function to succeed.
 * 
 * To specify the new name of an existing local group, call 
 * <b>NetLocalGroupSetInfo</b> with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_0">LOCALGROUP_INFO_0</a> and specify a value using the <b>lgrpi0_name</b> member. If you call the 
 * <b>NetLocalGroupSetInfo</b> function with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_1">LOCALGROUP_INFO_1</a> and specify a new value using the <b>lgrpi1_name</b> member, that value will be ignored.
 * 
 * If the 
 * <b>NetLocalGroupSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the local group information structure that is invalid. (A local group information structure begins with LOCALGROUP_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix lgrpi*_ indicates that the member can begin with multiple prefixes, for example, lgrpi0_ or lgrpi1_.)
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>LOCALGROUP_NAME_PARMNUM</td>
 * <td>lgrpi*_name</td>
 * </tr>
 * <tr>
 * <td>LOCALGROUP_COMMENT_PARMNUM</td>
 * <td>lgrpi*_comment</td>
 * </tr>
 * </table>
 *  
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname Pointer to a constant string that specifies the name of the local group account to modify. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to a buffer that contains the local group information. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err Pointer to a value that receives the index of the first member of the local group information structure that caused the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
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
 * One of the function parameters is invalid. For more information, see the following Remarks section.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_ALIAS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified local group does not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupsetinfo
 * @since windows5.0
 */
export NetLocalGroupSetInfo(servername, groupname, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetLocalGroupSetInfo", "ptr", servername, "ptr", groupname, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetLocalGroupDel function deletes a local group account and all its members from the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the LocalGroup object is used to perform the access check for this function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname Pointer to a constant string that specifies the name of the local group account to delete. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotPrimary</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is allowed only on the primary domain controller of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The local group specified by the <i>groupname</i> parameter does not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_ALIAS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified local group does not exist.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupdel
 * @since windows5.0
 */
export NetLocalGroupDel(servername, groupname) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    result := DllCall("NETAPI32.dll\NetLocalGroupDel", "ptr", servername, "ptr", groupname, UInt32)
    return result
}

/**
 * The NetLocalGroupDelMember function is obsolete. You should use the NetLocalGroupDelMembers function instead.
 * @param {PWSTR} servername TBD
 * @param {PWSTR} groupname TBD
 * @param {PSID} membersid TBD
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupdelmember
 */
export NetLocalGroupDelMember(servername, groupname, membersid) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    result := DllCall("NETAPI32.dll\NetLocalGroupDelMember", "ptr", servername, "ptr", groupname, PSID, membersid, UInt32)
    return result
}

/**
 * The NetLocalGroupGetMembers function retrieves a list of the members of a particular local group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the LocalGroup object is used to perform the access check for this function. 
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * 
 * If this function returns <b>ERROR_MORE_DATA</b>, then it must be repeatedly called until <b>ERROR_SUCCESS</b> or <b>NERR_success</b> is returned.  Failure to do so can result in an RPC connection leak.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} localgroupname Pointer to a constant string that specifies the name of the local group whose members are to be listed. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the address that receives the return information structure. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen Specifies the preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread Pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position.
 * @param {Pointer<Pointer>} resumehandle Pointer to a value that contains a resume handle which is used to continue an existing group member search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, then no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_ALIAS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified local group does not exist.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupgetmembers
 * @since windows5.0
 */
export NetLocalGroupGetMembers(servername, localgroupname, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
    servername := servername is String ? StrPtr(servername) : servername
    localgroupname := localgroupname is String ? StrPtr(localgroupname) : localgroupname

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resumehandleMarshal := resumehandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetLocalGroupGetMembers", "ptr", servername, "ptr", localgroupname, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resumehandleMarshal, resumehandle, UInt32)
    return result
}

/**
 * The NetLocalGroupSetMembers function sets the membership for the specified local group.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the LocalGroup object is used to perform the access check for this function.
 * 
 * You can replace the local group membership with an entirely new list of members by calling the 
 * <b>NetLocalGroupSetMembers</b> function. The typical sequence of steps to perform this follows.
 * 
 * <p class="proch"><b>To replace the local group membership</b>
 * 
 * <ol>
 * <li>Call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupgetmembers">NetLocalGroupGetMembers</a> function to retrieve the current membership list.</li>
 * <li>Modify the returned membership list to reflect the new membership.</li>
 * <li>Call the 
 * <b>NetLocalGroupSetMembers</b> function to replace the old membership list with the new membership list.</li>
 * </ol>
 * To add one or more existing user accounts or global group accounts to an existing local group, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupaddmembers">NetLocalGroupAddMembers</a> function. To remove one or more members from an existing local group, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupdelmembers">NetLocalGroupDelMembers</a> function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname Pointer to a constant string that specifies the name of the local group in which the specified users or global groups should be granted membership. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to the buffer that contains the member information. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Integer} totalentries Specifies a value that contains the total number of entries in the buffer pointed to by the <i>buf</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The group specified by the <i>groupname</i> parameter does not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_MEMBER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the members doesn't exist. The local group membership was not changed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_MEMBER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the members cannot be added because it has an invalid account type. The local group membership was not changed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupsetmembers
 * @since windows5.0
 */
export NetLocalGroupSetMembers(servername, groupname, level, buf, totalentries) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    bufMarshal := buf is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetLocalGroupSetMembers", "ptr", servername, "ptr", groupname, "uint", level, bufMarshal, buf, "uint", totalentries, UInt32)
    return result
}

/**
 * The NetLocalGroupAddMembers function adds membership of one or more existing user accounts or global group accounts to an existing local group.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the LocalGroup object is used to perform the access check for this function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname Pointer to a constant string that specifies the name of the local group to which the specified users or global groups will be added. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to a buffer that contains the data for the new local group members. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Integer} totalentries Specifies the number of entries in the buffer pointed to by the <i>buf</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The local group specified by the <i>groupname</i> parameter does not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_MEMBER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the members specified do not exist. Therefore, no new members were added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MEMBER_IN_ALIAS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the members specified were already members of the local group. No new members were added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_MEMBER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the members cannot be added because their account type is invalid. No new members were added.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupaddmembers
 * @since windows5.0
 */
export NetLocalGroupAddMembers(servername, groupname, level, buf, totalentries) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    bufMarshal := buf is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetLocalGroupAddMembers", "ptr", servername, "ptr", groupname, "uint", level, bufMarshal, buf, "uint", totalentries, UInt32)
    return result
}

/**
 * The NetLocalGroupDelMembers function removes one or more members from an existing local group. Local group members can be users or global groups.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the LocalGroup object is used to perform the access check for this function.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} groupname Pointer to a constant string that specifies the name of the local group from which the specified users or global groups will be removed. For more information, see the following Remarks section.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to a buffer that specifies the members to be removed. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Integer} totalentries Specifies the number of entries in the array pointed to by the <i>buf</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_GroupNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The local group specified by the <i>groupname</i> parameter does not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_MEMBER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the specified members do not exist. No members were deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MEMBER_NOT_IN_ALIAS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the members specified were not members of the local group. No members were deleted.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupdelmembers
 * @since windows5.0
 */
export NetLocalGroupDelMembers(servername, groupname, level, buf, totalentries) {
    servername := servername is String ? StrPtr(servername) : servername
    groupname := groupname is String ? StrPtr(groupname) : groupname

    bufMarshal := buf is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetLocalGroupDelMembers", "ptr", servername, "ptr", groupname, "uint", level, bufMarshal, buf, "uint", totalentries, UInt32)
    return result
}

/**
 * The NetQueryDisplayInformation function returns user account, computer, or group account information. Call this function to quickly enumerate account information for display in user interfaces.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The <b>NetQueryDisplayInformation</b> function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container.
 * 
 * The 
 * <b>NetQueryDisplayInformation</b> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetdisplayinformationindex">NetGetDisplayInformationIndex</a> functions provide an efficient mechanism for enumerating user and group accounts. When possible, use these functions instead of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a> function or the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupenum">NetGroupEnum</a> function.
 * 
 * To enumerate trusting domains or member computer accounts, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a>, specifying the appropriate filter value to obtain the account information you require. To enumerate trusted domains, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomains">LsaEnumerateTrustedDomains</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomainsex">LsaEnumerateTrustedDomainsEx</a> function.
 * 
 * The number of entries returned by this function depends on the security descriptor located on the root domain object. The API will return  either the first 100 entries or the entire set of entries in the domain, depending on the access privileges of the user. The ACE used to control this behavior is "SAM-Enumerate-Entire-Domain", and is granted to Authenticated Users by default. Administrators can modify this setting to allow users to enumerate the entire domain.
 * 
 * Each call to 
 * <b>NetQueryDisplayInformation</b> returns a maximum of 100 objects. Calling the 
 * <b>NetQueryDisplayInformation</b> function to enumerate domain account information can be costly in terms of performance. If you are programming for Active Directory, you may be able to use methods on the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-idirectorysearch">IDirectorySearch</a> interface to make paged queries against the domain. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-setsearchpreference">IDirectorySearch::SetSearchPreference</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-executesearch">IDirectorySearch::ExecuteSearch</a>. To enumerate trusted domains, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomainsex">LsaEnumerateTrustedDomainsEx</a> function.
 * @param {PWSTR} ServerName Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} Level 
 * @param {Integer} Index Specifies the index of the first entry for which to retrieve information. Specify zero to retrieve account information beginning with the first display information entry. For more information, see the following Remarks section.
 * @param {Integer} EntriesRequested Specifies the maximum number of entries for which to retrieve information. On Windows 2000 and later, each call to 
 * <b>NetQueryDisplayInformation</b> returns a maximum of 100 objects.
 * @param {Integer} PreferredMaximumLength Specifies the preferred maximum size, in bytes, of the system-allocated buffer returned in the <i>SortedBuffer</i> parameter. It is recommended that you set this parameter to MAX_PREFERRED_LENGTH.
 * @param {Pointer<Integer>} ReturnedEntryCount Pointer to a value that receives the number of entries in the buffer returned in the <i>SortedBuffer</i> parameter. If this parameter is zero, there are no entries with an index as large as that specified. Entries may be returned when the function's return value is either NERR_Success or ERROR_MORE_DATA.
 * @param {Pointer<Pointer<Void>>} SortedBuffer Pointer to a buffer that receives a pointer to a system-allocated buffer that specifies a sorted list of the requested information. The format of this data depends on the value of the <i>Level</i> parameter. Because this buffer is allocated by the system, it must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA. For more information, see the following Return Values section, and the topics 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>Level</i> parameter specifies an invalid value.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. That is, the last entry returned in the <i>SortedBuffer</i> parameter is not the last entry available. To retrieve additional entries, call 
 * <b>NetQueryDisplayInformation</b> again with the <i>Index</i> parameter set to the value returned in the <b>next_index</b> member of the last entry in <i>SortedBuffer</i>. Note that you should not use the value of the <b>next_index</b> member for any purpose except to retrieve more data with additional calls to 
 * <b>NetQueryDisplayInformation</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netquerydisplayinformation
 * @since windows5.0
 */
export NetQueryDisplayInformation(ServerName, Level, Index, EntriesRequested, PreferredMaximumLength, ReturnedEntryCount, SortedBuffer) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

    ReturnedEntryCountMarshal := ReturnedEntryCount is VarRef ? "uint*" : "ptr"
    SortedBufferMarshal := SortedBuffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetQueryDisplayInformation", "ptr", ServerName, "uint", Level, "uint", Index, "uint", EntriesRequested, "uint", PreferredMaximumLength, ReturnedEntryCountMarshal, ReturnedEntryCount, SortedBufferMarshal, SortedBuffer, UInt32)
    return result
}

/**
 * The NetGetDisplayInformationIndex function returns the index of the first display information entry whose name begins with a specified string or whose name alphabetically follows the string.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container.
 * @param {PWSTR} ServerName Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} Level 
 * @param {PWSTR} Prefix Pointer to a string that specifies the prefix for which to search.
 * @param {Pointer<Integer>} Index Pointer to a value that receives the index of the requested entry.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>Level</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There were no more items on which to operate.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer name is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgetdisplayinformationindex
 * @since windows5.0
 */
export NetGetDisplayInformationIndex(ServerName, Level, Prefix, Index) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    Prefix := Prefix is String ? StrPtr(Prefix) : Prefix

    IndexMarshal := Index is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGetDisplayInformationIndex", "ptr", ServerName, "uint", Level, "ptr", Prefix, IndexMarshal, Index, UInt32)
    return result
}

/**
 * Not supported. (NetAccessAdd)
 * @remarks
 * This function requires User level security to be enabled.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level Specifies the information level of the data. This parameter can be the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="1"></a><dl>
 * <dt><b>1</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pbBuffer</i> parameter points to an 
 *         <b>access_info_1</b> structure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} buf Pointer to the buffer that contains the access information structure.
 * @param {Pointer<Integer>} parm_err Specifies the size, in bytes, of the buffer pointed to by the <i>pbBuffer</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessadd
 * @since windows5.0
 */
export NetAccessAdd(servername, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetAccessAdd", "ptr", servername, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * Not supported. (NetAccessEnum)
 * @remarks
 * This function requires Admin privilege to successfully execute on a computer that has local security enabled.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} BasePath Pointer to a string that contains a base pathname for the resource. A <b>NULL</b> pointer or <b>NULL</b> string means no base path is to be used. The path can be specified as a universal naming convention (UNC) pathname.
 * @param {Integer} Recursive Specifies a flag that enables or disables recursive searching.
 * 
 * If this parameter is equal to zero, the <b>NetAccessEnum</b> function returns entries for the resource named as the base path by the <i>pszBasePath</i> parameter, and for the resources directly below that base path.
 * 
 * If this parameter is nonzero, the function returns entries for all access control lists (ACLs) that have <i>pszBasePath</i> at the beginning of the resource name.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the buffer that receives the access information structure. The format of this data depends on the value of the <i>sLevel</i> parameter.
 * @param {Integer} prefmaxlen Specifies the size, in bytes, of the buffer pointed to by the <i>pbBuffer</i> parameter.
 * @param {Pointer<Integer>} entriesread Pointer to an unsigned short integer that receives the count of elements actually enumerated. The count is valid only if the 
 * <b>NetAccessEnum</b> function returns <b>NERR_Success</b> or <b>ERROR_MORE_DATA</b>.
 * @param {Pointer<Integer>} totalentries Pointer to an unsigned short integer that receives the total number of entries that could have been enumerated. The count is valid only if the 
 * <b>NetAccessEnum</b> function returns <b>NERR_Success</b> or <b>ERROR_MORE_DATA</b>.
 * @param {Pointer<Integer>} resume_handle TBD
 * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessenum
 * @since windows5.0
 */
export NetAccessEnum(servername, BasePath, Recursive, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
    servername := servername is String ? StrPtr(servername) : servername
    BasePath := BasePath is String ? StrPtr(BasePath) : BasePath

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resume_handleMarshal := resume_handle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetAccessEnum", "ptr", servername, "ptr", BasePath, "uint", Recursive, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resume_handleMarshal, resume_handle, UInt32)
    return result
}

/**
 * Not supported. (NetAccessGetInfo)
 * @remarks
 * This function requires Admin privilege to successfully execute on a computer that has local security enabled.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} resource 
 * @param {Integer} level Pointer to the buffer that receives the access information structure. The format of this data depends on the value of the <i>sLevel</i> parameter.
 * @param {Pointer<Pointer<Integer>>} bufptr Specifies the size, in bytes, of the buffer pointed to by the <i>pbBuffer</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessgetinfo
 * @since windows5.0
 */
export NetAccessGetInfo(servername, resource, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    resource := resource is String ? StrPtr(resource) : resource

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetAccessGetInfo", "ptr", servername, "ptr", resource, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * Not supported. (NetAccessSetInfo)
 * @remarks
 * This function requires Admin privilege to successfully execute on a computer that has local security enabled.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} resource Pointer to a string that contains the name of the network resource to modify.
 * @param {Integer} level Specifies the information level of the data. This parameter can be the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="1"></a><dl>
 * <dt><b>1</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pbBuffer</i> parameter points to an 
 * <b>access_info_1</b> structure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} buf Pointer to the buffer that contains the access information structure. The format of this data depends on the value of the <i>sLevel</i> parameter.
 * @param {Pointer<Integer>} parm_err TBD
 * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccesssetinfo
 * @since windows5.0
 */
export NetAccessSetInfo(servername, resource, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername
    resource := resource is String ? StrPtr(resource) : resource

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetAccessSetInfo", "ptr", servername, "ptr", resource, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * Not supported. (NetAccessDel)
 * @remarks
 * This function requires Admin privilege to successfully execute on a computer that has local security enabled.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} resource Pointer to a string that contains the name of the network resource for which to remove the access control list.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessdel
 * @since windows5.0
 */
export NetAccessDel(servername, resource) {
    servername := servername is String ? StrPtr(servername) : servername
    resource := resource is String ? StrPtr(resource) : resource

    result := DllCall("NETAPI32.dll\NetAccessDel", "ptr", servername, "ptr", resource, UInt32)
    return result
}

/**
 * Not supported. (NetAccessGetUserPerms)
 * @remarks
 * This function requires Admin privilege to successfully execute on a computer that has local security enabled. When users request their own access permissions, no special privilege is required.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} UGname Pointer to a string that specifies the name of the user or group to query.
 * @param {PWSTR} resource Pointer to a string that contains the name of the network resource to query.
 * @param {Pointer<Integer>} Perms Pointer to an unsigned short integer that receives the user permissions for the specified resource.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessgetuserperms
 * @since windows5.0
 */
export NetAccessGetUserPerms(servername, UGname, resource, Perms) {
    servername := servername is String ? StrPtr(servername) : servername
    UGname := UGname is String ? StrPtr(UGname) : UGname
    resource := resource is String ? StrPtr(resource) : resource

    PermsMarshal := Perms is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetAccessGetUserPerms", "ptr", servername, "ptr", UGname, "ptr", resource, PermsMarshal, Perms, UInt32)
    return result
}

/**
 * The NetValidatePasswordPolicy function allows an application to check password compliance against an application-provided account database and verify that passwords meet the complexity, aging, minimum length, and history reuse requirements of a password policy.
 * @remarks
 * The <b>NetValidatePasswordPolicy</b> function is designed to allow applications to validate passwords for users that are in an account database provided by the application. This function can also be used to verify that passwords meet the complexity, aging, minimum length, and history reuse requirements of a password policy. This function also provides the means for an application to implement an account-lockout mechanism.
 * 
 * The <b>NetValidatePasswordPolicy</b> function does not validate passwords in Active Directory accounts and cannot be used for this purpose.
 * The only policy that this function checks a password against in Active Directory accounts is the password complexity (the password strength). 
 * 
 * A typical scenario for the use of the <b>NetValidatePasswordPolicy</b> function would be enforcing the choice of strong passwords by users for web applications and applications that allow password-protected documents. Another use of this function could be checking password complexity in a situation in which a password is attached to a functional operation rather than to a user account; for example, passwords that are used with Secure Multipurpose Internet Mail Extensions (S/MIME) certificate-based public keys.
 * 
 * If the <b>NetValidatePasswordPolicy</b> function is called on a domain controller that is running Active Directory, access is allowed or denied based on the ACL for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * The security descriptor of the Domain object is used to perform the access check for the <b>NetValidatePasswordPolicy</b> function. 
 * 
 * To call <b>NetValidatePasswordPolicy</b> in a security context that is not the default, first call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function, specifying LOGON32_LOGON_NEW_CREDENTIALS in the <i>dwLogonType</i> parameter, and then call <b>NetValidatePasswordPolicy</b> under impersonation. For more information about impersonation, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/client-impersonation">Client Impersonation</a>.
 * 
 * If the return code of the <b>NetValidatePasswordPolicy</b> function is <b>Nerr_Success</b> then the function
 *         allocates a buffer pointed to by the <i>OutputArg</i> parameter that contains a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_output_arg">NET_VALIDATE_OUTPUT_ARG</a> structure with the results of
 *         the operation. The application must examine <b>ValidationStatus</b> member in the <b>NET_VALIDATE_OUTPUT_ARG</b> structure to
 *         determine the results of the password policy validation check.  For more information, see <b>NET_VALIDATE_OUTPUT_ARG</b>.
 * 
 * Note that it is the application's responsibility to save all the data in the <b>ChangedPersistedFields</b> member of the <b>NET_VALIDATE_OUTPUT_ARG</b> structure as well as any User object information. The next time the application calls <b>NetValidatePasswordPolicy</b> on the same instance of the User object, the application must provide the required fields from the persistent information.
 * 
 * When you call <b>NetValidatePasswordPolicy</b> and specify <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg">NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG</a> or <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_password_reset_input_arg">NET_VALIDATE_PASSWORD_RESET_INPUT_ARG</a> in <i>InputArg</i> parameter, the call also validates the password by passing it through the password filter DLL that the computer is configured to use. For more information about password filters, see <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/using-password-filters">Using Password Filters</a>.
 * 
 * If the return value from the <b>NetValidatePasswordPolicy</b> function is nonzero then <i>OutputArg</i> parameter  is set to <b>NULL</b> and password policy
 *         could not be examined.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicyfree">NetValidatePasswordPolicyFree</a> function should be called after calling  <b>NetValidatePasswordPolicy</b> to free the memory allocated for the <i>OutputArg</i> parameter that is returned by the call to the <b>NetValidatePasswordPolicy</b> function.
 * @param {PWSTR} ServerName A pointer to a constant Unicode string specifying the name of the remote server on which the function is to execute. This string must
 *         begin with \\ followed by the remote server name. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Pointer<Void>} Qualifier Reserved for future use. This parameter must be <b>NULL</b>.
 * @param {NET_VALIDATE_PASSWORD_TYPE} ValidationType The type of password validation to perform. This parameter must be one of the following enumerated constant values. 
 * 
 * 
 * 
 * 
 * 
 * ```cpp
 * typedef enum _NET_VALIDATE_PASSWORD_TYPE {
 * 
 *     NetValidateAuthentication = 1,
 *     NetValidatePasswordChange,
 *     NetValidatePasswordReset,
 * 
 * } NET_VALIDATE_PASSWORD_TYPE, *PNET_VALIDATE_PASSWORD_TYPE;
 * 
 * ```
 * 
 * 
 * These values have the following meanings.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NetValidateAuthentication"></a><a id="netvalidateauthentication"></a><a id="NETVALIDATEAUTHENTICATION"></a><dl>
 * <dt><b>NetValidateAuthentication</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The application is requesting password validation during authentication. The <i>InputArg</i> parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_authentication_input_arg">NET_VALIDATE_AUTHENTICATION_INPUT_ARG</a> structure. This type of validation enforces password expiration and account lockout policy.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NetValidatePasswordChange"></a><a id="netvalidatepasswordchange"></a><a id="NETVALIDATEPASSWORDCHANGE"></a><dl>
 * <dt><b>NetValidatePasswordChange</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The application is requesting password validation during a password change operation. The <i>InputArg</i> parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg">NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG</a> structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NetValidatePasswordReset"></a><a id="netvalidatepasswordreset"></a><a id="NETVALIDATEPASSWORDRESET"></a><dl>
 * <dt><b>NetValidatePasswordReset</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The application is requesting password validation during a password reset operation. The <i>InputArg</i> parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_reset_input_arg">NET_VALIDATE_PASSWORD_RESET_INPUT_ARG</a> structure. You can also reset the "lockout state" of a user account by specifying this structure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} InputArg A pointer to a structure that depends on the type of password validation to perform. The type of structure depends on the value of the <i>ValidationType</i> parameter. For more information, see the description of the <i>ValidationType</i> parameter.
 * @param {Pointer<Pointer<Void>>} OutputArg If the <b>NetValidatePasswordPolicy</b> function succeeds (the return value is <b>Nerr_Success</b>), then the function
 *         allocates a buffer that contains the results of
 *         the operation. The <i>OutputArg</i> parameter contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_output_arg">NET_VALIDATE_OUTPUT_ARG</a> structure. The application must examine <b>ValidationStatus</b> member in the <b>NET_VALIDATE_OUTPUT_ARG</b> structure pointed to by the <i>OutputArg</i> parameter to
 *         determine the results of the password policy validation check.   The <b>NET_VALIDATE_OUTPUT_ARG</b> structure contains a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_persisted_fields">NET_VALIDATE_PERSISTED_FIELDS</a> structure with changes to persistent password-related information, and the results of the password validation. The application must
 *         plan to persist all persisted the fields in the <b>NET_VALIDATE_PERSISTED_FIELDS</b> structure aside from the <b>ValidationStatus</b> member as information along with the user object information and provide the required fields from
 *         the persisted information when calling this function in the future on the same user object.
 * 
 * If the <b>NetValidatePasswordPolicy</b> function fails (the return value is nonzero),  then <i>OutputArg</i> parameter is set to a <b>NULL</b> pointer and password policy
 *         could not be examined.
 * 
 * For more information, see the Return Values and Remarks sections.
 * @returns {Integer} If the function succeeds, and the password is authenticated, changed, or reset, the return value is NERR_Success and the function allocates an <i>OutputArg</i> parameter.
 * 
 * If the function fails, the <i>OutputArg</i> parameter is <b>NULL</b> and the return value is a system error code that can be one of the following error codes. For a list of all possible error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
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
 * A parameter is incorrect. This error is returned if the <i>InputArg</i>  or <i>OutputArg</i> parameters are <b>NULL</b>. This error is also returned if the <i>Qualifier</i> parameter is not <b>NULL</b> or if the <i>ValidationType</i> parameter is not one of the allowed values. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to complete the operation.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicy
 * @since windowsserver2003
 */
export NetValidatePasswordPolicy(ServerName, Qualifier, ValidationType, InputArg, OutputArg) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

    QualifierMarshal := Qualifier is VarRef ? "ptr" : "ptr"
    InputArgMarshal := InputArg is VarRef ? "ptr" : "ptr"
    OutputArgMarshal := OutputArg is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetValidatePasswordPolicy", "ptr", ServerName, QualifierMarshal, Qualifier, NET_VALIDATE_PASSWORD_TYPE, ValidationType, InputArgMarshal, InputArg, OutputArgMarshal, OutputArg, UInt32)
    return result
}

/**
 * The NetValidatePasswordPolicyFree function frees the memory that the NetValidatePasswordPolicy function allocates for the OutputArg parameter, which is a NET_VALIDATE_OUTPUT_ARG structure.
 * @remarks
 * No special group membership is required to successfully execute this function.
 * @param {Pointer<Pointer<Void>>} OutputArg Pointer to the memory allocated for the <i>OutputArg</i> parameter by a call to the <b>NetValidatePasswordPolicy</b> function.
 * @returns {Integer} If the function frees the memory, or if there is no memory to free from a previous call to <b>NetValidatePasswordPolicy</b>, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicyfree
 * @since windowsserver2003
 */
export NetValidatePasswordPolicyFree(OutputArg) {
    OutputArgMarshal := OutputArg is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetValidatePasswordPolicyFree", OutputArgMarshal, OutputArg, UInt32)
    return result
}

/**
 * The NetGetDCName function returns the name of the primary domain controller (PDC). It does not return the name of the backup domain controller (BDC) for the specified domain. Also, you cannot remote this function to a non-PDC server.
 * @remarks
 * No special group membership is required to successfully execute the 
 * <b>NetGetDCName</b> function.
 * @param {PWSTR} ServerName 
 * @param {PWSTR} DomainName 
 * @param {Pointer<Pointer<Integer>>} _Buffer 
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_DCNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Could not find the domain controller for the domain specified in the <i>domainname</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_NETPATH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network path was not found. This error is returned if the computer specified in the <i>servername</i> parameter could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The name syntax is incorrect. This error is returned if the name specified in the <i>servername</i> parameter contains illegal characters. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgetdcname
 * @since windows5.0
 */
export NetGetDCName(ServerName, DomainName, _Buffer) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    DomainName := DomainName is String ? StrPtr(DomainName) : DomainName

    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGetDCName", "ptr", ServerName, "ptr", DomainName, _BufferMarshal, _Buffer, UInt32)
    return result
}

/**
 * The NetGetAnyDCName function returns the name of any domain controller (DC) for a domain that is directly trusted by the specified server.
 * @remarks
 * No special group membership is required to successfully execute the 
 * <b>NetGetAnyDCName</b> function.
 * 
 * If <i>servername</i> specifies a stand-alone workstation or a stand-alone server, no <i>domainname</i> is valid.
 * 
 * If <i>servername</i> specifies a workstation that is a member of a domain, or a server that is a member of a domain, the <i>domainname</i> must be in the same domain as <i>servername</i>.
 * 
 * If <i>servername</i> specifies a domain controller, the <i>domainname</i> must be one of the domains trusted by the domain for which the server is a controller. The domain controller that this call finds has been operational at least once during this call.
 * @param {PWSTR} ServerName 
 * @param {PWSTR} DomainName 
 * @param {Pointer<Pointer<Integer>>} _Buffer 
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_LOGON_SERVERS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No domain controllers could be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified domain is not a trusted domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_TRUST_LSA_SECRET</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client side of the trust relationship is broken.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_TRUST_SAM_ACCOUNT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The server side of the trust relationship is broken or the password is broken.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DOMAIN_TRUST_INCONSISTENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The server that responded is not a proper domain controller of the specified domain.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgetanydcname
 * @since windows5.0
 */
export NetGetAnyDCName(ServerName, DomainName, _Buffer) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    DomainName := DomainName is String ? StrPtr(DomainName) : DomainName

    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGetAnyDCName", "ptr", ServerName, "ptr", DomainName, _BufferMarshal, _Buffer, UInt32)
    return result
}

/**
 * Controls various aspects of the Netlogon service.
 * @remarks
 * This function can be used to request that a BDC ensure that its copy of the SAM database is brought up-to-date. It can also be used to determine if a BDC currently has a secure channel open to the PDC.
 * @param {PWSTR} ServerName The name of the remote server.
 * @param {Integer} FunctionCode The operation to be performed. This value  can be one of the following.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_QUERY"></a><a id="netlogon_control_query"></a><dl>
 * <dt><b>NETLOGON_CONTROL_QUERY</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No operation. Returns only the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_REPLICATE"></a><a id="netlogon_control_replicate"></a><dl>
 * <dt><b>NETLOGON_CONTROL_REPLICATE</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces the security account manager (SAM) database on a backup domain controller (BDC) to be brought in sync with the copy on the primary domain controller (PDC). This operation does not imply a full synchronize. The Netlogon service replicates any outstanding differences if possible.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_SYNCHRONIZE"></a><a id="netlogon_control_synchronize"></a><dl>
 * <dt><b>NETLOGON_CONTROL_SYNCHRONIZE</b></dt>
 * <dt>3</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a BDC to get a new copy of the SAM database from the PDC. This operation performs a full synchronize.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_PDC_REPLICATE"></a><a id="netlogon_control_pdc_replicate"></a><dl>
 * <dt><b>NETLOGON_CONTROL_PDC_REPLICATE</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a PDC to ask for each BDC to replicate now.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_REDISCOVER"></a><a id="netlogon_control_rediscover"></a><dl>
 * <dt><b>NETLOGON_CONTROL_REDISCOVER</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a domain controller (DC) to rediscover the specified trusted domain DC.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_TC_QUERY"></a><a id="netlogon_control_tc_query"></a><dl>
 * <dt><b>NETLOGON_CONTROL_TC_QUERY</b></dt>
 * <dt>6</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries  the secure channel, requesting a status update about its last usage.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_TC_VERIFY"></a><a id="netlogon_control_tc_verify"></a><dl>
 * <dt><b>NETLOGON_CONTROL_TC_VERIFY</b></dt>
 * <dt>10</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verifies the current status of the specified trusted domain secure channel. If the status indicates success, the domain controller is pinged. If the status or the ping indicates failure, a new trusted domain controller is rediscovered.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_CHANGE_PASSWORD"></a><a id="netlogon_control_change_password"></a><dl>
 * <dt><b>NETLOGON_CONTROL_CHANGE_PASSWORD</b></dt>
 * <dt>9</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a password change on a secure channel to a trusted domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_FORCE_DNS_REG"></a><a id="netlogon_control_force_dns_reg"></a><dl>
 * <dt><b>NETLOGON_CONTROL_FORCE_DNS_REG</b></dt>
 * <dt>11</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces the domain controller to re-register all of its DNS records. The <i>QueryLevel</i> parameter must be set to 1.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NETLOGON_CONTROL_QUERY_DNS_REG"></a><a id="netlogon_control_query_dns_reg"></a><dl>
 * <dt><b>NETLOGON_CONTROL_QUERY_DNS_REG</b></dt>
 * <dt>12</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Issues a query requesting the status of DNS updates performed by the Netlogon service. If any DNS registration or deregistration errors occurred on the last update, the result is negative. The <i>QueryLevel</i> parameter must be set to 1.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} QueryLevel Indicates what information should be returned from the Netlogon service. This value can be any of the following structures.
 * @param {Pointer<Integer>} Data Carries input data that depends on the value specified in the <i>FunctionCode</i> parameter. The NETLOGON_CONTROL_REDISCOVER and NETLOGON_CONTROL_TC_QUERY function codes specify the trusted domain name (the data type is <b>LPWSTR *</b>).
 * @param {Pointer<Pointer<Integer>>} _Buffer Returns a pointer to a buffer that contains the requested information in the structure passed in the <i>QueryLevel</i> parameter.
 * 
 *  The buffer must be freed using <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @returns {Integer} The method returns 0x00000000 (<b>NERR_Success</b>) on success; otherwise, it returns a nonzero error code defined in Lmerr.h or Winerror.h. NET_API_STATUS error codes begin with the value 0x00000834. For more information about network management error codes, see <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-error-codes">Network_Management_Error_Codes</a>. The following table describes possible return values.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>NERR_Success</b></b></dt>
 * <dt>0x00000000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The method call completed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>0x00000005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access validation on the caller returns false. Access is denied.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * <dt>0x00000008</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough storage is available to process this command.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * <dt>0x00000032</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A function code is not valid on the specified
 *         server.  For example,  NETLOGON_CONTROL_REPLICATE might have been passed to a primary domain controller (PDC).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>0x00000057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * <dt>0x0000007C</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The query call level is not correct.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
 * <dt>0x000004261210121</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The service has not been started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b> ERROR_INVALID_COMPUTERNAME</b></dt>
 * <dt> 0x000004BA</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The format of the specified computer name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_LOGON_SERVERS</b></dt>
 * <dt>0x0000051F</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are currently no logon servers available to service the logon request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DOMAIN_ROLE</b></dt>
 * <dt>0x0000054A</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Password change for an interdomain trust account was attempted  on a backup domain controller (BDC). This operation is only allowed for the PDC of the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
 * <dt>0x0000054B</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified domain either does not exist or could not be contacted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserNotFound</b></dt>
 * <dt>0x000008AD</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-i_netlogoncontrol2
 */
export I_NetLogonControl2(ServerName, FunctionCode, QueryLevel, Data, _Buffer) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

    DataMarshal := Data is VarRef ? "char*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\I_NetLogonControl2", "ptr", ServerName, "uint", FunctionCode, "uint", QueryLevel, DataMarshal, Data, _BufferMarshal, _Buffer, UInt32)
    return result
}

/**
 * Creates a standalone managed service account (sMSA) or retrieves the credentials for a group managed service account (gMSA) and stores the account information on the local computer.
 * @param {PWSTR} ServerName The value of this parameter must be <b>NULL</b>.
 * @param {PWSTR} AccountName The name of the account to be created.
 * @param {PWSTR} Password This parameter is reserved. Do not use it.
 * @param {Integer} Flags This parameter can be the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SERVICE_ACCOUNT_FLAG_LINK_TO_HOST_ONLY"></a><a id="service_account_flag_link_to_host_only"></a><dl>
 * <dt><b>SERVICE_ACCOUNT_FLAG_LINK_TO_HOST_ONLY</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No standalone managed service account is created. If a service account with the specified name exists, it is linked to the local computer. This flag is ignored if the account name is an existing gMSA.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {NTSTATUS} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaddserviceaccount
 * @since windows6.1
 */
export NetAddServiceAccount(ServerName, AccountName, Password, Flags) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    AccountName := AccountName is String ? StrPtr(AccountName) : AccountName
    Password := Password is String ? StrPtr(Password) : Password

    result := DllCall("NETAPI32.dll\NetAddServiceAccount", "ptr", ServerName, "ptr", AccountName, "ptr", Password, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Deletes the specified service account from the Active Directory database if the account is a standalone managed service account (sMSA).
 * @param {PWSTR} ServerName The value of this parameter must be <b>NULL</b>.
 * @param {PWSTR} AccountName The name of the account to be deleted.
 * @param {Integer} Flags This parameter can have the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SERVICE_ACCOUNT_FLAG_UNLINK_FROM_HOST_ONLY"></a><a id="service_account_flag_unlink_from_host_only"></a><dl>
 * <dt><b>SERVICE_ACCOUNT_FLAG_UNLINK_FROM_HOST_ONLY</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * For sMSAs, the service account object is unlinked from the local computer and the secret stored in the LSA is deleted. The service account object is not deleted from the Active Directory database. This flag has no meaning for gMSAs.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {NTSTATUS} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netremoveserviceaccount
 * @since windows6.1
 */
export NetRemoveServiceAccount(ServerName, AccountName, Flags) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    AccountName := AccountName is String ? StrPtr(AccountName) : AccountName

    result := DllCall("NETAPI32.dll\NetRemoveServiceAccount", "ptr", ServerName, "ptr", AccountName, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Enumerates the standalone managed service accounts (sMSA) on the specified server.
 * @param {PWSTR} ServerName The value of this parameter must be <b>NULL</b>.
 * @param {Integer} Flags This parameter is reserved. Do not use it.
 * @param {Pointer<Integer>} AccountsCount The number of elements in the <i>Accounts</i> array.
 * @param {Pointer<Pointer<Pointer<Integer>>>} Accounts A pointer to an array of the names of the service accounts on the specified server.
 * 
 * When you have finished using the names, free the array by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
 * @returns {NTSTATUS} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netenumerateserviceaccounts
 * @since windows6.1
 */
export NetEnumerateServiceAccounts(ServerName, Flags, AccountsCount, Accounts) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

    AccountsCountMarshal := AccountsCount is VarRef ? "uint*" : "ptr"
    AccountsMarshal := Accounts is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetEnumerateServiceAccounts", "ptr", ServerName, "uint", Flags, AccountsCountMarshal, AccountsCount, AccountsMarshal, Accounts, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Tests whether the specified standalone managed service account (sMSA) or group managed service account (gMSA) exists in the Netlogon store on the specified server.
 * @param {PWSTR} ServerName The value of this parameter must be <b>NULL</b>.
 * @param {PWSTR} AccountName The name of the account to be tested.
 * @param {Pointer<BOOL>} IsService <b>TRUE</b> if the specified service account exists on the specified server; otherwise, <b>FALSE</b>.
 * @returns {NTSTATUS} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netisserviceaccount
 * @since windows6.1
 */
export NetIsServiceAccount(ServerName, AccountName, IsService) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    AccountName := AccountName is String ? StrPtr(AccountName) : AccountName

    IsServiceMarshal := IsService is VarRef ? "int*" : "ptr"

    result := DllCall("NETAPI32.dll\NetIsServiceAccount", "ptr", ServerName, "ptr", AccountName, IsServiceMarshal, IsService, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PWSTR} ServerName 
 * @param {PWSTR} AccountName 
 * @param {Pointer<BOOL>} IsService 
 * @param {Pointer<MSA_INFO_ACCOUNT_TYPE>} AccountType 
 * @returns {NTSTATUS} 
 */
export NetIsServiceAccount2(ServerName, AccountName, IsService, AccountType) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    AccountName := AccountName is String ? StrPtr(AccountName) : AccountName

    IsServiceMarshal := IsService is VarRef ? "int*" : "ptr"
    AccountTypeMarshal := AccountType is VarRef ? "int*" : "ptr"

    result := DllCall("NETAPI32.dll\NetIsServiceAccount2", "ptr", ServerName, "ptr", AccountName, IsServiceMarshal, IsService, AccountTypeMarshal, AccountType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Gets information about the specified managed service account.
 * @param {PWSTR} ServerName The value of this parameter must be <b>NULL</b>.
 * @param {PWSTR} AccountName The name of the account to be created.
 * @param {Integer} InfoLevel Specifies the format of the data returned in the <i>Buffer</i> parameter. This can be the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>Buffer</i> parameter contains an <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-msa_info_0">MSA_INFO_0</a> structure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Pointer<Integer>>} _Buffer Information about the specified service account.
 * 
 * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
 * @returns {NTSTATUS} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netqueryserviceaccount
 * @since windows6.1
 */
export NetQueryServiceAccount(ServerName, AccountName, InfoLevel, _Buffer) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    AccountName := AccountName is String ? StrPtr(AccountName) : AccountName

    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetQueryServiceAccount", "ptr", ServerName, "ptr", AccountName, "uint", InfoLevel, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The NetAlertRaise function notifies all registered clients when a particular event occurs.
 * @remarks
 * No special group membership is required to successfully execute the 
 * <b>NetAlertRaise</b> function.
 * 
 * The alerter service must be running on the client computer when you call the 
 * <b>NetAlertRaise</b> function, or the function fails with ERROR_FILE_NOT_FOUND.
 * @param {PWSTR} AlertType A pointer to a constant string that specifies the alert class (type of alert) to raise. This parameter can be one of the following predefined values, or a user-defined alert class for network applications. The event name for an alert can be any text string. 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Name</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_ADMIN_EVENT"></a><a id="alert_admin_event"></a><dl>
 * <dt><b>ALERT_ADMIN_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An administrator's intervention is required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_ERRORLOG_EVENT"></a><a id="alert_errorlog_event"></a><dl>
 * <dt><b>ALERT_ERRORLOG_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An entry was added to the error log.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_MESSAGE_EVENT"></a><a id="alert_message_event"></a><dl>
 * <dt><b>ALERT_MESSAGE_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A user or application received a broadcast message.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_PRINT_EVENT"></a><a id="alert_print_event"></a><dl>
 * <dt><b>ALERT_PRINT_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A print job completed or a print error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_USER_EVENT"></a><a id="alert_user_event"></a><dl>
 * <dt><b>ALERT_USER_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An application or resource was used.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} _Buffer A pointer to the data to send to the clients listening for the interrupting message. The data should begin with a fixed-length 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-std_alert">STD_ALERT</a> structure followed by additional message data in one 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-admin_other_info">ADMIN_OTHER_INFO</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-errlog_other_info">ERRLOG_OTHER_INFO</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-print_other_info">PRINT_OTHER_INFO</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-user_other_info">USER_OTHER_INFO</a> structure. Finally, the buffer should include any required variable-length information. For more information, see the code sample in the following Remarks section. 
 * 
 * 
 * 
 * 
 * The calling application must allocate and free the memory for all structures and variable data. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Integer} BufferSize The size, in bytes, of the message buffer.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code and a can be one of the following error codes. For a list of all possible error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
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
 * A parameter is incorrect. This error is returned if the <i>AlertEventName</i>  parameter is <b>NULL</b> or an empty string, the <i>Buffer</i>  parameter is <b>NULL</b>, or the <i>BufferSize</i>  parameter is less than the size of the <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-std_alert">STD_ALERT</a> structure plus the fixed size for the additional message data structure. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned on Windows Vista and later since the Alerter service is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmalert/nf-lmalert-netalertraise
 * @since windows5.0
 */
export NetAlertRaise(AlertType, _Buffer, BufferSize) {
    AlertType := AlertType is String ? StrPtr(AlertType) : AlertType

    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("NETAPI32.dll\NetAlertRaise", "ptr", AlertType, _BufferMarshal, _Buffer, "uint", BufferSize, UInt32)
    return result
}

/**
 * The NetAlertRaiseEx function notifies all registered clients when a particular event occurs. You can call this extended function to simplify the sending of an alert message because NetAlertRaiseEx does not require that you specify a STD_ALERT structure.
 * @remarks
 * No special group membership is required to successfully execute the 
 * <b>NetAlertRaiseEx</b> function.
 * 
 * The alerter service must be running on the client computer when you call the 
 * <b>NetAlertRaiseEx</b> function, or the function fails with ERROR_FILE_NOT_FOUND.
 * @param {PWSTR} AlertType A pointer to a constant string that specifies the alert class (type of alert) to raise. This parameter can be one of the following predefined values, or a user-defined alert class for network applications. (The event name for an alert can be any text string.) 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Name</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_ADMIN_EVENT"></a><a id="alert_admin_event"></a><dl>
 * <dt><b>ALERT_ADMIN_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An administrator's intervention is required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_ERRORLOG_EVENT"></a><a id="alert_errorlog_event"></a><dl>
 * <dt><b>ALERT_ERRORLOG_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An entry was added to the error log.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_MESSAGE_EVENT"></a><a id="alert_message_event"></a><dl>
 * <dt><b>ALERT_MESSAGE_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A user or application received a broadcast message.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_PRINT_EVENT"></a><a id="alert_print_event"></a><dl>
 * <dt><b>ALERT_PRINT_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A print job completed or a print error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ALERT_USER_EVENT"></a><a id="alert_user_event"></a><dl>
 * <dt><b>ALERT_USER_EVENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An application or resource was used.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} VariableInfo A pointer to the data to send to the clients listening for the interrupting message. The data should consist of one 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-admin_other_info">ADMIN_OTHER_INFO</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-errlog_other_info">ERRLOG_OTHER_INFO</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-print_other_info">PRINT_OTHER_INFO</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-user_other_info">USER_OTHER_INFO</a> structure followed by any required variable-length information. For more information, see the code sample in the following Remarks section. 
 * 
 * 
 * 
 * 
 * The calling application must allocate and free the memory for all structures and variable data. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Integer} VariableInfoSize The number of bytes of variable information in the buffer pointed to by the <i>VariableInfo</i> parameter.
 * @param {PWSTR} ServiceName A pointer to a constant string that specifies the name of the service raising the interrupting message.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code and a can be one of the following error codes. For a list of all possible error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
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
 * A parameter is incorrect. This error is returned if the <i>AlertEventName</i>  parameter is <b>NULL</b> or an empty string, the <i>ServiceName</i>  parameter is <b>NULL</b> or an empty string, the <i>VariableInfo</i>  parameter is <b>NULL</b>, or the <i>VariableInfoSize</i>  parameter is greater than 512 minus the size of the <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-std_alert">STD_ALERT</a> structure. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned on Windows Vista and later since the Alerter service is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmalert/nf-lmalert-netalertraiseex
 * @since windows5.0
 */
export NetAlertRaiseEx(AlertType, VariableInfo, VariableInfoSize, ServiceName) {
    AlertType := AlertType is String ? StrPtr(AlertType) : AlertType
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName

    VariableInfoMarshal := VariableInfo is VarRef ? "ptr" : "ptr"

    result := DllCall("NETAPI32.dll\NetAlertRaiseEx", "ptr", AlertType, VariableInfoMarshal, VariableInfo, "uint", VariableInfoSize, "ptr", ServiceName, UInt32)
    return result
}

/**
 * The NetMessageNameAdd function registers a message alias in the message name table. The function requires that the messenger service be started.
 * @remarks
 * Only members of the Administrators local group can successfully execute the 
 * <b>NetMessageNameAdd</b> function on a remote server.
 * 
 * The forward action flag is no longer a parameter to the LAN Manager 2.<i>x</i><b>NetMessageNameAdd</b> function because message forwarding is no longer supported. If the 
 * <b>NetMessageNameAdd</b> function detects that a forwarded version of <i>msgname</i> exists on the network, the function will fail with error NERR_Already_Exists.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} msgname Pointer to a constant string that specifies the message alias to add. The string cannot be more than 15 characters long.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the appropriate
 *         access to complete the operation.
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
 * A parameter is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This request is not supported. This error is returned on Windows Vista and later.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_AlreadyExists</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The message alias already exists on this computer. For more information, see the following Remarks section.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_DuplicateName</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The name specified is already in use as a message alias on the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NetworkError</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A general failure occurred in the network hardware.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_TooManyNames</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The maximum number of message aliases has been exceeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagenameadd
 * @since windows5.0
 */
export NetMessageNameAdd(servername, msgname) {
    servername := servername is String ? StrPtr(servername) : servername
    msgname := msgname is String ? StrPtr(msgname) : msgname

    result := DllCall("NETAPI32.dll\NetMessageNameAdd", "ptr", servername, "ptr", msgname, UInt32)
    return result
}

/**
 * The NetMessageNameEnum function lists the message aliases that receive messages on a specified computer. The function requires that the messenger service be started.
 * @remarks
 * Only members of the Administrators local group can successfully execute the 
 * <b>NetMessageNameEnum</b> function on a remote server.
 * 
 * To retrieve information about a particular message alias in the message name table, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmmsg/nf-lmmsg-netmessagenamegetinfo">NetMessageNameGetInfo</a> function.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen Specifies the preferred maximum length of the returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread Pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
 * @param {Pointer<Integer>} resume_handle Pointer to a value that contains a resume handle which is used to continue an existing message alias search. The handle should be zero on the first call and left unchanged for subsequent calls. If <i>resume_handle</i> is <b>NULL</b>, no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the appropriate
 *         access to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
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
 * A parameter is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This request is not supported. This error is returned on Windows Vista and later.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_BufTooSmall</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The supplied buffer is too small.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagenameenum
 * @since windows5.0
 */
export NetMessageNameEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resume_handleMarshal := resume_handle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetMessageNameEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resume_handleMarshal, resume_handle, UInt32)
    return result
}

/**
 * The NetMessageNameGetInfo function retrieves information about a particular message alias in the message name table. The function requires that the messenger service be started.
 * @remarks
 * Only members of the Administrators local group can successfully execute the 
 * <b>NetMessageNameGetInfo</b> function on a remote server.
 * 
 * To list all the message aliases in a message name table, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmmsg/nf-lmmsg-netmessagenameenum">NetMessageNameEnum</a> function.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} msgname Pointer to a constant string that specifies the message alias for which to return information.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the appropriate
 *         access to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
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
 * A parameter is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This request is not supported. This error is returned on Windows Vista and later.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotLocalName</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The message alias is not on the local computer.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagenamegetinfo
 * @since windows5.0
 */
export NetMessageNameGetInfo(servername, msgname, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    msgname := msgname is String ? StrPtr(msgname) : msgname

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetMessageNameGetInfo", "ptr", servername, "ptr", msgname, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetMessageNameDel function deletes a message alias in the message name table. The function requires that the messenger service be started.
 * @remarks
 * Only members of the Administrators local group can successfully execute the 
 * <b>NetMessageNameDel</b> function on a remote server.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} msgname Pointer to a constant string that specifies the message alias to delete. The string cannot be more than 15 characters long.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the appropriate
 *         access to complete the operation.
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
 * A parameter is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This request is not supported. This error is returned on Windows Vista and later.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_DelComputerName</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A message alias that is also a computer name cannot be deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_IncompleteDel</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The message alias was not successfully deleted from all networks.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NameInUse</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The message alias is currently in use. Try again later.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NotLocalName</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The message alias is not on the local computer.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagenamedel
 * @since windows5.0
 */
export NetMessageNameDel(servername, msgname) {
    servername := servername is String ? StrPtr(servername) : servername
    msgname := msgname is String ? StrPtr(msgname) : msgname

    result := DllCall("NETAPI32.dll\NetMessageNameDel", "ptr", servername, "ptr", msgname, UInt32)
    return result
}

/**
 * The NetMessageBufferSend function sends a buffer of information to a registered message alias.
 * @remarks
 * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the securable object. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Server Operators can call this function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs and ACEs, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * @param {PWSTR} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} msgname Pointer to a constant string that specifies the message alias to which the message buffer should be sent.
 * @param {PWSTR} fromname Pointer to a constant string specifying who the message is from. If this parameter is <b>NULL</b>, the message is sent from the local computer name.
 * @param {Pointer<Integer>} buf Pointer to a buffer that contains the message text. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Integer} buflen Specifies a value that contains the length, in bytes, of the message text pointed to by the <i>buf</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the appropriate
 *         access to complete the operation.
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
 * A parameter is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This request is not supported. This error is returned on Windows Vista and later.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NameNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name could not be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NetworkError</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A general failure occurred in the network hardware.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagebuffersend
 * @since windows5.0
 */
export NetMessageBufferSend(servername, msgname, fromname, buf, buflen) {
    servername := servername is String ? StrPtr(servername) : servername
    msgname := msgname is String ? StrPtr(msgname) : msgname
    fromname := fromname is String ? StrPtr(fromname) : fromname

    bufMarshal := buf is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetMessageBufferSend", "ptr", servername, "ptr", msgname, "ptr", fromname, bufMarshal, buf, "uint", buflen, UInt32)
    return result
}

/**
 * The NetRemoteTOD function returns the time of day information from a specified server.
 * @remarks
 * No special group membership is required to successfully execute the 
 * <b>NetRemoteTOD</b> function.
 * @param {PWSTR} UncServerName Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Pointer<Pointer<Integer>>} BufferPtr Pointer to the address that receives the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmremutl/ns-lmremutl-time_of_day_info">TIME_OF_DAY_INFO</a> information structure. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmremutl/nf-lmremutl-netremotetod
 * @since windows5.0
 */
export NetRemoteTOD(UncServerName, BufferPtr) {
    UncServerName := UncServerName is String ? StrPtr(UncServerName) : UncServerName

    BufferPtrMarshal := BufferPtr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetRemoteTOD", "ptr", UncServerName, BufferPtrMarshal, BufferPtr, UInt32)
    return result
}

/**
 * The NetRemoteComputerSupports function queries the redirector to retrieve the optional features the remote system supports.
 * @remarks
 * No special group membership is required to successfully execute the 
 * <b>NetRemoteComputerSupports</b> function.
 * @param {PWSTR} UncServerName Pointer to a constant string that specifies the name of the remote server to query. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS} OptionsWanted 
 * @param {Pointer<Integer>} OptionsSupported Pointer to a value that receives a set of bit flags. The flags indicate which features specified by the <i>OptionsWanted</i> parameter are implemented on the computer specified by the <i>UncServerName</i> parameter. (All other bits are set to zero.) 
 * 
 * 
 * 
 * 
 * The value of this parameter is valid only when the 
 * <b>NetRemoteComputerSupports</b> function returns NERR_Success.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
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
 * Either the <i>OptionsWanted</i> parameter or the <i>OptionsSupported</i> parameter is <b>NULL</b>; both parameters are required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmremutl/nf-lmremutl-netremotecomputersupports
 * @since windows5.0
 */
export NetRemoteComputerSupports(UncServerName, OptionsWanted, OptionsSupported) {
    UncServerName := UncServerName is String ? StrPtr(UncServerName) : UncServerName

    OptionsSupportedMarshal := OptionsSupported is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetRemoteComputerSupports", "ptr", UncServerName, NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS, OptionsWanted, OptionsSupportedMarshal, OptionsSupported, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @returns {Integer} 
 */
export NetReplGetInfo(servername, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetReplGetInfo", "ptr", servername, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf 
 * @param {Pointer<Integer>} parm_err 
 * @returns {Integer} 
 */
export NetReplSetInfo(servername, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetReplSetInfo", "ptr", servername, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf 
 * @param {Pointer<Integer>} parm_err 
 * @returns {Integer} 
 */
export NetReplExportDirAdd(servername, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetReplExportDirAdd", "ptr", servername, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {PWSTR} dirname 
 * @returns {Integer} 
 */
export NetReplExportDirDel(servername, dirname) {
    servername := servername is String ? StrPtr(servername) : servername
    dirname := dirname is String ? StrPtr(dirname) : dirname

    result := DllCall("NETAPI32.dll\NetReplExportDirDel", "ptr", servername, "ptr", dirname, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @param {Integer} prefmaxlen 
 * @param {Pointer<Integer>} entriesread 
 * @param {Pointer<Integer>} totalentries 
 * @param {Pointer<Integer>} resumehandle 
 * @returns {Integer} 
 */
export NetReplExportDirEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resumehandleMarshal := resumehandle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetReplExportDirEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resumehandleMarshal, resumehandle, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {PWSTR} dirname 
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @returns {Integer} 
 */
export NetReplExportDirGetInfo(servername, dirname, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    dirname := dirname is String ? StrPtr(dirname) : dirname

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetReplExportDirGetInfo", "ptr", servername, "ptr", dirname, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {PWSTR} dirname 
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf 
 * @param {Pointer<Integer>} parm_err 
 * @returns {Integer} 
 */
export NetReplExportDirSetInfo(servername, dirname, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername
    dirname := dirname is String ? StrPtr(dirname) : dirname

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetReplExportDirSetInfo", "ptr", servername, "ptr", dirname, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {PWSTR} dirname 
 * @returns {Integer} 
 */
export NetReplExportDirLock(servername, dirname) {
    servername := servername is String ? StrPtr(servername) : servername
    dirname := dirname is String ? StrPtr(dirname) : dirname

    result := DllCall("NETAPI32.dll\NetReplExportDirLock", "ptr", servername, "ptr", dirname, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {PWSTR} dirname 
 * @param {Integer} unlockforce 
 * @returns {Integer} 
 */
export NetReplExportDirUnlock(servername, dirname, unlockforce) {
    servername := servername is String ? StrPtr(servername) : servername
    dirname := dirname is String ? StrPtr(dirname) : dirname

    result := DllCall("NETAPI32.dll\NetReplExportDirUnlock", "ptr", servername, "ptr", dirname, "uint", unlockforce, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf 
 * @param {Pointer<Integer>} parm_err 
 * @returns {Integer} 
 */
export NetReplImportDirAdd(servername, level, buf, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetReplImportDirAdd", "ptr", servername, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {PWSTR} dirname 
 * @returns {Integer} 
 */
export NetReplImportDirDel(servername, dirname) {
    servername := servername is String ? StrPtr(servername) : servername
    dirname := dirname is String ? StrPtr(dirname) : dirname

    result := DllCall("NETAPI32.dll\NetReplImportDirDel", "ptr", servername, "ptr", dirname, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @param {Integer} prefmaxlen 
 * @param {Pointer<Integer>} entriesread 
 * @param {Pointer<Integer>} totalentries 
 * @param {Pointer<Integer>} resumehandle 
 * @returns {Integer} 
 */
export NetReplImportDirEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resumehandleMarshal := resumehandle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetReplImportDirEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resumehandleMarshal, resumehandle, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {PWSTR} dirname 
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @returns {Integer} 
 */
export NetReplImportDirGetInfo(servername, dirname, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    dirname := dirname is String ? StrPtr(dirname) : dirname

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetReplImportDirGetInfo", "ptr", servername, "ptr", dirname, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {PWSTR} dirname 
 * @returns {Integer} 
 */
export NetReplImportDirLock(servername, dirname) {
    servername := servername is String ? StrPtr(servername) : servername
    dirname := dirname is String ? StrPtr(dirname) : dirname

    result := DllCall("NETAPI32.dll\NetReplImportDirLock", "ptr", servername, "ptr", dirname, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} servername 
 * @param {PWSTR} dirname 
 * @param {Integer} unlockforce 
 * @returns {Integer} 
 */
export NetReplImportDirUnlock(servername, dirname, unlockforce) {
    servername := servername is String ? StrPtr(servername) : servername
    dirname := dirname is String ? StrPtr(dirname) : dirname

    result := DllCall("NETAPI32.dll\NetReplImportDirUnlock", "ptr", servername, "ptr", dirname, "uint", unlockforce, UInt32)
    return result
}

/**
 * The NetServerEnum function lists all servers of the specified type that are visible in a domain.
 * @remarks
 * The
 * 				<b>NetServerEnum</b> function is used to list all servers of the specified type that are visible in a domain. For example, an application can call 
 * <b>NetServerEnum</b> to list all domain controllers only or all servers that run instances of SQL server only.
 * 
 * An application combine the bit masks for various server types in the <i>servertype</i> parameter to list several types. For example, a value of SV_TYPE_WORKSTATION | SVTYPE_SERVER (0x00000003) combines the bit masks for SV_TYPE_WORKSTATION (0x00000001) and SV_TYPE_SERVER (0x00000002).
 * 
 * If you require more information for a specific server, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a> function.
 * 
 * No special group membership is required to successfully execute the 
 * <b>NetServerEnum</b> function.
 * 
 * If you specify the value SV_TYPE_LOCAL_LIST_ONLY, the 
 * <b>NetServerEnum</b> function returns the list of servers that the browser maintains internally. This has meaning only on the master browser (or on a computer that has been the master browser in the past). The master browser is the computer that currently has rights to determine which computers can be servers or workstations on the network.
 * 
 * If there are no servers found that match the types specified in the <i>servertype</i> parameter, the 
 * <b>NetServerEnum</b> function returns the <i>bufptr</i> parameter as <b>NULL</b> and DWORD values pointed to by the <i>entriesread</i> and <i>totalentries</i> parameters are set to zero.
 * 
 * The 
 * <b>NetServerEnum</b> function depends on the browser service being installed and running. If no browser servers are found, then <b>NetServerEnum</b> fails with ERROR_NO_BROWSER_SERVERS_FOUND.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same function you can achieve by calling the network management server functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * @param {PWSTR} servername Reserved; must be <b>NULL</b>.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen The preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread A pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries A pointer to a value that receives the total number of visible servers and workstations on the network. Note that applications should consider this value only as a hint.
 * @param {NET_SERVER_TYPE} servertype 
 * @param {PWSTR} domain A pointer to a constant string that specifies the name of the domain for which a list of servers is to be returned. The domain name must be a NetBIOS domain name (for example, microsoft). 
 * The <b>NetServerEnum</b> function does not support DNS-style names (for example, microsoft.com). 
 * 
 * If this parameter is <b>NULL</b>, the primary domain is implied.
 * @param {Pointer<Integer>} resume_handle Reserved; must be set to zero.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes:
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access was denied.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The parameter is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * <dt>234</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_BROWSER_SERVERS_FOUND</b></dt>
 * <dt>6118</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No browser servers found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * <dt>50</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_RemoteErr</b></dt>
 * <dt>2127</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A remote error occurred with no data returned by the server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_ServerNotStarted</b></dt>
 * <dt>2114</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The server service is not started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_ServiceNotInstalled</b></dt>
 * <dt>2184</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The service has not been started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_WkstaNotStarted</b></dt>
 * <dt>2138</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Workstation service has not been started. The local workstation service is used  to communicate with a downlevel remote server.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netserverenum
 * @since windows5.0
 */
export NetServerEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, servertype, domain, resume_handle) {
    servername := servername is String ? StrPtr(servername) : servername
    domain := domain is String ? StrPtr(domain) : domain

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resume_handleMarshal := resume_handle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServerEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, NET_SERVER_TYPE, servertype, "ptr", domain, resume_handleMarshal, resume_handle, UInt32)
    return result
}

/**
 * The NetServerGetInfo function retrieves current configuration information for the specified server.
 * @remarks
 * Only the Administrators or Server Operators local group, or those with Print or Server Operator group membership, can successfully execute the 
 * <b>NetServerGetInfo</b> function at level 102. No special group membership is required for level 100 or level 101 calls.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management server functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * @param {PWSTR} servername Pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. 
 * 
 * 
 * 
 * 
 * This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * <dt>124</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * <dt>8</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_ServerNotStarted</b></dt>
 * <dt>2114</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The server service is not started.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservergetinfo
 * @since windows5.0
 */
export NetServerGetInfo(servername, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServerGetInfo", "ptr", servername, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetServerSetInfo function sets a server's operating parameters; it can set them individually or collectively. The information is stored in a way that allows it to remain in effect after the system has been reinitialized.
 * @remarks
 * Only members of the Administrators or Server Operators local group can successfully execute the 
 * <b>NetServerSetInfo</b> function.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management server functions. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
 * 
 * If the 
 * <b>NetServerSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>ParmError</i> parameter to indicate the first member of the server information structure that is invalid. (A server information structure begins with SERVER_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>ParmError</i> parameter and the corresponding structure member that is in error. (The prefix sv*_ indicates that the member can begin with multiple prefixes, for example, sv101_ or sv402_.)
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>SV_PLATFORM_ID_PARMNUM</td>
 * <td>sv*_platform_id</td>
 * </tr>
 * <tr>
 * <td>SV_NAME_PARMNUM</td>
 * <td>sv*_name</td>
 * </tr>
 * <tr>
 * <td>SV_VERSION_MAJOR_PARMNUM</td>
 * <td>sv*_version_major</td>
 * </tr>
 * <tr>
 * <td>SV_VERSION_MINOR_PARMNUM</td>
 * <td>sv*_version_minor</td>
 * </tr>
 * <tr>
 * <td>SV_TYPE_PARMNUM</td>
 * <td>sv*_type</td>
 * </tr>
 * <tr>
 * <td>SV_COMMENT_PARMNUM</td>
 * <td>sv*_comment</td>
 * </tr>
 * <tr>
 * <td>SV_USERS_PARMNUM</td>
 * <td>sv*_users</td>
 * </tr>
 * <tr>
 * <td>SV_DISC_PARMNUM</td>
 * <td>sv*_disc</td>
 * </tr>
 * <tr>
 * <td>SV_HIDDEN_PARMNUM</td>
 * <td>sv*_hidden</td>
 * </tr>
 * <tr>
 * <td>SV_ANNOUNCE_PARMNUM</td>
 * <td>sv*_announce</td>
 * </tr>
 * <tr>
 * <td>SV_ANNDELTA_PARMNUM</td>
 * <td>sv*_anndelta</td>
 * </tr>
 * <tr>
 * <td>SV_USERPATH_PARMNUM</td>
 * <td>sv*_userpath</td>
 * </tr>
 * <tr>
 * <td>SV_ULIST_MTIME_PARMNUM</td>
 * <td>sv*_ulist_mtime</td>
 * </tr>
 * <tr>
 * <td>SV_GLIST_MTIME_PARMNUM</td>
 * <td>sv*_glist_mtime</td>
 * </tr>
 * <tr>
 * <td>SV_ALIST_MTIME_PARMNUM</td>
 * <td>sv*_alist_mtime</td>
 * </tr>
 * <tr>
 * <td>SV_ALERTS_PARMNUM</td>
 * <td>sv*_alerts</td>
 * </tr>
 * <tr>
 * <td>SV_SECURITY_PARMNUM</td>
 * <td>sv*_security</td>
 * </tr>
 * <tr>
 * <td>SV_NUMADMIN_PARMNUM</td>
 * <td>sv*_numadmin</td>
 * </tr>
 * <tr>
 * <td>SV_LANMASK_PARMNUM</td>
 * <td>sv*_lanmask</td>
 * </tr>
 * <tr>
 * <td>SV_GUESTACC_PARMNUM</td>
 * <td>sv*_guestacc</td>
 * </tr>
 * <tr>
 * <td>SV_CHDEVQ_PARMNUM</td>
 * <td>sv*_chdevq</td>
 * </tr>
 * <tr>
 * <td>SV_CHDEVJOBS_PARMNUM</td>
 * <td>sv*_chdevjobs</td>
 * </tr>
 * <tr>
 * <td>SV_CONNECTIONS_PARMNUM</td>
 * <td>sv*_connections</td>
 * </tr>
 * <tr>
 * <td>SV_SHARES_PARMNUM</td>
 * <td>sv*_shares</td>
 * </tr>
 * <tr>
 * <td>SV_OPENFILES_PARMNUM</td>
 * <td>sv*_openfiles</td>
 * </tr>
 * <tr>
 * <td>SV_SESSOPENS_PARMNUM</td>
 * <td>sv*_sessopens</td>
 * </tr>
 * <tr>
 * <td>SV_SESSVCS_PARMNUM</td>
 * <td>sv*_sessvcs</td>
 * </tr>
 * <tr>
 * <td>SV_SESSREQS_PARMNUM</td>
 * <td>sv*_sessreqs</td>
 * </tr>
 * <tr>
 * <td>SV_OPENSEARCH_PARMNUM</td>
 * <td>sv*_opensearch</td>
 * </tr>
 * <tr>
 * <td>SV_ACTIVELOCKS_PARMNUM</td>
 * <td>sv*_activelocks</td>
 * </tr>
 * <tr>
 * <td>SV_NUMREQBUF_PARMNUM</td>
 * <td>sv*_numreqbuf</td>
 * </tr>
 * <tr>
 * <td>SV_SIZREQBUF_PARMNUM</td>
 * <td>sv*_sizreqbuf</td>
 * </tr>
 * <tr>
 * <td>SV_NUMBIGBUF_PARMNUM</td>
 * <td>sv*_numbigbuf</td>
 * </tr>
 * <tr>
 * <td>SV_NUMFILETASKS_PARMNUM</td>
 * <td>sv*_numfiletasks</td>
 * </tr>
 * <tr>
 * <td>SV_ALERTSCHED_PARMNUM</td>
 * <td>sv*_alertsched</td>
 * </tr>
 * <tr>
 * <td>SV_ERRORALERT_PARMNUM</td>
 * <td>sv*_erroralert</td>
 * </tr>
 * <tr>
 * <td>SV_LOGONALERT_PARMNUM</td>
 * <td>sv*_logonalert</td>
 * </tr>
 * <tr>
 * <td>SV_ACCESSALERT_PARMNUM</td>
 * <td>sv*_accessalert</td>
 * </tr>
 * <tr>
 * <td>SV_DISKALERT_PARMNUM</td>
 * <td>sv*_diskalert</td>
 * </tr>
 * <tr>
 * <td>SV_NETIOALERT_PARMNUM</td>
 * <td>sv*_netioalert</td>
 * </tr>
 * <tr>
 * <td>SV_MAXAUDITSZ_PARMNUM</td>
 * <td>sv*_maxauditsz</td>
 * </tr>
 * <tr>
 * <td>SV_SRVHEURISTICS_PARMNUM</td>
 * <td>sv*_srvheuristics</td>
 * </tr>
 * <tr>
 * <td>SV_TIMESOURCE_PARMNUM</td>
 * <td>sv*_timesource</td>
 * </tr>
 * </table>
 * @param {PWSTR} servername Pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to a buffer that receives the server information. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} ParmError Pointer to a value that receives the index of the first member of the server information structure that causes the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
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
 * The specified parameter is invalid. For more information, see the following Remarks section.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netserversetinfo
 * @since windows5.0
 */
export NetServerSetInfo(servername, level, buf, ParmError) {
    servername := servername is String ? StrPtr(servername) : servername

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    ParmErrorMarshal := ParmError is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServerSetInfo", "ptr", servername, "uint", level, bufMarshal, buf, ParmErrorMarshal, ParmError, UInt32)
    return result
}

/**
 * The NetServerDiskEnum function retrieves a list of disk drives on a server. The function returns an array of three-character strings (a drive letter, a colon, and a terminating null character).
 * @remarks
 * Only members of the Administrators or Server Operators local group can successfully execute the 
 * <b>NetServerDiskEnum</b> function on a remote computer.
 * 
 * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same results you can achieve by calling the network management server functions. For more information, see 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a> interface reference.
 * @param {PWSTR} servername A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level The level of information required. A value of zero is the only valid level.
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the buffer that receives the data. The data is an array of three-character strings (a drive letter, a colon, and a terminating null character). This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen The preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>. 
 * 
 * <div class="alert"><b>Note</b>  This parameter is currently ignored.</div>
 * <div> </div>
 * @param {Pointer<Integer>} entriesread A pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
 * @param {Pointer<Integer>} resume_handle A pointer to a value that contains a resume handle which is used to continue an existing server disk search. The handle should be zero on the first call and left unchanged for subsequent calls. If the <i>resume_handle</i> parameter is a <b>NULL</b> pointer, then no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if a remote server was specified in <i>servername</i> parameter, the remote server only supports remote RPC calls using the legacy Remote Access Protocol mechanism, and this request is not supported. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netserverdiskenum
 * @since windows5.0
 */
export NetServerDiskEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resume_handleMarshal := resume_handle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServerDiskEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resume_handleMarshal, resume_handle, UInt32)
    return result
}

/**
 * The NetServerComputerNameAdd function enumerates the transports on which the specified server is active, and binds the emulated server name to each of the transports.
 * @remarks
 * Only members of the Administrators or Server Operators local group can successfully execute the 
 * <b>NetServerComputerNameAdd</b> function.
 * 
 * The server specified by the <i>ServerName</i> parameter continues to support all names it was supporting, and additionally begins to support new names supplied by successful calls to the 
 * <b>NetServerComputerNameAdd</b> function.
 * 
 * Name emulation that results from a call to 
 * <b>NetServerComputerNameAdd</b> ceases when the server reboots or restarts. To discontinue name emulation set by a previous call to 
 * <b>NetServerComputerNameAdd</b> without restarting or rebooting, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservercomputernamedel">NetServerComputerNameDel</a> function.
 * 
 * The 
 * <b>NetServerComputerNameAdd</b> function is typically used when a system administrator replaces a server, but wants to keep the conversion transparent to users.
 * @param {PWSTR} ServerName Pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} EmulatedDomainName Pointer to a string that contains the domain name the specified server should use when announcing its presence using the <i>EmulatedServerName</i>. This parameter is optional.
 * @param {PWSTR} EmulatedServerName Pointer to a null-terminated character string that contains the emulated name the server should begin supporting in addition to the name specified by the <i>ServerName</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success. Note that 
 * <b>NetServerComputerNameAdd</b> succeeds if the emulated server name specified is added to at least one transport.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DUP_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A duplicate name exists on the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DOMAINNAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The domain name could not be found on the network.
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
 * The specified parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservercomputernameadd
 * @since windows5.0
 */
export NetServerComputerNameAdd(ServerName, EmulatedDomainName, EmulatedServerName) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    EmulatedDomainName := EmulatedDomainName is String ? StrPtr(EmulatedDomainName) : EmulatedDomainName
    EmulatedServerName := EmulatedServerName is String ? StrPtr(EmulatedServerName) : EmulatedServerName

    result := DllCall("NETAPI32.dll\NetServerComputerNameAdd", "ptr", ServerName, "ptr", EmulatedDomainName, "ptr", EmulatedServerName, UInt32)
    return result
}

/**
 * The NetServerComputerNameDel function causes the specified server to cease supporting the emulated server name set by a previous call to the NetServerComputerNameAdd function. The function does this by unbinding network transports from the emulated name.
 * @remarks
 * Only members of the Administrators or Server Operators local group can successfully execute the 
 * <b>NetServerComputerNameDel</b> function.
 * @param {PWSTR} ServerName Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} EmulatedServerName Pointer to a null-terminated character string that contains the emulated name the server should stop supporting. The server continues to support all other server names it was supporting.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
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
 * The specified parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NetNameNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The share name does not exist.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservercomputernamedel
 * @since windows5.0
 */
export NetServerComputerNameDel(ServerName, EmulatedServerName) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    EmulatedServerName := EmulatedServerName is String ? StrPtr(EmulatedServerName) : EmulatedServerName

    result := DllCall("NETAPI32.dll\NetServerComputerNameDel", "ptr", ServerName, "ptr", EmulatedServerName, UInt32)
    return result
}

/**
 * The NetServerTransportAdd function binds the server to the transport protocol.
 * @remarks
 * Only members of the Administrators or Server Operators local group can successfully execute the 
 * <b>NetServerTransportAdd</b> function.
 * 
 * If you add a transport protocol to a server using a call to the 
 * <b>NetServerTransportAdd</b> function, the connection will not remain after the server reboots or restarts.
 * @param {PWSTR} servername A pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level Specifies the information level of the data. This parameter can be the following value. 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="0"></a><dl>
 * <dt><b>0</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies information about the transport protocol, including name, address, and location on the network. The <i>bufptr</i> parameter points to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_0">SERVER_TRANSPORT_INFO_0</a> structure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} bufptr A pointer to the buffer that contains the data.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DUP_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A duplicate name exists on the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DOMAINNAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The domain name could not be found on the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
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
 * A parameter is invalid. 
 * 
 * This error is returned if the <b>svti0_transportname</b> or <b>svti0_transportaddress</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_0">SERVER_TRANSPORT_INFO_0</a> structure pointed to by the <i>bufptr</i> parameter is <b>NULL</b>. This error is also returned if the <b>svti0_transportaddresslength</b> member in the <b>SERVER_TRANSPORT_INFO_0</b> structure pointed to by the <i>bufptr</i> parameter is zero or larger than MAX_PATH (defined in the Windef.h header file). 
 * 
 * This error is also returned for other invalid parameters.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservertransportadd
 * @since windows5.0
 */
export NetServerTransportAdd(servername, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServerTransportAdd", "ptr", servername, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetServerTransportAddEx function binds the specified server to the transport protocol.
 * @remarks
 * Only members of the Administrators or Server Operators local group can successfully execute the 
 * <b>NetServerTransportAddEx</b> function.
 * 
 * If you add a transport protocol to a server using a call to the 
 * <b>NetServerTransportAddEx</b> function, the connection will not remain after the server reboots or restarts.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservercomputernameadd">NetServerComputerNameAdd</a> function is a utility function. It combines the features of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportenum">NetServerTransportEnum</a> function and the 
 * <b>NetServerTransportAddEx</b> function, allowing you to specify an emulated server name.
 * 
 * On Windows Server 2008  and Windows Vista with Service Pack 1 (SP1), every name registered with the Windows remote file server (SRV) is designated as either a scoped name or a non-scoped name.  Every share that is added to the system will then either be attached to all of the non-scoped names, or to a single scoped name.  Applications that wish to use the scoping features are responsible for both registering the new name as a scoped endpoint and then creating the shares with an appropriate scope. In this way, legacy uses of the Network Management and Network Share Management functions are not affected in any way since they continue to register shares and names as non-scoped names.  
 * 
 * A scoped endpoint is created by calling the <b>NetServerTransportAddEx</b> function with the <i>level</i> parameter set to 2 and the <i>bufptr</i> parameter pointed to a <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a> structure with the <b>SVTI2_SCOPED_NAME</b> bit value set in <b>svti2_flags</b> member. A scoped endpoint is also created by calling the <b>NetServerTransportAddEx</b> function with the <i>level</i> parameter set to 3 and the <i>bufptr</i> parameter pointed to a <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_3">SERVER_TRANSPORT_INFO_3</a> structure with the <b>SVTI2_SCOPED_NAME</b> bit value set in <b>svti3_flags</b> member. 
 * 
 * When the <b>SVTI2_SCOPED_NAME</b> bit value is set for a transport, then shares can be added with a corresponding server name (the <b>shi503_servername</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/ns-lmshare-share_info_503">SHARE_INFO_503</a> structure) in a scoped fashion using the <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netshareadd">NetShareAdd</a> function.  If there is no transport registered with the <b>SVTI2_SCOPED_NAME</b> bit value and the name provided in <b>shi503_servername</b> member, then the share add in a scoped fashion will not succeed.
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netshareadd">NetShareAdd</a> function is used to add a scoped share on a remote server specified in the <i>servername</i> parameter. The remote server specified in the <b>shi503_servername</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/ns-lmshare-share_info_503">SHARE_INFO_503</a> passed in the <i>bufptr</i> parameter must have been bound to a transport protocol using the <b>NetServerTransportAddEx</b> function as a scoped endpoint. The <b>SVTI2_SCOPED_NAME</b> flag must have been specified in the <b>shi503_servername</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a> or <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_3">SERVER_TRANSPORT_INFO_3</a> structure for the transport protocol.  The <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharedelex">NetShareDelEx</a> function is used to delete a scoped share.  The <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharegetinfo">NetShareGetInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> functions are to used to get and set information on a scoped share.  
 * 
 * Scoped endpoints are generally used by the cluster namespace.
 * @param {PWSTR} servername A pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Integer>} bufptr A pointer to the buffer that contains the data. The format of this data depends on the value of the <i>level</i> parameter. 
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DUP_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A duplicate name exists on the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DOMAINNAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The domain name could not be found on the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
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
 * A parameter is invalid. 
 * 
 * This error is returned if the transport name or transport address member in the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_0">SERVER_TRANSPORT_INFO_0</a>, <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_1">SERVER_TRANSPORT_INFO_1</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_3">SERVER_TRANSPORT_INFO_3</a> structure pointed to by the <i>bufptr</i> parameter is <b>NULL</b>. This error is also returned if the transport address length member in the <b>SERVER_TRANSPORT_INFO_0</b>, <b>SERVER_TRANSPORT_INFO_1</b>, 
 * <b>SERVER_TRANSPORT_INFO_2</b>, or 
 * <b>SERVER_TRANSPORT_INFO_3</b> structure pointed to by the <i>bufptr</i> parameter is zero or larger than MAX_PATH (defined in the <i>Windef.h</i> header file). This error is also returned if the flags member of the <b>SERVER_TRANSPORT_INFO_2</b>, or 
 * <b>SERVER_TRANSPORT_INFO_3</b> structure pointed to by the <i>bufptr</i> parameter contains an illegal value.
 * 
 * This error is also returned for other invalid parameters.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservertransportaddex
 * @since windows5.0
 */
export NetServerTransportAddEx(servername, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServerTransportAddEx", "ptr", servername, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetServerTransportDel function unbinds (or disconnects) the transport protocol from the server. Effectively, the server can no longer communicate with clients using the specified transport protocol (such as TCP or XNS).
 * @remarks
 * Only members of the Administrators or Server Operators local group can successfully execute the 
 * <b>NetServerTransportDel</b> function.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Integer>} bufptr Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
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
 * The specified parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NetNameNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The share name does not exist.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservertransportdel
 * @since windows5.0
 */
export NetServerTransportDel(servername, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServerTransportDel", "ptr", servername, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetServerTransportEnum function supplies information about transport protocols that are managed by the server.
 * @remarks
 * Only Authenticated Users can successfully call this function.<b>Windows XP/2000:  </b>No special group membership is required to successfully execute this function.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen Specifies the preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread Pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
 * @param {Pointer<Integer>} resume_handle Pointer to a value that contains a resume handle which is used to continue an existing server transport search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specified for the <i>level</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_BufTooSmall</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The supplied buffer is too small.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservertransportenum
 * @since windows5.0
 */
export NetServerTransportEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resume_handleMarshal := resume_handle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServerTransportEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resume_handleMarshal, resume_handle, UInt32)
    return result
}

/**
 * The NetServiceControl function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
 * @param {PWSTR} servername 
 * @param {PWSTR} service 
 * @param {Integer} opcode 
 * @param {Integer} arg 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/NetMgmt/netservicecontrol
 */
export NetServiceControl(servername, service, opcode, arg, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    service := service is String ? StrPtr(service) : service

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServiceControl", "ptr", servername, "ptr", service, "uint", opcode, "uint", arg, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetServiceEnum function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
 * @param {PWSTR} servername 
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @param {Integer} prefmaxlen 
 * @param {Pointer<Integer>} entriesread 
 * @param {Pointer<Integer>} totalentries 
 * @param {Pointer<Integer>} resume_handle 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/NetMgmt/netserviceenum
 */
export NetServiceEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resume_handleMarshal := resume_handle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServiceEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resume_handleMarshal, resume_handle, UInt32)
    return result
}

/**
 * The NetServiceGetInfo function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
 * @param {PWSTR} servername 
 * @param {PWSTR} service 
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/NetMgmt/netservicegetinfo
 */
export NetServiceGetInfo(servername, service, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    service := service is String ? StrPtr(service) : service

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServiceGetInfo", "ptr", servername, "ptr", service, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetServiceInstall function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
 * @param {PWSTR} servername 
 * @param {PWSTR} service 
 * @param {Integer} argc 
 * @param {Pointer<PWSTR>} argv 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/NetMgmt/netserviceinstall
 */
export NetServiceInstall(servername, service, argc, argv, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername
    service := service is String ? StrPtr(service) : service

    argvMarshal := argv is VarRef ? "ptr*" : "ptr"
    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetServiceInstall", "ptr", servername, "ptr", service, "uint", argc, argvMarshal, argv, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetUseAdd function establishes a connection between the local computer and a remote server.
 * @remarks
 * You can also use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection2a">WNetAddConnection2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection3a">WNetAddConnection3</a> functions to redirect a local device to a network resource.
 * 
 * No special group membership is required to call the 
 * <b>NetUseAdd</b> function. This function cannot be executed on a remote server except in cases of downlevel compatibility.
 * 
 * This function applies only to the Server Message Block (LAN Manager Workstation) client. The <b>NetUseAdd</b> function does not support Distributed File System (DFS) shares. To add a share using a different network provider (WebDAV or a DFS share, for example), use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection2a">WNetAddConnection2</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection3a">WNetAddConnection3</a> function.
 * 
 * 
 * If the 
 * <b>NetUseAdd</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>ParmError</i> parameter to indicate the first member of the information structure that is invalid. (The information structure begins with USE_INFO_ and its format is specified by the <i>Level</i> parameter.) The following table lists the values that can be returned in the <i>ParmError</i> parameter and the corresponding structure member that is in error. (The prefix ui<i>*</i>_ indicates that the member can begin with multiple prefixes, for example, ui1_ or ui2_.)
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>USE_LOCAL_PARMNUM</td>
 * <td>1</td>
 * <td>ui<i>*</i>_local</td>
 * </tr>
 * <tr>
 * <td>USE_REMOTE_PARMNUM</td>
 * <td>2</td>
 * <td>ui<i>*</i>_remote</td>
 * </tr>
 * <tr>
 * <td>USE_PASSWORD_PARMNUM</td>
 * <td>3</td>
 * <td>ui<i>*</i>_password</td>
 * </tr>
 * <tr>
 * <td>USE_ASGTYPE_PARMNUM</td>
 * <td>4</td>
 * <td>ui<i>*</i>_asg_type</td>
 * </tr>
 * <tr>
 * <td>USE_USERNAME_PARMNUM</td>
 * <td>5</td>
 * <td>ui<i>*</i>_username</td>
 * </tr>
 * <tr>
 * <td>USE_DOMAINNAME_PARMNUM</td>
 * <td>6</td>
 * <td>ui<i>*</i>_domainname</td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} servername The UNC name of the computer on which to execute this function. If this parameter is <b>NULL</b>, then the local computer is used. If the <i>UncServerName</i> parameter specified is a remote computer, then the remote computer must support remote RPC calls using the legacy Remote Access Protocol mechanism. 
 * 
 * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
 * @param {Integer} LevelFlags 
 * @param {Pointer<Integer>} buf A pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>Level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err A pointer to a value that receives the index of the first member of the information structure in error when the ERROR_INVALID_PARAMETER error is returned. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmuse/nf-lmuse-netuseadd
 * @since windows5.0
 */
export NetUseAdd(servername, LevelFlags, buf, parm_err) {
    servernameMarshal := servername is VarRef ? "char*" : "ptr"
    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUseAdd", servernameMarshal, servername, "uint", LevelFlags, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetUseDel function ends a connection to a shared resource.
 * @remarks
 * The <b>NetUseDel</b> function applies only to the Server Message Block (LAN Manager Workstation) client. The <b>NetUseDel</b> function does not support Distributed File System (DFS) shares or other network file systems. To terminate a connection to a share using a different network provider (WebDAV or a DFS share, for example), use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetcancelconnection2a">WNetCancelConnection2</a> function.
 * 
 * 
 * No special group membership is required to call the 
 * <b>NetUseDel</b> function. This function cannot be executed on a remote server except in cases of downlevel compatibility.
 * @param {PWSTR} UncServerName The UNC name of the computer on which to execute this function. If this is parameter is <b>NULL</b>, then the local computer is used. 
 * 
 * If the <i>UncServerName</i> parameter specified is a remote computer, then the remote computer must support remote RPC calls using the legacy Remote Access Protocol mechanism. 
 * 
 * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
 * @param {PWSTR} UseName A pointer to a string that specifies the path of the connection to delete.
 * 
 * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
 * @param {FORCE_LEVEL_FLAGS} ForceLevelFlags The level of force to use in deleting the connection.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmuse/nf-lmuse-netusedel
 * @since windows5.0
 */
export NetUseDel(UncServerName, UseName, ForceLevelFlags) {
    UncServerName := UncServerName is String ? StrPtr(UncServerName) : UncServerName
    UseName := UseName is String ? StrPtr(UseName) : UseName

    result := DllCall("NETAPI32.dll\NetUseDel", "ptr", UncServerName, "ptr", UseName, FORCE_LEVEL_FLAGS, ForceLevelFlags, UInt32)
    return result
}

/**
 * The NetUseEnum function lists all current connections between the local computer and resources on remote servers.
 * @remarks
 * No special group membership is required to call the 
 * <b>NetUseEnum</b> function. This function cannot be executed on a remote server except in cases of downlevel compatibility using the legacy Remote Access Protocol.
 * 
 * To retrieve information about one network connection, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/nf-lmuse-netusegetinfo">NetUseGetInfo</a> function.
 * 
 * This function applies only to the Server Message Block (LAN Manager Workstation) client. The <b>NetUseEnum</b> function does not support Distributed File System (DFS) shares. To enumerate shares using a different network provider (WebDAV or a DFS share, for example), use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetopenenuma">WNetOpenEnum</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetcloseenum">WNetCloseEnum</a> functions.
 * @param {PWSTR} UncServerName The UNC name of the computer on which to execute this function. If this is parameter is <b>NULL</b>, then the local computer is used. If the <i>UncServerName</i> parameter specified is a remote computer, then the remote computer must support remote RPC calls using the legacy Remote Access Protocol mechanism.  
 * 
 * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
 * @param {Integer} LevelFlags 
 * @param {Pointer<Pointer<Integer>>} BufPtr A pointer to the buffer that receives the information structures. The format of this data depends on the value of the <i>Level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function when the information is no longer needed. Note that you must free the buffer even if the function fails with <b>ERROR_MORE_DATA</b>.
 * @param {Integer} PreferedMaximumSize The preferred maximum length, in bytes, of the data to return. If <b>MAX_PREFERRED_LENGTH</b> is specified, the function allocates the amount of memory required for the data. If another value is specified in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns <b>ERROR_MORE_DATA</b>. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} EntriesRead A pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} TotalEntries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
 * @param {Pointer<Integer>} ResumeHandle A pointer to a value that contains a resume handle which is used to continue the search. The handle should be zero on the first call and left unchanged for subsequent calls. If <i>ResumeHandle</i> is <b>NULL</b>, then no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
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
 * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>BufPtr</i> or <i>entriesread</i> parameters.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is more data to return. This error is returned if the buffer size is insufficient to hold all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if the  <i>UncServerName</i> parameter was not <b>NULL</b> and the remote server does not support remote RPC calls using the legacy Remote Access Protocol mechanism. 
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
 * Use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmuse/nf-lmuse-netuseenum
 * @since windows5.0
 */
export NetUseEnum(UncServerName, LevelFlags, BufPtr, PreferedMaximumSize, EntriesRead, TotalEntries, ResumeHandle) {
    UncServerName := UncServerName is String ? StrPtr(UncServerName) : UncServerName

    BufPtrMarshal := BufPtr is VarRef ? "ptr*" : "ptr"
    EntriesReadMarshal := EntriesRead is VarRef ? "uint*" : "ptr"
    TotalEntriesMarshal := TotalEntries is VarRef ? "uint*" : "ptr"
    ResumeHandleMarshal := ResumeHandle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUseEnum", "ptr", UncServerName, "uint", LevelFlags, BufPtrMarshal, BufPtr, "uint", PreferedMaximumSize, EntriesReadMarshal, EntriesRead, TotalEntriesMarshal, TotalEntries, ResumeHandleMarshal, ResumeHandle, UInt32)
    return result
}

/**
 * The NetUseGetInfo function retrieves information about a connection to a shared resource.
 * @remarks
 * No special group membership is required to call the 
 * <b>NetUseGetInfo</b> function. This function cannot be executed on a remote server except in cases of downlevel compatibility.
 * 
 * To list all current connections between the local computer and resources on remote servers, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/nf-lmuse-netuseenum">NetUseEnum</a> function.
 * 
 * This function applies only to the Server Message Block (LAN Manager Workstation) client. The <b>NetUseGetInfo</b> function does not support Distributed File System (DFS) shares. To retrieve information for a share using a different network provider (WebDAV or a DFS share, for example), use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetconnectiona">WNetGetConnection</a> function.
 * @param {PWSTR} UncServerName The UNC name of computer on which to execute this function. If this is parameter is <b>NULL</b>, then the local computer is used. If the <i>UncServerName</i> parameter specified is a remote computer, then the remote computer must support remote RPC calls using the legacy Remote Access Protocol mechanism. 
 * 
 * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
 * @param {PWSTR} UseName A pointer to a string that specifies the name of the connection for which to return information.
 * 
 * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
 * @param {Integer} LevelFlags 
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>Level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmuse/nf-lmuse-netusegetinfo
 * @since windows5.0
 */
export NetUseGetInfo(UncServerName, UseName, LevelFlags, bufptr) {
    UncServerName := UncServerName is String ? StrPtr(UncServerName) : UncServerName
    UseName := UseName is String ? StrPtr(UseName) : UseName

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetUseGetInfo", "ptr", UncServerName, "ptr", UseName, "uint", LevelFlags, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetWkstaGetInfo function returns information about the configuration of a workstation.
 * @remarks
 * <b>Windows Server 2003 and Windows XP:  </b> If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the ACL for the securable object. To enable anonymous access, the user Anonymous must be a member of the "Pre-Windows 2000 compatible access" group. This is because anonymous tokens do not include the Everyone group SID by default. If you call this function on a member server or workstation, all authenticated users can view the information. Anonymous access is also permitted if the EveryoneIncludesAnonymous policy setting allows anonymous access. Anonymous access is always permitted for level 100. If you call this function at level 101, authenticated users can view the information. Members of the Administrators, and the Server, System and Print Operator local groups can view information at levels 102 and 502. For more information about restricting anonymous access, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * <b>Windows 2000:  </b>If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the securable object. The default ACL permits all authenticated users and members of the "
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. By default, the "Pre-Windows 2000 compatible access" group includes Everyone as a member. This enables anonymous access to the information if the system allows anonymous access. If you call this function on a member server or workstation, all authenticated users can view the information. Anonymous access is also permitted if the RestrictAnonymous policy setting allows anonymous access.
 * 
 * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0400 or later. For more information,see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>level</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstagetinfo
 * @since windows5.0
 */
export NetWkstaGetInfo(servername, level, bufptr) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetWkstaGetInfo", "ptr", servername, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetWkstaSetInfo function configures a workstation with information that remains in effect after the system has been reinitialized.
 * @remarks
 * Only members of the Administrators group can successfully execute the 
 * <b>NetWkstaSetInfo</b> function on a remote server.
 * 
 * The
 * 				<b>NetWkstaSetInfo</b> function calls the workstation service on the local system or a remote system. Only a limited number of members of the <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/ns-lmwksta-wksta_info_502">WKSTA_INFO_502</a> structure can actually be changed using the <b>NetWkstaSetInfo</b> function. No errors are returned if a member is set that is ignored by the workstation service. The workstation service is primarily configured using settings in the registry. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/nf-lmwksta-netwkstausersetinfo">NetWkstaUserSetInfo</a> function can be used instead of the <b>NetWkstaSetInfo</b> function to set configuration information on the local system. The <b>NetWkstaUserSetInfo</b> function calls the Local Security Authority (LSA). 
 * 
 * If the 
 * <b>NetWkstaSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the workstation information structure that is invalid. (A workstation information structure begins with WKSTA_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix wki*_ indicates that the member can begin with multiple prefixes, for example, wki100_ or wki402_.)
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>WKSTA_PLATFORM_ID_PARMNUM</td>
 * <td>wki*_platform_id</td>
 * </tr>
 * <tr>
 * <td>WKSTA_COMPUTERNAME_PARMNUM</td>
 * <td>wki*_computername</td>
 * </tr>
 * <tr>
 * <td>WKSTA_LANGROUP_PARMNUM</td>
 * <td>wki*_langroup</td>
 * </tr>
 * <tr>
 * <td>WKSTA_VER_MAJOR_PARMNUM</td>
 * <td>wki*_ver_major</td>
 * </tr>
 * <tr>
 * <td>WKSTA_VER_MINOR_PARMNUM</td>
 * <td>wki*_ver_minor</td>
 * </tr>
 * <tr>
 * <td>WKSTA_LOGGED_ON_USERS_PARMNUM</td>
 * <td>wki*_logged_on_users</td>
 * </tr>
 * <tr>
 * <td>WKSTA_LANROOT_PARMNUM</td>
 * <td>wki*_lanroot</td>
 * </tr>
 * <tr>
 * <td>WKSTA_LOGON_DOMAIN_PARMNUM</td>
 * <td>wki*_logon_domain</td>
 * </tr>
 * <tr>
 * <td>WKSTA_LOGON_SERVER_PARMNUM</td>
 * <td>wki*_logon_server</td>
 * </tr>
 * <tr>
 * <td>WKSTA_CHARWAIT_PARMNUM</td>
 * <td>wki*_char_wait</td>
 * </tr>
 * <tr>
 * <td>WKSTA_CHARTIME_PARMNUM</td>
 * <td>wki*_collection_time</td>
 * </tr>
 * <tr>
 * <td>WKSTA_CHARCOUNT_PARMNUM</td>
 * <td>wki*_maximum_collection_count</td>
 * </tr>
 * <tr>
 * <td>WKSTA_KEEPCONN_PARMNUM</td>
 * <td>wki*_keep_conn</td>
 * </tr>
 * <tr>
 * <td>WKSTA_KEEPSEARCH_PARMNUM</td>
 * <td>wki*_keep_search</td>
 * </tr>
 * <tr>
 * <td>WKSTA_MAXCMDS_PARMNUM</td>
 * <td>wki*_max_cmds</td>
 * </tr>
 * <tr>
 * <td>WKSTA_NUMWORKBUF_PARMNUM</td>
 * <td>wki*_num_work_buf</td>
 * </tr>
 * <tr>
 * <td>WKSTA_MAXWRKCACHE_PARMNUM</td>
 * <td>wki*_max_wrk_cache</td>
 * </tr>
 * <tr>
 * <td>WKSTA_SESSTIMEOUT_PARMNUM</td>
 * <td>wki*_sess_timeout</td>
 * </tr>
 * <tr>
 * <td>WKSTA_SIZERROR_PARMNUM</td>
 * <td>wki*_siz_error</td>
 * </tr>
 * <tr>
 * <td>WKSTA_NUMALERTS_PARMNUM</td>
 * <td>wki*_num_alerts</td>
 * </tr>
 * <tr>
 * <td>WKSTA_NUMSERVICES_PARMNUM</td>
 * <td>wki*_num_services</td>
 * </tr>
 * <tr>
 * <td>WKSTA_ERRLOGSZ_PARMNUM</td>
 * <td>wki*_errlog_sz</td>
 * </tr>
 * <tr>
 * <td>WKSTA_PRINTBUFTIME_PARMNUM</td>
 * <td>wki*_print_buf_time</td>
 * </tr>
 * <tr>
 * <td>WKSTA_NUMCHARBUF_PARMNU</td>
 * <td>wki*_num_char_buf</td>
 * </tr>
 * <tr>
 * <td>WKSTA_SIZCHARBUF_PARMNUM</td>
 * <td>wki*_siz_char_buf</td>
 * </tr>
 * <tr>
 * <td>WKSTA_WRKHEURISTICS_PARMNUM</td>
 * <td>wki*_wrk_heuristics</td>
 * </tr>
 * <tr>
 * <td>WKSTA_MAILSLOTS_PARMNUM</td>
 * <td>wki*_mailslots</td>
 * </tr>
 * <tr>
 * <td>WKSTA_MAXTHREADS_PARMNUM</td>
 * <td>wki*_max_threads</td>
 * </tr>
 * <tr>
 * <td>WKSTA_SIZWORKBUF_PARMNUM</td>
 * <td>wki*_siz_work_buf</td>
 * </tr>
 * <tr>
 * <td>WKSTA_NUMDGRAMBUF_PARMNUM</td>
 * <td>wki*_num_dgram_buf</td>
 * </tr>
 * </table>
 *  
 * 
 * The workstation service parameter settings are stored in the registry, not in the LanMan.ini file used previously by LAN Manager. The 
 * <b>NetWkstaSetInfo</b> function does not change the values in the LanMan.ini file. When the workstation service is stopped and restarted, workstation parameters are reset to the default values specified in the registry (unless they are overwritten by command-line parameters). Values set by previous calls to 
 * <b>NetWkstaSetInfo</b> can be overwritten when workstation parameters are reset.
 * @param {PWSTR} servername A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Integer>} _buffer A pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err A pointer to a value that receives the index of the first member of the workstation information structure that causes the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the Remarks section.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
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
 * One of the function parameters is invalid. For more information, see the following Remarks section.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstasetinfo
 * @since windows5.0
 */
export NetWkstaSetInfo(servername, level, _buffer, parm_err) {
    servername := servername is String ? StrPtr(servername) : servername

    _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetWkstaSetInfo", "ptr", servername, "uint", level, _bufferMarshal, _buffer, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetWkstaUserGetInfo function returns information about the currently logged-on user. This function must be called in the context of the logged-on user.
 * @remarks
 * The 
 * <b>NetWkstaUserGetInfo</b> function only works locally.
 * @param {PWSTR} reserved This parameter must be set to <b>NULL</b>.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>bufptr</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system ran out of memory resources. Either the network manager configuration is incorrect, or the program is running on a system with insufficient memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>level</i> parameter is invalid.
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
 * One of the function parameters is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstausergetinfo
 * @since windows5.0
 */
export NetWkstaUserGetInfo(reserved, level, bufptr) {
    reserved := reserved is String ? StrPtr(reserved) : reserved

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetWkstaUserGetInfo", "ptr", reserved, "uint", level, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetWkstaUserSetInfo function sets the user-specific information about the configuration elements for a workstation.
 * @remarks
 * The 
 * <b>NetWkstaUserSetInfo</b> function only works locally. Administrator group membership is required.
 * 
 * Domain names in the <b>wkui1101_oth_domains</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/ns-lmwksta-wksta_user_info_1101">WKSTA_USER_INFO_1101</a> structure are separated by spaces. An empty list is valid. A <b>NULL</b> pointer means to leave the member unmodified. The <b>wkui1101_oth_domains</b> member cannot be set with MS-DOS. When setting this element, 
 * <b>NetWkstaUserSetInfo</b> rejects the request if the name list was invalid or if a name could not be added to one or more of the network adapters managed by the system.
 * 
 * If the 
 * <b>NetWkstaUserSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the member of the workstation user information structure that is invalid. (A workstation user information structure begins with WKSTA_USER_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the value that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix wkui*_ indicates that the member can begin with multiple prefixes, for example, wkui0_ or wkui1_.)
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>WKSTA_OTH_DOMAINS_PARMNUM</td>
 * <td>wkui*_oth_domains</td>
 * </tr>
 * </table>
 * @param {PWSTR} reserved This parameter must be set to zero.
 * @param {Integer} level 
 * @param {Pointer<Integer>} buf Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err Pointer to a value that receives the index of the first parameter that causes the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>level</i> parameter is invalid.
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
 * One of the function parameters is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstausersetinfo
 * @since windows5.0
 */
export NetWkstaUserSetInfo(reserved, level, buf, parm_err) {
    reserved := reserved is String ? StrPtr(reserved) : reserved

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetWkstaUserSetInfo", "ptr", reserved, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * The NetWkstaUserEnum function lists information about all users currently logged on to the workstation. This list includes interactive, service and batch logons.
 * @remarks
 * Note that since the 
 * <b>NetWkstaUserEnum</b> function lists entries for service and batch logons, as well as for interactive logons, the function can return entries for users who have logged off a workstation. This can occur, for example, when a user calls a service that impersonates the user. In this instance, 
 * <b>NetWkstaUserEnum</b> returns an entry for the user until the service stops impersonating the user.
 * 
 * <b>Windows Server 2003 and Windows XP:  </b>If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the ACL for the securable object. To enable anonymous access, the user Anonymous must be a member of the "Pre-Windows 2000 compatible access" group. This is because anonymous tokens do not include the Everyone group SID by default. If you call this function on a member server or workstation, all authenticated users can view the information. Anonymous access is also permitted if the RestrictAnonymous policy setting permits anonymous access. If the RestrictAnonymous policy setting does not permit anonymous access, only an administrator can successfully execute the function. Members of the Administrators, and the Server, System and Print Operator local groups can also view information. For more information about restricting anonymous access, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
 * 
 * <b>Windows 2000:  </b>If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the securable object. The default ACL permits all authenticated users and members of the "
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. By default, the "Pre-Windows 2000 compatible access" group includes Everyone as a member. This enables anonymous access to the information if the system allows anonymous access. If you call this function on a member server or workstation, all authenticated users can view the information. Anonymous access is also permitted if the RestrictAnonymous policy setting allows anonymous access.
 * 
 * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0400 or later. For more information,see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level 
 * @param {Pointer<Pointer<Integer>>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} prefmaxlen Specifies the preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread Pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
 * @param {Pointer<Integer>} resumehandle Pointer to a value that contains a resume handle which is used to continue an existing search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>level</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstauserenum
 * @since windows5.0
 */
export NetWkstaUserEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
    servername := servername is String ? StrPtr(servername) : servername

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resumehandleMarshal := resumehandle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetWkstaUserEnum", "ptr", servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resumehandleMarshal, resumehandle, UInt32)
    return result
}

/**
 * Not supported. (NetWkstaTransportAdd)
 * @remarks
 * Only members of the Administrators local group can successfully execute the 
 * <b>NetWkstaTransportAdd</b> function.
 * 
 * If the 
 * <b>NetWkstaTransportAdd</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the member of the 
 * <b>WKSTA_TRANSPORT_INFO_0</b> structure that is invalid. The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Member</th>
 * </tr>
 * <tr>
 * <td>TRANSPORT_QUALITYOFSERVICE_PARMNUM</td>
 * <td><b>wkti0_quality_of_service</b></td>
 * </tr>
 * <tr>
 * <td>TRANSPORT_NAME_PARMNUM</td>
 * <td><b>wkti0_transport_name</b></td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used. 
 * 
 * 
 * This string must begin with \\.
 * @param {Integer} level Specifies the information level of the data. This parameter can be the following value. 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="0"></a><dl>
 * <dt><b>0</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies workstation transport protocol information. The <i>buf</i> parameter points to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/ns-lmwksta-wksta_transport_info_0">WKSTA_TRANSPORT_INFO_0</a> structure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} buf Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} parm_err Pointer to a value that receives the index of the first parameter that causes the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The level parameter, which indicates what level of data structure information is available, is invalid.
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
 * One of the function parameters is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstatransportadd
 */
export NetWkstaTransportAdd(servername, level, buf, parm_err) {
    servernameMarshal := servername is VarRef ? "char*" : "ptr"
    bufMarshal := buf is VarRef ? "char*" : "ptr"
    parm_errMarshal := parm_err is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetWkstaTransportAdd", servernameMarshal, servername, "uint", level, bufMarshal, buf, parm_errMarshal, parm_err, UInt32)
    return result
}

/**
 * Not supported. (NetWkstaTransportDel)
 * @remarks
 * Only members of the Administrators local group can successfully execute the 
 * <b>NetWkstaTransportDel</b> function.
 * @param {PWSTR} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used. 
 * 
 * 
 * This string must begin with \\.
 * @param {PWSTR} transportname Pointer to a string that specifies the name of the transport protocol to disconnect from the redirector.
 * @param {FORCE_LEVEL_FLAGS} ucond 
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user does not have access to the requested information.
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
 * One of the function parameters is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UseNotFound</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network connection does not exist.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstatransportdel
 */
export NetWkstaTransportDel(servername, transportname, ucond) {
    servername := servername is String ? StrPtr(servername) : servername
    transportname := transportname is String ? StrPtr(transportname) : transportname

    result := DllCall("NETAPI32.dll\NetWkstaTransportDel", "ptr", servername, "ptr", transportname, FORCE_LEVEL_FLAGS, ucond, UInt32)
    return result
}

/**
 * The NetWkstaTransportEnum function supplies information about transport protocols that are managed by the redirector, which is the software on the client computer that generates file requests to the server computer.
 * @remarks
 * No special group membership is required to successfully execute the 
 * <b>NetWkstaTransportEnum</b> function.
 * @param {Pointer<Integer>} servername A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} level The level of information requested for the data. This parameter can be the following value. 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="0"></a><dl>
 * <dt><b>0</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Return workstation transport protocol information. The <i>bufptr</i> parameter points to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/ns-lmwksta-wksta_transport_info_0">WKSTA_TRANSPORT_INFO_0</a> structures.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Pointer<Integer>>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with <b>ERROR_MORE_DATA</b> or <b>NERR_BufTooSmall</b>.
 * @param {Integer} prefmaxlen The preferred maximum length of returned data, in bytes. If you specify <b>MAX_PREFERRED_LENGTH</b>, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns <b>ERROR_MORE_DATA</b> or <b>NERR_BufTooSmall</b>. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} entriesread A pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
 * @param {Pointer<Integer>} resume_handle A pointer to a value that contains a resume handle which is used to continue an existing workstation transport search. The handle should be zero on the first call and left unchanged for subsequent calls. If the <i>resumehandle</i> parameter is a <b>NULL</b> pointer, no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_LEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The level parameter, which indicates what level of data structure information is available, is invalid. This error is returned if the <i>level</i> parameter is specified as a value other than zero.
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
 * One or more parameters was invalid. This error is returned if the <i>bufptr</i> or the <i>entriesread</i> parameters are <b>NULL</b> pointers. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory was available to process the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if a remote server was specified in <i>servername</i> parameter, and this request is not supported on the remote server. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_BufTooSmall</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * More entries are available. Specify a large enough buffer to receive all entries. This error code is defined in the <i>Lmerr.h</i> header file.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstatransportenum
 * @since windows5.0
 */
export NetWkstaTransportEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
    servernameMarshal := servername is VarRef ? "char*" : "ptr"
    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    entriesreadMarshal := entriesread is VarRef ? "uint*" : "ptr"
    totalentriesMarshal := totalentries is VarRef ? "uint*" : "ptr"
    resume_handleMarshal := resume_handle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetWkstaTransportEnum", servernameMarshal, servername, "uint", level, bufptrMarshal, bufptr, "uint", prefmaxlen, entriesreadMarshal, entriesread, totalentriesMarshal, totalentries, resume_handleMarshal, resume_handle, UInt32)
    return result
}

/**
 * The NetApiBufferAllocate function allocates memory from the heap. Use this function only when compatibility with the NetApiBufferFree function is required. Otherwise, use the memory management functions.
 * @remarks
 * No special group membership is required to successfully execute the ApiBuffer functions.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Integer} ByteCount Number of bytes to be allocated.
 * @param {Pointer<Pointer<Void>>} _Buffer Receives a pointer to the allocated buffer.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmapibuf/nf-lmapibuf-netapibufferallocate
 * @since windows5.0
 */
export NetApiBufferAllocate(ByteCount, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetApiBufferAllocate", "uint", ByteCount, _BufferMarshal, _Buffer, UInt32)
    return result
}

/**
 * The NetApiBufferFree function frees the memory that the NetApiBufferAllocate function allocates. Applications should also call NetApiBufferFree to free the memory that other network management functions use internally to return information.
 * @remarks
 * The
 * 				<b>NetApiBufferFree</b> function is used to free memory used by network management functions. This function is used in two cases:
 * 
 * 
 * <ul>
 * <li> To free memory explicitly allocated by calls in an application to the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function when the memory is no longer needed.</li>
 * <li>To free memory allocated internally by calls in an application to remotable network management functions that return information to the caller. The RPC run-time library internally allocates the buffer containing the return information. </li>
 * </ul>
 * 
 * 
 * Many network management functions retrieve information and return this information as a buffer that may contain a complex structure, an array of structures, or an array of nested structures. These functions use the RPC run-time library to internally allocate the buffer containing the return information, whether the call is to a local computer or a remote server. For example, the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netserverenum">NetServerEnum</a> function retrieves a lists of servers and returns this information as an array of  structures pointed to by the <i>bufptr</i> parameter. When the function is successful, memory is allocated internally by the  <b>NetServerEnum</b> function to store the array of structures returned in the <i>bufptr</i> parameter to the application. When this array of structures is no longer needed,  the <b>NetApiBufferFree</b> function should be called by the application with the <i>Buffer</i> parameter set to the <i>bufptr</i> parameter returned by  <b>NetServerEnum</b> to free this internal memory used. In these cases, the <b>NetApiBufferFree</b> function frees all of the internal memory allocated for the buffer including memory for nested structures, pointers to strings, and other data.
 * 
 * No special group membership is required to successfully execute the <b>NetApiBufferFree</b> function or any of the other <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/apibuffer-functions">ApiBuffer functions</a>.
 * 
 * For a code sample that demonstrates how to use of the <b>NetApiBufferFree</b> function to free memory explicitly allocated by an application, see 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function.
 * 
 * For a code sample that demonstrates how to use of the <b>NetApiBufferFree</b> function to free memory internally allocated by a network management function to return information, see 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netserverenum">NetServerEnum</a> function.
 * @param {Pointer<Void>} _Buffer A pointer to a buffer returned previously by another network management function or memory allocated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmapibuf/nf-lmapibuf-netapibufferfree
 * @since windows5.0
 */
export NetApiBufferFree(_Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("NETAPI32.dll\NetApiBufferFree", _BufferMarshal, _Buffer, UInt32)
    return result
}

/**
 * The NetApiBufferReallocate function changes the size of a buffer allocated by a previous call to the NetApiBufferAllocate function.
 * @remarks
 * No special group membership is required to successfully execute the ApiBuffer functions.
 * 
 * For a code sample that demonstrates how to use the network management 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/apibuffer-functions">ApiBuffer functions</a>, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a>.
 * @param {Pointer<Void>} OldBuffer Pointer to the buffer returned by a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function.
 * @param {Integer} NewByteCount Specifies the new size of the buffer, in bytes.
 * @param {Pointer<Pointer<Void>>} NewBuffer Receives the pointer to the reallocated buffer.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmapibuf/nf-lmapibuf-netapibufferreallocate
 * @since windows5.0
 */
export NetApiBufferReallocate(OldBuffer, NewByteCount, NewBuffer) {
    OldBufferMarshal := OldBuffer is VarRef ? "ptr" : "ptr"
    NewBufferMarshal := NewBuffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetApiBufferReallocate", OldBufferMarshal, OldBuffer, "uint", NewByteCount, NewBufferMarshal, NewBuffer, UInt32)
    return result
}

/**
 * The NetApiBufferSize function returns the size, in bytes, of a buffer allocated by a call to the NetApiBufferAllocate function.
 * @remarks
 * No special group membership is required to successfully execute the ApiBuffer functions.
 * 
 * For a code sample that demonstrates how to use the network management 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/apibuffer-functions">ApiBuffer functions</a>, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a>.
 * @param {Pointer<Void>} _Buffer Pointer to a buffer returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function.
 * @param {Pointer<Integer>} ByteCount Receives the size of the buffer, in bytes.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmapibuf/nf-lmapibuf-netapibuffersize
 * @since windows5.0
 */
export NetApiBufferSize(_Buffer, ByteCount) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
    ByteCountMarshal := ByteCount is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetApiBufferSize", _BufferMarshal, _Buffer, ByteCountMarshal, ByteCount, UInt32)
    return result
}

/**
 * The NetErrorLogClear function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
 * @param {PWSTR} UncServerName TBD
 * @param {PWSTR} BackupFile TBD
 * @param {Pointer<Integer>} Reserved TBD
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/lmerrlog/nf-lmerrlog-neterrorlogclear
 */
export NetErrorLogClear(UncServerName, BackupFile, Reserved) {
    UncServerName := UncServerName is String ? StrPtr(UncServerName) : UncServerName
    BackupFile := BackupFile is String ? StrPtr(BackupFile) : BackupFile

    ReservedMarshal := Reserved is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetErrorLogClear", "ptr", UncServerName, "ptr", BackupFile, ReservedMarshal, Reserved, UInt32)
    return result
}

/**
 * The NetErrorLogRead function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
 * @param {PWSTR} UncServerName TBD
 * @param {PWSTR} Reserved1 TBD
 * @param {Pointer<HLOG>} ErrorLogHandle TBD
 * @param {Integer} Offset TBD
 * @param {Pointer<Integer>} Reserved2 TBD
 * @param {Integer} Reserved3 TBD
 * @param {Integer} OffsetFlag TBD
 * @param {Pointer<Pointer<Integer>>} BufPtr TBD
 * @param {Integer} PrefMaxSize TBD
 * @param {Pointer<Integer>} BytesRead TBD
 * @param {Pointer<Integer>} TotalAvailable TBD
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/lmerrlog/nf-lmerrlog-neterrorlogread
 */
export NetErrorLogRead(UncServerName, Reserved1, ErrorLogHandle, Offset, Reserved2, Reserved3, OffsetFlag, BufPtr, PrefMaxSize, BytesRead, TotalAvailable) {
    UncServerName := UncServerName is String ? StrPtr(UncServerName) : UncServerName
    Reserved1 := Reserved1 is String ? StrPtr(Reserved1) : Reserved1

    Reserved2Marshal := Reserved2 is VarRef ? "uint*" : "ptr"
    BufPtrMarshal := BufPtr is VarRef ? "ptr*" : "ptr"
    BytesReadMarshal := BytesRead is VarRef ? "uint*" : "ptr"
    TotalAvailableMarshal := TotalAvailable is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetErrorLogRead", "ptr", UncServerName, "ptr", Reserved1, HLOG.Ptr, ErrorLogHandle, "uint", Offset, Reserved2Marshal, Reserved2, "uint", Reserved3, "uint", OffsetFlag, BufPtrMarshal, BufPtr, "uint", PrefMaxSize, BytesReadMarshal, BytesRead, TotalAvailableMarshal, TotalAvailable, UInt32)
    return result
}

/**
 * The NetErrorLogWrite function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
 * @param {Pointer<Integer>} Reserved1 TBD
 * @param {Integer} Code TBD
 * @param {PWSTR} _Component TBD
 * @param {Pointer<Integer>} _Buffer TBD
 * @param {Integer} NumBytes TBD
 * @param {Pointer<Integer>} MsgBuf TBD
 * @param {Integer} StrCount TBD
 * @param {Pointer<Integer>} Reserved2 TBD
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/lmerrlog/nf-lmerrlog-neterrorlogwrite
 */
export NetErrorLogWrite(Reserved1, Code, _Component, _Buffer, NumBytes, MsgBuf, StrCount, Reserved2) {
    _Component := _Component is String ? StrPtr(_Component) : _Component

    Reserved1Marshal := Reserved1 is VarRef ? "char*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "char*" : "ptr"
    MsgBufMarshal := MsgBuf is VarRef ? "char*" : "ptr"
    Reserved2Marshal := Reserved2 is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetErrorLogWrite", Reserved1Marshal, Reserved1, "uint", Code, "ptr", _Component, _BufferMarshal, _Buffer, "uint", NumBytes, MsgBufMarshal, MsgBuf, "uint", StrCount, Reserved2Marshal, Reserved2, UInt32)
    return result
}

/**
 * The NetConfigGet function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the registry.
 * @param {PWSTR} server TBD
 * @param {PWSTR} _component TBD
 * @param {PWSTR} parameter TBD
 * @param {Pointer<Pointer<Integer>>} bufptr TBD
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/lmconfig/nf-lmconfig-netconfigget
 */
export NetConfigGet(server, _component, parameter, bufptr) {
    server := server is String ? StrPtr(server) : server
    _component := _component is String ? StrPtr(_component) : _component
    parameter := parameter is String ? StrPtr(parameter) : parameter

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetConfigGet", "ptr", server, "ptr", _component, "ptr", parameter, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetConfigGetAll function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the registry.
 * @param {PWSTR} server TBD
 * @param {PWSTR} _component TBD
 * @param {Pointer<Pointer<Integer>>} bufptr TBD
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/lmconfig/nf-lmconfig-netconfiggetall
 */
export NetConfigGetAll(server, _component, bufptr) {
    server := server is String ? StrPtr(server) : server
    _component := _component is String ? StrPtr(_component) : _component

    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetConfigGetAll", "ptr", server, "ptr", _component, bufptrMarshal, bufptr, UInt32)
    return result
}

/**
 * The NetConfigSet function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the registry.
 * @param {PWSTR} server TBD
 * @param {PWSTR} reserved1 TBD
 * @param {PWSTR} _component TBD
 * @param {Integer} level TBD
 * @param {Integer} reserved2 TBD
 * @param {Pointer<Integer>} buf TBD
 * @param {Integer} reserved3 TBD
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/lmconfig/nf-lmconfig-netconfigset
 */
export NetConfigSet(server, reserved1, _component, level, reserved2, buf, reserved3) {
    server := server is String ? StrPtr(server) : server
    reserved1 := reserved1 is String ? StrPtr(reserved1) : reserved1
    _component := _component is String ? StrPtr(_component) : _component

    bufMarshal := buf is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetConfigSet", "ptr", server, "ptr", reserved1, "ptr", _component, "uint", level, "uint", reserved2, bufMarshal, buf, "uint", reserved3, UInt32)
    return result
}

/**
 * The NetAuditClear function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
 * @param {PWSTR} server 
 * @param {PWSTR} backupfile 
 * @param {PWSTR} service 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/NetMgmt/netauditclear
 */
export NetAuditClear(server, backupfile, service) {
    server := server is String ? StrPtr(server) : server
    backupfile := backupfile is String ? StrPtr(backupfile) : backupfile
    service := service is String ? StrPtr(service) : service

    result := DllCall("NETAPI32.dll\NetAuditClear", "ptr", server, "ptr", backupfile, "ptr", service, UInt32)
    return result
}

/**
 * The NetAuditRead function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
 * @param {PWSTR} server 
 * @param {PWSTR} service 
 * @param {Pointer<HLOG>} auditloghandle 
 * @param {Integer} offset 
 * @param {Pointer<Integer>} reserved1 
 * @param {Integer} reserved2 
 * @param {Integer} offsetflag 
 * @param {Pointer<Pointer<Integer>>} bufptr 
 * @param {Integer} prefmaxlen 
 * @param {Pointer<Integer>} bytesread 
 * @param {Pointer<Integer>} totalavailable 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/NetMgmt/netauditread
 */
export NetAuditRead(server, service, auditloghandle, offset, reserved1, reserved2, offsetflag, bufptr, prefmaxlen, bytesread, totalavailable) {
    server := server is String ? StrPtr(server) : server
    service := service is String ? StrPtr(service) : service

    reserved1Marshal := reserved1 is VarRef ? "uint*" : "ptr"
    bufptrMarshal := bufptr is VarRef ? "ptr*" : "ptr"
    bytesreadMarshal := bytesread is VarRef ? "uint*" : "ptr"
    totalavailableMarshal := totalavailable is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetAuditRead", "ptr", server, "ptr", service, HLOG.Ptr, auditloghandle, "uint", offset, reserved1Marshal, reserved1, "uint", reserved2, "uint", offsetflag, bufptrMarshal, bufptr, "uint", prefmaxlen, bytesreadMarshal, bytesread, totalavailableMarshal, totalavailable, UInt32)
    return result
}

/**
 * The NetAuditWrite function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
 * @param {Integer} type 
 * @param {Pointer<Integer>} buf 
 * @param {Integer} numbytes 
 * @param {PWSTR} service 
 * @param {Pointer<Integer>} reserved 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/NetMgmt/netauditwrite
 */
export NetAuditWrite(type, buf, numbytes, service, reserved) {
    service := service is String ? StrPtr(service) : service

    bufMarshal := buf is VarRef ? "char*" : "ptr"
    reservedMarshal := reserved is VarRef ? "char*" : "ptr"

    result := DllCall("NETAPI32.dll\NetAuditWrite", "uint", type, bufMarshal, buf, "uint", numbytes, "ptr", service, reservedMarshal, reserved, UInt32)
    return result
}

/**
 * The NetJoinDomain function joins a computer to a workgroup or domain.
 * @remarks
 * Joining (and unjoining) a computer to a domain or workgroup can be performed only by a member of the Administrators local group on the target computer. Note that the domain administrator can set additional requirements for joining the domain using delegation and assignment of privileges.
 * 
 * If you call the 
 * <b>NetJoinDomain</b> function remotely, you must supply credentials because you cannot delegate credentials under these circumstances.
 * 
 * Different processes, or different threads of the same process, should not call the 
 * <b>NetJoinDomain</b> function at the same time. This situation can leave the computer in an inconsistent state.
 * 
 * If you encounter a problem during a join operation, you should not delete a computer account and immediately follow the deletion with another join attempt. This can lead to replication-related problems that are difficult to investigate. When you delete a computer account, wait until the change has replicated to all domain controllers before attempting another join operation.
 * 
 * A system reboot is required after calling the <b>NetJoinDomain</b> function for the operation to complete.
 * 
 * <b>Windows Server 2003 and Windows XP:  </b>When a call to the 
 * <b>NetJoinDomain</b> function precedes a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrenamemachineindomain">NetRenameMachineInDomain</a> function, you should defer the update of the SPN and DnsHostName properties on the computer object until the rename operation. This is because the join operation can fail in certain situations. An example of such a situation is when the SPN that is derived from the current computer name is not valid in the new domain that the computer is joining, but the SPN derived from the new name that the computer will have after the rename operation is valid in the new domain. In this situation, the call to 
 * <b>NetJoinDomain</b> fails unless you defer the update of the two properties until the rename operation by specifying the NETSETUP_DEFER_SPN_SET flag in the <i>fJoinOptions</i> parameter when you call 
 * <b>NetJoinDomain</b>.
 * @param {PWSTR} lpServer A pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to execute the domain join operation. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} lpDomain A pointer to a constant null-terminated character string that specifies the name of the domain or workgroup to join. 
 * 
 * 
 * 
 * 
 * Optionally, you can specify the preferred domain controller to perform the join operation. In this instance, the string must be of the form  <i>DomainName\MachineName</i>,  where <i>DomainName</i>  is the name of the domain to join, and <i>MachineName</i> is the name of the domain controller to perform the join.
 * @param {PWSTR} lpMachineAccountOU Optionally specifies the pointer to a constant null-terminated character string that contains the RFC 1779 format name of the organizational unit (OU) for the computer account. If you specify this parameter, the string must contain a full path, for example, OU=testOU,DC=domain,DC=Domain,DC=com. Otherwise, this parameter must be <b>NULL</b>.
 * @param {PWSTR} lpAccount A pointer to a constant null-terminated character string that specifies the account name to use when connecting to the domain controller. The string must specify either a domain NetBIOS name and user account (for example, <i>REDMOND\user</i>) or the user principal name (UPN) of the user in the form of an Internet-style login name (for example, "someone@example.com"). If this parameter is <b>NULL</b>, the caller's context is used.
 * @param {PWSTR} lpPassword If the <i>lpAccount</i> parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>. 
 * 
 * 
 * 
 * 
 * You can specify a local machine account password rather than a user password for unsecured joins. For more information, see the description of the NETSETUP_MACHINE_PWD_PASSED flag described in the <i>fJoinOptions</i> parameter.
 * @param {NET_JOIN_DOMAIN_JOIN_OPTIONS} fJoinOptions 
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
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
 * A parameter is incorrect. This error is returned if the <i>lpDomain</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified domain did not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if the computer specified in the <i>lpServer</i> parameter does not support  some of the options passed in the <i>fJoinOptions</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidWorkgroupName</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified workgroup name is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SetupAlreadyJoined</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer is already joined to a domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_WkstaNotStarted</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Workstation service has not been started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A remote procedure call is already in progress for this thread.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote procedure call protocol sequence is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netjoindomain
 * @since windows5.0
 */
export NetJoinDomain(lpServer, lpDomain, lpMachineAccountOU, lpAccount, lpPassword, fJoinOptions) {
    lpServer := lpServer is String ? StrPtr(lpServer) : lpServer
    lpDomain := lpDomain is String ? StrPtr(lpDomain) : lpDomain
    lpMachineAccountOU := lpMachineAccountOU is String ? StrPtr(lpMachineAccountOU) : lpMachineAccountOU
    lpAccount := lpAccount is String ? StrPtr(lpAccount) : lpAccount
    lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword

    result := DllCall("NETAPI32.dll\NetJoinDomain", "ptr", lpServer, "ptr", lpDomain, "ptr", lpMachineAccountOU, "ptr", lpAccount, "ptr", lpPassword, NET_JOIN_DOMAIN_JOIN_OPTIONS, fJoinOptions, UInt32)
    return result
}

/**
 * The NetUnjoinDomain function unjoins a computer from a workgroup or a domain.
 * @remarks
 * Unjoining (and joining) a computer to a domain or workgroup can be performed only by a member of the Administrators local group on the target computer. If you call the 
 * <b>NetUnjoinDomain</b> function remotely, you must supply credentials because you cannot delegate credentials under these circumstances.
 * 
 * Different processes, or different threads of the same process, should not call the 
 * <b>NetUnjoinDomain</b> function at the same time. This situation can leave the computer in an inconsistent state.
 * 
 * A system reboot is required after calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrenamemachineindomain">NetRenameMachineInDomain</a> function for the operation to complete.
 * @param {PWSTR} lpServer A pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} lpAccount A pointer to a constant string that specifies the account name to use when connecting to the domain controller. The string must specify either a domain NetBIOS name and user account (for example, <i>REDMOND\user</i>) or the user principal name (UPN) of the user in the form of an Internet-style login name (for example, "someone@example.com"). If this parameter is <b>NULL</b>, the caller's context is used.
 * @param {PWSTR} lpPassword If the <i>lpAccount</i> parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>.
 * @param {Integer} fUnjoinOptions Specifies the unjoin options. If this parameter is NETSETUP_ACCT_DELETE, the account is disabled when the unjoin occurs. Note that this option does not delete the account. Currently, there are no other unjoin options defined.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
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
 * A parameter is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SetupNotJoined</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer is not currently joined to a domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SetupDomainController</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This computer is a domain controller and cannot be unjoined from a domain.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netunjoindomain
 * @since windows5.0
 */
export NetUnjoinDomain(lpServer, lpAccount, lpPassword, fUnjoinOptions) {
    lpServer := lpServer is String ? StrPtr(lpServer) : lpServer
    lpAccount := lpAccount is String ? StrPtr(lpAccount) : lpAccount
    lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword

    result := DllCall("NETAPI32.dll\NetUnjoinDomain", "ptr", lpServer, "ptr", lpAccount, "ptr", lpPassword, "uint", fUnjoinOptions, UInt32)
    return result
}

/**
 * The NetRenameMachineInDomain function changes the name of a computer in a domain.
 * @remarks
 * Renaming a domain computer can be performed only by a user that is a member of the Administrators local group on the target computer and that also is a member of the Administrators group on the domain or has the Account Operator privilege on the domain. If you call the 
 * <b>NetRenameMachineInDomain</b> function remotely, you must supply credentials because you cannot delegate credentials under these circumstances.
 * 
 * Different processes, or different threads of the same process, should not call the 
 * <b>NetRenameMachineInDomain</b> function at the same time. This situation can leave the computer in an inconsistent state.
 * 
 * The <b>NERR_SetupNotJoined</b> and  <b>NERR_SetupDomainController</b> return values are defined in the Lmerr.h header file. This header file is automatically included by the Lm.h header file and should not be included directly.
 * 
 * A system reboot is required after calling the <b>NetRenameMachineInDomain</b> function for the operation to complete.
 * @param {PWSTR} lpServer A pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} lpNewMachineName A pointer to a constant string that specifies the new name of the computer. If specified, the local computer name is changed as well. If this parameter is <b>NULL</b>, the function assumes you have already called the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-setcomputernameexa">SetComputerNameEx</a> function.
 * @param {PWSTR} lpAccount A pointer to a constant string that specifies an account name to use when connecting to the domain controller. If this parameter is <b>NULL</b>, the caller's context is used.
 * @param {PWSTR} lpPassword If the <i>lpAccount</i> parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>.
 * @param {Integer} fRenameOptions The rename options. If this parameter is NETSETUP_ACCT_CREATE, the function renames the account in the domain.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access is denied. This error is returned if the account name passed in the <i>lpAccount</i> parameter did not have sufficient access rights for the operation. 
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
 * A parameter is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SetupNotJoined</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The computer is not currently joined to a domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_SetupDomainController</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This computer is a domain controller and cannot be unjoined from a domain.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netrenamemachineindomain
 * @since windows5.0
 */
export NetRenameMachineInDomain(lpServer, lpNewMachineName, lpAccount, lpPassword, fRenameOptions) {
    lpServer := lpServer is String ? StrPtr(lpServer) : lpServer
    lpNewMachineName := lpNewMachineName is String ? StrPtr(lpNewMachineName) : lpNewMachineName
    lpAccount := lpAccount is String ? StrPtr(lpAccount) : lpAccount
    lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword

    result := DllCall("NETAPI32.dll\NetRenameMachineInDomain", "ptr", lpServer, "ptr", lpNewMachineName, "ptr", lpAccount, "ptr", lpPassword, "uint", fRenameOptions, UInt32)
    return result
}

/**
 * The NetValidateName function verifies that a name is valid for name type specified(computer name, workgroup name, domain name, or DNS computer name).
 * @remarks
 * The
 * 				<b>NetValidateName</b> function validates a name based on the nametype specified. 
 * 
 * If the <i>NameType</i> parameter is <b>NetSetupMachine</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a NetBIOS name and the name must not currently be in use on the network.
 * 
 * If the <i>NameType</i> parameter is <b>NetSetupWorkgroup</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a NetBIOS name, the name must not currently be in use on the network as a unique name, and the name must be different from the computer name.
 * 
 * If the <i>NameType</i> parameter is <b>NetSetupDomain</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a NetBIOS or DNS name and the name must currently be registered as a domain name.
 * 
 * If the <i>NameType</i> parameter is <b>NetSetupNonExistentDomain</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a NetBIOS or DNS name and the name must currently not be registered as a domain name.
 * 
 * If the <i>NameType</i> parameter is <b>NetSetupDnsMachine</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a DNS name.
 * 
 * NetBIOS names are limited to maximum length of 16 characters.
 * 
 * No special group membership is required to successfully execute the 
 * <b>NetValidateName</b> function.
 * @param {PWSTR} lpServer A pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} lpName A pointer to a constant string that specifies the name to validate. Depending on the value specified in the <i>NameType</i> parameter, the <i>lpName</i>  parameter can point to a computer name, workgroup name, domain name, or DNS computer name.
 * @param {PWSTR} lpAccount If the <i>lpName</i> parameter is a domain name, this parameter points to an account name to use when connecting to the domain controller. The string must specify either a domain NetBIOS name and user account (for example, "REDMOND\user") or the user principal name (UPN) of the user in the form of an Internet-style login name (for example, "someone@example.com"). If this parameter is <b>NULL</b>, the caller's context is used.
 * @param {PWSTR} lpPassword If the <i>lpAccount</i>  parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>.
 * @param {NETSETUP_NAME_TYPE} NameType The type of the name passed in the <i>lpName</i> parameter to validate. This parameter can be one of the values from the NETSETUP_NAME_TYPE enumeration type defined in the <i>Lmjoin.h</i> header file.
 * 
 * Note that the <i>Lmjoin.h</i> header is automatically included by the <i>Lm.h</i> header file. The <i>Lmjoin.h</i> header files should not be used directly. 
 * 
 * 
 * 
 *  The following list shows the possible values for this parameter. 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NetSetupUnknown"></a><a id="netsetupunknown"></a><a id="NETSETUPUNKNOWN"></a><dl>
 * <dt><b>NetSetupUnknown</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The nametype is unknown. If this value is used, the <b>NetValidateName</b> function fails with <b>ERROR_INVALID_PARAMETER</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NetSetupMachine"></a><a id="netsetupmachine"></a><a id="NETSETUPMACHINE"></a><dl>
 * <dt><b>NetSetupMachine</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify that the NetBIOS computer name is valid and that it is not in use.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NetSetupWorkgroup"></a><a id="netsetupworkgroup"></a><a id="NETSETUPWORKGROUP"></a><dl>
 * <dt><b>NetSetupWorkgroup</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify that the workgroup name is valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NetSetupDomain"></a><a id="netsetupdomain"></a><a id="NETSETUPDOMAIN"></a><dl>
 * <dt><b>NetSetupDomain</b></dt>
 * <dt>3</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify that the domain name exists and that it is a domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NetSetupNonExistentDomain"></a><a id="netsetupnonexistentdomain"></a><a id="NETSETUPNONEXISTENTDOMAIN"></a><dl>
 * <dt><b>NetSetupNonExistentDomain</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify that the domain name is not in use.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NetSetupDnsMachine"></a><a id="netsetupdnsmachine"></a><a id="NETSETUPDNSMACHINE"></a><dl>
 * <dt><b>NetSetupDnsMachine</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify that the DNS computer name is valid.
 * 
 * This value is supported on Windows 2000 and later. The application must be compiled with <b>_WIN32_WINNT &gt;= 0x0500</b> to use this value.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>DNS_ERROR_INVALID_NAME_CHAR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The DNS name contains an invalid character. This error is returned if the <i>NameType</i> parameter specified is <b>NetSetupDnsMachine</b> and the DNS name in the <i>lpName</i> parameter contains an invalid character. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>DNS_ERROR_NON_RFC_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The DNS name does not comply with RFC specifications. This error is returned if the  <i>NameType</i> parameter specified is <b>NetSetupDnsMachine</b> and the DNS name in the <i>lpName</i> parameter does not comply with RFC specifications. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DUP_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A duplicate name already exists on the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_COMPUTERNAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The format of the specified computer name is not valid. 
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
 * A parameter is incorrect. This error is returned if the  <i>lpName</i> parameter is <b>NULL</b> or the <i>NameType</i> parameter is specified as <b>NetSetupUnknown</b> or an unknown nametype. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified domain does not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if a remote computer was specified in the <i>lpServer</i> parameter and this call is not supported on the remote computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidComputer</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified computer name is not valid. This error is returned if the <i>NameType</i> parameter specified is <b>NetSetupDnsMachine</b> or <b>NetSetupMachine</b> and the specified computer name is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_InvalidWorkgroupName</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified workgroup name is not valid. This error is returned if the <i>NameType</i> parameter specified is <b>NetSetupWorkgroup</b> and the specified workgroup name is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_SERVER_UNAVAILABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The RPC server is not available. This error is returned if a remote computer was specified in the <i>lpServer</i> parameter and the RPC server is not available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_E_REMOTE_DISABLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Remote calls are not allowed for this process. This error is returned if a remote computer was specified in the <i>lpServer</i> parameter and remote calls are not allowed for this process.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netvalidatename
 * @since windows5.0
 */
export NetValidateName(lpServer, lpName, lpAccount, lpPassword, NameType) {
    lpServer := lpServer is String ? StrPtr(lpServer) : lpServer
    lpName := lpName is String ? StrPtr(lpName) : lpName
    lpAccount := lpAccount is String ? StrPtr(lpAccount) : lpAccount
    lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword

    result := DllCall("NETAPI32.dll\NetValidateName", "ptr", lpServer, "ptr", lpName, "ptr", lpAccount, "ptr", lpPassword, NETSETUP_NAME_TYPE, NameType, UInt32)
    return result
}

/**
 * The NetGetJoinableOUs function retrieves a list of organizational units (OUs) in which a computer account can be created.
 * @remarks
 * No special group membership is required to successfully execute the 
 * <b>NetGetJoinableOUs</b> function.
 * 
 * For more information about organizational units, see 
 * <a href="https://docs.microsoft.com/windows/desktop/AD/managing-users">Managing Users</a> in the Active Directory documentation.
 * @param {PWSTR} lpServer Pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} lpDomain Pointer to a constant string that specifies the name of the domain for which to retrieve the list of OUs that can be joined.
 * @param {PWSTR} lpAccount Pointer to a constant string that specifies the account name to use when connecting to the domain controller. The string must specify either a domain NetBIOS name and user account (for example, "REDMOND\user") or the user principal name (UPN) of the user in the form of an Internet-style login name (for example, "someone@example.com"). If this parameter is <b>NULL</b>, the caller's context is used.
 * @param {PWSTR} lpPassword If the <i>lpAccount</i> parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>.
 * @param {Pointer<Integer>} OUCount Receives the count of OUs returned in the list of joinable OUs.
 * @param {Pointer<Pointer<PWSTR>>} OUs Pointer to an array that receives the list of joinable OUs. This array is allocated by the system and must be freed using a single call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough storage is available to process this command.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_DefaultJoinRequired</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The destination domain controller does not support creating computer accounts in OUs.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netgetjoinableous
 * @since windows5.0
 */
export NetGetJoinableOUs(lpServer, lpDomain, lpAccount, lpPassword, OUCount, OUs) {
    lpServer := lpServer is String ? StrPtr(lpServer) : lpServer
    lpDomain := lpDomain is String ? StrPtr(lpDomain) : lpDomain
    lpAccount := lpAccount is String ? StrPtr(lpAccount) : lpAccount
    lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword

    OUCountMarshal := OUCount is VarRef ? "uint*" : "ptr"
    OUsMarshal := OUs is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGetJoinableOUs", "ptr", lpServer, "ptr", lpDomain, "ptr", lpAccount, "ptr", lpPassword, OUCountMarshal, OUCount, OUsMarshal, OUs, UInt32)
    return result
}

/**
 * Adds an alternate name for the specified computer.
 * @remarks
 * The <b>NetAddAlternateComputerName</b> function is supported on Windows XP and later.  
 * 
 * The <b>NetAddAlternateComputerName</b> function is used to set secondary network names for computers. The primary name is the name used for authentication and maps to the machine account name.
 * 
 * The <b>NetAddAlternateComputerName</b> function requires that the caller is a member of the Administrators local group on the target computer.
 * @param {PWSTR} Server A pointer to a constant string that specifies the name of the computer on which to execute this function. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} AlternateName A pointer to a constant string that specifies the alternate name to add. This name must be in the form of a fully qualified DNS name.
 * @param {PWSTR} DomainAccount A pointer to a constant string that specifies the domain account to use for accessing the
 *         machine account object for the computer specified in the <i>Server</i> parameter in Active Directory. If this parameter is <b>NULL</b>, then the credentials of the user executing
 *         this routine are used. 
 * 
 * This parameter is not used if the server to execute this function is not joined to a domain.
 * @param {PWSTR} DomainAccountPassword A pointer to a constant string that specifies the password matching the domain account passed in the <i>DomainAccount</i> parameter.
 *         If this parameter is <b>NULL</b>, then the credentials of the user executing
 *         this routine are used. 
 * 
 * This parameter is ignored if the <i>DomainAccount</i> parameter is <b>NULL</b>. This parameter is not used if the server to execute this function is not joined to a domain.
 * @param {Integer} Reserved Reserved for future use.   This parameter should be <b>NULL</b>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A name parameter is incorrect. This error is returned if the <i>AlternateName</i> parameter does not contain valid name.
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
 * A parameter is incorrect. This error is returned if the <i>DomainAccount</i> parameter does not contain a valid domain. This error is also returned if the <i>DomainAccount</i> parameter is not <b>NULL</b> and the <i>DomainAccountPassword</i> parameter is not <b>NULL</b> but does not contain a Unicode string.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to process this command.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if the target computer specified in the <i>Server</i> parameter on which this function executes is running on Windows 2000 and earlier. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_WkstaNotStarted</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Workstation service has not been started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A remote procedure call is already in progress for this thread.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote procedure call protocol sequence is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netaddalternatecomputername
 * @since windows5.1.2600
 */
export NetAddAlternateComputerName(Server, AlternateName, DomainAccount, DomainAccountPassword, Reserved) {
    Server := Server is String ? StrPtr(Server) : Server
    AlternateName := AlternateName is String ? StrPtr(AlternateName) : AlternateName
    DomainAccount := DomainAccount is String ? StrPtr(DomainAccount) : DomainAccount
    DomainAccountPassword := DomainAccountPassword is String ? StrPtr(DomainAccountPassword) : DomainAccountPassword

    result := DllCall("NETAPI32.dll\NetAddAlternateComputerName", "ptr", Server, "ptr", AlternateName, "ptr", DomainAccount, "ptr", DomainAccountPassword, "uint", Reserved, UInt32)
    return result
}

/**
 * Removes an alternate name for the specified computer.
 * @remarks
 * The <b>NetRemoveAlternateComputerName</b> function is supported on Windows XP and later.  
 * 
 * The <b>NetRemoveAlternateComputerName</b> function is used to remove secondary computer names configured for the target computer.
 * 
 * The <b>NetRemoveAlternateComputerName</b> function requires that the caller is a member of the Administrators local group on the target computer.
 * @param {PWSTR} Server A pointer to a constant string that specifies the name of the computer on which to execute this function. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} AlternateName A pointer to a constant string that specifies the alternate name to remove. This name must be in the form of a fully qualified DNS name.
 * @param {PWSTR} DomainAccount A pointer to a constant string that specifies the domain account to use for accessing the
 *         machine account object for the computer specified in the <i>Server</i> parameter in Active Directory. If this parameter is <b>NULL</b>, then the credentials of the user executing
 *         this routine are used. 
 * 
 * This parameter is not used if the server to execute this function is not joined to a domain.
 * @param {PWSTR} DomainAccountPassword A pointer to a constant string that specifies the password matching the domain account passed in the <i>DomainAccount</i> parameter.
 *         If this parameter is <b>NULL</b>, then the credentials of the user executing
 *         this routine are used. 
 * 
 * This parameter is ignored if the <i>DomainAccount</i> parameter is <b>NULL</b>. This parameter is not used if the server to execute this function is not joined to a domain.
 * @param {Integer} Reserved Reserved for future use.   This parameter should be <b>NULL</b>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A name parameter is incorrect. This error is returned if the <i>AlternateName</i> parameter does not contain valid name.
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
 * A parameter is incorrect. This error is returned if the <i>DomainAccount</i> parameter does not contain a valid domain. This error is also returned if the <i>DomainAccount</i> parameter is not <b>NULL</b> and the <i>DomainAccountPassword</i> parameter is not <b>NULL</b> but does not contain a Unicode string.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to process this command.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if the target computer specified in the <i>Server</i> parameter on which this function executes is running on Windows 2000 and earlier. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_WkstaNotStarted</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Workstation service has not been started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A remote procedure call is already in progress for this thread.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote procedure call protocol sequence is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netremovealternatecomputername
 * @since windows5.1.2600
 */
export NetRemoveAlternateComputerName(Server, AlternateName, DomainAccount, DomainAccountPassword, Reserved) {
    Server := Server is String ? StrPtr(Server) : Server
    AlternateName := AlternateName is String ? StrPtr(AlternateName) : AlternateName
    DomainAccount := DomainAccount is String ? StrPtr(DomainAccount) : DomainAccount
    DomainAccountPassword := DomainAccountPassword is String ? StrPtr(DomainAccountPassword) : DomainAccountPassword

    result := DllCall("NETAPI32.dll\NetRemoveAlternateComputerName", "ptr", Server, "ptr", AlternateName, "ptr", DomainAccount, "ptr", DomainAccountPassword, "uint", Reserved, UInt32)
    return result
}

/**
 * Sets the primary computer name for the specified computer.
 * @remarks
 * The <b>NetSetPrimaryComputerName</b> function is supported on Windows XP and later.  
 * 
 * The <b>NetSetPrimaryComputerName</b> function is used as part of computer rename operations. The specified name will be removed from the alternate name list configured for the target computer and configured as the primary name. The computer account name will be changed to match the primary name. The previous primary computer name is moved to the alternate computer name list configured for the computer.
 * 
 * The <b>NetSetPrimaryComputerName</b> function requires that the caller is a member of the Administrators local group on the target computer.
 * @param {PWSTR} Server A pointer to a constant string that specifies the name of the computer on which to execute this function. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {PWSTR} PrimaryName A pointer to a constant string that specifies the primary name to set. This name must be in the form of a fully qualified DNS name.
 * @param {PWSTR} DomainAccount A pointer to a constant string that specifies the domain account to use for accessing the
 *         machine account object for the computer specified in the <i>Server</i> parameter in Active Directory. If this parameter is <b>NULL</b>, then the credentials of the user executing
 *         this routine are used. 
 * 
 * This parameter is not used if the server to execute this function is not joined to a domain.
 * @param {PWSTR} DomainAccountPassword A pointer to a constant string that specifies the password matching the domain account passed in the <i>DomainAccount</i> parameter.
 *         If this parameter is <b>NULL</b>, then the credentials of the user executing
 *         this routine are used. 
 * 
 * This parameter is ignored if the <i>DomainAccount</i> parameter is <b>NULL</b>. This parameter is not used if the server to execute this function is not joined to a domain.
 * @param {Integer} Reserved Reserved for future use.   This parameter should be <b>NULL</b>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A name parameter is incorrect. This error is returned if the <i>PrimaryName</i> parameter does not contain valid name.
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
 * A parameter is incorrect. This error is returned if the <i>DomainAccount</i> parameter does not contain a valid domain. This error is also returned if the <i>DomainAccount</i> parameter is not <b>NULL</b> and the <i>DomainAccountPassword</i> parameter is not <b>NULL</b> but does not contain a Unicode string.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to process this command.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if the target computer specified in the <i>Server</i> parameter on which this function executes is running on Windows 2000 and earlier. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_WkstaNotStarted</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Workstation service has not been started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A remote procedure call is already in progress for this thread.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote procedure call protocol sequence is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netsetprimarycomputername
 * @since windows5.1.2600
 */
export NetSetPrimaryComputerName(Server, PrimaryName, DomainAccount, DomainAccountPassword, Reserved) {
    Server := Server is String ? StrPtr(Server) : Server
    PrimaryName := PrimaryName is String ? StrPtr(PrimaryName) : PrimaryName
    DomainAccount := DomainAccount is String ? StrPtr(DomainAccount) : DomainAccount
    DomainAccountPassword := DomainAccountPassword is String ? StrPtr(DomainAccountPassword) : DomainAccountPassword

    result := DllCall("NETAPI32.dll\NetSetPrimaryComputerName", "ptr", Server, "ptr", PrimaryName, "ptr", DomainAccount, "ptr", DomainAccountPassword, "uint", Reserved, UInt32)
    return result
}

/**
 * Enumerates names for the specified computer.
 * @remarks
 * The <b>NetEnumerateComputerNames</b> function is supported on Windows Vista and later.  
 * 
 * The <b>NetEnumerateComputerNames</b> function is used to request the names a computer currently has configured. 
 * 
 * The <b>NetEnumerateComputerNames</b> function requires that the caller is a member of the Administrators local group on the target computer.
 * @param {PWSTR} Server A pointer to a constant string that specifies the name of the computer on which to execute this function. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {NET_COMPUTER_NAME_TYPE} NameType 
 * @param {Integer} Reserved Reserved for future use.   This parameter should be <b>NULL</b>.
 * @param {Pointer<Integer>} EntryCount A pointer to a DWORD value that returns the number of names returned
 * in the buffer pointed to by the <i>ComputerNames</i> parameter if the function succeeds.
 * @param {Pointer<Pointer<PWSTR>>} ComputerNames A pointer to an array of pointers to names.  If the function call is successful, this parameter will return the computer names that match the computer type name specified in the <i>NameType</i> parameter. 
 * 
 * When the application no longer needs this array, this buffer should be freed by
 *         calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
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
 * A parameter is incorrect. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to process this command.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if the target computer specified in the <i>Server</i> parameter on which this function executes is running on Windows 2000 and earlier. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_WkstaNotStarted</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Workstation service has not been started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A remote procedure call is already in progress for this thread.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote procedure call protocol sequence is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netenumeratecomputernames
 * @since windows5.1.2600
 */
export NetEnumerateComputerNames(Server, NameType, Reserved, EntryCount, ComputerNames) {
    Server := Server is String ? StrPtr(Server) : Server

    EntryCountMarshal := EntryCount is VarRef ? "uint*" : "ptr"
    ComputerNamesMarshal := ComputerNames is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetEnumerateComputerNames", "ptr", Server, NET_COMPUTER_NAME_TYPE, NameType, "uint", Reserved, EntryCountMarshal, EntryCount, ComputerNamesMarshal, ComputerNames, UInt32)
    return result
}

/**
 * Provisions a computer account for later use in an offline domain join operation.
 * @remarks
 * The <b>NetProvisionComputerAccount</b> function is supported on Windows 7 and Windows Server 2008 R2 for offline join operations.  On Windows 8 or Windows Server 2008 R2, it is recommended that the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> function be used instead of the <b>NetProvisionComputerAccount</b> function.
 * 
 * The <b>NetProvisionComputerAccount</b> function is used to provision a computer account for later use in an offline domain join operation using the  <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function. The offline domain join scenario uses these functions as follows: <ul>
 * <li><b>NetProvisionComputerAccount</b>  is a provisioning function that is first called to perform the network operations necessary to create and configure the computer object in Active Directory. The output from the <b>NetProvisionComputerAccount</b> is an opaque binary blob of serialized metadata used for the next step. </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a>, an image initialization function,   is then called to inject the output from the <b>NetProvisionComputerAccount</b> provisioning function into a Windows operating system image to be used during installation.  </li>
 * </ul>Changes to Windows initialization code will detect this saved state and affect the local only portion of domain join. 
 * 
 * The <b>NetProvisionComputerAccount</b> function will create or reuse the machine account in the domain, collect all necessary metadata and return it in an opaque versioned binary blob or as text for embedding in an unattended setup answer file. The opaque binary blob can be consumed by the offline domain join request operation supplying all the necessary input to complete the domain join during first boot without any network operations (local state updates only). 
 * 
 * <b>Security Note:  </b>The blob returned by the <b>NetProvisionComputerAccount</b> function contains very sensitive data. It should be treated just as securely as a plaintext password. The blob contains the machine account password and other information about the domain, including the domain name, the name of a domain controller, and the security ID (SID) of the domain. If the blob is being transported physically or over the network, care must be taken to transport it securely. The design makes no provisions for securing this data.  This problem exists today with unattended setup answer files which can carry a number of secrets including domain user passwords. The caller must secure the blob and the unattended setup files. Solutions to this problem are varied. As an example, a pre-exchanged key could be used to encrypt a session between the consumer and provisioning entity enabling a secure transfer of the opaque blob.
 * 
 * 
 * The opaque blob returned in the  <i>pProvisionBinData</i> parameter by the <b>NetProvisionComputerAccount</b> function is versioned to allow interoperability and serviceability scenarios between different versions of Windows (joining client, provisioning machine, and domain controller). The offline join scenario currently does not limit the lifetime of the blob returned by the <b>NetProvisionComputerAccount</b> function.   
 * 
 * For offline domain joins, the access check performed depends on the configuration of the domain. Computer account creation is enabled using three methods:<ul>
 * <li>Domain administrators have rights to create computer accounts.</li>
 * <li>The SD on a container can delegate the rights to create computer accounts.</li>
 * <li>By default, authenticated users may create computer accounts by privilege. Authenticated users are limited to creating  a limited number of accounts that is specified as a quota on the domain (the default value is 10). For more information, see the <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-ada2/6ba13b0c-1620-478c-b2ae-eca041f2e1c4">ms-DS-MachineAccountQuota</a> attribute in the Active Directory schema.</li>
 * </ul>
 * 
 * 
 * The <b>NetProvisionComputerAccount</b> function works only with a writable domain controller and does not function against a read-only domain controller.  Once provisioning is done against a writable domain controller and the account is replicated to a read-only domain controller, then the other portions of offline domain join operation do not require access to a domain controller.
 * 
 * If the <b>NetProvisionComputerAccount</b> function is successful, the pointer in the <i>pProvisionBinData</i> or <i>pProvisionTextData</i> parameter (depending on which was parameter was not <b>NULL</b>) is returned with the serialized data for use in an offline join operation or as text in an unattended setup file.  
 * 
 * For more information on offline domain join operations, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd392267(v=ws.10)">Offline Domain Join Step-by-Step Guide</a>.
 * 
 * Joining (and unjoining) a computer to a domain using <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain">NetJoinDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netunjoindomain">NetUnjoinDomain</a> can be performed only by a member of the Administrators local group on the target computer. Note that the domain administrator can set additional requirements for joining the domain using delegation and assignment of privileges.
 * @param {PWSTR} lpDomain A pointer to a <b>NULL</b>-terminated character string that specifies the name of the domain where the computer account is created.
 * @param {PWSTR} lpMachineName A pointer to a <b>NULL</b>-terminated character string that specifies the short name of the machine from which the computer account attribute sAMAccountName is derived by appending a '$'. This parameter must contain a valid DNS or NetBIOS machine name.
 * @param {PWSTR} lpMachineAccountOU An optional pointer to a <b>NULL</b>-terminated character string that contains the RFC 1779 format name of the organizational unit (OU) where the computer account will be created. If you specify this parameter, the string must contain a full path, for example, OU=testOU,DC=domain,DC=Domain,DC=com. Otherwise, this parameter must be <b>NULL</b>.
 * 
 * If this parameter is <b>NULL</b>, the well known computer object container will be used as published in the domain.
 * @param {PWSTR} lpDcName An optional pointer to a <b>NULL</b>-terminated character string that contains the name of the domain controller to target.
 * @param {NETSETUP_PROVISION} dwOptions 
 * @param {Pointer<Pointer<Integer>>} pProvisionBinData An optional pointer that will receive the opaque binary blob of serialized metadata required by <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function to complete an offline domain join, if the <b>NetProvisionComputerAccount</b> function completes successfully.  The data is returned as an opaque binary buffer which may be passed to <b>NetRequestOfflineDomainJoin</b> function.  
 * 
 * If this parameter is <b>NULL</b>, then <i>pProvisionTextData</i> parameter must not be <b>NULL</b>. If this parameter is not <b>NULL</b>, then the  <i>pProvisionTextData</i> parameter must be <b>NULL</b>.
 * @param {Pointer<Integer>} pdwProvisionBinDataSize A pointer to a value that receives the size, in bytes, of the buffer returned in the <i>pProvisionBinData</i> parameter. 
 * 
 * This parameter must not be <b>NULL</b> if the <i>pProvisionBinData</i> parameter is not <b>NULL</b>. This parameter must be <b>NULL</b> when the <i>pProvisionBinData</i> parameter is <b>NULL</b>.
 * @param {Pointer<PWSTR>} pProvisionTextData An optional pointer that will receive the opaque binary blob of serialized metadata required by <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function to complete an offline domain join, if the <b>NetProvisionComputerAccount</b> function completes successfully.  The data is returned in string form for embedding in an unattended setup answer file.  
 * 
 * If this parameter is <b>NULL</b>, then the <i>pProvisionBinData</i> parameter must not be <b>NULL</b>. If this parameter is not <b>NULL</b>, then the  the <i>pProvisionBinData</i> parameter must be <b>NULL</b>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access is denied. This error is returned if the caller does not have sufficient privileges to complete the operation. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DOMAIN_ROLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This operation is only allowed for the Primary Domain Controller of the domain. This error is returned if a domain controller name was specified in the <i>lpDcName</i> parameter, but the computer specified could not be validated as a domain controller for the target domain specified in the <i>lpDomain</i> parameter.
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
 * A parameter is incorrect. This error is returned if the <i>lpDomain</i> or <i>lpMachineName</i> parameter is <b>NULL</b>. This error is also returned if both the <i>pProvisionBinData</i> and <i>pProvisionTextData</i> parameters are <b>NULL</b>. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified domain did not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if the <i>lpMachineAccountOU</i> parameter was specified and the domain controller is running on an earlier versions of Windows that does not support this parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>    NERR_DS8DCRequired</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified domain controller does not meet the version requirement for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>    NERR_LDAPCapableDCRequired</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This operation requires a domain controller which supports LDAP.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserExists</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The account already exists in the domain and the NETSETUP_PROVISION_REUSE_ACCOUNT bit was not specified in the <i>dwOptions</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_WkstaNotStarted</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Workstation service has not been started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A remote procedure call is already in progress for this thread.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote procedure call protocol sequence is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount
 * @since windows6.1
 */
export NetProvisionComputerAccount(lpDomain, lpMachineName, lpMachineAccountOU, lpDcName, dwOptions, pProvisionBinData, pdwProvisionBinDataSize, pProvisionTextData) {
    lpDomain := lpDomain is String ? StrPtr(lpDomain) : lpDomain
    lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName
    lpMachineAccountOU := lpMachineAccountOU is String ? StrPtr(lpMachineAccountOU) : lpMachineAccountOU
    lpDcName := lpDcName is String ? StrPtr(lpDcName) : lpDcName

    pProvisionBinDataMarshal := pProvisionBinData is VarRef ? "ptr*" : "ptr"
    pdwProvisionBinDataSizeMarshal := pdwProvisionBinDataSize is VarRef ? "uint*" : "ptr"
    pProvisionTextDataMarshal := pProvisionTextData is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetProvisionComputerAccount", "ptr", lpDomain, "ptr", lpMachineName, "ptr", lpMachineAccountOU, "ptr", lpDcName, NETSETUP_PROVISION, dwOptions, pProvisionBinDataMarshal, pProvisionBinData, pdwProvisionBinDataSizeMarshal, pdwProvisionBinDataSize, pProvisionTextDataMarshal, pProvisionTextData, UInt32)
    return result
}

/**
 * Executes locally on a machine to modify a Windows operating system image mounted on a volume. (NetRequestOfflineDomainJoin)
 * @remarks
 * The <b>NetRequestOfflineDomainJoin</b> function is supported on Windows 7 for offline domain join operations.  
 * 
 * The 
 * 				<b>NetRequestOfflineDomainJoin</b> function is used locally on a machine to modify a Windows operating system image mounted on a volume. The registry is loaded for the image and provisioning blob data is written where it can be retrieved during the completion phase of an offline domain join operation. The offline domain join scenario uses these functions as follows:<ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a>  is a provisioning function that is first called to perform the network operations necessary to create and configure the computer object in Active Directory. The output from the <b>NetProvisionComputerAccount</b> is an opaque binary blob of serialized metadata used for the next step.</li>
 * <li><b>NetRequestOfflineDomainJoin</b> , an image initialization function,   is then called to inject the output from the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> provisioning function into a Windows operating system image to be used during installation.  Changes to Windows initialization code will detect this saved state and affect the local only portion of domain join. </li>
 * </ul>
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function will create or reuse the machine account in the domain, collect all necessary metadata and return it in an opaque versioned binary blob or as text for embedding in an unattended setup answer file. The opaque binary blob can be consumed by the offline domain join request operation supplying all the necessary input to complete the domain join during first boot without any network operations (local state updates only). Note that the blob contains machine account password material essentially in the clear. The design makes no provisions for securing this data.  This problem exists today with unattended setup answer files which can carry a number of secrets including domain user passwords. The caller must secure the blob and the unattended setup files. Solutions to this problem are varied. As an example, a pre-exchanged key could be used to encrypt a session between the consumer and provisioning entity enabling a secure transfer of the opaque blob .
 * 
 * 
 * The opaque blob returned in the  <i>pProvisionBinData</i> parameter by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function is versioned to allow interoperability and serviceability scenarios between different versions of Windows (joining client, provisioning machine, and domain controller). The offline join scenario currently does not limit the lifetime of the blob returned by the <b>NetProvisionComputerAccount</b> function.   
 * 
 * For more information on offline domain join operations, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd392267(v=ws.10)">Offline Domain Join Step-by-Step Guide</a>.
 * @param {Integer} pProvisionBinData A pointer to a buffer required to initialize the registry of a Windows operating system image to process the final local state change during the completion phase of the offline domain join operation. 
 * 
 * The opaque binary blob of serialized metadata passed in the <i>pProvisionBinData</i> parameter is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function.
 * @param {Integer} cbProvisionBinDataSize The size, in bytes, of the buffer pointed to by the <i>pProvisionBinData</i> parameter. 
 * 
 * This parameter must not be <b>NULL</b>.
 * @param {NET_REQUEST_PROVISION_OPTIONS} dwOptions 
 * @param {PWSTR} lpWindowsPath A pointer to a constant null-terminated character string that specifies the path to a Windows operating system image  under which the registry hives are located. This image must be offline and not currently booted unless the <i>dwOptions</i> parameter contains <b>NETSETUP_PROVISION_ONLINE_CALLER</b> in which case the locally running operating system directory is allowed. 
 * 
 * This path could
 *                      be a UNC path on a remote server.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access is denied. This error is returned if the caller does not have sufficient privileges to complete the operation. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ELEVATION_REQUIRED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation requires elevation.
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
 * A parameter is incorrect. This error is returned if the <i>pProvisionBinData</i>, <i>cbProvisionBinDataSize</i>, or <i>lpWindowsPath</i> parameters are <b>NULL</b>.  This error is also returned if the buffer pointed to by the <i>pProvisionBinData</i> parameter does not contain valid data in the blob for the domain, machine account name, or machine account password. This error is also returned if the string pointed to <i>lpWindowsPath</i> parameter does not specific the path to a Windows operating system image.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if the specified server does not support this operation. For example, if the <i>lpWindowsPath</i> parameter references a Windows installation configured as a domain controller.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_WkstaNotStarted</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Workstation service has not been started.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin
 * @since windows6.1
 */
export NetRequestOfflineDomainJoin(pProvisionBinData, cbProvisionBinDataSize, dwOptions, lpWindowsPath) {
    lpWindowsPath := lpWindowsPath is String ? StrPtr(lpWindowsPath) : lpWindowsPath

    result := DllCall("NETAPI32.dll\NetRequestOfflineDomainJoin", "ptr", pProvisionBinData, "uint", cbProvisionBinDataSize, NET_REQUEST_PROVISION_OPTIONS, dwOptions, "ptr", lpWindowsPath, UInt32)
    return result
}

/**
 * Creates a provisioning package that provisions a computer account for later use in an offline domain join operation. The package may also contain information about certificates and policies to add to the machine during provisioning.
 * @remarks
 * The <b>NetCreateProvisioningPackage</b> function is supported on Windows 8 and  Windows Server 2012 for offline join operations.  For Windows 7, use the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function.
 * 
 * The <b>NetCreateProvisioningPackage</b> function is used to provision a computer account for later use in an offline domain join operation using the  <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestprovisioningpackageinstall">NetRequestProvisioningPackageInstall</a> function.
 * 
 * The offline domain join scenario uses two functions: <ul>
 * <li><b>NetCreateProvisioningPackage</b>  is a provisioning function that is first called to perform the network operations necessary to create and configure the computer object in Active Directory. The output from the <b>NetCreateProvisioningPackage</b> is a package used for the next step. </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestprovisioningpackageinstall">NetRequestProvisioningPackageInstall</a>, an image initialization function,   is called to inject the output from the <b>NetCreateProvisioningPackage</b> provisioning function into a Windows operating system image for use during pre-installation and post-installation. </li>
 * </ul>Changes to Windows initialization code will detect this saved state and affect the local-only portion of domain join.
 * 
 * When the <i>pPackageBinData</i> and <i>pdwPackageBinDataSize</i> out pointers are used, set the <i>pPackageTextData</i> out pointer to NULL. When <i>pPackageTextData</i> is used, set the <i>pPackageBinData</i> and <i>pdwPackageBinDataSize</i> out pointers to NULL.
 * 
 * The <i>pProvisioningParams</i> parameter specifies data to include in the provisioning package. The package includes information relevant to the domain join, and it can also include information about policies and certificates to install on the machine. The provisioning package can be used in four ways:<ul>
 * <li>Domain join</li>
 * <li>Domain join and installation of certificates</li>
 * <li>Domain join and installation of policies</li>
 * <li>Domain join and installation of certificates and policies</li>
 * </ul>
 * 
 * 
 * The <b>NetCreateProvisioningPackage</b> function creates or reuses the machine account in the domain, collects all necessary metadata and returns it in a package. The package can be consumed by the offline domain join request operation supplying all the necessary input to complete the domain join during first boot without any network operations (local state updates only). 
 * 
 * <b>Security Note:  </b>The package returned by the <b>NetCreateProvisioningPackage</b> function contains very sensitive data. It should be treated just as securely as a plaintext password. The package contains the machine account password and other information about the domain, including the domain name, the name of a domain controller, and the security ID (SID) of the domain. If the package is being transported physically or over the network, care must be taken to transport it securely. The design makes no provisions for securing this data.  This problem exists today with unattended setup answer files which can carry a number of secrets including domain user passwords. The caller must secure the package. Solutions to this problem are varied. As an example, a pre-exchanged key could be used to encrypt a session between the consumer and provisioning entity enabling a secure transfer of the package.
 * 
 * 
 * The package returned in the  <i>pPackageBinData</i> parameter by the <b>NetCreateProvisioningPackage</b> function is versioned to allow interoperability and serviceability scenarios between different versions of Windows (such as joining a client, provisioning a machine, and using a domain controller). A package created on Windows 8 or Windows Server 2012 can be used Windows 7 or Windows Server 2008 R2, however only domain join information will take effect (certificates and policies are not supported). The offline join scenario currently does not limit the lifetime of the package returned by the <b>NetCreateProvisioningPackage</b> function.
 * 
 * For offline domain joins, the access check performed depends on the configuration of the domain. Computer account creation is enabled using three methods:<ul>
 * <li>Domain administrators have rights to create computer accounts.</li>
 * <li>The SD on a container can delegate the rights to create computer accounts.</li>
 * <li>By default, authenticated users may create computer accounts by privilege. Authenticated users are limited to creating  a limited number of accounts that is specified as a quota on the domain (the default value is 10). For more information, see the <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-ada2/6ba13b0c-1620-478c-b2ae-eca041f2e1c4">ms-DS-MachineAccountQuota</a> attribute in the Active Directory schema.</li>
 * </ul>
 * 
 * 
 * The <b>NetCreateProvisioningPackage</b> function works only with a writable domain controller and does not function against a read-only domain controller.  Once provisioning is done against a writable domain controller and the account is replicated to a read-only domain controller,  the other portions of the offline domain join operation do not require access to a domain controller.
 * 
 * If the <b>NetCreateProvisioningPackage</b> function is successful, the pointer in the <i>pPackageBinData</i> or <i>pPackageTextData</i> parameter (depending on which  parameter was not <b>NULL</b>) is returned with the serialized data for use in an offline join operation or as text in an unattended setup file.  
 * 
 * All phases of the provisioning process append to a  <i>NetSetup.log</i> file on the local computer. The provisioning process can include up to three different computers: the computer where the provisioning package is created,  the computer that requests the installation of the package,  and the computer where the  package is installed. There will be <i>NetSetup.log</i> file information stored on all three computers according to  the operation performed. Reviewing the contents of these files is the most common means of troubleshooting online and offline provisioning errors. Provisioning operations undertaken by admins are logged to the <i>NetSetup.log</i> file in the <i>%WINDIR%\Debug</i>. Provisioning operations performed by non-admins are logged to the <i>NetSetup.log</i> file  in the <i>%USERPROFILE%\Debug</i> folder.
 * 
 * For more information on offline domain join operations, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd392267(v=ws.10)">Offline Domain Join Step-by-Step Guide</a>.
 * 
 * Joining (and unjoining) a computer to a domain using <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain">NetJoinDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netunjoindomain">NetUnjoinDomain</a> is performed only by a member of the Administrators local group on the target computer. Note that the domain administrator can set additional requirements for joining the domain using delegation and assignment of privileges.
 * @param {Pointer<NETSETUP_PROVISIONING_PARAMS>} pProvisioningParams A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> structure that contains information about the provisioning package.
 * 
 * The following values are defined for the members of this structure:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="dwVersion"></a><a id="dwversion"></a><a id="DWVERSION"></a><dl>
 * <dt><b>dwVersion</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The version of Windows in the provisioning package. This member should use the following value defined in the <i>Lmjoin.h</i> header file:
 * 
 * NETSETUP_PROVISIONING_PARAMS_CURRENT_VERSION (0x00000001)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="lpDomain"></a><a id="lpdomain"></a><a id="LPDOMAIN"></a><dl>
 * <dt><b>lpDomain</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A pointer to a constant null-terminated character string that specifies the name of the domain where the computer account is created. 
 * 
 * 
 *  
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="lpMachineName"></a><a id="lpmachinename"></a><a id="LPMACHINENAME"></a><dl>
 * <dt><b>lpMachineName</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A pointer to a constant null-terminated character string that specifies the short name of the machine from which the computer account attribute sAMAccountName is derived by appending a '$'. This parameter must contain a valid DNS or NetBIOS machine name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="lpMachineAccountOU"></a><a id="lpmachineaccountou"></a><a id="LPMACHINEACCOUNTOU"></a><dl>
 * <dt><b>lpMachineAccountOU</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An optional pointer to a constant null-terminated character string that contains the RFC 1779 format name of the organizational unit (OU) where the computer account will be created. If you specify this parameter, the string must contain a full path, for example, OU=testOU,DC=domain,DC=Domain,DC=com. Otherwise, this parameter must be <b>NULL</b>.
 * 
 * If this parameter is <b>NULL</b>, the well known computer object container will be used as published in the domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="lpDcName"></a><a id="lpdcname"></a><a id="LPDCNAME"></a><dl>
 * <dt><b>lpDcName</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An optional pointer to a constant null-terminated character string that contains the name of the domain controller to target.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="dwProvisionOptions"></a><a id="dwprovisionoptions"></a><a id="DWPROVISIONOPTIONS"></a><dl>
 * <dt><b>dwProvisionOptions</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A set of bit flags that define provisioning options. This parameter can be one or more of the values specified for the <i>dwOptions</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function. 
 * 
 * These possible values are defined in the <i>Lmjoin.h</i> header file. 
 * 
 * The <b>NETSETUP_PROVISION_ROOT_CA_CERTS</b> option is only supported on Windows 8 and Windows Server 2012.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="aCertTemplateNames"></a><a id="acerttemplatenames"></a><a id="ACERTTEMPLATENAMES"></a><dl>
 * <dt><b>aCertTemplateNames</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A optional pointer to an array of <b>NULL</b>-terminated certificate template names. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="cCertTemplateNames"></a><a id="ccerttemplatenames"></a><a id="CCERTTEMPLATENAMES"></a><dl>
 * <dt><b>cCertTemplateNames</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * When <b>aCertTemplateNames</b> is not NULL, this member provides an explicit count of the number of items in the array.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="aMachinePolicyNames"></a><a id="amachinepolicynames"></a><a id="AMACHINEPOLICYNAMES"></a><dl>
 * <dt><b>aMachinePolicyNames</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An optional pointer to an array of <b>NULL</b>-terminated machine policy names.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="cMachinePolicyNames"></a><a id="cmachinepolicynames"></a><a id="CMACHINEPOLICYNAMES"></a><dl>
 * <dt><b>cMachinePolicyNames</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * When <b>aMachinePolicyNames</b> is not <b>NULL</b>, this member provides an explicit count of the number of items in the array.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="aMachinePolicyPaths"></a><a id="amachinepolicypaths"></a><a id="AMACHINEPOLICYPATHS"></a><dl>
 * <dt><b>aMachinePolicyPaths</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An optional pointer to an array of  character strings. Each array element is a NULL-terminated character string which specifies the full or partial path to a file in the Registry Policy File format. For more information on the Registry Policy File Format , see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/registry-policy-file-format">Registry Policy File Format</a>
 * 
 * 
 * The path could
 *                      be a UNC path on a remote server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="cMachinePolicyPaths"></a><a id="cmachinepolicypaths"></a><a id="CMACHINEPOLICYPATHS"></a><dl>
 * <dt><b>cMachinePolicyPaths</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * When <b>aMachinePolicyPaths</b> is not <b>NULL</b>, this member provides an explicit count of the number of items in the array.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Pointer<Integer>>} ppPackageBinData An optional pointer that will receive the package required by <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function to complete an offline domain join, if the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function completes successfully.  The data is returned as an opaque binary buffer which may be passed to <b>NetRequestOfflineDomainJoin</b> function.  
 * 
 * If this parameter is <b>NULL</b>, then <i>pPackageTextData</i> parameter must not be <b>NULL</b>. If this parameter is not <b>NULL</b>, then the  <i>pPackageTextData</i> parameter must be <b>NULL</b>.
 * @param {Pointer<Integer>} pdwPackageBinDataSize A pointer to a value that receives the size, in bytes, of the buffer returned in the <i>pProvisionBinData</i> parameter. 
 * 
 * This parameter must not be <b>NULL</b> if the <i>pPackageBinData</i> parameter is not <b>NULL</b>. This parameter must be <b>NULL</b> when the <i>pPackageBinData</i> parameter is <b>NULL</b>.
 * @param {Pointer<PWSTR>} ppPackageTextData An optional pointer that will receive the package required by <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function to complete an offline domain join, if the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function completes successfully.  The data is returned in string form for embedding in an unattended setup answer file.  
 * 
 * If this parameter is <b>NULL</b>, then the <i>pPackageBinData</i> parameter must not be <b>NULL</b>. If this parameter is not <b>NULL</b>, then the  the <i>pPackageBinData</i> parameter must be <b>NULL</b>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following error codes or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access is denied. This error is returned if the caller does not have sufficient privileges to complete the operation. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DOMAIN_ROLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This operation is only allowed for the Primary Domain Controller of the domain. This error is returned if a domain controller name was specified in the <b>lpDcName </b> of the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> struct pointed to by the <i>pProvisioningParams</i> parameter, but the computer specified could not be validated as a domain controller for the target domain specified in the <b>lpDomain</b> of the <b>NETSETUP_PROVISIONING_PARAMS</b>.
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
 * A parameter is incorrect. This error is also returned if both the <i>pProvisioningParams</i> parameter is  <b>NULL</b>. This error is also returned if the <b>lpDomain</b> or <b>lpMachineName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> struct pointed to by the <i>pProvisioningParams</i> parameter is <b>NULL</b>. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified domain did not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported. This error is returned if the <b>lpMachineAccountOU</b> member was specified in the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> struct pointed to by the <i>pProvisioningParams</i> parameter and the domain controller is running on an earlier versions of Windows that does not support this parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>    NERR_DS8DCRequired</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified domain controller does not meet the version requirement for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>    NERR_LDAPCapableDCRequired</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This operation requires a domain controller which supports LDAP.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_UserExists</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The account already exists in the domain and the <b>NETSETUP_PROVISION_REUSE_ACCOUNT</b> bit was not specified in the <b>dwProvisionOptions</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> struct pointed to by the <i>pProvisioningParams</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_WkstaNotStarted</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Workstation service has not been started.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A remote procedure call is already in progress for this thread.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote procedure call protocol sequence is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage
 * @since windows8.0
 */
export NetCreateProvisioningPackage(pProvisioningParams, ppPackageBinData, pdwPackageBinDataSize, ppPackageTextData) {
    ppPackageBinDataMarshal := ppPackageBinData is VarRef ? "ptr*" : "ptr"
    pdwPackageBinDataSizeMarshal := pdwPackageBinDataSize is VarRef ? "uint*" : "ptr"
    ppPackageTextDataMarshal := ppPackageTextData is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetCreateProvisioningPackage", NETSETUP_PROVISIONING_PARAMS.Ptr, pProvisioningParams, ppPackageBinDataMarshal, ppPackageBinData, pdwPackageBinDataSizeMarshal, pdwPackageBinDataSize, ppPackageTextDataMarshal, ppPackageTextData, UInt32)
    return result
}

/**
 * Executes locally on a machine to modify a Windows operating system image mounted on a volume. (NetRequestProvisioningPackageInstall)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestProvisioningPackageInstall</a> function is supported on Windows 8 for offline domain join operations.  For  Windows 7, use <b>NetRequestOfflineDomainJoin</b>.
 * 
 * The offline domain join scenario uses two functions: <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a>  is a provisioning function that is first called to perform the network operations necessary to create and configure the computer object in Active Directory. The output from the <b>NetCreateProvisioningPackage</b> is a package used for the next step. </li>
 * <li><b>NetRequestProvisioningPackageInstall</b>, an image initialization function,   is called to inject the output from the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> provisioning function into a Windows operating system image for use during installation. </li>
 * </ul>Changes to Windows initialization code will detect this saved state and affect the local-only portion of domain join and install any certificate and  policy information that may have been present in the package.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> function will create or reuse the machine account in the domain, collect all necessary metadata and return it in a package. The package can be consumed by the offline domain join request operation supplying all the necessary input to complete the domain join during first boot without any network operations (local state updates only). 
 * 
 * <b>Security Note:  </b>The package created by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> function contains very sensitive data. It should be treated just as securely as a plaintext password. The package contains the machine account password and other information about the domain, including the domain name, the name of a domain controller, and the security ID (SID) of the domain. If the package is being transported physically or over the network, care must be taken to transport it securely. The design makes no provisions for securing this data.  This problem exists today with unattended setup answer files which can carry a number of secrets including domain user passwords. The caller must secure the package. Solutions to this problem are varied. As an example, a pre-exchanged key could be used to encrypt a session between the consumer and provisioning entity enabling a secure transfer of the package.
 * 
 * 
 * The package returned in the  <i>pPackageBinData</i> parameter by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> function is versioned to allow interoperability and serviceability scenarios between different versions of Windows (such as joining a client, provisioning a machine, and using a domain controller). The offline join scenario currently does not limit the lifetime of the package returned by the <b>NetCreateProvisioningPackage</b> function.
 * 
 * All phases of the provisioning process append to a  <i>NetSetup.log</i> file on the local computer. The provisioning process can include up to three different computers: the computer where the provisioning package is created,  the computer that requests the installation of the package,  and the computer where the  package is installed. There will be <i>NetSetup.log</i> file information stored on all three computers according to  the operation performed. Reviewing the contents of these files is the most common means of troubleshooting online and offline provisioning errors. Provisioning operations undertaken by admins are logged to the <i>NetSetup.log</i> file in the <i>%WINDIR%\Debug</i>. Provisioning operations performed by non-admins are logged to the <i>NetSetup.log</i> file  in the <i>%USERPROFILE%\Debug</i> folder.
 * @param {Integer} pPackageBinData A pointer to a buffer required to initialize the registry of a Windows operating system image to process the final local state change during the completion phase of the offline domain join operation. 
 * 
 * The opaque binary blob of serialized metadata passed in the <i>pPackageBinData</i> parameter is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetCreateProvisioningPackage</a> function.
 * @param {Integer} dwPackageBinDataSize The size, in bytes, of the buffer pointed to by the <i>pPackageBinData</i> parameter. 
 * 
 * This parameter must not be <b>NULL</b>.
 * @param {NET_REQUEST_PROVISION_OPTIONS} dwProvisionOptions 
 * @param {PWSTR} lpWindowsPath A pointer to a <b>NULL</b>-terminated character string that specifies the path to a Windows operating system image  under which the registry hives are located. This image must be offline and not currently booted unless the <i>dwProvisionOptions</i> parameter contains <b>NETSETUP_PROVISION_ONLINE_CALLER</b>, in which case, the locally running operating system directory is allowed. 
 * 
 * This path could
 *                      be a UNC path on a remote server.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be one of the following <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-error-codes">Network Management error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NoOfflineJoinInfo </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The offline join completion information was not found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_BadOfflineJoinInfo</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The offline join completion information was bad.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_CantCreateJoinInfo</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to create offline join information. Please ensure you have access to the specified path location and permissions to modify its contents. Running as an elevated administrator may be required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_BadDomainJoinInfo</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The domain join info being saved was incomplete or bad.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_JoinPerformedMustRestart</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Offline join operation successfully completed but a restart is needed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_NoJoinPending</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There was no offline join operation pending.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_ValuesNotSet</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to set one or more requested machine or domain name values on the local computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_CantVerifyHostname</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Could not verify the current machine's hostname against the saved value in the join completion information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_CantLoadOfflineHive</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to load the specified offline registry hive. Please ensure you have access to the specified path location and permissions to modify its contents. Running as an elevated administrator may be required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_ConnectionInsecure</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The minimum session security requirements for this operation were not met.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NERR_ProvisioningBlobUnsupported</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Computer account provisioning blob version is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netrequestprovisioningpackageinstall
 * @since windows8.0
 */
export NetRequestProvisioningPackageInstall(pPackageBinData, dwPackageBinDataSize, dwProvisionOptions, lpWindowsPath) {
    static pvReserved := 0 ;Reserved parameters must always be NULL

    lpWindowsPath := lpWindowsPath is String ? StrPtr(lpWindowsPath) : lpWindowsPath

    result := DllCall("NETAPI32.dll\NetRequestProvisioningPackageInstall", "ptr", pPackageBinData, "uint", dwPackageBinDataSize, NET_REQUEST_PROVISION_OPTIONS, dwProvisionOptions, "ptr", lpWindowsPath, "ptr", pvReserved, UInt32)
    return result
}

/**
 * Retrieves the join information for the specified tenant. This function examines the join information for Microsoft Azure Active Directory and the work account that the current user added.
 * @param {PWSTR} pcszTenantId The tenant identifier for the joined account. If the device
 *                        is not joined to Azure Active Directory (Azure AD), and the user currently logged into Windows added no Azure AD work accounts  for the specified tenant,
 *                        the buffer that the <i>ppJoinInfo</i> parameter points to  is set to NULL.
 * 
 * If the specified
 *                        tenant ID is NULL or empty, <i>ppJoinInfo</i> is set to the default
 *                        join account information, or NULL if the device is not joined to Azure AD and the current user added  no Azure AD work accounts.
 *                        
 * The default join account is one of the following:
 * 
 * <ul>
 * <li>The Azure AD account, if the device is joined to Azure AD.</li>
 * <li>The Azure AD work account that the current user added, if the device is not joined to Azure AD,
 *                        but the current user added a single Azure AD work account.</li>
 * <li>Any of the Azure AD work accounts that the current user added,  if the device is not joined to Azure AD, but the current user added multiple
 *                        Azure AD work accounts. The algorithm for selecting one of the work
 *                        accounts is not specified.</li>
 * </ul>
 * @returns {Pointer<DSREG_JOIN_INFO>} The join information for the tenant that the <i>pcszTenantId</i> parameter specifies. If this parameter is NULL,  the device is not joined to Azure AD and the current user added no Azure AD work accounts. You must call
 *                      the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netfreeaadjoininformation">NetFreeAadJoinInformation</a> function to free the memory allocated for
 *                      this structure.
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netgetaadjoininformation
 * @since windows10.0.10240
 */
export NetGetAadJoinInformation(pcszTenantId) {
    pcszTenantId := pcszTenantId is String ? StrPtr(pcszTenantId) : pcszTenantId

    result := DllCall("NETAPI32.dll\NetGetAadJoinInformation", "ptr", pcszTenantId, "ptr*", &ppJoinInfo := 0, "HRESULT")
    return ppJoinInfo
}

/**
 * Frees the memory allocated for the specified DSREG_JOIN_INFO structure, which contains join information for a tenant and which you retrieved by calling the NetGetAadJoinInformation function.
 * @param {Pointer<DSREG_JOIN_INFO>} pJoinInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-dsreg_join_info">DSREG_JOIN_INFO</a> structure for which you want to free the memory.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netfreeaadjoininformation
 * @since windows10.0.10240
 */
export NetFreeAadJoinInformation(pJoinInfo) {
    DllCall("NETAPI32.dll\NetFreeAadJoinInformation", DSREG_JOIN_INFO.Ptr, pJoinInfo)
}

/**
 * The NetGetJoinInformation function retrieves join status information for the specified computer.
 * @remarks
 * No special group membership is required to successfully execute the 
 * <b>NetGetJoinInformation</b> function.
 * @param {PWSTR} lpServer Pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Pointer<PWSTR>} lpNameBuffer Pointer to the buffer that receives the NetBIOS name of the domain or workgroup to which the computer is joined. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<NETSETUP_JOIN_STATUS>} BufferType 
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value can be the following error code or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough storage is available to process this command.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netgetjoininformation
 * @since windows5.0
 */
export NetGetJoinInformation(lpServer, lpNameBuffer, BufferType) {
    lpServer := lpServer is String ? StrPtr(lpServer) : lpServer

    lpNameBufferMarshal := lpNameBuffer is VarRef ? "ptr*" : "ptr"
    BufferTypeMarshal := BufferType is VarRef ? "int*" : "ptr"

    result := DllCall("NETAPI32.dll\NetGetJoinInformation", "ptr", lpServer, lpNameBufferMarshal, lpNameBuffer, BufferTypeMarshal, BufferType, UInt32)
    return result
}

/**
 * The GetNetScheduleAccountInformation function retrieves the AT Service account name.
 * @remarks
 * To successfully call the <b>GetNetScheduleAccountInformation</b> function,  the caller should have read access to the task folder  which is usually %windir%\tasks or as defined in the following registry setting:
 * 
 * <b>HKLM\SOFTWARE\Microsoft\SchedulingAgent\TasksFolder\
 * </b>
 * @param {PWSTR} pwszServerName A NULL-terminated wide character string for the name of the computer whose account information is being retrieved.
 * @param {Integer} ccAccount The number of characters, including the NULL terminator, allocated for <i>wszAccount</i>. The maximum allowed length for this value is the maximum domain name length plus the maximum user name length plus 2, expressed as DNLEN + UNLEN + 2. (The last two characters are the "\" character and the NULL terminator.)
 * @param {PWSTR} wszAccount An array of wide characters, including the NULL terminator, that receives the account information.
 * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the function succeeded, and the account information is  returned in <i>wszAccount</i>. A value of S_FALSE  indicates the function succeeded, and the account is the Local System account (no information will be returned in <i>wszAccount</i>). Any other return values indicate an error condition.
 * @see https://learn.microsoft.com/windows/win32/api/atacct/nf-atacct-getnetscheduleaccountinformation
 * @since windows6.0.6000
 */
export GetNetScheduleAccountInformation(pwszServerName, ccAccount, wszAccount) {
    pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName
    wszAccount := wszAccount is String ? StrPtr(wszAccount) : wszAccount

    result := DllCall("mstask.dll\GetNetScheduleAccountInformation", "ptr", pwszServerName, "uint", ccAccount, "ptr", wszAccount, "HRESULT")
    return result
}

/**
 * The SetNetScheduleAccountInformation function sets the AT Service account name and password. The AT Service account name and password are used as the credentials for scheduled jobs created with NetScheduleJobAdd.
 * @remarks
 * The <b>SetNetScheduleAccountInformation</b> impersonates the caller. Only members of the local Administrators group on the computer where the schedule account information is being set can successfully execute this function. Note that <b>NULL</b> passwords are not allowed.
 * @param {PWSTR} pwszServerName A NULL-terminated wide character string for the name of the computer whose account information is being set.
 * @param {PWSTR} pwszAccount A pointer to a NULL-terminated wide character string for the account. To specify the local system account, set this parameter to <b>NULL</b>.
 * @param {PWSTR} pwszPassword A pointer to a NULL-terminated wide character string for the password. For information about securing password information, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
 * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the account name and password were successfully set. Any other value indicates an error condition.
 * 
 * If the function fails, some of the possible return values are listed below. 
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_ACCESSDENIED</b></dt>
 * <dt>0x080070005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access was denied. This error is returned if the caller was not a member of the Administrators group. This error is also returned if the <i>pwszAccount</i> parameter  was  not <b>NULL</b> indicating a named account not the local system account and the <i>pwszPassword</i> parameter was incorrect for the account specified in the <i>pwszAccount</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATA)</b></dt>
 * <dt>0x08007000d</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The data is invalid. This error is returned if the <i>pwszPassword</i> parameter was <b>NULL</b> or the length of  <i>pwszPassword</i> parameter string was too long.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SCHED_E_ACCOUNT_NAME_NOT_FOUND</b></dt>
 * <dt>0x80041310</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to establish existence of the account specified. This error is returned if the <i>pwszAccount</i> parameter  was  not <b>NULL</b> indicating a named account not the local system account and  the <i>pwszAccount</i> parameter could not be found. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/atacct/nf-atacct-setnetscheduleaccountinformation
 * @since windows6.0.6000
 */
export SetNetScheduleAccountInformation(pwszServerName, pwszAccount, pwszPassword) {
    pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName
    pwszAccount := pwszAccount is String ? StrPtr(pwszAccount) : pwszAccount
    pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

    result := DllCall("mstask.dll\SetNetScheduleAccountInformation", "ptr", pwszServerName, "ptr", pwszAccount, "ptr", pwszPassword, "HRESULT")
    return result
}

/**
 * The NetScheduleJobAdd function submits a job to run at a specified future time and date. This function requires that the schedule service be started on the computer to which the job is submitted.
 * @remarks
 * Normally only members of the local Administrators group on the computer where the schedule job is being added can successfully execute this function. If the server name passed in the string pointed to by the <i>Servername</i> parameter is a remote server, then only members of the local Administrators group on the  remote server can successfully execute this function. 
 * 
 * If the following registry value has the least significant bit set (for example, 0x00000001), then users belonging to the Server Operators group can also successfully execute this function.
 * 
 * 
 * <b>HKLM\System\CurrentControlSet\Control\Lsa\SubmitControl</b>
 * 
 * The following are examples of how to schedule jobs using different properties supported by the 
 * <b>NetScheduleJobAdd</b> function.
 * 
 * To schedule a job that executes once:
 * 
 * <ul>
 * <li>Set the <b>DaysOfMonth</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to zero.</li>
 * <li>Set the <b>DaysOfWeek</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to zero.</li>
 * <li>Set the <b>JobTime</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to the time the job should execute.</li>
 * </ul>
 * The job executes at the time specified by the <b>JobTime</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure pointed to by the <i>Buffer</i> parameter. After the job executes, it is deleted.
 * 
 * To schedule and delete a job that executes multiple times:
 * 
 * <ul>
 * <li>Set the appropriate bits in the  <b>DaysOfMonth</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure or </li>
 * <li>Set the appropriate bits in the  <b>DaysOfWeek</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure. </li>
 * <li>Set the <b>JobTime</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to the time the job should execute.</li>
 * </ul>
 * <div class="alert"><b>Note</b>  You do not need to set both the  <b>DaysOfMonth</b> and the  <b>DaysOfWeek</b> members of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure.</div>
 * <div> </div>
 * The job executes at the time specified by the <b>JobTime</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure pointed to by the <i>Buffer</i> parameter, once for each day set in the  <b>DaysOfMonth</b> or <b>DaysOfWeek</b> members of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure. After each job executes, the corresponding bit is cleared. When the last bit is cleared, the job is deleted.
 * 
 * To schedule a job that executes periodically:
 * 
 * <ul>
 * <li>Set the appropriate bits in the <b>DaysOfMonth</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure or</li>
 * <li>Set the appropriate bits in the <b>DaysOfWeek</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure. </li>
 * <li>Set the <b>JobTime</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to the time the job should execute.</li>
 * <li>Set the job submission flag JOB_RUN_PERIODICALLY in the <b>Flags</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure.</li>
 * </ul>
 * <div class="alert"><b>Note</b>  You do not need to set both the  <b>DaysOfMonth</b> and the  <b>DaysOfWeek</b> members of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure.</div>
 * <div> </div>
 * The job will execute periodically, at the time specified by the <b>JobTime</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure pointed to by the <i>Buffer</i> parameter, on each day set in the <b>DaysOfMonth</b> or <b>DaysOfWeek</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure. The job will not be deleted as a result of the repeated executions. The only way to delete the job is by an explicit call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/nf-lmat-netschedulejobdel">NetScheduleJobDel</a> function.
 * 
 * See 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure for a description of the <b>DaysOfWeek</b>, <b>DaysOfMonth</b>, and  job property bitmasks.
 * 
 * On Windows 2000, the earlier AT service and the Task Scheduler were combined. The Task Scheduler service was only accurate to the minute.  Therefore, the <b>NetScheduleJobAdd</b> function only uses hours and minutes specified in the <b>JobTime</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure when a job is scheduled to run. 
 * 
 * Starting with   Windows Vista, the precision for the Task Scheduler was increased to the second. Therefore, the <b>NetScheduleJobAdd</b> function uses only the hours, minutes, and seconds specified in the <b>JobTime</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure when a job is scheduled to run.
 * @param {PWSTR} Servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Pointer<Integer>} _Buffer A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure describing the job to submit. For more information about scheduling jobs using different job properties, see the following Remarks section and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
 * @param {Pointer<Integer>} JobId A pointer that receives a job identifier for the newly submitted job. This entry is valid only if the function returns successfully.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmat/nf-lmat-netschedulejobadd
 * @since windows5.0
 */
export NetScheduleJobAdd(Servername, _Buffer, JobId) {
    Servername := Servername is String ? StrPtr(Servername) : Servername

    _BufferMarshal := _Buffer is VarRef ? "char*" : "ptr"
    JobIdMarshal := JobId is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetScheduleJobAdd", "ptr", Servername, _BufferMarshal, _Buffer, JobIdMarshal, JobId, UInt32)
    return result
}

/**
 * The NetScheduleJobDel function deletes a range of jobs queued to run at a computer. This function requires that the schedule service be started at the computer to which the job deletion request is being sent.
 * @remarks
 * Normally only members of the local Administrators group on the computer where the schedule job is being deleted can successfully execute this function. If the server name passed in the string pointed to by the <i>Servername</i> parameter is a remote server, then only members of the local Administrators group on the  server can successfully execute this function. 
 * 
 * If the following registry value has the least significant bit set (for example, 0x00000001), then users belonging to the Server Operators group can also successfully execute this function.
 * 
 * 
 * <b>HKLM\System\CurrentControlSet\Control\Lsa\SubmitControl</b>
 * 
 * Call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/nf-lmat-netschedulejobenum">NetScheduleJobEnum</a> function to retrieve the job identifier for one or more scheduled jobs.
 * 
 * The 
 * <b>NetScheduleJobDel</b> function deletes all jobs whose job identifiers are in the range <i>MinJobId</i> through <i>MaxJobId</i>.
 * 
 * To delete all scheduled jobs at the server, you can call 
 * <b>NetScheduleJobDel</b> specifying <i>MinJobId</i> equal to 0 and <i>MaxJobId</i> equal to – 1. To delete one job, specify the job's identifier for both the <i>MinJobId</i> parameter and the <i>MaxJobId</i> parameter.
 * @param {PWSTR} Servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} MinJobId The minimum job identifier. Jobs with a job identifier smaller than <i>MinJobId</i> will not be deleted.
 * @param {Integer} MaxJobId The  maximum job identifier. Jobs with a job identifier larger than <i>MaxJobId</i> will not be deleted.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmat/nf-lmat-netschedulejobdel
 * @since windows5.0
 */
export NetScheduleJobDel(Servername, MinJobId, MaxJobId) {
    Servername := Servername is String ? StrPtr(Servername) : Servername

    result := DllCall("NETAPI32.dll\NetScheduleJobDel", "ptr", Servername, "uint", MinJobId, "uint", MaxJobId, UInt32)
    return result
}

/**
 * The NetScheduleJobEnum function lists the jobs queued on a specified computer. This function requires that the schedule service be started.
 * @remarks
 * Normally only members of the local Administrators group on the computer where the schedule job is being enumerated can successfully execute this function. If the server name passed in the string pointed to by the <i>Servername</i> parameter is a remote server, then only members of the local Administrators group on the  server can successfully execute this function. 
 * 
 * If the following registry value has the least significant bit set (for example, 0x00000001), then users belonging to the Server Operators group can also successfully execute this function.
 * 
 * 
 * <b>HKLM\System\CurrentControlSet\Control\Lsa\SubmitControl</b>
 * 
 * Each entry returned contains an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_enum">AT_ENUM</a> structure. The value of the <b>JobId</b> member can be used when calling functions that require a job identifier parameter, such as the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/nf-lmat-netschedulejobdel">NetScheduleJobDel</a> function.
 * @param {PWSTR} Servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Pointer<Pointer<Integer>>} PointerToBuffer A pointer to the buffer that receives the data. The return information is an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_enum">AT_ENUM</a> structures. The buffer is allocated by the system and must be freed using a single call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
 * @param {Integer} PrefferedMaximumLength A value that indicates the preferred maximum length of the returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @param {Pointer<Integer>} EntriesRead A pointer to a value that receives the count of elements actually enumerated.
 * @param {Pointer<Integer>} TotalEntries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
 * @param {Pointer<Integer>} ResumeHandle A pointer to a value that contains a resume handle which is used to continue a job enumeration. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, then no resume handle is stored.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmat/nf-lmat-netschedulejobenum
 * @since windows5.0
 */
export NetScheduleJobEnum(Servername, PointerToBuffer, PrefferedMaximumLength, EntriesRead, TotalEntries, ResumeHandle) {
    Servername := Servername is String ? StrPtr(Servername) : Servername

    PointerToBufferMarshal := PointerToBuffer is VarRef ? "ptr*" : "ptr"
    EntriesReadMarshal := EntriesRead is VarRef ? "uint*" : "ptr"
    TotalEntriesMarshal := TotalEntries is VarRef ? "uint*" : "ptr"
    ResumeHandleMarshal := ResumeHandle is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\NetScheduleJobEnum", "ptr", Servername, PointerToBufferMarshal, PointerToBuffer, "uint", PrefferedMaximumLength, EntriesReadMarshal, EntriesRead, TotalEntriesMarshal, TotalEntries, ResumeHandleMarshal, ResumeHandle, UInt32)
    return result
}

/**
 * The NetScheduleJobGetInfo function retrieves information about a particular job queued on a specified computer. This function requires that the schedule service be started.
 * @remarks
 * Normally only members of the local Administrators group on the computer where the schedule job is being enumerated can successfully execute this function. If the server name passed in the string pointed to by the <i>Servername</i> parameter is a remote server, then only members of the local Administrators group on the  server can successfully execute this function. 
 * 
 * If the following registry value has the least significant bit set (for example, 0x00000001), then users belonging to the Server Operators group can also successfully execute this function.
 * 
 * 
 * <b>HKLM\System\CurrentControlSet\Control\Lsa\SubmitControl</b>
 * @param {PWSTR} Servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {Integer} JobId A value that indicates the identifier of the job for which to retrieve information.
 * @param {Pointer<Pointer<Integer>>} PointerToBuffer A pointer to the buffer that receives the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure describing the specified job. This buffer is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
 * @returns {Integer} If the function succeeds, the return value is NERR_Success.
 * 
 * If the function fails, the return value is a system error code. For a list of error codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmat/nf-lmat-netschedulejobgetinfo
 * @since windows5.0
 */
export NetScheduleJobGetInfo(Servername, JobId, PointerToBuffer) {
    Servername := Servername is String ? StrPtr(Servername) : Servername

    PointerToBufferMarshal := PointerToBuffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\NetScheduleJobGetInfo", "ptr", Servername, "uint", JobId, PointerToBufferMarshal, PointerToBuffer, UInt32)
    return result
}

/**
 * 
 * @param {PSTR} lpszCallerName 
 * @param {Integer} dwFlags 
 * @returns {Integer} 
 */
export TraceRegisterExA(lpszCallerName, dwFlags) {
    lpszCallerName := lpszCallerName is String ? StrPtr(lpszCallerName) : lpszCallerName

    result := DllCall("rtutils.dll\TraceRegisterExA", "ptr", lpszCallerName, "uint", dwFlags, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @returns {Integer} 
 */
export TraceDeregisterA(dwTraceID) {
    result := DllCall("rtutils.dll\TraceDeregisterA", "uint", dwTraceID, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @returns {Integer} 
 */
export TraceDeregisterExA(dwTraceID, dwFlags) {
    result := DllCall("rtutils.dll\TraceDeregisterExA", "uint", dwTraceID, "uint", dwFlags, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Pointer<HANDLE>} lphConsole 
 * @returns {Integer} 
 */
export TraceGetConsoleA(dwTraceID, lphConsole) {
    result := DllCall("rtutils.dll\TraceGetConsoleA", "uint", dwTraceID, HANDLE.Ptr, lphConsole, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {PSTR} lpszFormat 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {Integer} 
 */
export TracePrintfA(dwTraceID, lpszFormat, args*) {
    lpszFormat := lpszFormat is String ? StrPtr(lpszFormat) : lpszFormat

    varArgs := [args*]
    varArgs.Push(UInt32)

    result := DllCall("rtutils.dll\TracePrintfA", "uint", dwTraceID, "ptr", lpszFormat, varArgs*)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @param {PSTR} lpszFormat 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {Integer} 
 */
export TracePrintfExA(dwTraceID, dwFlags, lpszFormat, args*) {
    lpszFormat := lpszFormat is String ? StrPtr(lpszFormat) : lpszFormat

    varArgs := [args*]
    varArgs.Push(UInt32)

    result := DllCall("rtutils.dll\TracePrintfExA", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszFormat, varArgs*)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @param {PSTR} lpszFormat 
 * @param {Pointer<Integer>} arglist 
 * @returns {Integer} 
 */
export TraceVprintfExA(dwTraceID, dwFlags, lpszFormat, arglist) {
    lpszFormat := lpszFormat is String ? StrPtr(lpszFormat) : lpszFormat

    arglistMarshal := arglist is VarRef ? "char*" : "ptr"

    result := DllCall("rtutils.dll\TraceVprintfExA", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszFormat, arglistMarshal, arglist, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @param {PSTR} lpszString 
 * @returns {Integer} 
 */
export TracePutsExA(dwTraceID, dwFlags, lpszString) {
    lpszString := lpszString is String ? StrPtr(lpszString) : lpszString

    result := DllCall("rtutils.dll\TracePutsExA", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszString, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @param {Pointer<Integer>} lpbBytes 
 * @param {Integer} dwByteCount 
 * @param {Integer} dwGroupSize 
 * @param {BOOL} bAddressPrefix 
 * @param {PSTR} lpszPrefix 
 * @returns {Integer} 
 */
export TraceDumpExA(dwTraceID, dwFlags, lpbBytes, dwByteCount, dwGroupSize, bAddressPrefix, lpszPrefix) {
    lpszPrefix := lpszPrefix is String ? StrPtr(lpszPrefix) : lpszPrefix

    lpbBytesMarshal := lpbBytes is VarRef ? "char*" : "ptr"

    result := DllCall("rtutils.dll\TraceDumpExA", "uint", dwTraceID, "uint", dwFlags, lpbBytesMarshal, lpbBytes, "uint", dwByteCount, "uint", dwGroupSize, BOOL, bAddressPrefix, "ptr", lpszPrefix, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} lpszCallerName 
 * @param {Integer} dwFlags 
 * @returns {Integer} 
 */
export TraceRegisterExW(lpszCallerName, dwFlags) {
    lpszCallerName := lpszCallerName is String ? StrPtr(lpszCallerName) : lpszCallerName

    result := DllCall("rtutils.dll\TraceRegisterExW", "ptr", lpszCallerName, "uint", dwFlags, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @returns {Integer} 
 */
export TraceDeregisterW(dwTraceID) {
    result := DllCall("rtutils.dll\TraceDeregisterW", "uint", dwTraceID, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @returns {Integer} 
 */
export TraceDeregisterExW(dwTraceID, dwFlags) {
    result := DllCall("rtutils.dll\TraceDeregisterExW", "uint", dwTraceID, "uint", dwFlags, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Pointer<HANDLE>} lphConsole 
 * @returns {Integer} 
 */
export TraceGetConsoleW(dwTraceID, lphConsole) {
    result := DllCall("rtutils.dll\TraceGetConsoleW", "uint", dwTraceID, HANDLE.Ptr, lphConsole, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {PWSTR} lpszFormat 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {Integer} 
 */
export TracePrintfW(dwTraceID, lpszFormat, args*) {
    lpszFormat := lpszFormat is String ? StrPtr(lpszFormat) : lpszFormat

    varArgs := [args*]
    varArgs.Push(UInt32)

    result := DllCall("rtutils.dll\TracePrintfW", "uint", dwTraceID, "ptr", lpszFormat, varArgs*)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @param {PWSTR} lpszFormat 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {Integer} 
 */
export TracePrintfExW(dwTraceID, dwFlags, lpszFormat, args*) {
    lpszFormat := lpszFormat is String ? StrPtr(lpszFormat) : lpszFormat

    varArgs := [args*]
    varArgs.Push(UInt32)

    result := DllCall("rtutils.dll\TracePrintfExW", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszFormat, varArgs*)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @param {PWSTR} lpszFormat 
 * @param {Pointer<Integer>} arglist 
 * @returns {Integer} 
 */
export TraceVprintfExW(dwTraceID, dwFlags, lpszFormat, arglist) {
    lpszFormat := lpszFormat is String ? StrPtr(lpszFormat) : lpszFormat

    arglistMarshal := arglist is VarRef ? "char*" : "ptr"

    result := DllCall("rtutils.dll\TraceVprintfExW", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszFormat, arglistMarshal, arglist, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @param {PWSTR} lpszString 
 * @returns {Integer} 
 */
export TracePutsExW(dwTraceID, dwFlags, lpszString) {
    lpszString := lpszString is String ? StrPtr(lpszString) : lpszString

    result := DllCall("rtutils.dll\TracePutsExW", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszString, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwTraceID 
 * @param {Integer} dwFlags 
 * @param {Pointer<Integer>} lpbBytes 
 * @param {Integer} dwByteCount 
 * @param {Integer} dwGroupSize 
 * @param {BOOL} bAddressPrefix 
 * @param {PWSTR} lpszPrefix 
 * @returns {Integer} 
 */
export TraceDumpExW(dwTraceID, dwFlags, lpbBytes, dwByteCount, dwGroupSize, bAddressPrefix, lpszPrefix) {
    lpszPrefix := lpszPrefix is String ? StrPtr(lpszPrefix) : lpszPrefix

    lpbBytesMarshal := lpbBytes is VarRef ? "char*" : "ptr"

    result := DllCall("rtutils.dll\TraceDumpExW", "uint", dwTraceID, "uint", dwFlags, lpbBytesMarshal, lpbBytes, "uint", dwByteCount, "uint", dwGroupSize, BOOL, bAddressPrefix, "ptr", lpszPrefix, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwMessageId 
 * @param {Integer} cNumberOfSubStrings 
 * @param {Pointer<PSTR>} plpwsSubStrings 
 * @param {Integer} dwErrorCode 
 * @returns {String} Nothing - always returns an empty string
 */
export LogErrorA(dwMessageId, cNumberOfSubStrings, plpwsSubStrings, dwErrorCode) {
    plpwsSubStringsMarshal := plpwsSubStrings is VarRef ? "ptr*" : "ptr"

    DllCall("rtutils.dll\LogErrorA", "uint", dwMessageId, "uint", cNumberOfSubStrings, plpwsSubStringsMarshal, plpwsSubStrings, "uint", dwErrorCode)
}

/**
 * 
 * @param {Integer} wEventType 
 * @param {Integer} dwMessageId 
 * @param {Integer} cNumberOfSubStrings 
 * @param {Pointer<PSTR>} plpwsSubStrings 
 * @returns {String} Nothing - always returns an empty string
 */
export LogEventA(wEventType, dwMessageId, cNumberOfSubStrings, plpwsSubStrings) {
    plpwsSubStringsMarshal := plpwsSubStrings is VarRef ? "ptr*" : "ptr"

    DllCall("rtutils.dll\LogEventA", "uint", wEventType, "uint", dwMessageId, "uint", cNumberOfSubStrings, plpwsSubStringsMarshal, plpwsSubStrings)
}

/**
 * 
 * @param {Integer} dwMessageId 
 * @param {Integer} cNumberOfSubStrings 
 * @param {Pointer<PWSTR>} plpwsSubStrings 
 * @param {Integer} dwErrorCode 
 * @returns {String} Nothing - always returns an empty string
 */
export LogErrorW(dwMessageId, cNumberOfSubStrings, plpwsSubStrings, dwErrorCode) {
    plpwsSubStringsMarshal := plpwsSubStrings is VarRef ? "ptr*" : "ptr"

    DllCall("rtutils.dll\LogErrorW", "uint", dwMessageId, "uint", cNumberOfSubStrings, plpwsSubStringsMarshal, plpwsSubStrings, "uint", dwErrorCode)
}

/**
 * 
 * @param {Integer} wEventType 
 * @param {Integer} dwMessageId 
 * @param {Integer} cNumberOfSubStrings 
 * @param {Pointer<PWSTR>} plpwsSubStrings 
 * @returns {String} Nothing - always returns an empty string
 */
export LogEventW(wEventType, dwMessageId, cNumberOfSubStrings, plpwsSubStrings) {
    plpwsSubStringsMarshal := plpwsSubStrings is VarRef ? "ptr*" : "ptr"

    DllCall("rtutils.dll\LogEventW", "uint", wEventType, "uint", dwMessageId, "uint", cNumberOfSubStrings, plpwsSubStringsMarshal, plpwsSubStrings)
}

/**
 * 
 * @param {PSTR} lpszSource 
 * @returns {HANDLE} 
 */
export RouterLogRegisterA(lpszSource) {
    lpszSource := lpszSource is String ? StrPtr(lpszSource) : lpszSource

    result := DllCall("rtutils.dll\RouterLogRegisterA", "ptr", lpszSource, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogDeregisterA(hLogHandle) {
    DllCall("rtutils.dll\RouterLogDeregisterA", HANDLE, hLogHandle)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwMessageId 
 * @param {Integer} dwSubStringCount 
 * @param {Pointer<PSTR>} plpszSubStringArray 
 * @param {Integer} dwErrorCode 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventA(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwErrorCode) {
    plpszSubStringArrayMarshal := plpszSubStringArray is VarRef ? "ptr*" : "ptr"

    DllCall("rtutils.dll\RouterLogEventA", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, plpszSubStringArrayMarshal, plpszSubStringArray, "uint", dwErrorCode)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwMessageId 
 * @param {Integer} dwSubStringCount 
 * @param {Pointer<PSTR>} plpszSubStringArray 
 * @param {Integer} dwDataBytes 
 * @param {Pointer<Integer>} lpDataBytes 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventDataA(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwDataBytes, lpDataBytes) {
    plpszSubStringArrayMarshal := plpszSubStringArray is VarRef ? "ptr*" : "ptr"
    lpDataBytesMarshal := lpDataBytes is VarRef ? "char*" : "ptr"

    DllCall("rtutils.dll\RouterLogEventDataA", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, plpszSubStringArrayMarshal, plpszSubStringArray, "uint", dwDataBytes, lpDataBytesMarshal, lpDataBytes)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwMessageId 
 * @param {Integer} dwSubStringCount 
 * @param {Pointer<PSTR>} plpszSubStringArray 
 * @param {Integer} dwErrorCode 
 * @param {Integer} dwErrorIndex 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventStringA(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwErrorCode, dwErrorIndex) {
    plpszSubStringArrayMarshal := plpszSubStringArray is VarRef ? "ptr*" : "ptr"

    DllCall("rtutils.dll\RouterLogEventStringA", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, plpszSubStringArrayMarshal, plpszSubStringArray, "uint", dwErrorCode, "uint", dwErrorIndex)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwErrorCode 
 * @param {Integer} dwMessageId 
 * @param {PSTR} ptszFormat 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventExA(hLogHandle, dwEventType, dwErrorCode, dwMessageId, ptszFormat, args*) {
    ptszFormat := ptszFormat is String ? StrPtr(ptszFormat) : ptszFormat

    varArgs := [args*]

    DllCall("rtutils.dll\RouterLogEventExA", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwErrorCode, "uint", dwMessageId, "ptr", ptszFormat, varArgs*)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwErrorCode 
 * @param {Integer} dwMessageId 
 * @param {PSTR} ptszFormat 
 * @param {Pointer<Integer>} arglist 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventValistExA(hLogHandle, dwEventType, dwErrorCode, dwMessageId, ptszFormat, arglist) {
    ptszFormat := ptszFormat is String ? StrPtr(ptszFormat) : ptszFormat

    arglistMarshal := arglist is VarRef ? "char*" : "ptr"

    DllCall("rtutils.dll\RouterLogEventValistExA", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwErrorCode, "uint", dwMessageId, "ptr", ptszFormat, arglistMarshal, arglist)
}

/**
 * 
 * @param {Integer} dwErrorCode 
 * @param {Pointer<PSTR>} lplpszErrorString 
 * @returns {Integer} 
 */
export RouterGetErrorStringA(dwErrorCode, lplpszErrorString) {
    lplpszErrorStringMarshal := lplpszErrorString is VarRef ? "ptr*" : "ptr"

    result := DllCall("rtutils.dll\RouterGetErrorStringA", "uint", dwErrorCode, lplpszErrorStringMarshal, lplpszErrorString, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} lpszSource 
 * @returns {HANDLE} 
 */
export RouterLogRegisterW(lpszSource) {
    lpszSource := lpszSource is String ? StrPtr(lpszSource) : lpszSource

    result := DllCall("rtutils.dll\RouterLogRegisterW", "ptr", lpszSource, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogDeregisterW(hLogHandle) {
    DllCall("rtutils.dll\RouterLogDeregisterW", HANDLE, hLogHandle)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwMessageId 
 * @param {Integer} dwSubStringCount 
 * @param {Pointer<PWSTR>} plpszSubStringArray 
 * @param {Integer} dwErrorCode 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventW(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwErrorCode) {
    plpszSubStringArrayMarshal := plpszSubStringArray is VarRef ? "ptr*" : "ptr"

    DllCall("rtutils.dll\RouterLogEventW", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, plpszSubStringArrayMarshal, plpszSubStringArray, "uint", dwErrorCode)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwMessageId 
 * @param {Integer} dwSubStringCount 
 * @param {Pointer<PWSTR>} plpszSubStringArray 
 * @param {Integer} dwDataBytes 
 * @param {Pointer<Integer>} lpDataBytes 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventDataW(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwDataBytes, lpDataBytes) {
    plpszSubStringArrayMarshal := plpszSubStringArray is VarRef ? "ptr*" : "ptr"
    lpDataBytesMarshal := lpDataBytes is VarRef ? "char*" : "ptr"

    DllCall("rtutils.dll\RouterLogEventDataW", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, plpszSubStringArrayMarshal, plpszSubStringArray, "uint", dwDataBytes, lpDataBytesMarshal, lpDataBytes)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwMessageId 
 * @param {Integer} dwSubStringCount 
 * @param {Pointer<PWSTR>} plpszSubStringArray 
 * @param {Integer} dwErrorCode 
 * @param {Integer} dwErrorIndex 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventStringW(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwErrorCode, dwErrorIndex) {
    plpszSubStringArrayMarshal := plpszSubStringArray is VarRef ? "ptr*" : "ptr"

    DllCall("rtutils.dll\RouterLogEventStringW", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, plpszSubStringArrayMarshal, plpszSubStringArray, "uint", dwErrorCode, "uint", dwErrorIndex)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwErrorCode 
 * @param {Integer} dwMessageId 
 * @param {PWSTR} ptszFormat 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventExW(hLogHandle, dwEventType, dwErrorCode, dwMessageId, ptszFormat, args*) {
    ptszFormat := ptszFormat is String ? StrPtr(ptszFormat) : ptszFormat

    varArgs := [args*]

    DllCall("rtutils.dll\RouterLogEventExW", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwErrorCode, "uint", dwMessageId, "ptr", ptszFormat, varArgs*)
}

/**
 * 
 * @param {HANDLE} hLogHandle 
 * @param {Integer} dwEventType 
 * @param {Integer} dwErrorCode 
 * @param {Integer} dwMessageId 
 * @param {PWSTR} ptszFormat 
 * @param {Pointer<Integer>} arglist 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterLogEventValistExW(hLogHandle, dwEventType, dwErrorCode, dwMessageId, ptszFormat, arglist) {
    ptszFormat := ptszFormat is String ? StrPtr(ptszFormat) : ptszFormat

    arglistMarshal := arglist is VarRef ? "char*" : "ptr"

    DllCall("rtutils.dll\RouterLogEventValistExW", HANDLE, hLogHandle, "uint", dwEventType, "uint", dwErrorCode, "uint", dwMessageId, "ptr", ptszFormat, arglistMarshal, arglist)
}

/**
 * 
 * @param {Integer} dwErrorCode 
 * @param {Pointer<PWSTR>} lplpwszErrorString 
 * @returns {Integer} 
 */
export RouterGetErrorStringW(dwErrorCode, lplpwszErrorString) {
    lplpwszErrorStringMarshal := lplpwszErrorString is VarRef ? "ptr*" : "ptr"

    result := DllCall("rtutils.dll\RouterGetErrorStringW", "uint", dwErrorCode, lplpwszErrorStringMarshal, lplpwszErrorString, UInt32)
    return result
}

/**
 * 
 * @param {PSTR} pszFailedAssertion 
 * @param {PSTR} pszFileName 
 * @param {Integer} dwLineNumber 
 * @param {PSTR} pszMessage 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterAssert(pszFailedAssertion, pszFileName, dwLineNumber, pszMessage) {
    pszFailedAssertion := pszFailedAssertion is String ? StrPtr(pszFailedAssertion) : pszFailedAssertion
    pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
    pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

    DllCall("rtutils.dll\RouterAssert", "ptr", pszFailedAssertion, "ptr", pszFileName, "uint", dwLineNumber, "ptr", pszMessage)
}

/**
 * 
 * @param {Integer} dwTransportId 
 * @param {Pointer<Pointer<Integer>>} lplpBuffer 
 * @param {Pointer<Integer>} lpdwEntriesRead 
 * @returns {Integer} 
 */
export MprSetupProtocolEnum(dwTransportId, lplpBuffer, lpdwEntriesRead) {
    lplpBufferMarshal := lplpBuffer is VarRef ? "ptr*" : "ptr"
    lpdwEntriesReadMarshal := lpdwEntriesRead is VarRef ? "uint*" : "ptr"

    result := DllCall("rtutils.dll\MprSetupProtocolEnum", "uint", dwTransportId, lplpBufferMarshal, lplpBuffer, lpdwEntriesReadMarshal, lpdwEntriesRead, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} lpBuffer 
 * @returns {Integer} 
 */
export MprSetupProtocolFree(lpBuffer) {
    lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("rtutils.dll\MprSetupProtocolFree", lpBufferMarshal, lpBuffer, UInt32)
    return result
}

;@endregion Functions
