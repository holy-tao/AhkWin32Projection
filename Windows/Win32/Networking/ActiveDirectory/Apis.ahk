#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Security\Authentication\Identity\LSA_FOREST_TRUST_INFORMATION.ahk" { LSA_FOREST_TRUST_INFORMATION }
#Import ".\DS_REPSYNCALL_ERRINFOA.ahk" { DS_REPSYNCALL_ERRINFOA }
#Import ".\DS_SCHEMA_GUID_MAPW.ahk" { DS_SCHEMA_GUID_MAPW }
#Import ".\IADsContainer.ahk" { IADsContainer }
#Import "..\WinSock\SOCKET_ADDRESS.ahk" { SOCKET_ADDRESS }
#Import ".\DSBROWSEINFOW.ahk" { DSBROWSEINFOW }
#Import ".\DS_SITE_COST_INFO.ahk" { DS_SITE_COST_INFO }
#Import ".\ADSVALUE.ahk" { ADSVALUE }
#Import ".\DS_NAME_FLAGS.ahk" { DS_NAME_FLAGS }
#Import ".\DS_DOMAIN_TRUSTSW.ahk" { DS_DOMAIN_TRUSTSW }
#Import ".\DSBROWSEINFOA.ahk" { DSBROWSEINFOA }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import ".\DOMAIN_CONTROLLER_INFOA.ahk" { DOMAIN_CONTROLLER_INFOA }
#Import ".\DS_REPL_INFO_TYPE.ahk" { DS_REPL_INFO_TYPE }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOMAIN_CONTROLLER_INFOW.ahk" { DOMAIN_CONTROLLER_INFOW }
#Import ".\DS_NAME_RESULTA.ahk" { DS_NAME_RESULTA }
#Import ".\DS_DOMAIN_TRUSTSA.ahk" { DS_DOMAIN_TRUSTSA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DS_REPSYNCALL_ERRINFOW.ahk" { DS_REPSYNCALL_ERRINFOW }
#Import ".\SCHEDULE.ahk" { SCHEDULE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DS_KCC_TASKID.ahk" { DS_KCC_TASKID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\DS_SPN_NAME_TYPE.ahk" { DS_SPN_NAME_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DS_MANGLE_FOR.ahk" { DS_MANGLE_FOR }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import ".\DS_SCHEMA_GUID_MAPA.ahk" { DS_SCHEMA_GUID_MAPA }
#Import ".\ADSPROPINITPARAMS.ahk" { ADSPROPINITPARAMS }
#Import ".\DS_SPN_WRITE_OP.ahk" { DS_SPN_WRITE_OP }
#Import ".\DSROLE_PRIMARY_DOMAIN_INFO_LEVEL.ahk" { DSROLE_PRIMARY_DOMAIN_INFO_LEVEL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ADS_ATTR_INFO.ahk" { ADS_ATTR_INFO }
#Import ".\ADS_AUTHENTICATION_ENUM.ahk" { ADS_AUTHENTICATION_ENUM }
#Import "..\..\System\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import ".\DS_NAME_FORMAT.ahk" { DS_NAME_FORMAT }
#Import ".\DS_NAME_RESULTW.ahk" { DS_NAME_RESULTW }
#Import ".\ADSPROPERROR.ahk" { ADSPROPERROR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */

;@region Functions
/**
 * Binds to an object given its path and a specified interface identifier.
 * @remarks
 * A C/C++ client calls the <b>ADsGetObject</b> helper function to bind to an ADSI object. It is equivalent to a Visual Basic client calling the <a href="https://docs.microsoft.com/windows/desktop/ADSI/binding-with-getobject-and-adsgetobject">GetObject</a> function. They both take an ADsPath as input and returns a pointer to the requested interface. By default the binding uses ADS_SECURE_AUTHENTICATION option with the security context of the calling thread. However, if the authentication fails, the secure bind is downgraded to an anonymous bind, for example, a simple bind without user credentials. To securely bind to an ADSI object, use the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsopenobject">ADsOpenObject</a> function instead of the  <b>ADsGetObject</b> function.
 * 
 * For a code example that shows how to use <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsopenobject">ADsOpenObject</a>, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/binding-with-getobject-and-adsgetobject">Binding With GetObject and ADsGetObject</a>.
 * 
 * It is possible to bind to an ADSI object with a user credential different from that of the currently logged-on user. To perform this operation, use the   <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsopenobject">ADsOpenObject</a> function.
 * @param {PWSTR} lpszPathName Type: <b>LPCWSTR</b>
 * 
 * The null-terminated Unicode string that specifies the path  used to bind to the object in the underlying directory service. For more information and code examples for binding strings for this parameter, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/ldap-adspath">LDAP ADsPath</a> and  <a href="https://docs.microsoft.com/windows/desktop/ADSI/winnt-adspath">WinNT ADsPath</a>.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * Interface identifier for a specified interface on this object.
 * @param {Pointer<Pointer<Void>>} ppObject Type: <b>VOID**</b>
 * 
 * Pointer to a pointer to the requested Interface.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This method supports the standard <b>HRESULT</b> return values, as well as the following.
 * 
 * For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adsgetobject
 * @since windows6.0.6000
 */
export ADsGetObject(lpszPathName, riid, ppObject) {
    lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

    ppObjectMarshal := ppObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ACTIVEDS.dll\ADsGetObject", "ptr", lpszPathName, Guid.Ptr, riid, ppObjectMarshal, ppObject, "HRESULT")
    return result
}

/**
 * The ADsBuildEnumerator function creates an enumerator object for the specified ADSI container object.
 * @remarks
 * The <b>ADsBuildEnumerator</b> helper function wraps the calls used to retrieve the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface on the enumerator object.
 * 
 * <p class="proch"><b> To enumerate the available objects in a container</b>
 * 
 * <ol>
 * <li>Call the <b>ADsBuildEnumerator</b> function to create an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> object that will enumerate the contents of the container.</li>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsenumeratenext">ADsEnumerateNext</a> function as many times as necessary to retrieve the items from the enumerator object.</li>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsfreeenumerator">ADSFreeEnumerator</a> function to release the enumerator object when it is no longer required.</li>
 * </ol>
 * If the server supports paged searches and the client has specified a page size that exceeds the maximum search results allowed by the server, the <b>ADsBuildEnumerator</b> function will forward errors and results from the server to the user.
 * @param {IADsContainer} pADsContainer Type: <b>IADsContainer*</b>
 * 
 * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscontainer">IADsContainer</a> interface for the object to enumerate.
 * @returns {IEnumVARIANT} Type: <b>IEnumVARIANT**</b>
 * 
 * Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface pointer that receives the enumerator object created for the specified container object.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adsbuildenumerator
 * @since windows6.0.6000
 */
export ADsBuildEnumerator(pADsContainer) {
    result := DllCall("ACTIVEDS.dll\ADsBuildEnumerator", "ptr", pADsContainer, "ptr*", &ppEnumVariant := 0, "HRESULT")
    return IEnumVARIANT(ppEnumVariant)
}

/**
 * Frees an enumerator object created with the ADsBuildEnumerator function.
 * @remarks
 * The general process for enumerating objects in a container is as follows.
 * 
 * First, create an enumerator object on that container.
 * 
 * Second, retrieve the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface pointer.
 * 
 * Third, call the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsenumeratenext">ADsEnumerateNext</a> function to return an enumerated set of elements from the enumerator object.
 * 
 * Fourth, call the <b>ADSFreeEnumerator</b> function to free the enumerator object.
 * 
 * For more information and a code example, see <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsbuildenumerator">ADsBuildEnumerator</a>.
 * @param {IEnumVARIANT} pEnumVariant Type: <b>IEnumVARIANT*</b>
 * 
 * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface on the enumerator object to be freed.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This method supports standard return values, as well as the following.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adsfreeenumerator
 * @since windows6.0.6000
 */
export ADsFreeEnumerator(pEnumVariant) {
    result := DllCall("ACTIVEDS.dll\ADsFreeEnumerator", "ptr", pEnumVariant, "HRESULT")
    return result
}

/**
 * The ADsEnumerateNext function enumerates through a specified number of elements from the current cursor position of the enumerator.
 * @remarks
 * The general process to enumerate objects in a container involves the following:
 * 
 * First, create an enumerator object on that container.
 * 
 * Second, retrieve the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface pointer.
 * 
 * Third, call the <b>ADsEnumerateNext</b> function to return an enumerated set of elements from the enumerator object.
 * 
 * Fourth, call the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsfreeenumerator">ADSFreeEnumerator</a> function to free the enumerator object.
 * 
 * For more information and a code example, see the  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsbuildenumerator">ADsBuildEnumerator</a> topic.
 * @param {IEnumVARIANT} pEnumVariant Type: <b>IEnumVARIANT*</b>
 * 
 * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface on the enumerator object.
 * @param {Integer} cElements Type: <b>ULONG</b>
 * 
 * Number of elements requested.
 * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
 * 
 * Pointer to the array of elements retrieved.
 * @param {Pointer<Integer>} pcElementsFetched Type: <b>ULONG*</b>
 * 
 * Actual number of elements retrieved, which can be smaller than the number of elements requested.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This method supports the standard return values.
 * 
 * For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adsenumeratenext
 * @since windows6.0.6000
 */
export ADsEnumerateNext(pEnumVariant, cElements, pvar, pcElementsFetched) {
    pcElementsFetchedMarshal := pcElementsFetched is VarRef ? "uint*" : "ptr"

    result := DllCall("ACTIVEDS.dll\ADsEnumerateNext", "ptr", pEnumVariant, "uint", cElements, VARIANT.Ptr, pvar, pcElementsFetchedMarshal, pcElementsFetched, "HRESULT")
    return result
}

/**
 * The ADsBuildVarArrayStr function builds a variant array from an array of Unicode strings.
 * @remarks
 * To support Automation, use the <b>ADsBuildVarArrayStr</b> function to convert Unicode strings to a variant array of strings.
 * @param {Pointer<PWSTR>} lppPathNames Type: <b>LPWSTR*</b>
 * 
 * Array of null-terminated Unicode strings.
 * @param {Integer} dwPathNames Type: <b>DWORD</b>
 * 
 * Number of Unicode entries in the given array.
 * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
 * 
 * Pointer to the resulting variant array.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This method supports the standard return values, as well as the following.
 * 
 * For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adsbuildvararraystr
 * @since windows6.0.6000
 */
export ADsBuildVarArrayStr(lppPathNames, dwPathNames, pVar) {
    lppPathNamesMarshal := lppPathNames is VarRef ? "ptr*" : "ptr"

    result := DllCall("ACTIVEDS.dll\ADsBuildVarArrayStr", lppPathNamesMarshal, lppPathNames, "uint", dwPathNames, VARIANT.Ptr, pVar, "HRESULT")
    return result
}

/**
 * The ADsBuildVarArrayInt function builds a variant array of integers from an array of DWORD values.
 * @remarks
 * Use the <b>ADsBuildVarArrayInt</b> function to convert the integer array into a variant array of the integers. The following code example shows how to do this.
 * 
 * 
 * ```cpp
 * DWORD dwArray[]={0,1,2,3,4};
 * long nLength = sizeof(dwArray)/sizeof(DWORD);
 * VARIANT varArray[nLength];
 * HRESULT hr = ADsBuildVarArrayInt(dwArray, nLength, varArray);
 * if (hr = E_FAIL) exit(1);
 *  
 * // Resume work with the data in varArray.
 * . . .
 * ```
 * @param {Pointer<Integer>} lpdwObjectTypes Type: <b>LPDWORD</b>
 * 
 * Array of <b>DWORD</b> values.
 * @param {Integer} dwObjectTypes Type: <b>DWORD</b>
 * 
 * Number of <b>DWORD</b> entries in the given array.
 * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
 * 
 * Pointer to the resulting variant array of integers.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This method supports standard return values.
 * 
 * For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adsbuildvararrayint
 * @since windows6.0.6000
 */
export ADsBuildVarArrayInt(lpdwObjectTypes, dwObjectTypes, pVar) {
    lpdwObjectTypesMarshal := lpdwObjectTypes is VarRef ? "uint*" : "ptr"

    result := DllCall("ACTIVEDS.dll\ADsBuildVarArrayInt", lpdwObjectTypesMarshal, lpdwObjectTypes, "uint", dwObjectTypes, VARIANT.Ptr, pVar, "HRESULT")
    return result
}

/**
 * Binds to an ADSI object using explicit user name and password credentials.
 * @remarks
 * This function should not be used just to validate user credentials.
 * 
 * A C/C++ client calls the <b>ADsOpenObject</b> helper function to bind to an ADSI object, using the user name and password supplied as credentials for the appropriate directory service. If <i>lpszUsername</i> and <i>lpszPassword</i> are <b>NULL</b> and <b>ADS_SECURE_AUTHENTICATION</b> is set, ADSI binds to the object using the security context of the calling thread, which is either the security context of the user account under which the application is running or of the client user account that the calling thread impersonates.
 * 
 * The  credentials passed to the <b>ADsOpenObject</b> function are used only with the particular object bound to and do not affect the security context of the calling thread. This means that, in the example below, the call to <b>ADsOpenObject</b> will use different credentials than the call to <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsgetobject">ADsGetObject</a>.
 * 
 * 
 * ```cpp
 * HRESULT hr;
 * IADs *padsRoot1;
 * IADs *padsRoot2;
 * 
 * hr = ADsOpenObject(L"LDAP://rootDSE",
 *     pwszUsername,
 *     pwszPassword,
 *     ADS_SECURE_AUTHENTICATION,
 *     IID_IADs,
 *     (LPVOID*)&padsRoot1);
 * 
 * hr = ADsGetObject(L"LDAP://rootDSE",
 *     IID_IADs,
 *     (LPVOID*)&padsRoot2);
 * 
 * ```
 * 
 * 
 * To work with the WinNT: provider, you can pass in <i>lpszUsername</i> as one of the following strings:
 * 
 * <ul>
 * <li>The name of a user account, that is, "jeffsmith".</li>
 * <li>The Windows style user name, that is, "Fabrikam\jeffsmith".</li>
 * </ul>
 * With the LDAP provider for Active Directory, you may pass in <i>lpszUsername</i> as one of the following strings:
 * 
 * <ul>
 * <li>The name of a user account, such as "jeffsmith". To use a user name by itself, you must set only the <b>ADS_SECURE_AUTHENTICATION</b> flag in the <i>dwReserved</i> parameter.</li>
 * <li>The user path from a previous version of Windows, such as "Fabrikam\jeffsmith".</li>
 * <li>Distinguished Name, such as "CN=Jeff Smith,OU=Sales,DC=Fabrikam,DC=Com". To use a DN, the <i>dwReserved</i> parameter must be zero or it must include the <b>ADS_USE_SSL</b> flag.</li>
 * <li>User Principal Name (UPN), such as "jeffsmith@Fabrikam.com". To use a UPN, assign the appropriate UPN value for the <b>userPrincipalName</b> attribute of the target user object.</li>
 * </ul>
 * If Kerberos authentication is required for the successful completion of a specific directory request using the LDAP provider, the <i>lpszPathName</i> binding string must use either a serverless ADsPath, such as "LDAP://CN=Jeff Smith,CN=admin,DC=Fabrikam,DC=com", or it must use an ADsPath with a fully qualified DNS server name, such as "LDAP://central3.corp.Fabrikam.com/CN=Jeff Smith,CN=admin,DC=Fabrikam,DC=com". Binding to the server using a flat NETBIOS name or a short DNS name, for example, using the short name "central3" instead of "central3.corp.Fabrikam.com", may or may not yield Kerberos authentication.
 * 
 * The following code example shows how to bind to a directory service object with the requested user credentials.
 * 
 * 
 * ```cpp
 * IADs *pObject;
 * LPWSTR szUsername = NULL;
 * LPWSTR szPassword = NULL
 * HRESULT hr;
 * 
 * // Insert code to securely retrieve the user name and password.
 * 
 * hr = ADsOpenObject(L"LDAP://CN=Jeff,DC=Fabrikam,DC=com",
 *                    "jeffsmith",
 *                    "etercespot",
 *                    ADS_SECURE_AUTHENTICATION, 
 *                    IID_IADs,
 *                    (void**) &pObject);
 * ```
 * @param {PWSTR} lpszPathName Type: <b>LPCWSTR</b>
 * 
 * The null-terminated Unicode string that specifies the ADsPath of the ADSI object. For more information and code examples of binding strings for this parameter, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/ldap-adspath">LDAP ADsPath</a> and  <a href="https://docs.microsoft.com/windows/desktop/ADSI/winnt-adspath">WinNT ADsPath</a>.
 * @param {PWSTR} lpszUserName Type: <b>LPCWSTR</b>
 * 
 * The null-terminated Unicode string that specifies the user name to supply to the directory service to use for credentials. This string should always be in the format "&lt;domain\\&gt;&lt;user name&gt;" to avoid ambiguity. For example, if DomainA and DomainB have a trust relationship and both domains have a user with the name "user1", it is not possible to predict which domain <b>ADsOpenObject</b> will use to validate "user1".
 * @param {PWSTR} lpszPassword Type: <b>LPCWSTR</b>
 * 
 * The null-terminated Unicode string that specifies the password to supply to the directory service to use for credentials.
 * @param {ADS_AUTHENTICATION_ENUM} dwReserved Type: <b>DWORD</b>
 * 
 * Provider-specific authentication flags used to define the binding options. For more information, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum">ADS_AUTHENTICATION_ENUM</a>.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * Interface identifier for the requested interface on this object.
 * @param {Pointer<Pointer<Void>>} ppObject Type: <b>VOID**</b>
 * 
 * Pointer to a  pointer to the requested interface.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This method supports the standard <b>HRESULT</b> return values, including the following.
 * 
 * For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adsopenobject
 * @since windows6.0.6000
 */
export ADsOpenObject(lpszPathName, lpszUserName, lpszPassword, dwReserved, riid, ppObject) {
    lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName
    lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName
    lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

    ppObjectMarshal := ppObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ACTIVEDS.dll\ADsOpenObject", "ptr", lpszPathName, "ptr", lpszUserName, "ptr", lpszPassword, ADS_AUTHENTICATION_ENUM, dwReserved, Guid.Ptr, riid, ppObjectMarshal, ppObject, "HRESULT")
    return result
}

/**
 * The ADsGetLastError function retrieves the calling thread's last-error code value.
 * @remarks
 * ADSI errors fall into two types according to the values of their facility code. The standard ADSI error codes have a facility code value of 0x5 and the extended ADSI error codes assume that of FACILITY_WIN32. The error values of the standard and extended ADSI error codes are of the forms of 0x80005xxx and 0x8007xxxx, respectively. Use the HRESULT_FACILITY(hr) macro to determine the ADSI error type.
 *    
 * 
 * 
 * <div class="alert"><b>Note</b>  The WinNT ADSI provider does not support <b>ADsGetLastError</b>.</div>
 * <div> </div>
 * The following code example shows how to get Win32 error codes and their descriptions using <b>ADsGetLastError</b>.
 * 
 * 
 * ```cpp
 * if (FAILED(hr))
 * {
 *     wprintf(L"An error occurred.\n  HRESULT: %x\n",hr);
 *     // If facility is Win32, get the Win32 error 
 *     if (HRESULT_FACILITY(hr)==FACILITY_WIN32)
 *     {
 *         DWORD dwLastError;
 *         WCHAR szErrorBuf[MAX_PATH];
 *         WCHAR szNameBuf[MAX_PATH];
 *         // Get extended error value.
 *         HRESULT hr_return =S_OK;
 *         hr_return = ADsGetLastError( &dwLastError,
 *                                        szErrorBuf,
 *                                        MAX_PATH,
 *                                        szNameBuf,
 *                                        MAX_PATH);
 *         if (SUCCEEDED(hr_return))
 *         {
 *              wprintf(L"Error Code: %d\n Error Text: %ws\n Provider: %ws\n", dwLastError, szErrorBuf, szNameBuf);
 *         }
 *     }
 * }
 * ```
 * 
 * 
 * If hr is 80071392, the code example returns the following.
 * 
 * 
 * ```cpp
 * An error occurred.
 *     HRESULT: 80071392
 *     Error Code: 8305
 *     Error Text: 00002071: UpdErr: DSID-030502F1, problem 6005 (ENTRY_EXISTS), data 0
 *     Provider: LDAP Provider
 * ```
 * 
 * 
 * <div class="alert"><b>Note</b>  The WinNT ADSI provider does not support <b>ADsGetLastError</b>.</div>
 * <div> </div>
 * @param {Pointer<Integer>} lpError Type: <b>LPDWORD</b>
 * 
 * Pointer to the location that receives the error code.
 * @param {PWSTR} lpErrorBuf Type: <b>LPWSTR</b>
 * 
 * Pointer to the location that receives the null-terminated Unicode string that describes the error.
 * @param {Integer} dwErrorBufLen Type: <b>DWORD</b>
 * 
 * Size, in characters, of the <i>lpErrorBuf</i> buffer. If the buffer is too small to receive the error string, the string is truncated, but still null-terminated. A buffer, of at least 256 bytes, is recommended.
 * @param {PWSTR} lpNameBuf Type: <b>LPWSTR</b>
 * 
 * Pointer to the location that receives the null-terminated Unicode string that describes the name of the provider that raised the error.
 * @param {Integer} dwNameBufLen Type: <b>DWORD</b>
 * 
 * Size, in characters, of the <i>lpNameBuf</i> buffer. If the buffer is too small to receive the name of the provider, the string is truncated, but still null-terminated.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This method supports standard return values, as well as the following.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adsgetlasterror
 * @since windows6.0.6000
 */
export ADsGetLastError(lpError, lpErrorBuf, dwErrorBufLen, lpNameBuf, dwNameBufLen) {
    lpErrorBuf := lpErrorBuf is String ? StrPtr(lpErrorBuf) : lpErrorBuf
    lpNameBuf := lpNameBuf is String ? StrPtr(lpNameBuf) : lpNameBuf

    lpErrorMarshal := lpError is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("ACTIVEDS.dll\ADsGetLastError", lpErrorMarshal, lpError, "ptr", lpErrorBuf, "uint", dwErrorBufLen, "ptr", lpNameBuf, "uint", dwNameBufLen, "HRESULT")
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The ADsSetLastError sets the last-error code value for the calling thread.
 * @remarks
 * In a custom implementation of an ADSI provider, for example, an LDAP provider, you can set an operation error message as follows.
 * 
 * 
 * ```cpp
 * ADsSetLastError(HRESULT_FROM_WIN32(ERROR_DS_OPERATIONS_ERROR),
 *                 L"ERROR_DS_OPERATIONS_ERROR",
 *                 L"LDAP Provider");
 * ```
 * 
 * 
 * The user can use the following code example to examine this operation code.
 * 
 * 
 * ```cpp
 * DWORD dwLastError;
 * WCHAR szErrorBuf[MAX_PATH];
 * WCHAR szNameBuf[MAX_PATH];
 * // Get extended error value.
 * HRESULT hr_return =S_OK;
 * hr_return = ADsGetLastError( &dwLastError,
 *                                szErrorBuf,
 *                                MAX_PATH,
 *                                szNameBuf,
 *                                MAX_PATH);
 * if (SUCCEEDED(hr_return))
 * {
 *     wprintf(L"Error Code: %d\n Error Text: %ws\n Provider: %ws\n", dwLastError, szErrorBuf, szNameBuf);
 * }
 * ```
 * 
 * 
 * The previous code example produces the following output for the operations error code set above.
 * 
 * 
 * ```cpp
 * Error value: 80072020
 * Error Text: ERROR_DS_OPERATIONS_ERROR
 * Provider: LDAP Provider
 * ```
 * 
 * 
 * If you use <b>ERROR_DS_OPERATIONS_ERROR</b> without invoking the HRESULT_FROM_WIN32 macro when setting the error, the following output is returned.
 * 
 * 
 * ```cpp
 * Error value: 2020
 * Error Text: ERROR_DS_OPERATIONS_ERROR
 * Provider: LDAP Provider
 * ```
 * @param {Integer} dwErr Type: <b>DWORD</b>
 * 
 * The error code that occurred. If this is an error defined by Windows, <i>pszError</i> is ignored. If this is ERROR_EXTENDED_ERROR, it indicates the provider has a network-specific error to report.
 * @param {PWSTR} pszError Type: <b>LPWSTR</b>
 * 
 * The null-terminated Unicode string that describes the network-specific error.
 * @param {PWSTR} pszProvider Type: <b>LPWSTR</b>
 * 
 * The null-terminated Unicode string that names the ADSI provider that raised the error.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adssetlasterror
 * @since windows6.0.6000
 */
export ADsSetLastError(dwErr, pszError, pszProvider) {
    pszError := pszError is String ? StrPtr(pszError) : pszError
    pszProvider := pszProvider is String ? StrPtr(pszProvider) : pszProvider

    DllCall("ACTIVEDS.dll\ADsSetLastError", "uint", dwErr, "ptr", pszError, "ptr", pszProvider)
}

/**
 * Allocates a block of memory of the specified size.
 * @remarks
 * The memory block returned by <b>AllocADsMem</b> is initialized to zero.
 * 
 * For more information and a code example that shows how to use the <b>AllocADsMem</b> function, see <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsmem">ReallocADsMem</a>.
 * @param {Integer} cb Type: <b>DWORD</b>
 * 
 * Contains the size, in bytes, to be allocated.
 * @returns {Pointer<Void>} Type: <b>LPVOID</b>
 * 
 * When successful, the function returns a non-<b>NULL</b> pointer to the allocated memory. The caller must free this memory when it is no longer required by passing the returned pointer to <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a>.
 * 
 * Returns <b>NULL</b> if not successful. Call  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsgetlasterror">ADsGetLastError</a> to obtain extended error status. For more information about error code values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-allocadsmem
 * @since windows6.0.6000
 */
export AllocADsMem(cb) {
    result := DllCall("ACTIVEDS.dll\AllocADsMem", "uint", cb, IntPtr)
    return result
}

/**
 * Frees the memory allocated by AllocADsMem or ReallocADsMem.
 * @remarks
 * Do not use this  function to free memory allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsstr">AllocADsStr</a> or <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsstr">ReallocADsStr</a> function. Use the  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsstr">FreeADsStr</a> function to free memory allocated with these functions.
 * 
 * For more information and  a code example that shows how to use the <b>FreeADsMem</b> function, see <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsmem">ReallocADsMem</a>.
 * @param {Pointer<Void>} pMem Type: <b>LPVOID</b>
 * 
 * Pointer to the memory to be freed. This memory must have been allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsmem">AllocADsMem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsmem">ReallocADsMem</a> function.
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * The function returns <b>TRUE</b> if successful, otherwise it returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-freeadsmem
 * @since windows6.0.6000
 */
export FreeADsMem(pMem) {
    pMemMarshal := pMem is VarRef ? "ptr" : "ptr"

    result := DllCall("ACTIVEDS.dll\FreeADsMem", pMemMarshal, pMem, BOOL)
    return result
}

/**
 * Reallocates and copies an existing memory block.
 * @remarks
 * If <i>cbNew</i> is less than <i>cbOld</i>, the existing memory is truncated to fit the new memory size.
 * @param {Pointer<Void>} pOldMem Type: <b>LPVOID</b>
 * 
 * Pointer to the memory to copy. <b>ReallocADsMem</b> will free this memory with <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a> after it has been copied. If additional memory cannot be allocated, this memory is not freed. This memory must have been allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsmem">AllocADsMem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsstr">AllocADsStr</a>, <b>ReallocADsMem</b>, or <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsstr">ReallocADsStr</a> function.
 * 
 * The caller must  free this memory when it is no longer required by passing this pointer to <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a>.
 * @param {Integer} cbOld Type: <b>DWORD</b>
 * 
 * Size, in bytes, of the memory to copy.
 * @param {Integer} cbNew Type: <b>DWORD</b>
 * 
 * Size, in bytes, of the memory to allocate.
 * @returns {Pointer<Void>} Type: <b>LPVOID</b>
 * 
 * When successful, the function returns a pointer to the new allocated memory. Otherwise it returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-reallocadsmem
 * @since windows6.0.6000
 */
export ReallocADsMem(pOldMem, cbOld, cbNew) {
    pOldMemMarshal := pOldMem is VarRef ? "ptr" : "ptr"

    result := DllCall("ACTIVEDS.dll\ReallocADsMem", pOldMemMarshal, pOldMem, "uint", cbOld, "uint", cbNew, IntPtr)
    return result
}

/**
 * Allocates memory for and copies a specified string.
 * @remarks
 * For more information and a code example that shows how to use the <b>AllocADsStr</b> function, see <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsstr">ReallocADsStr</a>.
 * @param {PWSTR} _pStr Type: <b>LPWSTR</b>
 * 
 * Pointer to a null-terminated Unicode string to be copied.
 * @returns {PWSTR} Type: <b>LPWSTR</b>
 * 
 * When successful, the function returns a non-<b>NULL</b> pointer to the allocated memory. The string in <i>pStr</i> is copied to this buffer and null-terminated. The caller must  free this memory when it is no longer required by passing the returned pointer to <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsstr">FreeADsStr</a>.
 * 
 * Returns <b>NULL</b> if not successful. Call  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsgetlasterror">ADsGetLastError</a> to obtain the extended error status. For more information about error code values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-allocadsstr
 * @since windows6.0.6000
 */
export AllocADsStr(_pStr) {
    _pStr := _pStr is String ? StrPtr(_pStr) : _pStr

    result := DllCall("ACTIVEDS.dll\AllocADsStr", "ptr", _pStr, PWSTR)
    return result
}

/**
 * Frees the memory of a string allocated by AllocADsStr or ReallocADsStr.
 * @remarks
 * Do not use this function to free memory allocated with the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsmem">AllocADsMem</a> or 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsmem">ReallocADsMem</a> function. Use the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a> function  to free memory allocated with these 
 *     functions.
 * 
 * For more information and a code example that shows how to use the 
 *     <b>FreeADsStr</b> function, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsstr">ReallocADsStr</a>.
 * @param {PWSTR} _pStr Type: <b>LPWSTR</b>
 * 
 * Pointer to the string to be freed. This string must have been allocated with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsstr">AllocADsStr</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsstr">ReallocADsStr</a> function.
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * The function returns <b>TRUE</b> if the memory is freed. Otherwise, it returns 
 *       <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-freeadsstr
 * @since windows6.0.6000
 */
export FreeADsStr(_pStr) {
    _pStr := _pStr is String ? StrPtr(_pStr) : _pStr

    result := DllCall("ACTIVEDS.dll\FreeADsStr", "ptr", _pStr, BOOL)
    return result
}

/**
 * Creates a copy of a Unicode string.
 * @param {Pointer<PWSTR>} ppStr Type: <b>LPWSTR*</b>
 * 
 * Pointer to null-terminated Unicode string pointer that receives the allocated string. <b>ReallocADsStr</b> will attempt to free this memory with <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsstr">FreeADsStr</a> before reallocating the string, so this parameter should be initialized to <b>NULL</b> if the memory should not be freed or was not allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsmem">AllocADsMem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsstr">AllocADsStr</a>, <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsmem">ReallocADsMem</a> or <b>ReallocADsStr</b> function.
 * 
 * The caller must free this memory when it is no longer required by passing this pointer to <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsstr">FreeADsStr</a>.
 * @param {PWSTR} _pStr Type: <b>LPWSTR</b>
 * 
 * Pointer to a null-terminated Unicode string that contains the string to copy.
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * The function returns <b>TRUE</b> if  successful, otherwise <b>FALSE</b> is returned.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-reallocadsstr
 * @since windows6.0.6000
 */
export ReallocADsStr(ppStr, _pStr) {
    _pStr := _pStr is String ? StrPtr(_pStr) : _pStr

    ppStrMarshal := ppStr is VarRef ? "ptr*" : "ptr"

    result := DllCall("ACTIVEDS.dll\ReallocADsStr", ppStrMarshal, ppStr, "ptr", _pStr, BOOL)
    return result
}

/**
 * The ADsEncodeBinaryData function converts a binary large object (BLOB) to the Unicode format suitable to be embedded in a search filter.
 * @remarks
 * In ADSI, search filters must be Unicode strings. Sometimes, a filter contains data that is normally represented by an opaque BLOB of data. For example, you may want to include an object security identifier in a search filter, which is of binary data. In this case, you must first call the <b>ADsEncodeBinaryData</b> function to convert the binary data to the Unicode string format. When the data is no longer required, call the  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a> function to free the converted Unicode string; that is, <i>ppszDestData</i>.
 * 
 * The <b>ADsEncodeBinaryData</b> function does not encode byte values that represent alpha-numeric characters. It will, instead, place the character into the string without encoding it. This results in the string containing a mixture of encoded and unencoded characters. For example, if the binary data is 0x05|0x1A|0x1B|0x43|0x32, the encoded string will contain "\05\1A\1BC2". This has no effect on the filter and the search filters will work correctly with these types of strings.
 * @param {Pointer<Integer>} pbSrcData Type: <b>PBYTE</b>
 * 
 * BLOB to be converted.
 * @param {Integer} dwSrcLen Type: <b>DWORD</b>
 * 
 * Size, in bytes, of the BLOB.
 * @returns {PWSTR} Type: <b>LPWSTR*</b>
 * 
 * Pointer to a null-terminated Unicode string that receives the converted data.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-adsencodebinarydata
 * @since windows6.0.6000
 */
export ADsEncodeBinaryData(pbSrcData, dwSrcLen) {
    pbSrcDataMarshal := pbSrcData is VarRef ? "char*" : "ptr"

    result := DllCall("ACTIVEDS.dll\ADsEncodeBinaryData", pbSrcDataMarshal, pbSrcData, "uint", dwSrcLen, PWSTR.Ptr, &ppszDestData := 0, "HRESULT")
    return ppszDestData
}

/**
 * 
 * @param {PWSTR} szSrcData 
 * @param {Pointer<Pointer<Integer>>} ppbDestData 
 * @param {Pointer<Integer>} pdwDestLen 
 * @returns {HRESULT} 
 */
export ADsDecodeBinaryData(szSrcData, ppbDestData, pdwDestLen) {
    szSrcData := szSrcData is String ? StrPtr(szSrcData) : szSrcData

    ppbDestDataMarshal := ppbDestData is VarRef ? "ptr*" : "ptr"
    pdwDestLenMarshal := pdwDestLen is VarRef ? "uint*" : "ptr"

    result := DllCall("ACTIVEDS.dll\ADsDecodeBinaryData", "ptr", szSrcData, ppbDestDataMarshal, ppbDestData, pdwDestLenMarshal, pdwDestLen, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<VARIANT>} pVariant 
 * @param {Integer} dwNumVariant 
 * @param {Pointer<Pointer<ADSVALUE>>} ppAdsValues 
 * @param {Pointer<Integer>} pdwNumValues 
 * @returns {HRESULT} 
 */
export PropVariantToAdsType(pVariant, dwNumVariant, ppAdsValues, pdwNumValues) {
    ppAdsValuesMarshal := ppAdsValues is VarRef ? "ptr*" : "ptr"
    pdwNumValuesMarshal := pdwNumValues is VarRef ? "uint*" : "ptr"

    result := DllCall("ACTIVEDS.dll\PropVariantToAdsType", VARIANT.Ptr, pVariant, "uint", dwNumVariant, ppAdsValuesMarshal, ppAdsValues, pdwNumValuesMarshal, pdwNumValues, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<ADSVALUE>} pAdsValues 
 * @param {Integer} dwNumValues 
 * @param {Pointer<VARIANT>} pVariant 
 * @returns {HRESULT} 
 */
export AdsTypeToPropVariant(pAdsValues, dwNumValues, pVariant) {
    result := DllCall("ACTIVEDS.dll\AdsTypeToPropVariant", ADSVALUE.Ptr, pAdsValues, "uint", dwNumValues, VARIANT.Ptr, pVariant, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<ADSVALUE>} pAdsValues 
 * @param {Integer} dwNumValues 
 * @returns {String} Nothing - always returns an empty string
 */
export AdsFreeAdsValues(pAdsValues, dwNumValues) {
    DllCall("ACTIVEDS.dll\AdsFreeAdsValues", ADSVALUE.Ptr, pAdsValues, "uint", dwNumValues)
}

/**
 * Converts a binary security descriptor to an IADsSecurityDescriptor object.
 * @remarks
 * This function is used for legacy applications that must  manually convert security descriptors to binary security descriptors. For new applications, use the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecurityutility">IADsSecurityUtility</a> interface, which does this conversion automatically.
 * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor Type: <b>PSECURITY_DESCRIPTOR</b>
 * 
 * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure to convert.
 * @param {Pointer<VARIANT>} pVarsec Type: <b>VARIANT*</b>
 * 
 * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that receives the object. The <b>VARIANT</b> contains a <b>VT_DISPATCH</b> object that can be queried for the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecuritydescriptor">IADsSecurityDescriptor</a> interface. The caller must release this <b>VARIANT</b> by passing the <b>VARIANT</b> to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> function.
 * @param {PWSTR} pszServerName Type: <b>LPCWSTR</b>
 * 
 * A null-terminated Unicode string that provides the name of the server that the security descriptor was retrieved from. This parameter is optional and can be <b>NULL</b>.
 * @param {PWSTR} userName Type: <b>LPCWSTR</b>
 * 
 * A null-terminated Unicode string that provides the user name to be associated with the security descriptor. This parameter is optional and can be <b>NULL</b>.
 * @param {PWSTR} passWord Type: <b>LPCWSTR</b>
 * 
 * A null-terminated Unicode string that provides the password to be associated with the security descriptor. This parameter is optional and can be <b>NULL</b>.
 * @param {Integer} dwFlags Type: <b>DWORD</b>
 * 
 * Contains authentication flags for the conversion. This can be zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum">ADS_AUTHENTICATION_ENUM</a> enumeration values.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This method supports  standard return values, as well as the following:
 * 
 * If the operation fails, an ADSI error code is returned. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-binarysdtosecuritydescriptor
 * @since windows6.0.6000
 */
export BinarySDToSecurityDescriptor(pSecurityDescriptor, pVarsec, pszServerName, userName, passWord, dwFlags) {
    pszServerName := pszServerName is String ? StrPtr(pszServerName) : pszServerName
    userName := userName is String ? StrPtr(userName) : userName
    passWord := passWord is String ? StrPtr(passWord) : passWord

    result := DllCall("ACTIVEDS.dll\BinarySDToSecurityDescriptor", PSECURITY_DESCRIPTOR, pSecurityDescriptor, VARIANT.Ptr, pVarsec, "ptr", pszServerName, "ptr", userName, "ptr", passWord, "uint", dwFlags, "HRESULT")
    return result
}

/**
 * Converts an IADsSecurityDescriptor object to the binary security descriptor format.
 * @remarks
 * This function is used for legacy applications to manually convert security descriptors to binary security descriptors. For new applications, use <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecurityutility">IADsSecurityUtility</a>, which performs this conversion automatically.
 * @param {VARIANT} vVarSecDes Type: <b>VARIANT</b>
 * 
 * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that contains the security descriptor to convert. The <b>VARIANT</b> must contain a <b>VT_DISPATCH</b> that contains an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecuritydescriptor">IADsSecurityDescriptor</a> object.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor Type: <b>PSECURITY_DESCRIPTOR*</b>
 * 
 * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> pointer that receives the binary security descriptor data. The caller must free this memory by passing this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a> function.
 * @param {Pointer<Integer>} pdwSDLength Type: <b>PDWORD</b>
 * 
 * Address of a <b>DWORD</b> value that receives the length, in bytes of the binary security descriptor data.
 * @param {PWSTR} pszServerName Type: <b>LPCWSTR</b>
 * 
 * A null-terminated Unicode string that specifies the name of the server where the security descriptor is placed. This parameter is optional and can be <b>NULL</b>.
 * @param {PWSTR} userName Type: <b>LPCWSTR</b>
 * 
 * A null-terminated Unicode string that contains the user name that the security descriptor is associated to. This parameter is optional and can be <b>NULL</b>.
 * @param {PWSTR} passWord Type: <b>LPCWSTR</b>
 * 
 * A null-terminated Unicode string that contains the password that the security descriptor is associated. This parameter is optional and can be <b>NULL</b>.
 * @param {Integer} dwFlags Type: <b>DWORD</b>
 * 
 * Contains authentication flags for the conversion. This can be zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum">ADS_AUTHENTICATION_ENUM</a> enumeration values.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This method supports the standard return values, as well as the following.
 * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-securitydescriptortobinarysd
 * @since windows6.0.6000
 */
export SecurityDescriptorToBinarySD(vVarSecDes, ppSecurityDescriptor, pdwSDLength, pszServerName, userName, passWord, dwFlags) {
    pszServerName := pszServerName is String ? StrPtr(pszServerName) : pszServerName
    userName := userName is String ? StrPtr(userName) : userName
    passWord := passWord is String ? StrPtr(passWord) : passWord

    pdwSDLengthMarshal := pdwSDLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ACTIVEDS.dll\SecurityDescriptorToBinarySD", VARIANT, vVarSecDes, PSECURITY_DESCRIPTOR.Ptr, ppSecurityDescriptor, pdwSDLengthMarshal, pdwSDLength, "ptr", pszServerName, "ptr", userName, "ptr", passWord, "uint", dwFlags, "HRESULT")
    return result
}

/**
 * Displays a dialog box used to browse for container objects in Active Directory Domain Services. (Unicode)
 * @remarks
 * The dialog box displays a container picker which is either populated with containers from a particular root or which uses trusted domains. If it uses trusted domains, it can use either the domain that the user is currently logged on to, or it can use an alternate domain specified by the application using the <b>pszRoot</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsbrowseinfoa">DSBROWSEINFO</a> structure. If the user clicks the <b>OK</b> pushbutton or double-clicks an object, <b>IDOK</b> is returned and <b>pszPath</b> contains the ADsPath of the selected object. If the user cancels the dialog box, <b>DsBrowseForContainer</b> returns <b>IDCANCEL</b>.
 * 
 * The <b>pszRoot</b> member contains an ADsPath, which requires the  following form.
 * 
 * 
 * ```cpp
 * LDAP://fabrikam.com/CN=Users,DC=Fabrikam,DC=com
 * ```
 * 
 * 
 * <b>DsBrowseForContainer</b> uses this path as the root of the tree.  The <b>pszRoot</b> member can also be used to specify a domain that has a trust with the domain that the user is logged on to, so that the user can browse the <b>Users</b> container of the alternate  domain. If the <b>pszPath</b> member contains a path, the dialog will navigate from <b>pszRoot</b> through the containers until it reaches the object specified by <b>pszPath</b>.
 * 
 * The <b>DsBrowseForContainer</b> function supports a callback function as specified in the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsbrowseinfoa">DSBROWSEINFO</a> structure. The callback function can be used to filter, modify, or otherwise update the view based on selection change, and so on. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-bffcallback">BFFCallBack</a>.
 * 
 * <div class="alert"><b>Important</b>  Beginning with Windows Server 2003, the ANSI version of this function (<b>DsBrowseForContainerA</b>) is not implemented and always returns -1.</div>
 * <div> </div>
 * @param {Pointer<DSBROWSEINFOW>} pInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsbrowseinfoa">DSBROWSEINFO</a> structure that contains data about  initializing the container browser dialog and receives data about the selected object.
 * @returns {Integer} The function returns one of the following values.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-dsbrowseforcontainerw
 * @since windows6.0.6000
 */
export DsBrowseForContainerW(pInfo) {
    result := DllCall("dsuiext.dll\DsBrowseForContainerW", DSBROWSEINFOW.Ptr, pInfo, Int32)
    return result
}

/**
 * Displays a dialog box used to browse for container objects in Active Directory Domain Services. (ANSI)
 * @remarks
 * The dialog box displays a container picker which is either populated with containers from a particular root or which uses trusted domains. If it uses trusted domains, it can use either the domain that the user is currently logged on to, or it can use an alternate domain specified by the application using the <b>pszRoot</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsbrowseinfoa">DSBROWSEINFO</a> structure. If the user clicks the <b>OK</b> pushbutton or double-clicks an object, <b>IDOK</b> is returned and <b>pszPath</b> contains the ADsPath of the selected object. If the user cancels the dialog box, <b>DsBrowseForContainer</b> returns <b>IDCANCEL</b>.
 * 
 * The <b>pszRoot</b> member contains an ADsPath, which requires the  following form.
 * 
 * 
 * ```cpp
 * LDAP://fabrikam.com/CN=Users,DC=Fabrikam,DC=com
 * ```
 * 
 * 
 * <b>DsBrowseForContainer</b> uses this path as the root of the tree.  The <b>pszRoot</b> member can also be used to specify a domain that has a trust with the domain that the user is logged on to, so that the user can browse the <b>Users</b> container of the alternate  domain. If the <b>pszPath</b> member contains a path, the dialog will navigate from <b>pszRoot</b> through the containers until it reaches the object specified by <b>pszPath</b>.
 * 
 * The <b>DsBrowseForContainer</b> function supports a callback function as specified in the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsbrowseinfoa">DSBROWSEINFO</a> structure. The callback function can be used to filter, modify, or otherwise update the view based on selection change, and so on. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-bffcallback">BFFCallBack</a>.
 * 
 * <div class="alert"><b>Important</b>  Beginning with Windows Server 2003, the ANSI version of this function (<b>DsBrowseForContainerA</b>) is not implemented and always returns -1.</div>
 * <div> </div>
 * @param {Pointer<DSBROWSEINFOA>} pInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsbrowseinfoa">DSBROWSEINFO</a> structure that contains data about  initializing the container browser dialog and receives data about the selected object.
 * @returns {Integer} The function returns one of the following values.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-dsbrowseforcontainera
 * @since windows6.0.6000
 */
export DsBrowseForContainerA(pInfo) {
    result := DllCall("dsuiext.dll\DsBrowseForContainerA", DSBROWSEINFOA.Ptr, pInfo, Int32)
    return result
}

/**
 * Obtains the icon for a given object class.
 * @param {Integer} dwFlags 
 * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to retrieve the icon for. Examples of the object class name are "user" and "container".
 * @param {Integer} cxImage Contains the desired width, in pixels, of the icon. This function retrieves the icon that most closely matches this width.
 * @param {Integer} cyImage Contains the desired height, in pixels, of the icon. This function retrieves the icon that most closely matches this height.
 * @returns {HICON} Returns a handle to the icon if successful or <b>NULL</b> otherwise. The caller must destroy this icon when it is no longer required by passing this handle to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroyicon">DestroyIcon</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-dsgeticon
 * @since windows6.0.6000
 */
export DsGetIcon(dwFlags, pszObjectClass, cxImage, cyImage) {
    pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

    result := DllCall("dsuiext.dll\DsGetIcon", "uint", dwFlags, "ptr", pszObjectClass, "int", cxImage, "int", cyImage, HICON.Owned)
    return result
}

/**
 * Retrieves the localized name for an object class.
 * @remarks
 * If no friendly name is set in the display specifiers for the object class, this function returns the name passed in <i>pszObjectClass</i>.
 * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to obtain the name of. Examples of the object class name are "user" and "container".
 * @param {PWSTR} pszBuffer Pointer to a wide character buffer that receives the name string. This buffer must be at least <i>cchBuffer</i> wide characters in length.
 * @param {Integer} cchBuffer Contains the size of the <i>pszBuffer</i> buffer, in wide characters, including the terminating <b>NULL</b> character. If the name exceeds this number of characters, the name is truncated.
 * @returns {HRESULT} Returns a standard  <b>HRESULT</b> value, including the following.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-dsgetfriendlyclassname
 * @since windows6.0.6000
 */
export DsGetFriendlyClassName(pszObjectClass, pszBuffer, cchBuffer) {
    pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
    pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

    result := DllCall("dsuiext.dll\DsGetFriendlyClassName", "ptr", pszObjectClass, "ptr", pszBuffer, "uint", cchBuffer, "HRESULT")
    return result
}

/**
 * The ADsPropCreateNotifyObj function is used to create, or obtain, a notification object for use by an Active Directory Domain Services property sheet extension.
 * @remarks
 * The <b>ADsPropCreateNotifyObj</b> function is used in the implementation of an Active Directory Domain Services property sheet extension. The extension must first request the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/cfstr-dsobjectnames-clipboard-format">CFSTR_DSOBJECTNAMES</a> data from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellextinit-initialize">IShellExtInit::Initialize</a> by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>. This provides the data object and object name required to call <b>ADsPropCreateNotifyObj</b>.
 * 
 * When the notification object is no longer required, a <a href="https://docs.microsoft.com/windows/desktop/AD/wm-adsprop-notify-exit">WM_ADSPROP_NOTIFY_EXIT</a> message is sent to the notification object. This causes the notification object to destroy itself. When the <b>WM_ADSPROP_NOTIFY_EXIT</b> message is sent, the notification object handle should be considered invalid.
 * @param {IDataObject} pAppThdDataObj A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> object that represents the directory object that the property page applies to. This is the <b>IDataObject</b> passed to the property page <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellextinit-initialize">IShellExtInit::Initialize</a> method.
 * @param {PWSTR} pwzADsObjName The Active Directory Domain Services object name obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> method for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/cfstr-dsobjectnames-clipboard-format">CFSTR_DSOBJECTNAMES</a> clipboard format on the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> represented by <i>pAppThdDataObj</i>.
 * @param {Pointer<HWND>} phNotifyObj Pointer to an <b>HWND</b> value that receives the handle of the notification object.
 * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an OLE-defined error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/nf-adsprop-adspropcreatenotifyobj
 * @since windows6.0.6000
 */
export ADsPropCreateNotifyObj(pAppThdDataObj, pwzADsObjName, phNotifyObj) {
    pwzADsObjName := pwzADsObjName is String ? StrPtr(pwzADsObjName) : pwzADsObjName

    result := DllCall("dsprop.dll\ADsPropCreateNotifyObj", "ptr", pAppThdDataObj, "ptr", pwzADsObjName, HWND.Ptr, phNotifyObj, "HRESULT")
    return result
}

/**
 * Used to obtain directory object data that an Active Directory Domain Services property sheet extension applies to.
 * @remarks
 * The memory  for the <b>pwzCN</b> and <b>pWritableAttrs</b> members is allocated by the <b>ADsPropGetInitInfo</b> function. This memory is freed by the system after all property sheet objects are destroyed. The reference count for the interface pointer in <b>pDsObj</b> is not incremented by calling <b>ADsPropGetInitInfo</b>, so the interface must not be released by the caller.
 * 
 * For multiple-selection property sheets, the system only binds to the first object in the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsobject">DSOBJECT</a> array. Because of this, <b>ADsPropGetInitInfo</b> only supplies the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-idirectoryobject">IDirectoryObject</a> and writable attributes for the first object in the array. The other objects in the array are not bound to.
 * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
 * @param {Pointer<ADSPROPINITPARAMS>} pInitParams Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/ns-adsprop-adspropinitparams">ADSPROPINITPARAMS</a> structure that receives the directory object data. The <b>dwSize</b> member of this structure must be entered before calling this function.
 * @returns {BOOL} Returns nonzero if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/nf-adsprop-adspropgetinitinfo
 * @since windows6.0.6000
 */
export ADsPropGetInitInfo(hNotifyObj, pInitParams) {
    result := DllCall("dsprop.dll\ADsPropGetInitInfo", HWND, hNotifyObj, ADSPROPINITPARAMS.Ptr, pInitParams, BOOL)
    return result
}

/**
 * Used to notify the notification object of the property page window handle. (ADsPropSetHwndWithTitle)
 * @remarks
 * An Active Directory Domain Services property sheet extension normally calls this function while processing the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message.
 * 
 * If the property sheet extension uses the <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropshowerrordialog">ADsPropShowErrorDialog</a> function, the extension should use <b>ADsPropSetHwndWithTitle</b> rather than <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropsethwnd">ADsPropSetHwnd</a>.
 * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
 * @param {HWND} hPage A window handle of the property page.
 * @param {Pointer<Integer>} ptzTitle Pointer to a NULL-terminated string that contains the property page title.
 * @returns {BOOL} Returns zero if the notification object does not exist or nonzero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/nf-adsprop-adspropsethwndwithtitle
 * @since windows6.0.6000
 */
export ADsPropSetHwndWithTitle(hNotifyObj, hPage, ptzTitle) {
    ptzTitleMarshal := ptzTitle is VarRef ? "char*" : "ptr"

    result := DllCall("dsprop.dll\ADsPropSetHwndWithTitle", HWND, hNotifyObj, HWND, hPage, ptzTitleMarshal, ptzTitle, BOOL)
    return result
}

/**
 * Used to notify the notification object of the property page window handle. (ADsPropSetHwnd)
 * @remarks
 * An Active Directory Domain Services property sheet extension normally calls this function while processing the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message.
 * 
 * If the property sheet extension uses the <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropshowerrordialog">ADsPropShowErrorDialog</a> function, the extension should use <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropsethwndwithtitle">ADsPropSetHwndWithTitle</a> rather than <b>ADsPropSetHwnd</b>.
 * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
 * @param {HWND} hPage A window handle of the property page.
 * @returns {BOOL} Returns zero if the notification object does not exist or nonzero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/nf-adsprop-adspropsethwnd
 * @since windows6.0.6000
 */
export ADsPropSetHwnd(hNotifyObj, hPage) {
    result := DllCall("dsprop.dll\ADsPropSetHwnd", HWND, hNotifyObj, HWND, hPage, BOOL)
    return result
}

/**
 * The ADsPropCheckIfWritable function determines if an attribute can be written.
 * @remarks
 * During initialization, a property sheet extension should determine if the attributes it can change can be written by using <b>ADsPropCheckIfWritable</b>. If an attribute cannot be written, it should be displayed as read-only and the ability to change the attribute value should be removed.
 * 
 * It is possible for a user to be  granted write permission, but not read permission for an attribute. In this case, the attribute read operation fails and it is possible that the attribute could be overwritten. Consequently, it is not recommended to grant a user write permission, but revoke read permission on an attribute.
 * 
 * Do not use this function to verify the write permission for attributes in a multi-select property sheet. It is likely that each directory object will have a different set of writable attribute permissions. The property sheet extension should rely on the server returning an error when attempting to write to a specific object in a selected group to determine if write permissions for that object are denied.
 * @param {PWSTR} pwzAttr Pointer to a NULL-terminated <b>WCHAR</b> buffer that contains the name of the attribute.
 * @param {Pointer<ADS_ATTR_INFO>} pWritableAttrs Pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_attr_info">ADS_ATTR_INFO</a> structures returned by <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropgetinitinfo">ADsPropGetInitInfo</a>.
 * @returns {BOOL} Returns nonzero if the attribute is found in the writable-attribute list or zero otherwise. Also returns zero if <i>pWritableAttrs</i> is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/nf-adsprop-adspropcheckifwritable
 * @since windows6.0.6000
 */
export ADsPropCheckIfWritable(pwzAttr, pWritableAttrs) {
    pwzAttr := pwzAttr is String ? StrPtr(pwzAttr) : pwzAttr

    result := DllCall("dsprop.dll\ADsPropCheckIfWritable", "ptr", pwzAttr, ADS_ATTR_INFO.Ptr, pWritableAttrs, BOOL)
    return result
}

/**
 * The ADsPropSendErrorMessage function adds an error message to a list of error messages displayed by calling the ADsPropShowErrorDialog function.
 * @remarks
 * The error messages added by the <b>ADsPropSendErrorMessage</b> function are accumulated until  <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropshowerrordialog">ADsPropShowErrorDialog</a> is called.  <b>ADsPropShowErrorDialog</b> combines and displays the accumulated  error messages. When the error dialog is dismissed, the accumulated error messages are deleted.
 * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
 * @param {Pointer<ADSPROPERROR>} pError Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/ns-adsprop-adsproperror">ADSPROPERROR</a> structure which contains data about the error message.
 * @returns {BOOL} Returns nonzero if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/nf-adsprop-adspropsenderrormessage
 * @since windows6.0.6000
 */
export ADsPropSendErrorMessage(hNotifyObj, pError) {
    result := DllCall("dsprop.dll\ADsPropSendErrorMessage", HWND, hNotifyObj, ADSPROPERROR.Ptr, pError, BOOL)
    return result
}

/**
 * The ADsPropShowErrorDialog function displays a dialog box that contains the error messages accumulated through calls to the ADsPropSendErrorMessage function or the WM_ADSPROP_NOTIFY_ERROR.
 * @remarks
 * The error messages added by the <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropsenderrormessage">ADsPropSendErrorMessage</a> function are accumulated until  <b>ADsPropShowErrorDialog</b> is called.  <b>ADsPropShowErrorDialog</b> combines and displays the accumulated  error messages. When the error dialog is dismissed, the accumulated error messages are deleted.
 * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
 * @param {HWND} hPage The window handle of the property page.
 * @returns {BOOL} Returns zero if the notification object does not exist or nonzero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/nf-adsprop-adspropshowerrordialog
 * @since windows6.0.6000
 */
export ADsPropShowErrorDialog(hNotifyObj, hPage) {
    result := DllCall("dsprop.dll\ADsPropShowErrorDialog", HWND, hNotifyObj, HWND, hPage, BOOL)
    return result
}

/**
 * Constructs a service principal name (SPN) that identifies a service instance. (Unicode)
 * @remarks
 * The format of the SPN produced by the <b>DsMakeSpn</b> function depends on the input parameters. There are two basic formats. Both formats begin with the <i>ServiceClass</i> string followed by a host computer name and an optional <i>InstancePort</i> component.
 * 
 * <div class="alert"><b>Note</b>  This format is used by host-based services.</div>
 * <div> </div>
 * <p class="proch"><b>To produce an SPN with the "&lt;ServiceClass&gt;/&lt;host&gt;" format</b>
 * 
 * <ol>
 * <li>Set the <i>ServiceName</i> parameter to the DNS name of the host computer for the service instance. This is the host component of the SPN.</li>
 * <li>Set the <i>InstanceName</i> and <i>Referrer</i> parameters to <b>NULL</b>.</li>
 * <li>
 * Set the <i>InstancePort</i> parameter to zero. If <i>InstancePort</i> is nonzero, the SPN has the following format:
 * 
 * 
 * ```cpp
 * <service class>/<host>:<instance port>/<referrer>
 * ```
 * 
 * 
 * </li>
 * </ol>
 * <div class="alert"><b>Note</b>  This format is used by replicable services.</div>
 * <div> </div>
 * <p class="proch"><b>To produce an SPN with the "&lt;ServiceClass&gt;/&lt;host&gt;:&lt;InstancePort&gt;" format</b>
 * 
 * <ol>
 * <li>Set the <i>InstanceName</i> parameter to the DNS name of the host computer for the service instance. This is the host component.</li>
 * <li>Set the <i>ServiceName</i> parameter to a string that identifies an instance of the service. For example, it could be the distinguished name of the service connection point for this service instance.</li>
 * <li>Set the <i>Referrer</i> parameter to <b>NULL</b>.</li>
 * <li>
 * Set the <i>InstancePort</i> parameter to zero. If <i>InstancePort</i> is nonzero, the SPN has the following format:
 * 
 * 
 * ```cpp
 * <service class>/<host>:<instance port>/<service name>
 * ```
 * 
 * 
 * </li>
 * </ol>
 * The <i>Referrer</i> parameter is used only if the <i>ServiceName</i> parameter specifies the IP address of the service's host computer. In this case, <i>Referrer</i> specifies the DNS name of the computer that gave the IP address as a referral. The SPN has the following format:
 * 
 * 
 * ```cpp
 * <service class>/<host>:<instance port>/<referrer>
 * ```
 * 
 * 
 * where the host component is the <i>InstanceName</i> string or the <i>ServiceName</i> string if <i>InstanceName</i> is <b>NULL</b>, and the <i>InstancePort</i> component is optional.
 * 
 * String parameters cannot include the forward slash (/) character, as it is used to separate the components of the SPN.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsMakeSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ServiceClass Pointer to a constant null-terminated string that specifies the class of the service. This parameter can be any string unique to that service; either the protocol name, for example, ldap, or the string form of a GUID are acceptable.
 * @param {PWSTR} ServiceName Pointer to a constant null-terminated string that specifies the DNS name, NetBIOS name, or distinguished name (DN). This parameter must be non-<b>NULL</b>.
 * 
 * For more information about how the <i>ServiceName</i>, <i>InstanceName</i> and <i>InstancePort</i> parameters are used to compose an SPN, see the following Remarks section.
 * @param {PWSTR} InstanceName Pointer to a constant null-terminated string that specifies the DNS name or IP address of the host for an instance of the service.
 * 
 * If <i>ServiceName</i> specifies the DNS or NetBIOS name of the service host computer, the <i>InstanceName</i> parameter must be <b>NULL</b>.
 * 
 * If <i>ServiceName</i> specifies a DNS domain name, the name of a DNS SRV record, or a distinguished name, such as the DN of a service connection point, the <i>InstanceName</i> parameter must specify the DNS or NetBIOS name of the service host computer.
 * @param {Integer} InstancePort Port number for an instance of the service. Use 0 for the default port. If this parameter is zero, the SPN does not include a port number.
 * @param {PWSTR} Referrer Pointer to a constant null-terminated string that specifies the DNS name of the host that gave an IP address referral. This parameter is ignored unless the <i>ServiceName</i> parameter specifies an IP address.
 * @param {Pointer<Integer>} pcSpnLength Pointer to a variable that contains the length, in characters, of the buffer that will receive the new constructed SPN. This value may be 0 to request the final buffer size in advance.
 * 
 * The <i>pcSpnLength</i> parameter also receives the actual length of the SPN created, including the terminating null character.
 * @param {PWSTR} pszSpn Pointer to a null-terminated string that receives the constructed SPN. This buffer should be the length specified by <i>pcSpnLength</i>. The <i>pszSpn</i> parameter may be <b>NULL</b> to request the final buffer size in advance.
 * @returns {Integer} If the function returns an SPN, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsmakespnw
 * @since windows6.0.6000
 */
export DsMakeSpnW(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, pcSpnLength, pszSpn) {
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
    InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName
    Referrer := Referrer is String ? StrPtr(Referrer) : Referrer
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn

    pcSpnLengthMarshal := pcSpnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("DSPARSE.dll\DsMakeSpnW", "ptr", ServiceClass, "ptr", ServiceName, "ptr", InstanceName, "ushort", InstancePort, "ptr", Referrer, pcSpnLengthMarshal, pcSpnLength, "ptr", pszSpn, UInt32)
    return result
}

/**
 * Constructs a service principal name (SPN) that identifies a service instance. (ANSI)
 * @remarks
 * The format of the SPN produced by the <b>DsMakeSpn</b> function depends on the input parameters. There are two basic formats. Both formats begin with the <i>ServiceClass</i> string followed by a host computer name and an optional <i>InstancePort</i> component.
 * 
 * <div class="alert"><b>Note</b>  This format is used by host-based services.</div>
 * <div> </div>
 * <p class="proch"><b>To produce an SPN with the "&lt;ServiceClass&gt;/&lt;host&gt;" format</b>
 * 
 * <ol>
 * <li>Set the <i>ServiceName</i> parameter to the DNS name of the host computer for the service instance. This is the host component of the SPN.</li>
 * <li>Set the <i>InstanceName</i> and <i>Referrer</i> parameters to <b>NULL</b>.</li>
 * <li>
 * Set the <i>InstancePort</i> parameter to zero. If <i>InstancePort</i> is nonzero, the SPN has the following format:
 * 
 * 
 * ```cpp
 * <service class>/<host>:<instance port>/<referrer>
 * ```
 * 
 * 
 * </li>
 * </ol>
 * <div class="alert"><b>Note</b>  This format is used by replicable services.</div>
 * <div> </div>
 * <p class="proch"><b>To produce an SPN with the "&lt;ServiceClass&gt;/&lt;host&gt;:&lt;InstancePort&gt;" format</b>
 * 
 * <ol>
 * <li>Set the <i>InstanceName</i> parameter to the DNS name of the host computer for the service instance. This is the host component.</li>
 * <li>Set the <i>ServiceName</i> parameter to a string that identifies an instance of the service. For example, it could be the distinguished name of the service connection point for this service instance.</li>
 * <li>Set the <i>Referrer</i> parameter to <b>NULL</b>.</li>
 * <li>
 * Set the <i>InstancePort</i> parameter to zero. If <i>InstancePort</i> is nonzero, the SPN has the following format:
 * 
 * 
 * ```cpp
 * <service class>/<host>:<instance port>/<service name>
 * ```
 * 
 * 
 * </li>
 * </ol>
 * The <i>Referrer</i> parameter is used only if the <i>ServiceName</i> parameter specifies the IP address of the service's host computer. In this case, <i>Referrer</i> specifies the DNS name of the computer that gave the IP address as a referral. The SPN has the following format:
 * 
 * 
 * ```cpp
 * <service class>/<host>:<instance port>/<referrer>
 * ```
 * 
 * 
 * where the host component is the <i>InstanceName</i> string or the <i>ServiceName</i> string if <i>InstanceName</i> is <b>NULL</b>, and the <i>InstancePort</i> component is optional.
 * 
 * String parameters cannot include the forward slash (/) character, as it is used to separate the components of the SPN.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsMakeSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ServiceClass Pointer to a constant null-terminated string that specifies the class of the service. This parameter can be any string unique to that service; either the protocol name, for example, ldap, or the string form of a GUID are acceptable.
 * @param {PSTR} ServiceName Pointer to a constant null-terminated string that specifies the DNS name, NetBIOS name, or distinguished name (DN). This parameter must be non-<b>NULL</b>.
 * 
 * For more information about how the <i>ServiceName</i>, <i>InstanceName</i> and <i>InstancePort</i> parameters are used to compose an SPN, see the following Remarks section.
 * @param {PSTR} InstanceName Pointer to a constant null-terminated string that specifies the DNS name or IP address of the host for an instance of the service.
 * 
 * If <i>ServiceName</i> specifies the DNS or NetBIOS name of the service host computer, the <i>InstanceName</i> parameter must be <b>NULL</b>.
 * 
 * If <i>ServiceName</i> specifies a DNS domain name, the name of a DNS SRV record, or a distinguished name, such as the DN of a service connection point, the <i>InstanceName</i> parameter must specify the DNS or NetBIOS name of the service host computer.
 * @param {Integer} InstancePort Port number for an instance of the service. Use 0 for the default port. If this parameter is zero, the SPN does not include a port number.
 * @param {PSTR} Referrer Pointer to a constant null-terminated string that specifies the DNS name of the host that gave an IP address referral. This parameter is ignored unless the <i>ServiceName</i> parameter specifies an IP address.
 * @param {Pointer<Integer>} pcSpnLength Pointer to a variable that contains the length, in characters, of the buffer that will receive the new constructed SPN. This value may be 0 to request the final buffer size in advance.
 * 
 * The <i>pcSpnLength</i> parameter also receives the actual length of the SPN created, including the terminating null character.
 * @param {PSTR} pszSpn Pointer to a null-terminated string that receives the constructed SPN. This buffer should be the length specified by <i>pcSpnLength</i>. The <i>pszSpn</i> parameter may be <b>NULL</b> to request the final buffer size in advance.
 * @returns {Integer} If the function returns an SPN, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsmakespna
 * @since windows6.0.6000
 */
export DsMakeSpnA(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, pcSpnLength, pszSpn) {
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
    InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName
    Referrer := Referrer is String ? StrPtr(Referrer) : Referrer
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn

    pcSpnLengthMarshal := pcSpnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("DSPARSE.dll\DsMakeSpnA", "ptr", ServiceClass, "ptr", ServiceName, "ptr", InstanceName, "ushort", InstancePort, "ptr", Referrer, pcSpnLengthMarshal, pcSpnLength, "ptr", pszSpn, UInt32)
    return result
}

/**
 * Parses a service principal name (SPN) into its component strings. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsparse.h header defines DsCrackSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszSpn Pointer to a constant null-terminated string that contains the SPN to parse. The SPN has the following format, in which the &lt;service class&gt; and &lt;instance name&gt; components must be present and the &lt;port number&gt; and &lt;service name&gt; components are optional. The &lt;port number&gt; component must be a numeric string value.
 * 
 * 
 * ```cpp
 * <service class>/<instance name>:<port number>/<service name>
 * ```
 * @param {Pointer<Integer>} pcServiceClass Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>ServiceClass</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>ServiceClass</i> string, including the terminating null character.
 * 
 * If this parameter is <b>NULL</b>, contains zero, or <i>ServiceClass</i> is <b>NULL</b>, this parameter and  <i>ServiceClass</i> are ignored.
 * 
 * To obtain the number of characters required for the <i>ServiceClass</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>ServiceClass</i> and this parameter set to 1.
 * @param {PSTR} ServiceClass Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;service class&gt; component of the SPN. This buffer must be at least <i>*pcServiceClass </i><b>TCHARs</b> in size. This parameter may be  <b>NULL</b> if the service class is not required.
 * @param {Pointer<Integer>} pcServiceName Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>ServiceName</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>ServiceName</i> string, including the terminating null character.
 * 
 * If this parameter is <b>NULL</b>, contains zero, or <i>ServiceName</i> is <b>NULL</b>, this parameter and  <i>ServiceName</i> are ignored.
 * 
 * To obtain the number of characters required for the <i>ServiceName</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>ServiceName</i> and this parameter set to 1.
 * @param {PSTR} ServiceName Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;service name&gt; component of the SPN. This buffer must be at least <i>*pcServiceName </i><b>TCHARs</b> in size. If the &lt;service name&gt; component is not present in the SPN, this buffer  receives the &lt;instance name&gt; component. This parameter may be <b>NULL</b> if the service name is not required.
 * @param {Pointer<Integer>} pcInstanceName Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>InstanceName</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>InstanceName</i> string, including the terminating null character.
 * 
 * If this parameter is <b>NULL</b>, contains zero, or <i>InstanceName</i> is <b>NULL</b>, this parameter and <i>InstanceName</i> are ignored.
 * 
 * To obtain the number of characters required for the <i>InstanceName</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>InstanceName</i> and this parameter set to 1.
 * @param {PSTR} InstanceName Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;instance name&gt; component of the SPN. This buffer must be at least <i>*pcInstanceName </i> <b>TCHARs</b> in size. This parameter may be  <b>NULL</b> if the instance name is not required.
 * @param {Pointer<Integer>} pInstancePort Pointer to a <b>DWORD</b> value that receives the integer value of the &lt;port number&gt; component of the SPN. If the SPN does not contain a &lt;port number&gt; component, this parameter receives zero. This parameter may be  <b>NULL</b> if the port number is not required.
 * @returns {Integer} Returns a Win32 error code, including the following.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dscrackspna
 * @since windows6.0.6000
 */
export DsCrackSpnA(pszSpn, pcServiceClass, ServiceClass, pcServiceName, ServiceName, pcInstanceName, InstanceName, pInstancePort) {
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
    InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

    pcServiceClassMarshal := pcServiceClass is VarRef ? "uint*" : "ptr"
    pcServiceNameMarshal := pcServiceName is VarRef ? "uint*" : "ptr"
    pcInstanceNameMarshal := pcInstanceName is VarRef ? "uint*" : "ptr"
    pInstancePortMarshal := pInstancePort is VarRef ? "ushort*" : "ptr"

    result := DllCall("DSPARSE.dll\DsCrackSpnA", "ptr", pszSpn, pcServiceClassMarshal, pcServiceClass, "ptr", ServiceClass, pcServiceNameMarshal, pcServiceName, "ptr", ServiceName, pcInstanceNameMarshal, pcInstanceName, "ptr", InstanceName, pInstancePortMarshal, pInstancePort, UInt32)
    return result
}

/**
 * Parses a service principal name (SPN) into its component strings. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dsparse.h header defines DsCrackSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszSpn Pointer to a constant null-terminated string that contains the SPN to parse. The SPN has the following format, in which the &lt;service class&gt; and &lt;instance name&gt; components must be present and the &lt;port number&gt; and &lt;service name&gt; components are optional. The &lt;port number&gt; component must be a numeric string value.
 * 
 * 
 * ```cpp
 * <service class>/<instance name>:<port number>/<service name>
 * ```
 * @param {Pointer<Integer>} pcServiceClass Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>ServiceClass</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>ServiceClass</i> string, including the terminating null character.
 * 
 * If this parameter is <b>NULL</b>, contains zero, or <i>ServiceClass</i> is <b>NULL</b>, this parameter and  <i>ServiceClass</i> are ignored.
 * 
 * To obtain the number of characters required for the <i>ServiceClass</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>ServiceClass</i> and this parameter set to 1.
 * @param {PWSTR} ServiceClass Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;service class&gt; component of the SPN. This buffer must be at least <i>*pcServiceClass </i><b>TCHARs</b> in size. This parameter may be  <b>NULL</b> if the service class is not required.
 * @param {Pointer<Integer>} pcServiceName Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>ServiceName</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>ServiceName</i> string, including the terminating null character.
 * 
 * If this parameter is <b>NULL</b>, contains zero, or <i>ServiceName</i> is <b>NULL</b>, this parameter and  <i>ServiceName</i> are ignored.
 * 
 * To obtain the number of characters required for the <i>ServiceName</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>ServiceName</i> and this parameter set to 1.
 * @param {PWSTR} ServiceName Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;service name&gt; component of the SPN. This buffer must be at least <i>*pcServiceName </i><b>TCHARs</b> in size. If the &lt;service name&gt; component is not present in the SPN, this buffer  receives the &lt;instance name&gt; component. This parameter may be <b>NULL</b> if the service name is not required.
 * @param {Pointer<Integer>} pcInstanceName Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>InstanceName</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>InstanceName</i> string, including the terminating null character.
 * 
 * If this parameter is <b>NULL</b>, contains zero, or <i>InstanceName</i> is <b>NULL</b>, this parameter and <i>InstanceName</i> are ignored.
 * 
 * To obtain the number of characters required for the <i>InstanceName</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>InstanceName</i> and this parameter set to 1.
 * @param {PWSTR} InstanceName Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;instance name&gt; component of the SPN. This buffer must be at least <i>*pcInstanceName </i> <b>TCHARs</b> in size. This parameter may be  <b>NULL</b> if the instance name is not required.
 * @param {Pointer<Integer>} pInstancePort Pointer to a <b>DWORD</b> value that receives the integer value of the &lt;port number&gt; component of the SPN. If the SPN does not contain a &lt;port number&gt; component, this parameter receives zero. This parameter may be  <b>NULL</b> if the port number is not required.
 * @returns {Integer} Returns a Win32 error code, including the following.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dscrackspnw
 * @since windows6.0.6000
 */
export DsCrackSpnW(pszSpn, pcServiceClass, ServiceClass, pcServiceName, ServiceName, pcInstanceName, InstanceName, pInstancePort) {
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
    InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

    pcServiceClassMarshal := pcServiceClass is VarRef ? "uint*" : "ptr"
    pcServiceNameMarshal := pcServiceName is VarRef ? "uint*" : "ptr"
    pcInstanceNameMarshal := pcInstanceName is VarRef ? "uint*" : "ptr"
    pInstancePortMarshal := pInstancePort is VarRef ? "ushort*" : "ptr"

    result := DllCall("DSPARSE.dll\DsCrackSpnW", "ptr", pszSpn, pcServiceClassMarshal, pcServiceClass, "ptr", ServiceClass, pcServiceNameMarshal, pcServiceName, "ptr", ServiceName, pcInstanceNameMarshal, pcInstanceName, "ptr", InstanceName, pInstancePortMarshal, pInstancePort, UInt32)
    return result
}

/**
 * Converts an RDN into a quoted RDN value, if the RDN value contains characters that require quotes. (Unicode)
 * @remarks
 * Quotes are not added to the RDN if none are required. In this case, the output RDN value is the same as the input RDN value.
 * 
 * When quoting is required, the RDN is quoted in accordance with the specification "Lightweight Directory Access Protocol (v3): UTF-8 String Representation of Distinguished Names," RFC 2253.
 * 
 * The input and output RDN values are not <b>NULL</b>-terminated strings.
 * 
 * To revert changes made by this call, call the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/nf-dsparse-dsunquoterdnvaluea">DsUnquoteRdnValue</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsQuoteRdnValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} cUnquotedRdnValueLength The number of characters in the <i>psUnquotedRdnValue</i> string.
 * @param {PWSTR} psUnquotedRdnValue The string that specifies the unquoted RDN value.
 * @param {Pointer<Integer>} pcQuotedRdnValueLength The maximum number of characters in the <i>psQuotedRdnValue</i> string.
 * 
 * The following flags are the output for this parameter.
 * @param {PWSTR} psQuotedRdnValue The string that receives the converted, and perhaps quoted, RDN value.
 * @returns {Integer} The following list contains the possible values  returned for the <b>DsQuoteRdnValue</b> function.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsquoterdnvaluew
 * @since windows6.0.6000
 */
export DsQuoteRdnValueW(cUnquotedRdnValueLength, psUnquotedRdnValue, pcQuotedRdnValueLength, psQuotedRdnValue) {
    psUnquotedRdnValue := psUnquotedRdnValue is String ? StrPtr(psUnquotedRdnValue) : psUnquotedRdnValue
    psQuotedRdnValue := psQuotedRdnValue is String ? StrPtr(psQuotedRdnValue) : psQuotedRdnValue

    pcQuotedRdnValueLengthMarshal := pcQuotedRdnValueLength is VarRef ? "uint*" : "ptr"

    result := DllCall("DSPARSE.dll\DsQuoteRdnValueW", "uint", cUnquotedRdnValueLength, "ptr", psUnquotedRdnValue, pcQuotedRdnValueLengthMarshal, pcQuotedRdnValueLength, "ptr", psQuotedRdnValue, UInt32)
    return result
}

/**
 * Converts an RDN into a quoted RDN value, if the RDN value contains characters that require quotes. (ANSI)
 * @remarks
 * Quotes are not added to the RDN if none are required. In this case, the output RDN value is the same as the input RDN value.
 * 
 * When quoting is required, the RDN is quoted in accordance with the specification "Lightweight Directory Access Protocol (v3): UTF-8 String Representation of Distinguished Names," RFC 2253.
 * 
 * The input and output RDN values are not <b>NULL</b>-terminated strings.
 * 
 * To revert changes made by this call, call the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/nf-dsparse-dsunquoterdnvaluea">DsUnquoteRdnValue</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsQuoteRdnValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} cUnquotedRdnValueLength The number of characters in the <i>psUnquotedRdnValue</i> string.
 * @param {PSTR} psUnquotedRdnValue The string that specifies the unquoted RDN value.
 * @param {Pointer<Integer>} pcQuotedRdnValueLength The maximum number of characters in the <i>psQuotedRdnValue</i> string.
 * 
 * The following flags are the output for this parameter.
 * @param {PSTR} psQuotedRdnValue The string that receives the converted, and perhaps quoted, RDN value.
 * @returns {Integer} The following list contains the possible values  returned for the <b>DsQuoteRdnValue</b> function.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsquoterdnvaluea
 * @since windows6.0.6000
 */
export DsQuoteRdnValueA(cUnquotedRdnValueLength, psUnquotedRdnValue, pcQuotedRdnValueLength, psQuotedRdnValue) {
    psUnquotedRdnValue := psUnquotedRdnValue is String ? StrPtr(psUnquotedRdnValue) : psUnquotedRdnValue
    psQuotedRdnValue := psQuotedRdnValue is String ? StrPtr(psQuotedRdnValue) : psQuotedRdnValue

    pcQuotedRdnValueLengthMarshal := pcQuotedRdnValueLength is VarRef ? "uint*" : "ptr"

    result := DllCall("DSPARSE.dll\DsQuoteRdnValueA", "uint", cUnquotedRdnValueLength, "ptr", psUnquotedRdnValue, pcQuotedRdnValueLengthMarshal, pcQuotedRdnValueLength, "ptr", psQuotedRdnValue, UInt32)
    return result
}

/**
 * The DsUnquoteRdnValue function is a client call that converts a quoted RDN value back to an unquoted RDN value. (Unicode)
 * @remarks
 * When <i>psQuotedRdnValue</i> is quoted:
 * 
 * <ul>
 * <li>The leading and trailing quotes are removed.</li>
 * <li>White space before the first quote is discarded.</li>
 * <li>White space trailing the last quote is discarded.</li>
 * <li>Escapes are removed and the character following the escape is kept.</li>
 * </ul>
 * The following actions are taken when <i>psQuotedRdnValue</i> is unquoted:
 * 
 * <ul>
 * <li>The leading white space is discarded.</li>
 * <li>The trailing white space is kept.</li>
 * <li>Escaped non-special characters return an error.</li>
 * <li>Unescaped special characters return an error.</li>
 * <li>RDN values beginning with # (ignoring leading white space) are handled as a  BER value that has previously been converted to a string, and converted accordingly.</li>
 * <li>Escaped hex digits (\89) are converted into a binary byte (0x89).</li>
 * <li>Escapes are removed from escaped special characters.</li>
 * </ul>
 * The following actions are always taken:
 * 
 * <ul>
 * <li>Escaped special characters are unescaped.</li>
 * <li>The input and output RDN values are not null-terminated values.</li>
 * </ul>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsUnquoteRdnValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} cQuotedRdnValueLength The number of characters in the <i>psQuotedRdnValue</i> string.
 * @param {PWSTR} psQuotedRdnValue The RDN value that may be quoted and escaped.
 * @param {Pointer<Integer>} pcUnquotedRdnValueLength The input value for this argument is the maximum length, in characters, of <i>psQuotedRdnValue</i>.
 * 
 * The output value for this argument includes the following flags.
 * @param {PWSTR} psUnquotedRdnValue The converted, unquoted RDN value.
 * @returns {Integer} The following list contains the possible values that are returned for the <b>DsUnquoteRdnValue</b> function.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsunquoterdnvaluew
 * @since windows6.0.6000
 */
export DsUnquoteRdnValueW(cQuotedRdnValueLength, psQuotedRdnValue, pcUnquotedRdnValueLength, psUnquotedRdnValue) {
    psQuotedRdnValue := psQuotedRdnValue is String ? StrPtr(psQuotedRdnValue) : psQuotedRdnValue
    psUnquotedRdnValue := psUnquotedRdnValue is String ? StrPtr(psUnquotedRdnValue) : psUnquotedRdnValue

    pcUnquotedRdnValueLengthMarshal := pcUnquotedRdnValueLength is VarRef ? "uint*" : "ptr"

    result := DllCall("DSPARSE.dll\DsUnquoteRdnValueW", "uint", cQuotedRdnValueLength, "ptr", psQuotedRdnValue, pcUnquotedRdnValueLengthMarshal, pcUnquotedRdnValueLength, "ptr", psUnquotedRdnValue, UInt32)
    return result
}

/**
 * The DsUnquoteRdnValue function is a client call that converts a quoted RDN value back to an unquoted RDN value. (ANSI)
 * @remarks
 * When <i>psQuotedRdnValue</i> is quoted:
 * 
 * <ul>
 * <li>The leading and trailing quotes are removed.</li>
 * <li>White space before the first quote is discarded.</li>
 * <li>White space trailing the last quote is discarded.</li>
 * <li>Escapes are removed and the character following the escape is kept.</li>
 * </ul>
 * The following actions are taken when <i>psQuotedRdnValue</i> is unquoted:
 * 
 * <ul>
 * <li>The leading white space is discarded.</li>
 * <li>The trailing white space is kept.</li>
 * <li>Escaped non-special characters return an error.</li>
 * <li>Unescaped special characters return an error.</li>
 * <li>RDN values beginning with # (ignoring leading white space) are handled as a  BER value that has previously been converted to a string, and converted accordingly.</li>
 * <li>Escaped hex digits (\89) are converted into a binary byte (0x89).</li>
 * <li>Escapes are removed from escaped special characters.</li>
 * </ul>
 * The following actions are always taken:
 * 
 * <ul>
 * <li>Escaped special characters are unescaped.</li>
 * <li>The input and output RDN values are not null-terminated values.</li>
 * </ul>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsUnquoteRdnValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} cQuotedRdnValueLength The number of characters in the <i>psQuotedRdnValue</i> string.
 * @param {PSTR} psQuotedRdnValue The RDN value that may be quoted and escaped.
 * @param {Pointer<Integer>} pcUnquotedRdnValueLength The input value for this argument is the maximum length, in characters, of <i>psQuotedRdnValue</i>.
 * 
 * The output value for this argument includes the following flags.
 * @param {PSTR} psUnquotedRdnValue The converted, unquoted RDN value.
 * @returns {Integer} The following list contains the possible values that are returned for the <b>DsUnquoteRdnValue</b> function.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsunquoterdnvaluea
 * @since windows6.0.6000
 */
export DsUnquoteRdnValueA(cQuotedRdnValueLength, psQuotedRdnValue, pcUnquotedRdnValueLength, psUnquotedRdnValue) {
    psQuotedRdnValue := psQuotedRdnValue is String ? StrPtr(psQuotedRdnValue) : psQuotedRdnValue
    psUnquotedRdnValue := psUnquotedRdnValue is String ? StrPtr(psUnquotedRdnValue) : psUnquotedRdnValue

    pcUnquotedRdnValueLengthMarshal := pcUnquotedRdnValueLength is VarRef ? "uint*" : "ptr"

    result := DllCall("DSPARSE.dll\DsUnquoteRdnValueA", "uint", cQuotedRdnValueLength, "ptr", psQuotedRdnValue, pcUnquotedRdnValueLengthMarshal, pcUnquotedRdnValueLength, "ptr", psUnquotedRdnValue, UInt32)
    return result
}

/**
 * Retrieves the key and value of the first relative distinguished name and a pointer to the next relative distinguished name from a distinguished name string.
 * @param {Pointer<PWSTR>} ppDN Address of a Unicode string pointer that, on entry, contains the distinguished name string to be parsed. The length of this string is specified in the <i>pcDN</i> parameter. If the function succeeds, this parameter is adjusted to point to the remainder of the distinguished name exclusive of current relative distinguished name. For example, if this parameter points to the string "dc=corp,dc=fabrikam,dc=com", after the function is complete this parameter points to the string ",dc=fabrikam,dc=com".
 * @param {Pointer<Integer>} pcDN Pointer to a <b>DWORD</b> value that, on entry, contains the number of characters in the <i>ppDN</i> string. If the function succeeds, this parameter receives the number of characters in the remainder of the distinguished name. These values do not include the null-terminated character.
 * @param {Pointer<PWSTR>} ppKey Pointer to a <b>LPCWCH</b> value that, if the function succeeds, receives a pointer to the key in the relative distinguished name string. This pointer is within the <i>ppDN</i> string and is not null-terminated. The <i>pcKey</i> parameter receives the number of characters in the key. This parameter is undefined if <i>pcKey</i> receives zero.
 * @param {Pointer<Integer>} pcKey Pointer to a <b>DWORD</b> value that, if the function succeeds, receives the number of characters in the key string represented by the <i>ppKey</i> parameter. If this parameter receives zero, <i>ppKey</i> is undefined.
 * @param {Pointer<PWSTR>} ppVal Pointer to a <b>LPCWCH</b> value that, if the function is successful, receives a pointer to the value in the relative distinguished name string. This pointer is within the <i>ppDN</i> string and is not null-terminated. The <i>pcVal</i> parameter receives the number of characters in the value. This parameter is undefined if <i>pcVal</i> receives zero.
 * @param {Pointer<Integer>} pcVal Pointer to a <b>DWORD</b> value that, if the function succeeds, receives the number of characters in the value string represented by the <i>ppVal</i> parameter. If this parameter receives zero, <i>ppVal</i> is undefined.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error code otherwise. Possible error codes include the following values.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsgetrdnw
 * @since windows6.0.6000
 */
export DsGetRdnW(ppDN, pcDN, ppKey, pcKey, ppVal, pcVal) {
    ppDNMarshal := ppDN is VarRef ? "ptr*" : "ptr"
    pcDNMarshal := pcDN is VarRef ? "uint*" : "ptr"
    ppKeyMarshal := ppKey is VarRef ? "ptr*" : "ptr"
    pcKeyMarshal := pcKey is VarRef ? "uint*" : "ptr"
    ppValMarshal := ppVal is VarRef ? "ptr*" : "ptr"
    pcValMarshal := pcVal is VarRef ? "uint*" : "ptr"

    result := DllCall("DSPARSE.dll\DsGetRdnW", ppDNMarshal, ppDN, pcDNMarshal, pcDN, ppKeyMarshal, ppKey, pcKeyMarshal, pcKey, ppValMarshal, ppVal, pcValMarshal, pcVal, UInt32)
    return result
}

/**
 * The DsCrackUnquotedMangledRdn function unmangles (unencodes) a given relative distinguished name and returns both the decoded GUID and the mangling type used. (Unicode)
 * @remarks
 * This function attempts to
 *     decode (unmangle)  an RDN that has been previously mangled due to a deletion or a naming conflict. If the relative distinguished name is mangled, the function returns <b>TRUE</b> and retrieves the GUID and mangle type, if requested.  If the relative distinguished name is not mangled, the function returns <b>FALSE</b>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsCrackUnquotedMangledRdn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszRDN Pointer to a string that contains the relative distinguished name (RDN) to translate. This string length is specified by the <i>cchRDN</i> parameter, so this string is not required to be null-terminated. This string must be in unquoted form. For more information about unquoted relative distinguished names, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/nf-dsparse-dsunquoterdnvaluea">DsUnquoteRdnValue</a>.
 * @param {Integer} cchRDN Contains the length, in characters, of the <i>pszRDN</i> string.
 * @param {Pointer<Guid>} pGuid Pointer to <b>GUID</b> value that receives the GUID of the unmangled relative distinguished name.  This parameter can be <b>NULL</b>.
 * @param {Pointer<DS_MANGLE_FOR>} peDsMangleFor Pointer 
 * to a <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> value that receives the type of mangling used in the mangled relative distinguished name.  This parameter can be <b>NULL</b>.
 * @returns {BOOL} This function returns <b>TRUE</b> if the relative distinguished name is mangled or <b>FALSE</b> otherwise. If this function returns <b>FALSE</b>, neither <i>pGuid</i> or <i>peDsMangleFor</i> receive any data.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dscrackunquotedmangledrdnw
 * @since windows6.0.6000
 */
export DsCrackUnquotedMangledRdnW(pszRDN, cchRDN, pGuid, peDsMangleFor) {
    pszRDN := pszRDN is String ? StrPtr(pszRDN) : pszRDN

    peDsMangleForMarshal := peDsMangleFor is VarRef ? "int*" : "ptr"

    result := DllCall("DSPARSE.dll\DsCrackUnquotedMangledRdnW", "ptr", pszRDN, "uint", cchRDN, Guid.Ptr, pGuid, peDsMangleForMarshal, peDsMangleFor, BOOL)
    return result
}

/**
 * The DsCrackUnquotedMangledRdn function unmangles (unencodes) a given relative distinguished name and returns both the decoded GUID and the mangling type used. (ANSI)
 * @remarks
 * This function attempts to
 *     decode (unmangle)  an RDN that has been previously mangled due to a deletion or a naming conflict. If the relative distinguished name is mangled, the function returns <b>TRUE</b> and retrieves the GUID and mangle type, if requested.  If the relative distinguished name is not mangled, the function returns <b>FALSE</b>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsCrackUnquotedMangledRdn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszRDN Pointer to a string that contains the relative distinguished name (RDN) to translate. This string length is specified by the <i>cchRDN</i> parameter, so this string is not required to be null-terminated. This string must be in unquoted form. For more information about unquoted relative distinguished names, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/nf-dsparse-dsunquoterdnvaluea">DsUnquoteRdnValue</a>.
 * @param {Integer} cchRDN Contains the length, in characters, of the <i>pszRDN</i> string.
 * @param {Pointer<Guid>} pGuid Pointer to <b>GUID</b> value that receives the GUID of the unmangled relative distinguished name.  This parameter can be <b>NULL</b>.
 * @param {Pointer<DS_MANGLE_FOR>} peDsMangleFor Pointer 
 * to a <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> value that receives the type of mangling used in the mangled relative distinguished name.  This parameter can be <b>NULL</b>.
 * @returns {BOOL} This function returns <b>TRUE</b> if the relative distinguished name is mangled or <b>FALSE</b> otherwise. If this function returns <b>FALSE</b>, neither <i>pGuid</i> or <i>peDsMangleFor</i> receive any data.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dscrackunquotedmangledrdna
 * @since windows6.0.6000
 */
export DsCrackUnquotedMangledRdnA(pszRDN, cchRDN, pGuid, peDsMangleFor) {
    pszRDN := pszRDN is String ? StrPtr(pszRDN) : pszRDN

    peDsMangleForMarshal := peDsMangleFor is VarRef ? "int*" : "ptr"

    result := DllCall("DSPARSE.dll\DsCrackUnquotedMangledRdnA", "ptr", pszRDN, "uint", cchRDN, Guid.Ptr, pGuid, peDsMangleForMarshal, peDsMangleFor, BOOL)
    return result
}

/**
 * Determines if a given relative distinguished name value is a mangled name of the given type. (Unicode)
 * @remarks
 * This function determines if the given relative distinguished name value is mangled and mangled in the given type.  The <i>pszRdn</i> parameter should only contain the value of the relative distinguished name and not the key.  The relative distinguished name value may be quoted or unquoted.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsIsMangledRdnValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszRdn Pointer to a null-terminated string that contains  the relative distinguished name  to determine if it is mangled. The <i>cRdn</i> parameter contains the number of characters in this string.
 * @param {Integer} cRdn Contains the number of characters in the <i>pszRdn</i> string.
 * @param {DS_MANGLE_FOR} eDsMangleForDesired Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> values that specifies the type of name mangling to search for.
 * @returns {BOOL} Returns <b>TRUE</b> if the  relative distinguished name is mangled and the mangle type is the same as specified. Returns <b>FALSE</b> if the relative distinguished name is not mangled or the  mangle type is different than specified.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsismangledrdnvaluew
 * @since windows6.0.6000
 */
export DsIsMangledRdnValueW(pszRdn, cRdn, eDsMangleForDesired) {
    pszRdn := pszRdn is String ? StrPtr(pszRdn) : pszRdn

    result := DllCall("DSPARSE.dll\DsIsMangledRdnValueW", "ptr", pszRdn, "uint", cRdn, DS_MANGLE_FOR, eDsMangleForDesired, BOOL)
    return result
}

/**
 * Determines if a given relative distinguished name value is a mangled name of the given type. (ANSI)
 * @remarks
 * This function determines if the given relative distinguished name value is mangled and mangled in the given type.  The <i>pszRdn</i> parameter should only contain the value of the relative distinguished name and not the key.  The relative distinguished name value may be quoted or unquoted.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsparse.h header defines DsIsMangledRdnValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszRdn Pointer to a null-terminated string that contains  the relative distinguished name  to determine if it is mangled. The <i>cRdn</i> parameter contains the number of characters in this string.
 * @param {Integer} cRdn Contains the number of characters in the <i>pszRdn</i> string.
 * @param {DS_MANGLE_FOR} eDsMangleForDesired Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> values that specifies the type of name mangling to search for.
 * @returns {BOOL} Returns <b>TRUE</b> if the  relative distinguished name is mangled and the mangle type is the same as specified. Returns <b>FALSE</b> if the relative distinguished name is not mangled or the  mangle type is different than specified.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsismangledrdnvaluea
 * @since windows6.0.6000
 */
export DsIsMangledRdnValueA(pszRdn, cRdn, eDsMangleForDesired) {
    pszRdn := pszRdn is String ? StrPtr(pszRdn) : pszRdn

    result := DllCall("DSPARSE.dll\DsIsMangledRdnValueA", "ptr", pszRdn, "uint", cRdn, DS_MANGLE_FOR, eDsMangleForDesired, BOOL)
    return result
}

/**
 * The DsIsMangledDn function determines if the first relative distinguished name (RDN) in a distinguished name (DN) is a mangled name of a given type. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsparse.h header defines DsIsMangledDn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszDn Pointer to a null-terminated string that contains the  distinguished name to retrieve the relative distinguished name from. This can also be a quoted distinguished name  as returned by other directory service functions.
 * @param {DS_MANGLE_FOR} eDsMangleFor Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> values that specifies the type of name mangling to look for.
 * @returns {BOOL} Returns <b>TRUE</b> if the first relative distinguished name in <i>pszDn</i> is mangled in the manner specified by <i>eDsMangleFor</i> or <b>FALSE</b>  otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsismangleddna
 * @since windows6.0.6000
 */
export DsIsMangledDnA(pszDn, eDsMangleFor) {
    pszDn := pszDn is String ? StrPtr(pszDn) : pszDn

    result := DllCall("DSPARSE.dll\DsIsMangledDnA", "ptr", pszDn, DS_MANGLE_FOR, eDsMangleFor, BOOL)
    return result
}

/**
 * The DsIsMangledDn function determines if the first relative distinguished name (RDN) in a distinguished name (DN) is a mangled name of a given type. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dsparse.h header defines DsIsMangledDn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszDn Pointer to a null-terminated string that contains the  distinguished name to retrieve the relative distinguished name from. This can also be a quoted distinguished name  as returned by other directory service functions.
 * @param {DS_MANGLE_FOR} eDsMangleFor Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> values that specifies the type of name mangling to look for.
 * @returns {BOOL} Returns <b>TRUE</b> if the first relative distinguished name in <i>pszDn</i> is mangled in the manner specified by <i>eDsMangleFor</i> or <b>FALSE</b>  otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/dsparse/nf-dsparse-dsismangleddnw
 * @since windows6.0.6000
 */
export DsIsMangledDnW(pszDn, eDsMangleFor) {
    pszDn := pszDn is String ? StrPtr(pszDn) : pszDn

    result := DllCall("DSPARSE.dll\DsIsMangledDnW", "ptr", pszDn, DS_MANGLE_FOR, eDsMangleFor, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} pszSpn 
 * @param {Integer} cSpn 
 * @param {Pointer<Integer>} pcServiceClass 
 * @param {PSTR} ServiceClass 
 * @param {Pointer<Integer>} pcServiceName 
 * @param {PSTR} ServiceName 
 * @param {Pointer<Integer>} pcInstanceName 
 * @param {PSTR} InstanceName 
 * @param {Pointer<Integer>} pInstancePort 
 * @returns {Integer} 
 */
export DsCrackSpn2A(pszSpn, cSpn, pcServiceClass, ServiceClass, pcServiceName, ServiceName, pcInstanceName, InstanceName, pInstancePort) {
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
    InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

    pcServiceClassMarshal := pcServiceClass is VarRef ? "uint*" : "ptr"
    pcServiceNameMarshal := pcServiceName is VarRef ? "uint*" : "ptr"
    pcInstanceNameMarshal := pcInstanceName is VarRef ? "uint*" : "ptr"
    pInstancePortMarshal := pInstancePort is VarRef ? "ushort*" : "ptr"

    result := DllCall("DSPARSE.dll\DsCrackSpn2A", "ptr", pszSpn, "uint", cSpn, pcServiceClassMarshal, pcServiceClass, "ptr", ServiceClass, pcServiceNameMarshal, pcServiceName, "ptr", ServiceName, pcInstanceNameMarshal, pcInstanceName, "ptr", InstanceName, pInstancePortMarshal, pInstancePort, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pszSpn 
 * @param {Integer} cSpn 
 * @param {Pointer<Integer>} pcServiceClass 
 * @param {PWSTR} ServiceClass 
 * @param {Pointer<Integer>} pcServiceName 
 * @param {PWSTR} ServiceName 
 * @param {Pointer<Integer>} pcInstanceName 
 * @param {PWSTR} InstanceName 
 * @param {Pointer<Integer>} pInstancePort 
 * @returns {Integer} 
 */
export DsCrackSpn2W(pszSpn, cSpn, pcServiceClass, ServiceClass, pcServiceName, ServiceName, pcInstanceName, InstanceName, pInstancePort) {
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
    InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

    pcServiceClassMarshal := pcServiceClass is VarRef ? "uint*" : "ptr"
    pcServiceNameMarshal := pcServiceName is VarRef ? "uint*" : "ptr"
    pcInstanceNameMarshal := pcInstanceName is VarRef ? "uint*" : "ptr"
    pInstancePortMarshal := pInstancePort is VarRef ? "ushort*" : "ptr"

    result := DllCall("DSPARSE.dll\DsCrackSpn2W", "ptr", pszSpn, "uint", cSpn, pcServiceClassMarshal, pcServiceClass, "ptr", ServiceClass, pcServiceNameMarshal, pcServiceName, "ptr", ServiceName, pcInstanceNameMarshal, pcInstanceName, "ptr", InstanceName, pInstancePortMarshal, pInstancePort, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pszSpn 
 * @param {Integer} cSpn 
 * @param {Pointer<Integer>} pcHostName 
 * @param {PWSTR} HostName 
 * @param {Pointer<Integer>} pcInstanceName 
 * @param {PWSTR} InstanceName 
 * @param {Pointer<Integer>} pPortNumber 
 * @param {Pointer<Integer>} pcDomainName 
 * @param {PWSTR} DomainName 
 * @param {Pointer<Integer>} pcRealmName 
 * @param {PWSTR} RealmName 
 * @returns {Integer} 
 */
export DsCrackSpn3W(pszSpn, cSpn, pcHostName, HostName, pcInstanceName, InstanceName, pPortNumber, pcDomainName, DomainName, pcRealmName, RealmName) {
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
    HostName := HostName is String ? StrPtr(HostName) : HostName
    InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName
    DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
    RealmName := RealmName is String ? StrPtr(RealmName) : RealmName

    pcHostNameMarshal := pcHostName is VarRef ? "uint*" : "ptr"
    pcInstanceNameMarshal := pcInstanceName is VarRef ? "uint*" : "ptr"
    pPortNumberMarshal := pPortNumber is VarRef ? "ushort*" : "ptr"
    pcDomainNameMarshal := pcDomainName is VarRef ? "uint*" : "ptr"
    pcRealmNameMarshal := pcRealmName is VarRef ? "uint*" : "ptr"

    result := DllCall("DSPARSE.dll\DsCrackSpn3W", "ptr", pszSpn, "uint", cSpn, pcHostNameMarshal, pcHostName, "ptr", HostName, pcInstanceNameMarshal, pcInstanceName, "ptr", InstanceName, pPortNumberMarshal, pPortNumber, pcDomainNameMarshal, pcDomainName, "ptr", DomainName, pcRealmNameMarshal, pcRealmName, "ptr", RealmName, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pszSpn 
 * @param {Integer} cSpn 
 * @param {Pointer<Integer>} pcHostName 
 * @param {PWSTR} HostName 
 * @param {Pointer<Integer>} pcInstanceName 
 * @param {PWSTR} InstanceName 
 * @param {Pointer<Integer>} pcPortName 
 * @param {PWSTR} PortName 
 * @param {Pointer<Integer>} pcDomainName 
 * @param {PWSTR} DomainName 
 * @param {Pointer<Integer>} pcRealmName 
 * @param {PWSTR} RealmName 
 * @returns {Integer} 
 */
export DsCrackSpn4W(pszSpn, cSpn, pcHostName, HostName, pcInstanceName, InstanceName, pcPortName, PortName, pcDomainName, DomainName, pcRealmName, RealmName) {
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
    HostName := HostName is String ? StrPtr(HostName) : HostName
    InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName
    PortName := PortName is String ? StrPtr(PortName) : PortName
    DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
    RealmName := RealmName is String ? StrPtr(RealmName) : RealmName

    pcHostNameMarshal := pcHostName is VarRef ? "uint*" : "ptr"
    pcInstanceNameMarshal := pcInstanceName is VarRef ? "uint*" : "ptr"
    pcPortNameMarshal := pcPortName is VarRef ? "uint*" : "ptr"
    pcDomainNameMarshal := pcDomainName is VarRef ? "uint*" : "ptr"
    pcRealmNameMarshal := pcRealmName is VarRef ? "uint*" : "ptr"

    result := DllCall("DSPARSE.dll\DsCrackSpn4W", "ptr", pszSpn, "uint", cSpn, pcHostNameMarshal, pcHostName, "ptr", HostName, pcInstanceNameMarshal, pcInstanceName, "ptr", InstanceName, pcPortNameMarshal, pcPortName, "ptr", PortName, pcDomainNameMarshal, pcDomainName, "ptr", DomainName, pcRealmNameMarshal, pcRealmName, "ptr", RealmName, UInt32)
    return result
}

/**
 * Binds to a domain controller. (Unicode)
 * @remarks
 * The behavior of the 
 *     <b>DsBind</b> function is determined by the contents of the <i>DomainControllerName</i> and <i>DnsDomainName</i> parameters. The following list describes the behavior of this function based on the contents of these parameters.
 * 
 * <table>
 * <tr>
 * <th><i>DomainControllerName</i></th>
 * <th><i>DnsDomainName</i></th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>DsBind</b> will attempt to bind to a global catalog server in the forest of the local computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * (value)
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>DsBind</b> will attempt to bind to the domain controller specified by the  <i>DomainControllerName</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * (value)
 * 
 * </td>
 * <td>
 * <b>DsBind</b> will attempt to bind to any domain controller in the domain specified by <i>DnsDomainName</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * (value</p>)</td>
 * <td>
 * (value)
 * 
 * </td>
 * <td>
 * The <i>DomainControllerName</i> parameter takes precedence. <b>DsBind</b> will attempt to bind to the domain controller specified by the  <i>DomainControllerName</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBind as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} DomainControllerName Pointer to a null-terminated string that contains the name of the domain controller to bind to. This name can be the name of the domain controller or the fully qualified DNS name of the domain controller. Either name type can, optionally, be preceded by two backslash characters. All of the following examples represent correctly formatted domain controller names:
 * 
 * <ul>
 * <li>"FAB-DC-01"</li>
 * <li>"\\FAB-DC-01"</li>
 * <li>"FAB-DC-01.fabrikam.com"</li>
 * <li>"\\FAB-DC-01.fabrikam.com"</li>
 * </ul>
 * This parameter can be <b>NULL</b>. For more information, see Remarks.
 * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. This parameter can be <b>NULL</b>. For more  information, see Remarks.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindw
 * @since windows6.0.6000
 */
export DsBindW(DomainControllerName, DnsDomainName, phDS) {
    DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName

    result := DllCall("NTDSAPI.dll\DsBindW", "ptr", DomainControllerName, "ptr", DnsDomainName, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Binds to a domain controller. (ANSI)
 * @remarks
 * The behavior of the 
 *     <b>DsBind</b> function is determined by the contents of the <i>DomainControllerName</i> and <i>DnsDomainName</i> parameters. The following list describes the behavior of this function based on the contents of these parameters.
 * 
 * <table>
 * <tr>
 * <th><i>DomainControllerName</i></th>
 * <th><i>DnsDomainName</i></th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>DsBind</b> will attempt to bind to a global catalog server in the forest of the local computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * (value)
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>DsBind</b> will attempt to bind to the domain controller specified by the  <i>DomainControllerName</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * (value)
 * 
 * </td>
 * <td>
 * <b>DsBind</b> will attempt to bind to any domain controller in the domain specified by <i>DnsDomainName</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * (value</p>)</td>
 * <td>
 * (value)
 * 
 * </td>
 * <td>
 * The <i>DomainControllerName</i> parameter takes precedence. <b>DsBind</b> will attempt to bind to the domain controller specified by the  <i>DomainControllerName</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBind as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} DomainControllerName Pointer to a null-terminated string that contains the name of the domain controller to bind to. This name can be the name of the domain controller or the fully qualified DNS name of the domain controller. Either name type can, optionally, be preceded by two backslash characters. All of the following examples represent correctly formatted domain controller names:
 * 
 * <ul>
 * <li>"FAB-DC-01"</li>
 * <li>"\\FAB-DC-01"</li>
 * <li>"FAB-DC-01.fabrikam.com"</li>
 * <li>"\\FAB-DC-01.fabrikam.com"</li>
 * </ul>
 * This parameter can be <b>NULL</b>. For more information, see Remarks.
 * @param {PSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. This parameter can be <b>NULL</b>. For more  information, see Remarks.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbinda
 * @since windows6.0.6000
 */
export DsBindA(DomainControllerName, DnsDomainName, phDS) {
    DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName

    result := DllCall("NTDSAPI.dll\DsBindA", "ptr", DomainControllerName, "ptr", DnsDomainName, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Binds to a domain controller using the specified credentials. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindWithCred as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information about this parameter, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information about this parameter, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * 
 * This parameter is required to secure a Kerberos authentication.
 * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
 *     
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function is used to obtain this value. If this parameter is <b>NULL</b>,
 *     the credentials of the calling thread are used.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindwithcredw
 * @since windows6.0.6000
 */
export DsBindWithCredW(DomainControllerName, DnsDomainName, AuthIdentity, phDS) {
    DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsBindWithCredW", "ptr", DomainControllerName, "ptr", DnsDomainName, AuthIdentityMarshal, AuthIdentity, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Binds to a domain controller using the specified credentials. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindWithCred as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information about this parameter, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {PSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information about this parameter, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * 
 * This parameter is required to secure a Kerberos authentication.
 * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
 *     
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function is used to obtain this value. If this parameter is <b>NULL</b>,
 *     the credentials of the calling thread are used.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindwithcreda
 * @since windows6.0.6000
 */
export DsBindWithCredA(DomainControllerName, DnsDomainName, AuthIdentity, phDS) {
    DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsBindWithCredA", "ptr", DomainControllerName, "ptr", DnsDomainName, AuthIdentityMarshal, AuthIdentity, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Binds to a domain controller using the specified credentials and a specific service principal name (SPN) for mutual authentication. (DsBindWithSpnW)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindWithSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
 *     
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function is used to obtain this value. If this parameter is <b>NULL</b>,
 *     the credentials of the calling thread are used.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
 * @param {PWSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindwithspnw
 * @since windows6.0.6000
 */
export DsBindWithSpnW(DomainControllerName, DnsDomainName, AuthIdentity, ServicePrincipalName, phDS) {
    DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
    ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsBindWithSpnW", "ptr", DomainControllerName, "ptr", DnsDomainName, AuthIdentityMarshal, AuthIdentity, "ptr", ServicePrincipalName, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Binds to a domain controller using the specified credentials and a specific service principal name (SPN) for mutual authentication. (DsBindWithSpnA)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindWithSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {PSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
 *     
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function is used to obtain this value. If this parameter is <b>NULL</b>,
 *     the credentials of the calling thread are used.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
 * @param {PSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindwithspna
 * @since windows6.0.6000
 */
export DsBindWithSpnA(DomainControllerName, DnsDomainName, AuthIdentity, ServicePrincipalName, phDS) {
    DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
    ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsBindWithSpnA", "ptr", DomainControllerName, "ptr", DnsDomainName, AuthIdentityMarshal, AuthIdentity, "ptr", ServicePrincipalName, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Binds to a domain controller using the specified credentials and a specific service principal name (SPN) for mutual authentication. (DsBindWithSpnExW)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindWithSpnEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
 *     
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function is used to obtain this value. If this parameter is <b>NULL</b>,
 *     the credentials of the calling thread are used.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
 * @param {PWSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
 * @param {Integer} BindFlags Contains a set of flags that define the behavior of this function. This parameter can contain zero or a combination of the values listed in the following list.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following list lists common error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindwithspnexw
 * @since windows6.0.6000
 */
export DsBindWithSpnExW(DomainControllerName, DnsDomainName, AuthIdentity, ServicePrincipalName, BindFlags, phDS) {
    DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
    ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsBindWithSpnExW", "ptr", DomainControllerName, "ptr", DnsDomainName, AuthIdentityMarshal, AuthIdentity, "ptr", ServicePrincipalName, "uint", BindFlags, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Binds to a domain controller using the specified credentials and a specific service principal name (SPN) for mutual authentication. (DsBindWithSpnExA)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindWithSpnEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {PSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
 * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
 *     
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function is used to obtain this value. If this parameter is <b>NULL</b>,
 *     the credentials of the calling thread are used.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
 * @param {PSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
 * @param {Integer} BindFlags Contains a set of flags that define the behavior of this function. This parameter can contain zero or a combination of the values listed in the following list.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following list lists common error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindwithspnexa
 * @since windows6.0.6000
 */
export DsBindWithSpnExA(DomainControllerName, DnsDomainName, AuthIdentity, ServicePrincipalName, BindFlags, phDS) {
    DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
    ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsBindWithSpnExA", "ptr", DomainControllerName, "ptr", DnsDomainName, AuthIdentityMarshal, AuthIdentity, "ptr", ServicePrincipalName, "uint", BindFlags, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Explicitly binds to any AD LDS or Active Directory instance. (Unicode)
 * @remarks
 * The following list lists the required parameter values for binding to an instance.
 * 
 * <table>
 * <tr>
 * <th>Instance</th>
 * <th><i>ServerName</i></th>
 * <th><i>Annotation</i></th>
 * <th><i>InstanceGuid</i></th>
 * <th><i>DnsDomainName</i></th>
 * </tr>
 * <tr>
 * <td>
 * Active Directory by server
 * 
 * </td>
 * <td>
 * Server Name
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Active Directory by domain
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * DNS domain name
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * AD LDS by port
 * 
 * </td>
 * <td>
 * DNS Name of the computer with the AD LDS installation.
 * 
 * </td>
 * <td>
 * Port Number
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * AD LDS by <b>GUID</b>
 * 
 * </td>
 * <td>
 * DNS Name of the computer with the AD LDS installation.
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * Instance <b>GUID</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert"><b>Note</b>  For improved performance when binding to an AD LDS instance on a computer with several instances 
 *      of AD LDS, bind by the Instance <b>GUID</b> instead of the port number.</div>
 * <div> </div>
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindByInstance as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ServerName Pointer to a null-terminated string that specifies the name of the instance. This parameter is required to 
 *       bind to an AD LDS instance. If this parameter is <b>NULL</b> when binding to an Active 
 *       Directory instance, then the <i>DnsDomainName</i> parameter must contain a value. If this 
 *       parameter and the <i>DnsDomainName</i> parameter are both <b>NULL</b>, the 
 *       function fails with the return value <b>ERROR_INVALID_PARAMETER</b> (87).
 * @param {PWSTR} Annotation Pointer to a null-terminated string that specifies the port number of the AD LDS instance or 
 *        <b>NULL</b> when binding to an Active Directory instance. For example, 
 *        "389".
 * 
 * If this parameter is <b>NULL</b> when binding by domain to an Active Directory instance, 
 *        then the <i>DnsDomainName</i> parameter must be specified. If this parameter is 
 *        <b>NULL</b> when binding to an AD LDS instance, then the 
 *        <i>InstanceGuid</i> parameter must be specified.
 * @param {Pointer<Guid>} InstanceGuid Pointer to a <b>GUID</b> value that contains the <b>GUID</b> of the AD LDS instance. The <b>GUID</b> value is the 
 *       <b>objectGUID</b> property of the <b>nTDSDSA</b> object of the 
 *       instance. If this parameter is <b>NULL</b> when binding to an AD LDS instance, the 
 *       <i>Annotation</i> parameter must be specified.
 * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that specifies the DNS name of the domain when binding to an Active 
 *       Directory instance by domain. Set this parameter to <b>NULL</b> to bind to an Active 
 *       Directory instance by server or to an AD LDS instance.
 * @param {Pointer<Void>} AuthIdentity Handle to the credentials used to start the RPC session. Use the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function to create 
 *       a structure suitable for <i>AuthIdentity</i>.
 * @param {PWSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. 
 *       Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call 
 *       to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
 * @param {Integer} BindFlags Contains a set of flags that define the behavior of this function. This parameter can contain zero or a
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the bind handle. To close this handle, 
 *       call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a>.
 * @returns {Integer} Returns <b>NO_ERROR</b> if successful or an RPC or Win32 error otherwise. Possible error codes include those 
 *       listed in the  following list.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindbyinstancew
 * @since windows6.0.6000
 */
export DsBindByInstanceW(ServerName, Annotation, InstanceGuid, DnsDomainName, AuthIdentity, ServicePrincipalName, BindFlags, phDS) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    Annotation := Annotation is String ? StrPtr(Annotation) : Annotation
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
    ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsBindByInstanceW", "ptr", ServerName, "ptr", Annotation, Guid.Ptr, InstanceGuid, "ptr", DnsDomainName, AuthIdentityMarshal, AuthIdentity, "ptr", ServicePrincipalName, "uint", BindFlags, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Explicitly binds to any AD LDS or Active Directory instance. (ANSI)
 * @remarks
 * The following list lists the required parameter values for binding to an instance.
 * 
 * <table>
 * <tr>
 * <th>Instance</th>
 * <th><i>ServerName</i></th>
 * <th><i>Annotation</i></th>
 * <th><i>InstanceGuid</i></th>
 * <th><i>DnsDomainName</i></th>
 * </tr>
 * <tr>
 * <td>
 * Active Directory by server
 * 
 * </td>
 * <td>
 * Server Name
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Active Directory by domain
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * DNS domain name
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * AD LDS by port
 * 
 * </td>
 * <td>
 * DNS Name of the computer with the AD LDS installation.
 * 
 * </td>
 * <td>
 * Port Number
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * AD LDS by <b>GUID</b>
 * 
 * </td>
 * <td>
 * DNS Name of the computer with the AD LDS installation.
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * Instance <b>GUID</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert"><b>Note</b>  For improved performance when binding to an AD LDS instance on a computer with several instances 
 *      of AD LDS, bind by the Instance <b>GUID</b> instead of the port number.</div>
 * <div> </div>
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindByInstance as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ServerName Pointer to a null-terminated string that specifies the name of the instance. This parameter is required to 
 *       bind to an AD LDS instance. If this parameter is <b>NULL</b> when binding to an Active 
 *       Directory instance, then the <i>DnsDomainName</i> parameter must contain a value. If this 
 *       parameter and the <i>DnsDomainName</i> parameter are both <b>NULL</b>, the 
 *       function fails with the return value <b>ERROR_INVALID_PARAMETER</b> (87).
 * @param {PSTR} Annotation Pointer to a null-terminated string that specifies the port number of the AD LDS instance or 
 *        <b>NULL</b> when binding to an Active Directory instance. For example, 
 *        "389".
 * 
 * If this parameter is <b>NULL</b> when binding by domain to an Active Directory instance, 
 *        then the <i>DnsDomainName</i> parameter must be specified. If this parameter is 
 *        <b>NULL</b> when binding to an AD LDS instance, then the 
 *        <i>InstanceGuid</i> parameter must be specified.
 * @param {Pointer<Guid>} InstanceGuid Pointer to a <b>GUID</b> value that contains the <b>GUID</b> of the AD LDS instance. The <b>GUID</b> value is the 
 *       <b>objectGUID</b> property of the <b>nTDSDSA</b> object of the 
 *       instance. If this parameter is <b>NULL</b> when binding to an AD LDS instance, the 
 *       <i>Annotation</i> parameter must be specified.
 * @param {PSTR} DnsDomainName Pointer to a null-terminated string that specifies the DNS name of the domain when binding to an Active 
 *       Directory instance by domain. Set this parameter to <b>NULL</b> to bind to an Active 
 *       Directory instance by server or to an AD LDS instance.
 * @param {Pointer<Void>} AuthIdentity Handle to the credentials used to start the RPC session. Use the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function to create 
 *       a structure suitable for <i>AuthIdentity</i>.
 * @param {PSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. 
 *       Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call 
 *       to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
 * @param {Integer} BindFlags Contains a set of flags that define the behavior of this function. This parameter can contain zero or a
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the bind handle. To close this handle, 
 *       call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a>.
 * @returns {Integer} Returns <b>NO_ERROR</b> if successful or an RPC or Win32 error otherwise. Possible error codes include those 
 *       listed in the  following list.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindbyinstancea
 * @since windows6.0.6000
 */
export DsBindByInstanceA(ServerName, Annotation, InstanceGuid, DnsDomainName, AuthIdentity, ServicePrincipalName, BindFlags, phDS) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    Annotation := Annotation is String ? StrPtr(Annotation) : Annotation
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
    ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsBindByInstanceA", "ptr", ServerName, "ptr", Annotation, Guid.Ptr, InstanceGuid, "ptr", DnsDomainName, AuthIdentityMarshal, AuthIdentity, "ptr", ServicePrincipalName, "uint", BindFlags, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Binds to the computer that holds the Inter-Site Topology Generator (ISTG) role in the domain of the local computer. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindToISTG as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} SiteName Pointer to a null-terminated string that contains the site name used when binding. If this parameter is <b>NULL</b>, the site of the nearest domain controller is used.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the bind handle. To close this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise.
 *        The following are possible error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindtoistgw
 * @since windows6.0.6000
 */
export DsBindToISTGW(SiteName, phDS) {
    SiteName := SiteName is String ? StrPtr(SiteName) : SiteName

    result := DllCall("NTDSAPI.dll\DsBindToISTGW", "ptr", SiteName, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Binds to the computer that holds the Inter-Site Topology Generator (ISTG) role in the domain of the local computer. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsBindToISTG as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} SiteName Pointer to a null-terminated string that contains the site name used when binding. If this parameter is <b>NULL</b>, the site of the nearest domain controller is used.
 * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the bind handle. To close this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise.
 *        The following are possible error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindtoistga
 * @since windows6.0.6000
 */
export DsBindToISTGA(SiteName, phDS) {
    SiteName := SiteName is String ? StrPtr(SiteName) : SiteName

    result := DllCall("NTDSAPI.dll\DsBindToISTGA", "ptr", SiteName, HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * The DsBindingSetTimeout function sets the timeout value that is honored by all RPC calls that use the specified binding handle. RPC calls that required more time than the timeout value are canceled.
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {Integer} cTimeoutSecs Contains the new timeout value, in seconds.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise. The following is a  possible error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsbindingsettimeout
 * @since windows6.0.6000
 */
export DsBindingSetTimeout(hDS, cTimeoutSecs) {
    result := DllCall("NTDSAPI.dll\DsBindingSetTimeout", HANDLE, hDS, "uint", cTimeoutSecs, UInt32)
    return result
}

/**
 * The DsUnBind function finds an RPC session with a domain controller and unbinds a handle to the directory service (DS). (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsUnBind as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<HANDLE>} phDS Pointer to a bind handle to the directory service. This handle is provided by a call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a>.
 * @returns {Integer} <b>NO_ERROR</b>
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsunbindw
 * @since windows6.0.6000
 */
export DsUnBindW(phDS) {
    result := DllCall("NTDSAPI.dll\DsUnBindW", HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * The DsUnBind function finds an RPC session with a domain controller and unbinds a handle to the directory service (DS). (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsUnBind as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<HANDLE>} phDS Pointer to a bind handle to the directory service. This handle is provided by a call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a>.
 * @returns {Integer} <b>NO_ERROR</b>
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsunbinda
 * @since windows6.0.6000
 */
export DsUnBindA(phDS) {
    result := DllCall("NTDSAPI.dll\DsUnBindA", HANDLE.Ptr, phDS, UInt32)
    return result
}

/**
 * Constructs a credential handle suitable for use with the DsBindWithCred function. (Unicode)
 * @remarks
 * A null, default credential handle is created if <i>User</i>, <i>Domain</i> and <i>Password</i> are all <b>NULL</b>. Otherwise, <i>User</i> must be present. The <i>Domain</i> parameter may be <b>NULL</b> when <i>User</i> is fully qualified, such as a user in UPN format; for example, "someone@fabrikam.com".
 * 
 * When the handle returned in <i>pAuthIdentity</i> is passed to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing the handle with <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a>.  The normal sequence is:
 * 
 * <ol>
 * <li>Call <b>DsMakePasswordCredentials</b> to obtain the credential handle.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, and pass the credential handle.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnbind</a> when the binding is no longer required.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> to free the credential handle.</li>
 * </ol>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsMakePasswordCredentials as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} User Pointer to a null-terminated string that contains the user name to use for the credentials.
 * @param {PWSTR} Domain Pointer to a null-terminated string that contains the domain that the user is a member of.
 * @param {PWSTR} Password Pointer to a null-terminated string that contains the password to use for the credentials.
 * @param {Pointer<Pointer<Void>>} pAuthIdentity Pointer to an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that receives the credential handle. This handle is used in a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>.   This handle must be freed with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function when it is no longer required.
 * @returns {Integer} Returns a Windows error code, including the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsw
 * @since windows6.0.6000
 */
export DsMakePasswordCredentialsW(User, Domain, Password, pAuthIdentity) {
    User := User is String ? StrPtr(User) : User
    Domain := Domain is String ? StrPtr(Domain) : Domain
    Password := Password is String ? StrPtr(Password) : Password

    pAuthIdentityMarshal := pAuthIdentity is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsMakePasswordCredentialsW", "ptr", User, "ptr", Domain, "ptr", Password, pAuthIdentityMarshal, pAuthIdentity, UInt32)
    return result
}

/**
 * Constructs a credential handle suitable for use with the DsBindWithCred function. (ANSI)
 * @remarks
 * A null, default credential handle is created if <i>User</i>, <i>Domain</i> and <i>Password</i> are all <b>NULL</b>. Otherwise, <i>User</i> must be present. The <i>Domain</i> parameter may be <b>NULL</b> when <i>User</i> is fully qualified, such as a user in UPN format; for example, "someone@fabrikam.com".
 * 
 * When the handle returned in <i>pAuthIdentity</i> is passed to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing the handle with <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a>.  The normal sequence is:
 * 
 * <ol>
 * <li>Call <b>DsMakePasswordCredentials</b> to obtain the credential handle.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, and pass the credential handle.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnbind</a> when the binding is no longer required.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> to free the credential handle.</li>
 * </ol>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsMakePasswordCredentials as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} User Pointer to a null-terminated string that contains the user name to use for the credentials.
 * @param {PSTR} Domain Pointer to a null-terminated string that contains the domain that the user is a member of.
 * @param {PSTR} Password Pointer to a null-terminated string that contains the password to use for the credentials.
 * @param {Pointer<Pointer<Void>>} pAuthIdentity Pointer to an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that receives the credential handle. This handle is used in a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>.   This handle must be freed with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function when it is no longer required.
 * @returns {Integer} Returns a Windows error code, including the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa
 * @since windows6.0.6000
 */
export DsMakePasswordCredentialsA(User, Domain, Password, pAuthIdentity) {
    User := User is String ? StrPtr(User) : User
    Domain := Domain is String ? StrPtr(Domain) : Domain
    Password := Password is String ? StrPtr(Password) : Password

    pAuthIdentityMarshal := pAuthIdentity is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsMakePasswordCredentialsA", "ptr", User, "ptr", Domain, "ptr", Password, pAuthIdentityMarshal, pAuthIdentity, UInt32)
    return result
}

/**
 * Frees memory allocated for a credentials structure by the DsMakePasswordCredentials function.
 * @remarks
 * When the handle  in <i>AuthIdentity</i> is passed to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnbind</a> must be called before freeing this handle. The normal sequence of events is:
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> to obtain the credential handle.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, passing the credential handle.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnbind</a> when the RPC connection is no longer required.</li>
 * <li>Call <b>DsFreePasswordCredentials</b> to free the credential handle.</li>
 * </ol>
 * @param {Pointer<Void>} AuthIdentity Handle of the credential structure to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials
 * @since windows6.0.6000
 */
export DsFreePasswordCredentials(AuthIdentity) {
    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    DllCall("NTDSAPI.dll\DsFreePasswordCredentials", AuthIdentityMarshal, AuthIdentity)
}

/**
 * Converts an array of directory service object names from one format to another. (Unicode)
 * @remarks
 * The success of the name conversion request depends on where the
 *     client is bound. Clients bind to specific instances of the directory service
 *     using some variant of <b>DsBind</b>. If bound to a
 *     global catalog, the scope of the name mapping is the entire forest. If not bound to a global catalog, the scope of the name mapping is the domain not
 *     covered by a global catalog for that domain controller. If not bound to a
 *     global catalog and a name is not found, but the input name unambiguously
 *     identifies its domain and this domain is in the forest, then the return data
 *     identifies the DNS domain name for the domain of interest. Clients are expected
 *     to use this data to bind to the correct domain controller or global
 *     catalog and call <b>DsCrackNames</b> again with the new bind handle.
 * 
 * The return value from <b>DsCrackNames</b> indicates errors such as invalid
 *     parameters or insufficient memory. However, problems in converting individual
 *     names are reported in the <b>status</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_result_itema">DS_NAME_RESULT_ITEM</a> structure returned for each input name.
 * 
 * <div class="alert"><b>Note</b>  Do not confuse the values of the format elements of
 *     the <i>formatOffered</i> parameter used by the
 *     <b>DsCrackNames</b> function with the similarly
 *     named format elements as defined in the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_type_enum">ADS_NAME_TYPE_ENUM</a> enumeration used by the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsnametranslate">IADsNameTranslate</a> interface. The
 *     two sets of element formats are not equivalent and are not interchangeable.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsCrackNames as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function. If <i>flags</i> contains
 *     <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_flags">DS_NAME_FLAG_SYNTACTICAL_ONLY</a>, <i>hDS</i> can be
 *     <b>NULL</b>.
 * @param {DS_NAME_FLAGS} flags Contains one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_flags">DS_NAME_FLAGS</a> values used to determine how the name syntax will be cracked.
 * @param {DS_NAME_FORMAT} formatOffered Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_NAME_FORMAT</a> values that identifies the format of the input names.
 * 
 * The <b>DS_LIST_NCS</b> value can also be passed for this parameter. This causes <b>DsCrackNames</b> to return the distinguished names of all naming contexts in the current forest. The <i>formatDesired</i> parameter is ignored. <i>cNames</i> must be at least one and all strings in <i>rpNames</i> must have a length greater than zero characters. The contents of the <i>rpNames</i> strings is ignored.
 * 
 * <div class="alert"><b>Note</b>  <b>DS_LIST_NCS</b> is not defined in a published header file. To use this value, define it in the exact format shown below.</div>
 * <div> </div>
 * 
 * ```cpp
 * @param {DS_NAME_FORMAT} formatDesired Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_NAME_FORMAT</a> values that identifies the format of the output names. The <b>DS_SID_OR_SID_HISTORY_NAME</b> value is not supported.
 * @param {Integer} cNames Contains the number of elements in the <i>rpNames</i> array.
 * @param {Pointer<PWSTR>} rpNames Pointer to an array of pointers to null-terminated strings that contain names to be converted.
 * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppResult Pointer to a <b>PDS_NAME_RESULT</b> value that receives a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure
 *     that contains the converted names. The caller must free this memory, when it is no longer required, by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
 * @returns {Integer} Returns a Win32 error value, an RPC error value, or one of the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dscracknamesw
 * @since windows6.0.6000
 */
export DsCrackNamesW(hDS, flags, formatOffered, formatDesired, cNames, rpNames, ppResult) {
    rpNamesMarshal := rpNames is VarRef ? "ptr*" : "ptr"
    ppResultMarshal := ppResult is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsCrackNamesW", HANDLE, hDS, DS_NAME_FLAGS, flags, DS_NAME_FORMAT, formatOffered, DS_NAME_FORMAT, formatDesired, "uint", cNames, rpNamesMarshal, rpNames, ppResultMarshal, ppResult, UInt32)
    return result
}

/**
 * Converts an array of directory service object names from one format to another. (ANSI)
 * @remarks
 * The success of the name conversion request depends on where the
 *     client is bound. Clients bind to specific instances of the directory service
 *     using some variant of <b>DsBind</b>. If bound to a
 *     global catalog, the scope of the name mapping is the entire forest. If not bound to a global catalog, the scope of the name mapping is the domain not
 *     covered by a global catalog for that domain controller. If not bound to a
 *     global catalog and a name is not found, but the input name unambiguously
 *     identifies its domain and this domain is in the forest, then the return data
 *     identifies the DNS domain name for the domain of interest. Clients are expected
 *     to use this data to bind to the correct domain controller or global
 *     catalog and call <b>DsCrackNames</b> again with the new bind handle.
 * 
 * The return value from <b>DsCrackNames</b> indicates errors such as invalid
 *     parameters or insufficient memory. However, problems in converting individual
 *     names are reported in the <b>status</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_result_itema">DS_NAME_RESULT_ITEM</a> structure returned for each input name.
 * 
 * <div class="alert"><b>Note</b>  Do not confuse the values of the format elements of
 *     the <i>formatOffered</i> parameter used by the
 *     <b>DsCrackNames</b> function with the similarly
 *     named format elements as defined in the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_type_enum">ADS_NAME_TYPE_ENUM</a> enumeration used by the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsnametranslate">IADsNameTranslate</a> interface. The
 *     two sets of element formats are not equivalent and are not interchangeable.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsCrackNames as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function. If <i>flags</i> contains
 *     <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_flags">DS_NAME_FLAG_SYNTACTICAL_ONLY</a>, <i>hDS</i> can be
 *     <b>NULL</b>.
 * @param {DS_NAME_FLAGS} flags Contains one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_flags">DS_NAME_FLAGS</a> values used to determine how the name syntax will be cracked.
 * @param {DS_NAME_FORMAT} formatOffered Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_NAME_FORMAT</a> values that identifies the format of the input names.
 * 
 * The <b>DS_LIST_NCS</b> value can also be passed for this parameter. This causes <b>DsCrackNames</b> to return the distinguished names of all naming contexts in the current forest. The <i>formatDesired</i> parameter is ignored. <i>cNames</i> must be at least one and all strings in <i>rpNames</i> must have a length greater than zero characters. The contents of the <i>rpNames</i> strings is ignored.
 * 
 * <div class="alert"><b>Note</b>  <b>DS_LIST_NCS</b> is not defined in a published header file. To use this value, define it in the exact format shown below.</div>
 * <div> </div>
 * 
 * ```cpp
 * @param {DS_NAME_FORMAT} formatDesired Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_NAME_FORMAT</a> values that identifies the format of the output names. The <b>DS_SID_OR_SID_HISTORY_NAME</b> value is not supported.
 * @param {Integer} cNames Contains the number of elements in the <i>rpNames</i> array.
 * @param {Pointer<PSTR>} rpNames Pointer to an array of pointers to null-terminated strings that contain names to be converted.
 * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppResult Pointer to a <b>PDS_NAME_RESULT</b> value that receives a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure
 *     that contains the converted names. The caller must free this memory, when it is no longer required, by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
 * @returns {Integer} Returns a Win32 error value, an RPC error value, or one of the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dscracknamesa
 * @since windows6.0.6000
 */
export DsCrackNamesA(hDS, flags, formatOffered, formatDesired, cNames, rpNames, ppResult) {
    rpNamesMarshal := rpNames is VarRef ? "ptr*" : "ptr"
    ppResultMarshal := ppResult is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsCrackNamesA", HANDLE, hDS, DS_NAME_FLAGS, flags, DS_NAME_FORMAT, formatOffered, DS_NAME_FORMAT, formatDesired, "uint", cNames, rpNamesMarshal, rpNames, ppResultMarshal, ppResult, UInt32)
    return result
}

/**
 * Frees the memory held by a DS_NAME_RESULT structure. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsFreeNameResult as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<DS_NAME_RESULTW>} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsfreenameresultw
 * @since windows6.0.6000
 */
export DsFreeNameResultW(pResult) {
    DllCall("NTDSAPI.dll\DsFreeNameResultW", DS_NAME_RESULTW.Ptr, pResult)
}

/**
 * Frees the memory held by a DS_NAME_RESULT structure. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsFreeNameResult as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<DS_NAME_RESULTA>} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsfreenameresulta
 * @since windows6.0.6000
 */
export DsFreeNameResultA(pResult) {
    DllCall("NTDSAPI.dll\DsFreeNameResultA", DS_NAME_RESULTA.Ptr, pResult)
}

/**
 * The DsGetSpn function constructs an array of one or more service principal names (SPNs). Each name in the array identifies an instance of a service. These SPNs may be registered with the directory service (DS) using the DsWriteAccountSpn function. (ANSI)
 * @remarks
 * <p class="proch"><b>To create SPNs for multiple instances of a replicated service running on multiple host computers</b>
 * 
 * <ol>
 * <li>Set <i>cInstanceNames</i> to the number of instances.</li>
 * <li>Specify the names of the host computers in the <i>pInstanceNames</i> array.</li>
 * </ol>
 * <p class="proch"><b>To create SPNs for multiple instances of a service running on the same host computer</b>
 * 
 * <ol>
 * <li>Set the <i>cInstanceNames</i> to the number of instances.</li>
 * <li>Set each entry in the <i>pInstanceNames</i> array to the DNS name of the host computer.</li>
 * <li>Use the <i>pInstancePorts</i> parameter to specify an array of unique port numbers for each instance to disambiguate the SPNs.</li>
 * </ol>
 * String parameters cannot include the forward slash  (/), which is used to separate the components of the SPN.
 * 
 * An application with the appropriate privileges, which are usually those of a domain administrator, can call the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dswriteaccountspna">DsWriteAccountSpn</a> function to register one or more SPNs on the user or computer account where the service is running. Clients can then use the SPNs to authenticate the service.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsGetSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {DS_SPN_NAME_TYPE} ServiceType 
 * @param {PSTR} ServiceClass Pointer to a constant null-terminated string that specifies the class of the service; for example, http. Generally, this can be any string that is unique to the service.
 * @param {PSTR} ServiceName Pointer to a constant null-terminated string that specifies the DNS name or distinguished name (DN) of the service. <i>ServiceName</i> is not required for a host-based service. For more information, see the description of the <i>ServiceType</i> parameter for the possible values of <i>ServiceName</i>.
 * @param {Integer} InstancePort Specifies the port number of the service instance. If this value is zero, the SPN does not include a port number.
 * @param {Integer} cInstanceNames Specifies the number of elements in the <i>pInstanceNames</i> and <i>pInstancePorts</i> arrays. If this value is not zero, <i>pInstanceNames</i> must point to an array of <i>cInstanceNames</i> strings, and <i>pInstancePorts</i> can be either <b>NULL</b> or a pointer to an array of <i>cInstanceNames</i> port numbers. If this value is zero, <b>DsGetSpn</b> returns only one SPN in the <i>prpszSpn</i> array and <i>pInstanceNames</i> and <i>pInstancePorts</i> are ignored.
 * @param {Pointer<PSTR>} pInstanceNames Pointer to an array of null-terminated strings that specify extra instance names (not used for host names). This parameter is ignored if <i>cInstanceNames</i> is zero. In that case, the <i>InstanceName</i> component of the SPN defaults to the fully qualified DNS name of the local computer or the NetBIOS name if <b>DS_SPN_NB_HOST</b> or <b>DS_SPN_NB_DOMAIN</b> is specified.
 * @param {Pointer<Integer>} pInstancePorts Pointer to an array of extra instance ports. If this value is non-<b>NULL</b>, it must point to an array of <i>cInstanceNames</i> port numbers. If this value is <b>NULL</b>, the SPNs do not include a port number. This parameter is ignored if <i>cInstanceNames</i> is zero.
 * @param {Pointer<Integer>} pcSpn Pointer to a variable that receives the number of SPNs contained in <i>prpszSpn</i>.
 * @param {Pointer<Pointer<PSTR>>} prpszSpn Pointer to a variable that receives a pointer to an array of SPNs. This array must be freed with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreespnarraya">DsFreeSpnArray</a>.
 * @returns {Integer} If the function returns an array of SPNs, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsgetspna
 * @since windows6.0.6000
 */
export DsGetSpnA(ServiceType, ServiceClass, ServiceName, InstancePort, cInstanceNames, pInstanceNames, pInstancePorts, pcSpn, prpszSpn) {
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName

    pInstanceNamesMarshal := pInstanceNames is VarRef ? "ptr*" : "ptr"
    pInstancePortsMarshal := pInstancePorts is VarRef ? "ushort*" : "ptr"
    pcSpnMarshal := pcSpn is VarRef ? "uint*" : "ptr"
    prpszSpnMarshal := prpszSpn is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsGetSpnA", DS_SPN_NAME_TYPE, ServiceType, "ptr", ServiceClass, "ptr", ServiceName, "ushort", InstancePort, "ushort", cInstanceNames, pInstanceNamesMarshal, pInstanceNames, pInstancePortsMarshal, pInstancePorts, pcSpnMarshal, pcSpn, prpszSpnMarshal, prpszSpn, UInt32)
    return result
}

/**
 * The DsGetSpn function constructs an array of one or more service principal names (SPNs). Each name in the array identifies an instance of a service. These SPNs may be registered with the directory service (DS) using the DsWriteAccountSpn function. (Unicode)
 * @remarks
 * <p class="proch"><b>To create SPNs for multiple instances of a replicated service running on multiple host computers</b>
 * 
 * <ol>
 * <li>Set <i>cInstanceNames</i> to the number of instances.</li>
 * <li>Specify the names of the host computers in the <i>pInstanceNames</i> array.</li>
 * </ol>
 * <p class="proch"><b>To create SPNs for multiple instances of a service running on the same host computer</b>
 * 
 * <ol>
 * <li>Set the <i>cInstanceNames</i> to the number of instances.</li>
 * <li>Set each entry in the <i>pInstanceNames</i> array to the DNS name of the host computer.</li>
 * <li>Use the <i>pInstancePorts</i> parameter to specify an array of unique port numbers for each instance to disambiguate the SPNs.</li>
 * </ol>
 * String parameters cannot include the forward slash  (/), which is used to separate the components of the SPN.
 * 
 * An application with the appropriate privileges, which are usually those of a domain administrator, can call the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dswriteaccountspna">DsWriteAccountSpn</a> function to register one or more SPNs on the user or computer account where the service is running. Clients can then use the SPNs to authenticate the service.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsGetSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {DS_SPN_NAME_TYPE} ServiceType 
 * @param {PWSTR} ServiceClass Pointer to a constant null-terminated string that specifies the class of the service; for example, http. Generally, this can be any string that is unique to the service.
 * @param {PWSTR} ServiceName Pointer to a constant null-terminated string that specifies the DNS name or distinguished name (DN) of the service. <i>ServiceName</i> is not required for a host-based service. For more information, see the description of the <i>ServiceType</i> parameter for the possible values of <i>ServiceName</i>.
 * @param {Integer} InstancePort Specifies the port number of the service instance. If this value is zero, the SPN does not include a port number.
 * @param {Integer} cInstanceNames Specifies the number of elements in the <i>pInstanceNames</i> and <i>pInstancePorts</i> arrays. If this value is zero, <i>pInstanceNames</i> must point to an array of <i>cInstanceNames</i> strings, and <i>pInstancePorts</i> can be either <b>NULL</b> or a pointer to an array of <i>cInstanceNames</i> port numbers. If this value is zero, <b>DsGetSpn</b> returns only one SPN in the <i>prpszSpn</i> array and <i>pInstanceNames</i> and <i>pInstancePorts</i> are ignored.
 * @param {Pointer<PWSTR>} pInstanceNames Pointer to an array of null-terminated strings that specify extra instance names (not used for host names). This parameter is ignored if <i>cInstanceNames</i> is zero. In that case, the <i>InstanceName</i> component of the SPN defaults to the fully qualified DNS name of the local computer or the NetBIOS name if <b>DS_SPN_NB_HOST</b> or <b>DS_SPN_NB_DOMAIN</b> is specified.
 * @param {Pointer<Integer>} pInstancePorts Pointer to an array of extra instance ports. If this value is non-<b>NULL</b>, it must point to an array of <i>cInstanceNames</i> port numbers. If this value is <b>NULL</b>, the SPNs do not include a port number. This parameter is ignored if <i>cInstanceNames</i> is zero.
 * @param {Pointer<Integer>} pcSpn Pointer to a variable that receives the number of SPNs contained in <i>prpszSpn</i>.
 * @param {Pointer<Pointer<PWSTR>>} prpszSpn Pointer to a variable that receives a pointer to an array of SPNs. This array must be freed with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreespnarraya">DsFreeSpnArray</a>.
 * @returns {Integer} If the function returns an array of SPNs, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsgetspnw
 * @since windows6.0.6000
 */
export DsGetSpnW(ServiceType, ServiceClass, ServiceName, InstancePort, cInstanceNames, pInstanceNames, pInstancePorts, pcSpn, prpszSpn) {
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName

    pInstanceNamesMarshal := pInstanceNames is VarRef ? "ptr*" : "ptr"
    pInstancePortsMarshal := pInstancePorts is VarRef ? "ushort*" : "ptr"
    pcSpnMarshal := pcSpn is VarRef ? "uint*" : "ptr"
    prpszSpnMarshal := prpszSpn is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsGetSpnW", DS_SPN_NAME_TYPE, ServiceType, "ptr", ServiceClass, "ptr", ServiceName, "ushort", InstancePort, "ushort", cInstanceNames, pInstanceNamesMarshal, pInstanceNames, pInstancePortsMarshal, pInstancePorts, pcSpnMarshal, pcSpn, prpszSpnMarshal, prpszSpn, UInt32)
    return result
}

/**
 * Frees an array returned from the DsGetSpn function. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsFreeSpnArray as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} cSpn Specifies the number of elements contained in <i>rpszSpn</i>.
 * @param {Pointer<PSTR>} rpszSpn Pointer to an array returned from <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetspna">DsGetSpn</a>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsfreespnarraya
 * @since windows6.0.6000
 */
export DsFreeSpnArrayA(cSpn, rpszSpn) {
    rpszSpnMarshal := rpszSpn is VarRef ? "ptr*" : "ptr"

    DllCall("NTDSAPI.dll\DsFreeSpnArrayA", "uint", cSpn, rpszSpnMarshal, rpszSpn)
}

/**
 * Frees an array returned from the DsGetSpn function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsFreeSpnArray as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} cSpn Specifies the number of elements contained in <i>rpszSpn</i>.
 * @param {Pointer<PWSTR>} rpszSpn Pointer to an array returned from <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetspna">DsGetSpn</a>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsfreespnarrayw
 * @since windows6.0.6000
 */
export DsFreeSpnArrayW(cSpn, rpszSpn) {
    rpszSpnMarshal := rpszSpn is VarRef ? "ptr*" : "ptr"

    DllCall("NTDSAPI.dll\DsFreeSpnArrayW", "uint", cSpn, rpszSpnMarshal, rpszSpn)
}

/**
 * Writes an array of service principal names (SPNs) to the servicePrincipalName attribute of a specified user or computer account object in Active Directory Domain Services. (ANSI)
 * @remarks
 * The <b>DsWriteAccountSpn</b> function registers the SPNs for one or more instances of a service. SPNs are used by clients, in conjunction with a trusted authentication service, to authenticate the service. To protect against security attacks where an application or service fraudulently registers an SPN that identifies some other service, the default DACL on user and computer accounts allows only domain administrators to register SPNs in most cases.
 * 
 * One exception to this rule is that a service running under the LocalSystem account can call <b>DsWriteAccountSpn</b> to register a simple SPN of the form "ServiceClass/Host:Port" if the host specified in the SPN is the DNS or NetBIOS name of the computer on which the service is running.
 * 
 * Another exception is that the default DACL on computer accounts allows callers to register SPNs on themselves, subject to certain constraints.  For example, a computer account can have SPNs relative to its computername, of the form "host/&lt;computername&gt;".  Because the computername is contained in the SPN, the SPN is allowable.
 * 
 * None of the rules above apply if the DSA is configured to allow any SPN to be written. This reduces security, however, so it is not recommended.
 * 
 * SPNs passed to <b>DsWriteAccountSpn</b> are actually added to the <b>Service-Principal-Name</b> attribute of the computer object in <i>pszAccount</i>. This call is made using RPC to the domain controller where the account object is stored so it can securely enforce policy on what SPNs are allowed on the account. Using LDAP to write directly to the SPN property is not allowed; all writes must come through this RPC call. Reads using LDAP are allowed.
 * 
 * Permissions required to set SPNs
 * 
 * To write an arbitrary SPN on an account, the writer requires the "Write ServicePrincipalName"  right, which is not granted by default  to the person who created the account. That person  has the 'Write validated SPN" right(present only on machine accounts).
 * 
 * Below is a summary of rights per user on machine accounts:
 * 
 * <table>
 * <tr>
 * <th>User Type</th>
 * <th>Rights</th>
 * </tr>
 * <tr>
 * <td>Person creating the Account</td>
 * <td>Write validated SPN</td>
 * </tr>
 * <tr>
 * <td>Account Operators</td>
 * <td>Write SPN and Write Validated SPN</td>
 * </tr>
 * <tr>
 * <td>Authenticated Users</td>
 * <td>None</td>
 * </tr>
 * <tr>
 * <td>(self)</td>
 * <td>Write Validated SPN</td>
 * </tr>
 * </table>
 *  
 * 
 * On user accounts there is no "Validated SPN" property or "Write SPN" right.  Rather, the  "Write public information" property set grants the ability to create arbitrary SPNs.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsWriteAccountSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {DS_SPN_WRITE_OP} Operation Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_spn_write_op">DS_SPN_WRITE_OP</a> values that specifies the operation that <b>DsWriteAccountSpn</b> will perform.
 * @param {PSTR} pszAccount Pointer to a constant null-terminated string that specifies the distinguished name of a user or computer object in Active Directory Domain Services. The caller must have write access to the <b>servicePrincipalName</b> property of this object.
 * @param {Integer} cSpn Specifies the number of SPNs in <i>rpszSpn</i>. If this value is zero, and <i>Operation</i> contains <b>DS_SPN_REPLACE_SPN_OP</b>, the function removes all values from the <b>servicePrincipalName</b> attribute of the specified account.
 * @param {Pointer<PSTR>} rpszSpn Pointer to an array of constant null-terminated strings that specify the SPNs to be added to or removed from the  account identified by the <i>pszAccount</i> parameter. The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetspna">DsGetSpn</a> function is used to compose SPNs for a service.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32, RPC or directory service error if unsuccessful.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dswriteaccountspna
 * @since windows6.0.6000
 */
export DsWriteAccountSpnA(hDS, Operation, pszAccount, cSpn, rpszSpn) {
    pszAccount := pszAccount is String ? StrPtr(pszAccount) : pszAccount

    rpszSpnMarshal := rpszSpn is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsWriteAccountSpnA", HANDLE, hDS, DS_SPN_WRITE_OP, Operation, "ptr", pszAccount, "uint", cSpn, rpszSpnMarshal, rpszSpn, UInt32)
    return result
}

/**
 * Writes an array of service principal names (SPNs) to the servicePrincipalName attribute of a specified user or computer account object in Active Directory Domain Services. (Unicode)
 * @remarks
 * The <b>DsWriteAccountSpn</b> function registers the SPNs for one or more instances of a service. SPNs are used by clients, in conjunction with a trusted authentication service, to authenticate the service. To protect against security attacks where an application or service fraudulently registers an SPN that identifies some other service, the default DACL on user and computer accounts allows only domain administrators to register SPNs in most cases.
 * 
 * One exception to this rule is that a service running under the LocalSystem account can call <b>DsWriteAccountSpn</b> to register a simple SPN of the form "ServiceClass/Host:Port" if the host specified in the SPN is the DNS or NetBIOS name of the computer on which the service is running.
 * 
 * Another exception is that the default DACL on computer accounts allows callers to register SPNs on themselves, subject to certain constraints.  For example, a computer account can have SPNs relative to its computername, of the form "host/&lt;computername&gt;".  Because the computername is contained in the SPN, the SPN is allowable.
 * 
 * None of the rules above apply if the DSA is configured to allow any SPN to be written. This reduces security, however, so it is not recommended.
 * 
 * SPNs passed to <b>DsWriteAccountSpn</b> are actually added to the <b>Service-Principal-Name</b> attribute of the computer object in <i>pszAccount</i>. This call is made using RPC to the domain controller where the account object is stored so it can securely enforce policy on what SPNs are allowed on the account. Using LDAP to write directly to the SPN property is not allowed; all writes must come through this RPC call. Reads using LDAP are allowed.
 * 
 * Permissions required to set SPNs
 * 
 * To write an arbitrary SPN on an account, the writer requires the "Write ServicePrincipalName"  right, which is not granted by default  to the person who created the account. That person  has the 'Write validated SPN" right(present only on machine accounts).
 * 
 * Below is a summary of rights per user on machine accounts:
 * 
 * <table>
 * <tr>
 * <th>User Type</th>
 * <th>Rights</th>
 * </tr>
 * <tr>
 * <td>Person creating the Account</td>
 * <td>Write validated SPN</td>
 * </tr>
 * <tr>
 * <td>Account Operators</td>
 * <td>Write SPN and Write Validated SPN</td>
 * </tr>
 * <tr>
 * <td>Authenticated Users</td>
 * <td>None</td>
 * </tr>
 * <tr>
 * <td>(self)</td>
 * <td>Write Validated SPN</td>
 * </tr>
 * </table>
 *  
 * 
 * On user accounts there is no "Validated SPN" property or "Write SPN" right.  Rather, the  "Write public information" property set grants the ability to create arbitrary SPNs.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsWriteAccountSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {DS_SPN_WRITE_OP} Operation Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_spn_write_op">DS_SPN_WRITE_OP</a> values that specifies the operation that <b>DsWriteAccountSpn</b> will perform.
 * @param {PWSTR} pszAccount Pointer to a constant null-terminated string that specifies the distinguished name of a user or computer object in Active Directory Domain Services. The caller must have write access to the <b>servicePrincipalName</b> property of this object.
 * @param {Integer} cSpn Specifies the number of SPNs in <i>rpszSpn</i>. If this value is zero, and <i>Operation</i> contains <b>DS_SPN_REPLACE_SPN_OP</b>, the function removes all values from the <b>servicePrincipalName</b> attribute of the specified account.
 * @param {Pointer<PWSTR>} rpszSpn Pointer to an array of constant null-terminated strings that specify the SPNs to be added to or removed from the  account identified by the <i>pszAccount</i> parameter. The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetspna">DsGetSpn</a> function is used to compose SPNs for a service.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32, RPC or directory service error if unsuccessful.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dswriteaccountspnw
 * @since windows6.0.6000
 */
export DsWriteAccountSpnW(hDS, Operation, pszAccount, cSpn, rpszSpn) {
    pszAccount := pszAccount is String ? StrPtr(pszAccount) : pszAccount

    rpszSpnMarshal := rpszSpn is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsWriteAccountSpnW", HANDLE, hDS, DS_SPN_WRITE_OP, Operation, "ptr", pszAccount, "uint", cSpn, rpszSpnMarshal, rpszSpn, UInt32)
    return result
}

/**
 * Constructs a service principal name (SPN) that identifies a specific server to use for authentication. (Unicode)
 * @remarks
 * When using this function, supply the service class and part of a DNS host name.
 * 
 * This function is a simplified version of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/nf-dsparse-dsmakespna">DsMakeSpn</a> function. The <i>ServiceName</i> is made canonical by resolving through DNS.
 * 
 * GUID-based DNS names are not supported. When constructed, the simplified SPN is as follows:
 * 
 * 
 * ``` syntax
 * ServiceClass / ServiceName / ServiceName
 * ```
 * 
 * The instance name portion (second position) is always set to default. The port and referrer fields are not used.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsClientMakeSpnForTargetServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ServiceClass Pointer to a null-terminated string that contains the class of the service as defined by the service. This can be any string unique to the service.
 * @param {PWSTR} ServiceName Pointer to a null-terminated string that contains the distinguished name service (DNS) host name. This can either be a fully qualified name or an IP address in the Internet standard  format.
 * 
 * Use of an IP address for <i>ServiceName</i> is not recommended because this can create a security issue. Before the SPN is constructed, the IP address must be translated to a computer name through DNS name resolution. It is possible for the DNS name resolution to be spoofed, replacing the  intended computer name with an unauthorized computer name.
 * @param {Pointer<Integer>} pcSpnLength Pointer to a <b>DWORD</b> value that, on entry, contains the size of the <i>pszSpn</i> buffer, in characters. On output, this parameter receives the number of characters copied to the  <i>pszSpn</i> buffer, including the terminating <b>NULL</b>.
 * @param {PWSTR} pszSpn Pointer to a string buffer that receives the SPN.
 * @returns {Integer} This function returns standard Windows error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsclientmakespnfortargetserverw
 * @since windows6.0.6000
 */
export DsClientMakeSpnForTargetServerW(ServiceClass, ServiceName, pcSpnLength, pszSpn) {
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn

    pcSpnLengthMarshal := pcSpnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsClientMakeSpnForTargetServerW", "ptr", ServiceClass, "ptr", ServiceName, pcSpnLengthMarshal, pcSpnLength, "ptr", pszSpn, UInt32)
    return result
}

/**
 * Constructs a service principal name (SPN) that identifies a specific server to use for authentication. (ANSI)
 * @remarks
 * When using this function, supply the service class and part of a DNS host name.
 * 
 * This function is a simplified version of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/nf-dsparse-dsmakespna">DsMakeSpn</a> function. The <i>ServiceName</i> is made canonical by resolving through DNS.
 * 
 * GUID-based DNS names are not supported. When constructed, the simplified SPN is as follows:
 * 
 * 
 * ``` syntax
 * ServiceClass / ServiceName / ServiceName
 * ```
 * 
 * The instance name portion (second position) is always set to default. The port and referrer fields are not used.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsClientMakeSpnForTargetServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ServiceClass Pointer to a null-terminated string that contains the class of the service as defined by the service. This can be any string unique to the service.
 * @param {PSTR} ServiceName Pointer to a null-terminated string that contains the distinguished name service (DNS) host name. This can either be a fully qualified name or an IP address in the Internet standard  format.
 * 
 * Use of an IP address for <i>ServiceName</i> is not recommended because this can create a security issue. Before the SPN is constructed, the IP address must be translated to a computer name through DNS name resolution. It is possible for the DNS name resolution to be spoofed, replacing the  intended computer name with an unauthorized computer name.
 * @param {Pointer<Integer>} pcSpnLength Pointer to a <b>DWORD</b> value that, on entry, contains the size of the <i>pszSpn</i> buffer, in characters. On output, this parameter receives the number of characters copied to the  <i>pszSpn</i> buffer, including the terminating <b>NULL</b>.
 * @param {PSTR} pszSpn Pointer to a string buffer that receives the SPN.
 * @returns {Integer} This function returns standard Windows error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsclientmakespnfortargetservera
 * @since windows6.0.6000
 */
export DsClientMakeSpnForTargetServerA(ServiceClass, ServiceName, pcSpnLength, pszSpn) {
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
    pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn

    pcSpnLengthMarshal := pcSpnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsClientMakeSpnForTargetServerA", "ptr", ServiceClass, "ptr", ServiceName, pcSpnLengthMarshal, pcSpnLength, "ptr", pszSpn, UInt32)
    return result
}

/**
 * The DsServerRegisterSpn function composes two SPNs for a host-based service. (ANSI)
 * @remarks
 * The two SPNs composed by the <b>DsServerRegisterSpn</b> function have the following format:
 * 
 * 
 * ```cpp
 * <ServiceClass>/<host>
 * ```
 * 
 * 
 * In one SPN, the host computer is the fully qualified DNS name of the local computer. In the other SPN, the host component is the NetBIOS name of the local computer.
 * 
 * In most cases, the <b>DsServerRegisterSpn</b> caller must have domain administrator privileges to successfully modify the <b>servicePrincipalName</b> attribute of an account object. The exception to this rule is if the calling thread is running under the LocalSystem account, <b>DsServerRegisterSpn</b> is allowed if the <i>UserObjectDN</i> parameter is either <b>NULL</b> or specifies the distinguished name of the local computer account.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsServerRegisterSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {DS_SPN_WRITE_OP} Operation 
 * @param {PSTR} ServiceClass Pointer to a constant null-terminated string specifying the class of the service. This parameter may be any string unique to that service; either the protocol name (for example, ldap) or the string form of a GUID will work.
 * @param {PSTR} UserObjectDN Pointer to a constant null-terminated string specifying the distinguished name of a user or computer account object to write the SPNs to. If this parameter is <b>NULL</b>, <b>DsServerRegisterSpn</b> writes to the account object of the primary or impersonated user associated with the calling thread. If the thread is running in the security context of the LocalSystem account, the function writes to the account object of the local computer.
 * @returns {Integer} If the function successfully registers one or more SPNs, it returns <b>ERROR_SUCCESS</b>. Modification is performed permissively, so that adding a value that already exists does not return an error.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsserverregisterspna
 * @since windows6.0.6000
 */
export DsServerRegisterSpnA(Operation, ServiceClass, UserObjectDN) {
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    UserObjectDN := UserObjectDN is String ? StrPtr(UserObjectDN) : UserObjectDN

    result := DllCall("NTDSAPI.dll\DsServerRegisterSpnA", DS_SPN_WRITE_OP, Operation, "ptr", ServiceClass, "ptr", UserObjectDN, UInt32)
    return result
}

/**
 * The DsServerRegisterSpn function composes two SPNs for a host-based service. (Unicode)
 * @remarks
 * The two SPNs composed by the <b>DsServerRegisterSpn</b> function have the following format:
 * 
 * 
 * ```cpp
 * <ServiceClass>/<host>
 * ```
 * 
 * 
 * In one SPN, the host computer is the fully qualified DNS name of the local computer. In the other SPN, the host component is the NetBIOS name of the local computer.
 * 
 * In most cases, the <b>DsServerRegisterSpn</b> caller must have domain administrator privileges to successfully modify the <b>servicePrincipalName</b> attribute of an account object. The exception to this rule is if the calling thread is running under the LocalSystem account, <b>DsServerRegisterSpn</b> is allowed if the <i>UserObjectDN</i> parameter is either <b>NULL</b> or specifies the distinguished name of the local computer account.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsServerRegisterSpn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {DS_SPN_WRITE_OP} Operation 
 * @param {PWSTR} ServiceClass Pointer to a constant null-terminated string specifying the class of the service. This parameter may be any string unique to that service; either the protocol name (for example, ldap) or the string form of a GUID will work.
 * @param {PWSTR} UserObjectDN Pointer to a constant null-terminated string specifying the distinguished name of a user or computer account object to write the SPNs to. If this parameter is <b>NULL</b>, <b>DsServerRegisterSpn</b> writes to the account object of the primary or impersonated user associated with the calling thread. If the thread is running in the security context of the LocalSystem account, the function writes to the account object of the local computer.
 * @returns {Integer} If the function successfully registers one or more SPNs, it returns <b>ERROR_SUCCESS</b>. Modification is performed permissively, so that adding a value that already exists does not return an error.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsserverregisterspnw
 * @since windows6.0.6000
 */
export DsServerRegisterSpnW(Operation, ServiceClass, UserObjectDN) {
    ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
    UserObjectDN := UserObjectDN is String ? StrPtr(UserObjectDN) : UserObjectDN

    result := DllCall("NTDSAPI.dll\DsServerRegisterSpnW", DS_SPN_WRITE_OP, Operation, "ptr", ServiceClass, "ptr", UserObjectDN, UInt32)
    return result
}

/**
 * Synchronizes a destination naming context (NC) with one of its sources. (ANSI)
 * @remarks
 * The server that <b>DsReplicaSync</b> executes on is called the destination. The destination naming context is brought up-to-date with respect to a source system, identified by the UUID of the source system NTDS Settings object. The destination system must already be configured so that the source system is one of the systems from which it receives replication data.
 * 
 * <div class="alert"><b>Note</b>  Forcing manual synchronization can prevent the directory service from properly prioritizing replication operations. For example, synchronizing a new user may preempt an urgent synchronization performed to provide access to a recently locked out user or to add a new trust password. If you call this API often, you can flood the network with requests, which can interfere with other replication operations. For this reason, it is strongly recommended that this function be used only for single-use scenarios rather than incorporating it into an application that would use it on a regular basis.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaSync as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name of the destination NC.
 * @param {Pointer<Guid>} pUuidDsaSrc Pointer to the UUID of a source that replicates to the destination NC.
 * @param {Integer} Options 
 * @returns {Integer} If the function performs its operation successfully, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value is one of the standard Win32 API errors.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicasynca
 * @since windows6.0.6000
 */
export DsReplicaSyncA(hDS, NameContext, pUuidDsaSrc, Options) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext

    result := DllCall("NTDSAPI.dll\DsReplicaSyncA", HANDLE, hDS, "ptr", NameContext, Guid.Ptr, pUuidDsaSrc, "uint", Options, UInt32)
    return result
}

/**
 * Synchronizes a destination naming context (NC) with one of its sources. (Unicode)
 * @remarks
 * The server that <b>DsReplicaSync</b> executes on is called the destination. The destination naming context is brought up-to-date with respect to a source system, identified by the UUID of the source system NTDS Settings object. The destination system must already be configured so that the source system is one of the systems from which it receives replication data.
 * 
 * <div class="alert"><b>Note</b>  Forcing manual synchronization can prevent the directory service from properly prioritizing replication operations. For example, synchronizing a new user may preempt an urgent synchronization performed to provide access to a recently locked out user or to add a new trust password. If you call this API often, you can flood the network with requests, which can interfere with other replication operations. For this reason, it is strongly recommended that this function be used only for single-use scenarios rather than incorporating it into an application that would use it on a regular basis.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaSync as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name of the destination NC.
 * @param {Pointer<Guid>} pUuidDsaSrc Pointer to the UUID of a source that replicates to the destination NC.
 * @param {Integer} Options 
 * @returns {Integer} If the function performs its operation successfully, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value is one of the standard Win32 API errors.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicasyncw
 * @since windows6.0.6000
 */
export DsReplicaSyncW(hDS, NameContext, pUuidDsaSrc, Options) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext

    result := DllCall("NTDSAPI.dll\DsReplicaSyncW", HANDLE, hDS, "ptr", NameContext, Guid.Ptr, pUuidDsaSrc, "uint", Options, UInt32)
    return result
}

/**
 * Adds a replication source reference to a destination naming context. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaAdd as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} NameContext The null-terminated string that specifies the distinguished name (DN) of the destination naming context (NC)  for which to add the replica. The destination NC record must exist locally as either an object, instantiated or not, or a reference phantom, for example, a phantom with a GUID.
 * @param {PSTR} SourceDsaDn The null-terminated string that specifies the DN of the <b>NTDS-DSA</b> object for the source directory system agent. This parameter is required if <i>Options</i> includes <b>DS_REPADD_ASYNCHRONOUS_REPLICA</b>; otherwise, it is ignored.
 * @param {PSTR} TransportDn The null-terminated string that specifies the DN of the <b>interSiteTransport</b> object that represents the transport used for communication with the source server. This parameter is required if <i>Options</i> includes <b>DS_REPADD_INTERSITE_MESSAGING</b>; otherwise, it is ignored.
 * @param {PSTR} SourceDsaAddress The null-terminated string that specifies the transport-specific address of the source DSA. This source server is identified by a string name, not by its UUID. A string name appropriate for <i>SourceDsaAddress</i> is usually a DNS name based on a GUID, where the GUID part of the name is the GUID of the <b>NTDS-DSA</b> object for the source server.
 * @param {Pointer<SCHEDULE>} pSchedule Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure that contains the  replication schedule data for the replication source. This parameter is optional and can be <b>NULL</b> if not used.
 * @param {Integer} Options 
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value can be one of the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicaadda
 * @since windows6.0.6000
 */
export DsReplicaAddA(hDS, NameContext, SourceDsaDn, TransportDn, SourceDsaAddress, pSchedule, Options) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
    SourceDsaDn := SourceDsaDn is String ? StrPtr(SourceDsaDn) : SourceDsaDn
    TransportDn := TransportDn is String ? StrPtr(TransportDn) : TransportDn
    SourceDsaAddress := SourceDsaAddress is String ? StrPtr(SourceDsaAddress) : SourceDsaAddress

    result := DllCall("NTDSAPI.dll\DsReplicaAddA", HANDLE, hDS, "ptr", NameContext, "ptr", SourceDsaDn, "ptr", TransportDn, "ptr", SourceDsaAddress, SCHEDULE.Ptr, pSchedule, "uint", Options, UInt32)
    return result
}

/**
 * Adds a replication source reference to a destination naming context. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaAdd as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} NameContext The null-terminated string that specifies the distinguished name (DN) of the destination naming context (NC)  for which to add the replica. The destination NC record must exist locally as either an object, instantiated or not, or a reference phantom, for example, a phantom with a GUID.
 * @param {PWSTR} SourceDsaDn The null-terminated string that specifies the DN of the <b>NTDS-DSA</b> object for the source directory system agent. This parameter is required if <i>Options</i> includes <b>DS_REPADD_ASYNCHRONOUS_REPLICA</b>; otherwise, it is ignored.
 * @param {PWSTR} TransportDn The null-terminated string that specifies the DN of the <b>interSiteTransport</b> object that represents the transport used for communication with the source server. This parameter is required if <i>Options</i> includes <b>DS_REPADD_INTERSITE_MESSAGING</b>; otherwise, it is ignored.
 * @param {PWSTR} SourceDsaAddress The null-terminated string that specifies the transport-specific address of the source DSA. This source server is identified by a string name, not by its UUID. A string name appropriate for <i>SourceDsaAddress</i> is usually a DNS name based on a GUID, where the GUID part of the name is the GUID of the <b>NTDS-DSA</b> object for the source server.
 * @param {Pointer<SCHEDULE>} pSchedule Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure that contains the  replication schedule data for the replication source. This parameter is optional and can be <b>NULL</b> if not used.
 * @param {Integer} Options 
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value can be one of the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicaaddw
 * @since windows6.0.6000
 */
export DsReplicaAddW(hDS, NameContext, SourceDsaDn, TransportDn, SourceDsaAddress, pSchedule, Options) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
    SourceDsaDn := SourceDsaDn is String ? StrPtr(SourceDsaDn) : SourceDsaDn
    TransportDn := TransportDn is String ? StrPtr(TransportDn) : TransportDn
    SourceDsaAddress := SourceDsaAddress is String ? StrPtr(SourceDsaAddress) : SourceDsaAddress

    result := DllCall("NTDSAPI.dll\DsReplicaAddW", HANDLE, hDS, "ptr", NameContext, "ptr", SourceDsaDn, "ptr", TransportDn, "ptr", SourceDsaAddress, SCHEDULE.Ptr, pSchedule, "uint", Options, UInt32)
    return result
}

/**
 * Removes a replication source reference from a destination naming context (NC). (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaDel as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name (DN) of the destination NC from which to remove the replica. The destination NC record must exist locally as either an object, instantiated or not, or a reference phantom, for example, a phantom with a GUID.
 * @param {PSTR} DsaSrc Pointer to a constant null-terminated Unicode string that specifies the transport-specific address of the source directory system agent (DSA). This source server is identified by a string name, not by its <b>UUID</b>. A string name appropriate for <i>DsaSrc</i> is usually a DNS name that is based on a <b>GUID</b>, where the <b>GUID</b> part of the name is the <b>GUID</b> of the nTDSDSA object for the source server.
 * @param {Integer} Options 
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value is a standard Win32 API error or <b>ERROR_INVALID_PARAMETER</b> if a parameter is invalid.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicadela
 * @since windows6.0.6000
 */
export DsReplicaDelA(hDS, NameContext, DsaSrc, Options) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
    DsaSrc := DsaSrc is String ? StrPtr(DsaSrc) : DsaSrc

    result := DllCall("NTDSAPI.dll\DsReplicaDelA", HANDLE, hDS, "ptr", NameContext, "ptr", DsaSrc, "uint", Options, UInt32)
    return result
}

/**
 * Removes a replication source reference from a destination naming context (NC). (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaDel as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name (DN) of the destination NC from which to remove the replica. The destination NC record must exist locally as either an object, instantiated or not, or a reference phantom, for example, a phantom with a GUID.
 * @param {PWSTR} DsaSrc Pointer to a constant null-terminated Unicode string that specifies the transport-specific address of the source directory system agent (DSA). This source server is identified by a string name, not by its <b>UUID</b>. A string name appropriate for <i>DsaSrc</i> is usually a DNS name that is based on a <b>GUID</b>, where the <b>GUID</b> part of the name is the <b>GUID</b> of the nTDSDSA object for the source server.
 * @param {Integer} Options 
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value is a standard Win32 API error or <b>ERROR_INVALID_PARAMETER</b> if a parameter is invalid.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicadelw
 * @since windows6.0.6000
 */
export DsReplicaDelW(hDS, NameContext, DsaSrc, Options) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
    DsaSrc := DsaSrc is String ? StrPtr(DsaSrc) : DsaSrc

    result := DllCall("NTDSAPI.dll\DsReplicaDelW", HANDLE, hDS, "ptr", NameContext, "ptr", DsaSrc, "uint", Options, UInt32)
    return result
}

/**
 * Modifies an existing replication source reference for a destination naming context. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaModify as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name (DN) of the destination naming context (NC).
 * @param {Pointer<Guid>} pUuidSourceDsa Pointer to the UUID of the source directory system agent (DSA). This parameter may be null if <i>ModifyFields</i> does not include <b>DS_REPMOD_UPDATE_ADDRESS</b> and <i>SourceDsaAddress</i> is not <b>NULL</b>.
 * @param {PSTR} SourceDsaAddress Pointer to a constant null-terminated Unicode string that specifies the transport-specific address of the source DSA. This parameter is ignored if <i>pUuidSourceDsa</i> is not <b>NULL</b> and <i>ModifyFields</i> does not include <b>DS_REPMOD_UPDATE_ADDRESS</b>.
 * @param {Pointer<SCHEDULE>} pSchedule Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure that contains the  replication schedule data for the replication source. This parameter is optional and can be <b>NULL</b> if not used. This parameter is required if <i>ModifyFields</i> contains the  <b>DS_REPMOD_UPDATE_SCHEDULE</b> flag.
 * @param {Integer} ModifyFields 
 * @param {Integer} Options 
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value can be one of the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicamodifya
 * @since windows6.0.6000
 */
export DsReplicaModifyA(hDS, NameContext, pUuidSourceDsa, SourceDsaAddress, pSchedule, ModifyFields, Options) {
    static TransportDn := 0, ReplicaFlags := 0 ;Reserved parameters must always be NULL

    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
    SourceDsaAddress := SourceDsaAddress is String ? StrPtr(SourceDsaAddress) : SourceDsaAddress

    result := DllCall("NTDSAPI.dll\DsReplicaModifyA", HANDLE, hDS, "ptr", NameContext, Guid.Ptr, pUuidSourceDsa, "ptr", TransportDn, "ptr", SourceDsaAddress, SCHEDULE.Ptr, pSchedule, "uint", ReplicaFlags, "uint", ModifyFields, "uint", Options, UInt32)
    return result
}

/**
 * Modifies an existing replication source reference for a destination naming context. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaModify as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name (DN) of the destination naming context (NC).
 * @param {Pointer<Guid>} pUuidSourceDsa Pointer to the UUID of the source directory system agent (DSA). This parameter may be null if <i>ModifyFields</i> does not include <b>DS_REPMOD_UPDATE_ADDRESS</b> and <i>SourceDsaAddress</i> is not <b>NULL</b>.
 * @param {PWSTR} SourceDsaAddress Pointer to a constant null-terminated Unicode string that specifies the transport-specific address of the source DSA. This parameter is ignored if <i>pUuidSourceDsa</i> is not <b>NULL</b> and <i>ModifyFields</i> does not include <b>DS_REPMOD_UPDATE_ADDRESS</b>.
 * @param {Pointer<SCHEDULE>} pSchedule Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure that contains the  replication schedule data for the replication source. This parameter is optional and can be <b>NULL</b> if not used. This parameter is required if <i>ModifyFields</i> contains the  <b>DS_REPMOD_UPDATE_SCHEDULE</b> flag.
 * @param {Integer} ReplicaFlags This parameter is used to control replication behavior and can take the following values.
 * @param {Integer} ModifyFields 
 * @param {Integer} Options 
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value can be one of the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicamodifyw
 * @since windows6.0.6000
 */
export DsReplicaModifyW(hDS, NameContext, pUuidSourceDsa, SourceDsaAddress, pSchedule, ReplicaFlags, ModifyFields, Options) {
    static TransportDn := 0 ;Reserved parameters must always be NULL

    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
    SourceDsaAddress := SourceDsaAddress is String ? StrPtr(SourceDsaAddress) : SourceDsaAddress

    result := DllCall("NTDSAPI.dll\DsReplicaModifyW", HANDLE, hDS, "ptr", NameContext, Guid.Ptr, pUuidSourceDsa, "ptr", TransportDn, "ptr", SourceDsaAddress, SCHEDULE.Ptr, pSchedule, "uint", ReplicaFlags, "uint", ModifyFields, "uint", Options, UInt32)
    return result
}

/**
 * Adds or removes a replication reference for a destination from a source naming context. (ANSI)
 * @remarks
 * If both <b>DS_REPUPD_ADD_REFERENCE</b> and <b>DS_REPUPD_DELETE_REFERENCE</b> are set in the <i>Options</i> parameter, a reference to the destination is added if one does not already exist on the server. If a reference to the destination already exists, the reference is updated.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaUpdateRefs as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name of the source naming context.
 * @param {PSTR} DsaDest Pointer to a constant null-terminated string that specifies the transport-specific address of the destination directory system agent.
 * @param {Pointer<Guid>} pUuidDsaDest Pointer to a <b>UUID</b> value that contains the destination directory system agent.
 * @param {Integer} Options 
 * @returns {Integer} If the function succeeds,  <b>ERROR_SUCCESS</b> is returned.
 * 
 * If the function fails, the return value can be one of the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicaupdaterefsa
 * @since windows6.0.6000
 */
export DsReplicaUpdateRefsA(hDS, NameContext, DsaDest, pUuidDsaDest, Options) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
    DsaDest := DsaDest is String ? StrPtr(DsaDest) : DsaDest

    result := DllCall("NTDSAPI.dll\DsReplicaUpdateRefsA", HANDLE, hDS, "ptr", NameContext, "ptr", DsaDest, Guid.Ptr, pUuidDsaDest, "uint", Options, UInt32)
    return result
}

/**
 * Adds or removes a replication reference for a destination from a source naming context. (Unicode)
 * @remarks
 * If both <b>DS_REPUPD_ADD_REFERENCE</b> and <b>DS_REPUPD_DELETE_REFERENCE</b> are set in the <i>Options</i> parameter, a reference to the destination is added if one does not already exist on the server. If a reference to the destination already exists, the reference is updated.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaUpdateRefs as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name of the source naming context.
 * @param {PWSTR} DsaDest Pointer to a constant null-terminated string that specifies the transport-specific address of the destination directory system agent.
 * @param {Pointer<Guid>} pUuidDsaDest Pointer to a <b>UUID</b> value that contains the destination directory system agent.
 * @param {Integer} Options 
 * @returns {Integer} If the function succeeds,  <b>ERROR_SUCCESS</b> is returned.
 * 
 * If the function fails, the return value can be one of the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicaupdaterefsw
 * @since windows6.0.6000
 */
export DsReplicaUpdateRefsW(hDS, NameContext, DsaDest, pUuidDsaDest, Options) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
    DsaDest := DsaDest is String ? StrPtr(DsaDest) : DsaDest

    result := DllCall("NTDSAPI.dll\DsReplicaUpdateRefsW", HANDLE, hDS, "ptr", NameContext, "ptr", DsaDest, Guid.Ptr, pUuidDsaDest, "uint", Options, UInt32)
    return result
}

/**
 * Synchronizes a server with all other servers, using transitive replication, as necessary. (ANSI)
 * @remarks
 * The <b>DsReplicaSyncAll</b> function attempts to bind to all servers before generating a topology to synchronize from. If a server cannot be contacted, the function excludes that server from the topology and attempts to work around it. Setting the <b>DS_REPSYNCALL_SKIP_INITIAL_CHECK</b> flag in <i>ulFlags</i> bypasses the initial binding.
 * 
 * If a server cannot be contacted, the <b>DsReplicaSyncAll</b> function attempts to route around it and replicate from as many servers as possible, unless <b>DS_REPSYNCALL_ABORT_IF_SERVER_UNAVAILABLE</b> is set in <i>ulFlags</i>.
 * 
 * The <b>DsReplicaSyncAll</b> function can use the callback function pointed to by <i>pFnCallBack</i> to keep an end user informed about the current status of the replication. Execution of the <b>DsReplicaSyncAll</b> function pauses when it calls the function pointed to by <i>pFnCallBack</i>. If the return value from the callback function is <b>TRUE</b>, replication continues; otherwise, the <b>DsReplicaSyncAll</b> function terminates replication.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaSyncAll as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} pszNameContext Pointer to a null-terminated string that specifies the distinguished name of the naming context to synchronize. The <i>pszNameContext</i> parameter is optional; if its value is <b>NULL</b>, the configuration naming context is replicated.
 * @param {Integer} ulFlags 
 * @param {Pointer} _pFnCallBack Pointer to an application-defined <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms677968(v=vs.85)">SyncUpdateProc</a> function called by the <b>DsReplicaSyncAll</b> function when it encounters an error, initiates synchronization of two servers, completes synchronization of two servers, or finishes synchronization of all the servers in the site.
 * @param {Pointer<Void>} pCallbackData Pointer to application-defined data passed as the first argument of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms677968(v=vs.85)">SyncUpdateProc</a> callback function pointed to by the <i>pFnCallBack</i> parameter.
 * @param {Pointer<Pointer<Pointer<DS_REPSYNCALL_ERRINFOA>>>} pErrors A NULL-terminated array of pointers to  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_errinfoa">DS_REPSYNCALL_ERRINFO</a> structures that contain errors that occurred during synchronization. The memory used to hold both the array of pointers and the MsCS\mscs\clusctl_resource_type_get_private_property_fmts.xml data is allocated as a single block of memory and should be freed when no longer required  by a single call to <b>LocalFree</b> with the pointer value returned in <i>pErrors</i> used as the argument.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value is as follows.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicasyncalla
 * @since windows6.0.6000
 */
export DsReplicaSyncAllA(hDS, pszNameContext, ulFlags, _pFnCallBack, pCallbackData, pErrors) {
    pszNameContext := pszNameContext is String ? StrPtr(pszNameContext) : pszNameContext

    pCallbackDataMarshal := pCallbackData is VarRef ? "ptr" : "ptr"
    pErrorsMarshal := pErrors is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsReplicaSyncAllA", HANDLE, hDS, "ptr", pszNameContext, "uint", ulFlags, "ptr", _pFnCallBack, pCallbackDataMarshal, pCallbackData, pErrorsMarshal, pErrors, UInt32)
    return result
}

/**
 * Synchronizes a server with all other servers, using transitive replication, as necessary. (Unicode)
 * @remarks
 * The <b>DsReplicaSyncAll</b> function attempts to bind to all servers before generating a topology to synchronize from. If a server cannot be contacted, the function excludes that server from the topology and attempts to work around it. Setting the <b>DS_REPSYNCALL_SKIP_INITIAL_CHECK</b> flag in <i>ulFlags</i> bypasses the initial binding.
 * 
 * If a server cannot be contacted, the <b>DsReplicaSyncAll</b> function attempts to route around it and replicate from as many servers as possible, unless <b>DS_REPSYNCALL_ABORT_IF_SERVER_UNAVAILABLE</b> is set in <i>ulFlags</i>.
 * 
 * The <b>DsReplicaSyncAll</b> function can use the callback function pointed to by <i>pFnCallBack</i> to keep an end user informed about the current status of the replication. Execution of the <b>DsReplicaSyncAll</b> function pauses when it calls the function pointed to by <i>pFnCallBack</i>. If the return value from the callback function is <b>TRUE</b>, replication continues; otherwise, the <b>DsReplicaSyncAll</b> function terminates replication.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaSyncAll as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} pszNameContext Pointer to a null-terminated string that specifies the distinguished name of the naming context to synchronize. The <i>pszNameContext</i> parameter is optional; if its value is <b>NULL</b>, the configuration naming context is replicated.
 * @param {Integer} ulFlags 
 * @param {Pointer} _pFnCallBack Pointer to an application-defined <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms677968(v=vs.85)">SyncUpdateProc</a> function called by the <b>DsReplicaSyncAll</b> function when it encounters an error, initiates synchronization of two servers, completes synchronization of two servers, or finishes synchronization of all the servers in the site.
 * @param {Pointer<Void>} pCallbackData Pointer to application-defined data passed as the first argument of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms677968(v=vs.85)">SyncUpdateProc</a> callback function pointed to by the <i>pFnCallBack</i> parameter.
 * @param {Pointer<Pointer<Pointer<DS_REPSYNCALL_ERRINFOW>>>} pErrors A NULL-terminated array of pointers to  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_errinfoa">DS_REPSYNCALL_ERRINFO</a> structures that contain errors that occurred during synchronization. The memory used to hold both the array of pointers and the MsCS\mscs\clusctl_resource_type_get_private_property_fmts.xml data is allocated as a single block of memory and should be freed when no longer required  by a single call to <b>LocalFree</b> with the pointer value returned in <i>pErrors</i> used as the argument.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value is as follows.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicasyncallw
 * @since windows6.0.6000
 */
export DsReplicaSyncAllW(hDS, pszNameContext, ulFlags, _pFnCallBack, pCallbackData, pErrors) {
    pszNameContext := pszNameContext is String ? StrPtr(pszNameContext) : pszNameContext

    pCallbackDataMarshal := pCallbackData is VarRef ? "ptr" : "ptr"
    pErrorsMarshal := pErrors is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsReplicaSyncAllW", HANDLE, hDS, "ptr", pszNameContext, "uint", ulFlags, "ptr", _pFnCallBack, pCallbackDataMarshal, pCallbackData, pErrorsMarshal, pErrors, UInt32)
    return result
}

/**
 * The DsRemoveDsServer function removes all traces of a directory service agent (DSA) from the global area of the directory service. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsRemoveDsServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} ServerDN Pointer to a null-terminated string that specifies the fully qualified distinguished name of the domain controller to remove.
 * @param {PWSTR} DomainDN Pointer to a null-terminated string that specifies a domain hosted by <i>ServerDN</i>. If this parameter is <b>NULL</b>, no verification is performed to ensure that <i>ServerDN</i> is the last domain controller in <i>DomainDN</i>.
 * @param {Pointer<BOOL>} fLastDcInDomain Pointer to a Boolean value that receives <b>TRUE</b> if <i>ServerDN</i> is the last DC in <i>DomainDN</i> or <b>FALSE</b> otherwise. This parameter receives <b>FALSE</b> if <i>DomainDN</i> is <b>NULL</b>.
 * @param {BOOL} fCommit Contains a Boolean value that specifies if the domain controller should actually be removed. If this parameter is nonzero, <i>ServerDN</i> is removed. If this parameter is zero, the existence of <i>ServerDN</i> is checked and <i>fLastDcInDomain</i> is written, but the domain controller is not removed.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful  or a Win32 or RPC error code if unsuccessful. Possible error codes include the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsremovedsserverw
 * @since windows6.0.6000
 */
export DsRemoveDsServerW(hDs, ServerDN, DomainDN, fLastDcInDomain, fCommit) {
    ServerDN := ServerDN is String ? StrPtr(ServerDN) : ServerDN
    DomainDN := DomainDN is String ? StrPtr(DomainDN) : DomainDN

    fLastDcInDomainMarshal := fLastDcInDomain is VarRef ? "int*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsRemoveDsServerW", HANDLE, hDs, "ptr", ServerDN, "ptr", DomainDN, fLastDcInDomainMarshal, fLastDcInDomain, BOOL, fCommit, UInt32)
    return result
}

/**
 * The DsRemoveDsServer function removes all traces of a directory service agent (DSA) from the global area of the directory service. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsRemoveDsServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} ServerDN Pointer to a null-terminated string that specifies the fully qualified distinguished name of the domain controller to remove.
 * @param {PSTR} DomainDN Pointer to a null-terminated string that specifies a domain hosted by <i>ServerDN</i>. If this parameter is <b>NULL</b>, no verification is performed to ensure that <i>ServerDN</i> is the last domain controller in <i>DomainDN</i>.
 * @param {Pointer<BOOL>} fLastDcInDomain Pointer to a Boolean value that receives <b>TRUE</b> if <i>ServerDN</i> is the last DC in <i>DomainDN</i> or <b>FALSE</b> otherwise. This parameter receives <b>FALSE</b> if <i>DomainDN</i> is <b>NULL</b>.
 * @param {BOOL} fCommit Contains a Boolean value that specifies if the domain controller should actually be removed. If this parameter is nonzero, <i>ServerDN</i> is removed. If this parameter is zero, the existence of <i>ServerDN</i> is checked and <i>fLastDcInDomain</i> is written, but the domain controller is not removed.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful  or a Win32 or RPC error code if unsuccessful. Possible error codes include the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsremovedsservera
 * @since windows6.0.6000
 */
export DsRemoveDsServerA(hDs, ServerDN, DomainDN, fLastDcInDomain, fCommit) {
    ServerDN := ServerDN is String ? StrPtr(ServerDN) : ServerDN
    DomainDN := DomainDN is String ? StrPtr(DomainDN) : DomainDN

    fLastDcInDomainMarshal := fLastDcInDomain is VarRef ? "int*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsRemoveDsServerA", HANDLE, hDs, "ptr", ServerDN, "ptr", DomainDN, fLastDcInDomainMarshal, fLastDcInDomain, BOOL, fCommit, UInt32)
    return result
}

/**
 * Removes all traces of a domain naming context from the global area of the directory service. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsRemoveDsDomain as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} DomainDN Pointer to a null-terminated string that specifies the distinguished name of the naming context to remove from the directory service.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful  or a Win32 or RPC error code if unsuccessful. Possible error codes include the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsremovedsdomainw
 * @since windows6.0.6000
 */
export DsRemoveDsDomainW(hDs, DomainDN) {
    DomainDN := DomainDN is String ? StrPtr(DomainDN) : DomainDN

    result := DllCall("NTDSAPI.dll\DsRemoveDsDomainW", HANDLE, hDs, "ptr", DomainDN, UInt32)
    return result
}

/**
 * Removes all traces of a domain naming context from the global area of the directory service. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsRemoveDsDomain as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} DomainDN Pointer to a null-terminated string that specifies the distinguished name of the naming context to remove from the directory service.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful  or a Win32 or RPC error code if unsuccessful. Possible error codes include the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsremovedsdomaina
 * @since windows6.0.6000
 */
export DsRemoveDsDomainA(hDs, DomainDN) {
    DomainDN := DomainDN is String ? StrPtr(DomainDN) : DomainDN

    result := DllCall("NTDSAPI.dll\DsRemoveDsDomainA", HANDLE, hDs, "ptr", DomainDN, UInt32)
    return result
}

/**
 * Lists all the sites in the enterprise forest. (ANSI)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListSites as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppSites Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of sites in the enterprise. The site name is returned in the distinguished name (DN) format. The returned structure must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
 * @returns {Integer} If the function returns a list of sites, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistsitesa
 * @since windows6.0.6000
 */
export DsListSitesA(hDs, ppSites) {
    ppSitesMarshal := ppSites is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListSitesA", HANDLE, hDs, ppSitesMarshal, ppSites, UInt32)
    return result
}

/**
 * Lists all the sites in the enterprise forest. (Unicode)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListSites as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppSites Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of sites in the enterprise. The site name is returned in the distinguished name (DN) format. The returned structure must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
 * @returns {Integer} If the function returns a list of sites, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistsitesw
 * @since windows6.0.6000
 */
export DsListSitesW(hDs, ppSites) {
    ppSitesMarshal := ppSites is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListSitesW", HANDLE, hDs, ppSitesMarshal, ppSites, UInt32)
    return result
}

/**
 * Lists all the servers in a site. (ANSI)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListServersInSite as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} site Pointer to a null-terminated string that specifies the site name. The site name uses a distinguished name format. It is taken from the list of sites returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppServers Pointer to a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of servers in the site. The returned structure must be freed using 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
 * @returns {Integer} If the function returns a list of servers, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistserversinsitea
 * @since windows6.0.6000
 */
export DsListServersInSiteA(hDs, site, ppServers) {
    site := site is String ? StrPtr(site) : site

    ppServersMarshal := ppServers is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListServersInSiteA", HANDLE, hDs, "ptr", site, ppServersMarshal, ppServers, UInt32)
    return result
}

/**
 * Lists all the servers in a site. (Unicode)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListServersInSite as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} site Pointer to a null-terminated string that specifies the site name. The site name uses a distinguished name format. It is taken from the list of sites returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppServers Pointer to a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of servers in the site. The returned structure must be freed using 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
 * @returns {Integer} If the function returns a list of servers, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistserversinsitew
 * @since windows6.0.6000
 */
export DsListServersInSiteW(hDs, site, ppServers) {
    site := site is String ? StrPtr(site) : site

    ppServersMarshal := ppServers is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListServersInSiteW", HANDLE, hDs, "ptr", site, ppServersMarshal, ppServers, UInt32)
    return result
}

/**
 * Lists all the domains in a site. (ANSI)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListDomainsInSite as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} site Pointer to a null-terminated string that specifies the site name. This string is taken from the list of site names returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppDomains Pointer to a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of domains in the site. To free the returned structure, call 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
 * @returns {Integer} If the function returns a list of domains, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistdomainsinsitea
 * @since windows6.0.6000
 */
export DsListDomainsInSiteA(hDs, site, ppDomains) {
    site := site is String ? StrPtr(site) : site

    ppDomainsMarshal := ppDomains is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListDomainsInSiteA", HANDLE, hDs, "ptr", site, ppDomainsMarshal, ppDomains, UInt32)
    return result
}

/**
 * Lists all the domains in a site. (Unicode)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListDomainsInSite as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} site Pointer to a null-terminated string that specifies the site name. This string is taken from the list of site names returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppDomains Pointer to a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of domains in the site. To free the returned structure, call 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
 * @returns {Integer} If the function returns a list of domains, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistdomainsinsitew
 * @since windows6.0.6000
 */
export DsListDomainsInSiteW(hDs, site, ppDomains) {
    site := site is String ? StrPtr(site) : site

    ppDomainsMarshal := ppDomains is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListDomainsInSiteW", HANDLE, hDs, "ptr", site, ppDomainsMarshal, ppDomains, UInt32)
    return result
}

/**
 * Lists all the servers in a domain in a site. (ANSI)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListServersForDomainInSite as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} domain Pointer to a null-terminated string that specifies the domain name. This string must be the same as one of the strings returned by <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistdomainsinsitea">DsListDomainsInSite</a> function.
 * @param {PSTR} site Pointer to a null-terminated string that specifies the site name. This string is taken from the list of site names returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppServers Pointer to a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of servers in the domain. The returned structure must be freed using 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
 * @returns {Integer} If the function returns a list of servers, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistserversfordomaininsitea
 * @since windows6.0.6000
 */
export DsListServersForDomainInSiteA(hDs, domain, site, ppServers) {
    domain := domain is String ? StrPtr(domain) : domain
    site := site is String ? StrPtr(site) : site

    ppServersMarshal := ppServers is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListServersForDomainInSiteA", HANDLE, hDs, "ptr", domain, "ptr", site, ppServersMarshal, ppServers, UInt32)
    return result
}

/**
 * Lists all the servers in a domain in a site. (Unicode)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListServersForDomainInSite as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} domain Pointer to a null-terminated string that specifies the domain name. This string must be the same as one of the strings returned by <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistdomainsinsitea">DsListDomainsInSite</a> function.
 * @param {PWSTR} site Pointer to a null-terminated string that specifies the site name. This string is taken from the list of site names returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppServers Pointer to a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of servers in the domain. The returned structure must be freed using 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
 * @returns {Integer} If the function returns a list of servers, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistserversfordomaininsitew
 * @since windows6.0.6000
 */
export DsListServersForDomainInSiteW(hDs, domain, site, ppServers) {
    domain := domain is String ? StrPtr(domain) : domain
    site := site is String ? StrPtr(site) : site

    ppServersMarshal := ppServers is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListServersForDomainInSiteW", HANDLE, hDs, "ptr", domain, "ptr", site, ppServersMarshal, ppServers, UInt32)
    return result
}

/**
 * The DsListInfoForServer function lists miscellaneous data for a server. (ANSI)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListInfoForServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} server Pointer to a null-terminated string that specifies the server name. This name must be the same as one of the strings returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistserversfordomaininsitea">DsListServersForDomainInSite</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistserversinsitea">DsListServersInSite</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppInfo Pointer to a variable that receives a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that contains the server data. The returned structure must be deallocated using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
 * 
 * The indexes of the array in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure indicate what data are contained by each array element. The following constants may be used to specify the desired index for a particular piece of data.
 * @returns {Integer} If the function returns server data, the return value is <b>NO_ERROR</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistinfoforservera
 * @since windows6.0.6000
 */
export DsListInfoForServerA(hDs, server, ppInfo) {
    server := server is String ? StrPtr(server) : server

    ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListInfoForServerA", HANDLE, hDs, "ptr", server, ppInfoMarshal, ppInfo, UInt32)
    return result
}

/**
 * The DsListInfoForServer function lists miscellaneous data for a server. (Unicode)
 * @remarks
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListInfoForServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} server Pointer to a null-terminated string that specifies the server name. This name must be the same as one of the strings returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistserversfordomaininsitea">DsListServersForDomainInSite</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistserversinsitea">DsListServersInSite</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppInfo Pointer to a variable that receives a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that contains the server data. The returned structure must be deallocated using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
 * 
 * The indexes of the array in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure indicate what data are contained by each array element. The following constants may be used to specify the desired index for a particular piece of data.
 * @returns {Integer} If the function returns server data, the return value is <b>NO_ERROR</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistinfoforserverw
 * @since windows6.0.6000
 */
export DsListInfoForServerW(hDs, server, ppInfo) {
    server := server is String ? StrPtr(server) : server

    ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListInfoForServerW", HANDLE, hDs, "ptr", server, ppInfoMarshal, ppInfo, UInt32)
    return result
}

/**
 * The DsListRoles function lists roles recognized by the server. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListRoles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppRoles Pointer to a variable that receives a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure containing the roles the server recognizes. The returned structure must be deallocated using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
 * 
 * The indexes of the array in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure indicate what data are contained by each array element. The following constants may be used to specify the desired index for a particular piece of data.
 * @returns {Integer} If the function returns a list of roles, the return value is <b>NO_ERROR</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistrolesa
 * @since windows6.0.6000
 */
export DsListRolesA(hDs, ppRoles) {
    ppRolesMarshal := ppRoles is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListRolesA", HANDLE, hDs, ppRolesMarshal, ppRoles, UInt32)
    return result
}

/**
 * The DsListRoles function lists roles recognized by the server. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsListRoles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppRoles Pointer to a variable that receives a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure containing the roles the server recognizes. The returned structure must be deallocated using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
 * 
 * The indexes of the array in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure indicate what data are contained by each array element. The following constants may be used to specify the desired index for a particular piece of data.
 * @returns {Integer} If the function returns a list of roles, the return value is <b>NO_ERROR</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * Individual name conversion errors are reported in the returned <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dslistrolesw
 * @since windows6.0.6000
 */
export DsListRolesW(hDs, ppRoles) {
    ppRolesMarshal := ppRoles is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsListRolesW", HANDLE, hDs, ppRolesMarshal, ppRoles, UInt32)
    return result
}

/**
 * Gets the communication cost between one site and one or more other sites. (Unicode)
 * @remarks
 * The cost values obtained by this function are only used to compare and have no meaning by themselves. For example, the cost for site 1 can be compared to the cost for site 2, but the cost for site 1 cannot be compared to a fixed value.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsQuerySitesByCost as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS A directory service handle.
 * @param {PWSTR} pwszFromSite Pointer to a null-terminated string that contains the relative distinguished name of the site the costs are measured from.
 * @param {Pointer<PWSTR>} rgwszToSites Contains an array of null-terminated string pointers that contain the relative distinguished names of the sites the costs are measured to.
 * @param {Integer} cToSites Contains the number of elements in the <i>rgwszToSites</i> array.
 * @param {Pointer<Pointer<DS_SITE_COST_INFO>>} prgSiteInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_site_cost_info">DS_SITE_COST_INFO</a> structures that receives the cost data. Each element in this array contains the cost data between the site identified by the <i>pwszFromSite</i> parameter and the site identified by the corresponding <i>rgwszToSites</i> element.
 * 
 * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsquerysitesfree">DsQuerySitesFree</a>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise.
 *        Possible error codes include values listed in the following list.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsquerysitesbycostw
 * @since windows6.0.6000
 */
export DsQuerySitesByCostW(hDS, pwszFromSite, rgwszToSites, cToSites, prgSiteInfo) {
    static dwFlags := 0 ;Reserved parameters must always be NULL

    pwszFromSite := pwszFromSite is String ? StrPtr(pwszFromSite) : pwszFromSite

    rgwszToSitesMarshal := rgwszToSites is VarRef ? "ptr*" : "ptr"
    prgSiteInfoMarshal := prgSiteInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsQuerySitesByCostW", HANDLE, hDS, "ptr", pwszFromSite, rgwszToSitesMarshal, rgwszToSites, "uint", cToSites, "uint", dwFlags, prgSiteInfoMarshal, prgSiteInfo, UInt32)
    return result
}

/**
 * Gets the communication cost between one site and one or more other sites. (ANSI)
 * @remarks
 * The cost values obtained by this function are only used to compare and have no meaning by themselves. For example, the cost for site 1 can be compared to the cost for site 2, but the cost for site 1 cannot be compared to a fixed value.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsQuerySitesByCost as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS A directory service handle.
 * @param {PSTR} pszFromSite Pointer to a null-terminated string that contains the relative distinguished name of the site the costs are measured from.
 * @param {Pointer<PSTR>} rgszToSites Contains an array of null-terminated string pointers that contain the relative distinguished names of the sites the costs are measured to.
 * @param {Integer} cToSites Contains the number of elements in the <i>rgwszToSites</i> array.
 * @param {Pointer<Pointer<DS_SITE_COST_INFO>>} prgSiteInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_site_cost_info">DS_SITE_COST_INFO</a> structures that receives the cost data. Each element in this array contains the cost data between the site identified by the <i>pwszFromSite</i> parameter and the site identified by the corresponding <i>rgwszToSites</i> element.
 * 
 * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsquerysitesfree">DsQuerySitesFree</a>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise.
 *        Possible error codes include values listed in the following list.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsquerysitesbycosta
 * @since windows6.0.6000
 */
export DsQuerySitesByCostA(hDS, pszFromSite, rgszToSites, cToSites, prgSiteInfo) {
    static dwFlags := 0 ;Reserved parameters must always be NULL

    pszFromSite := pszFromSite is String ? StrPtr(pszFromSite) : pszFromSite

    rgszToSitesMarshal := rgszToSites is VarRef ? "ptr*" : "ptr"
    prgSiteInfoMarshal := prgSiteInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsQuerySitesByCostA", HANDLE, hDS, "ptr", pszFromSite, rgszToSitesMarshal, rgszToSites, "uint", cToSites, "uint", dwFlags, prgSiteInfoMarshal, prgSiteInfo, UInt32)
    return result
}

/**
 * Frees the memory allocated by the DsQuerySitesByCost function.
 * @param {Pointer<DS_SITE_COST_INFO>} rgSiteInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_site_cost_info">DS_SITE_COST_INFO</a> structures allocated by a call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsquerysitesbycosta">DsQuerySitesByCost</a>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsquerysitesfree
 * @since windows6.0.6000
 */
export DsQuerySitesFree(rgSiteInfo) {
    DllCall("NTDSAPI.dll\DsQuerySitesFree", DS_SITE_COST_INFO.Ptr, rgSiteInfo)
}

/**
 * Converts GUIDs of directory service schema objects to their display names. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsMapSchemaGuids as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {Integer} cGuids Indicates the number of elements in <i>rGuids</i>.
 * @param {Pointer<Guid>} rGuids Pointer to an array of <b>GUID</b> values for the objects to be mapped.
 * @param {Pointer<Pointer<DS_SCHEMA_GUID_MAPA>>} ppGuidMap Pointer to a variable that receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapa">DS_SCHEMA_GUID_MAP</a> structures that contain the display names of the objects in <i>rGuids</i>. This array must be deallocated using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreeschemaguidmapa">DsFreeSchemaGuidMap</a>.
 * @returns {Integer} Returns a standard error code that includes the following values.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsmapschemaguidsa
 * @since windows6.0.6000
 */
export DsMapSchemaGuidsA(hDs, cGuids, rGuids, ppGuidMap) {
    ppGuidMapMarshal := ppGuidMap is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsMapSchemaGuidsA", HANDLE, hDs, "uint", cGuids, Guid.Ptr, rGuids, ppGuidMapMarshal, ppGuidMap, UInt32)
    return result
}

/**
 * Frees memory that the DsMapSchemaGuids function has allocated for a DS_SCHEMA_GUID_MAP structure. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsFreeSchemaGuidMap as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<DS_SCHEMA_GUID_MAPA>} pGuidMap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapa">DS_SCHEMA_GUID_MAP</a> structure to deallocate.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsfreeschemaguidmapa
 * @since windows6.0.6000
 */
export DsFreeSchemaGuidMapA(pGuidMap) {
    DllCall("NTDSAPI.dll\DsFreeSchemaGuidMapA", DS_SCHEMA_GUID_MAPA.Ptr, pGuidMap)
}

/**
 * Converts GUIDs of directory service schema objects to their display names. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsMapSchemaGuids as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {Integer} cGuids Indicates the number of elements in <i>rGuids</i>.
 * @param {Pointer<Guid>} rGuids Pointer to an array of <b>GUID</b> values for the objects to be mapped.
 * @param {Pointer<Pointer<DS_SCHEMA_GUID_MAPW>>} ppGuidMap Pointer to a variable that receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapa">DS_SCHEMA_GUID_MAP</a> structures that contain the display names of the objects in <i>rGuids</i>. This array must be deallocated using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreeschemaguidmapa">DsFreeSchemaGuidMap</a>.
 * @returns {Integer} Returns a standard error code that includes the following values.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsmapschemaguidsw
 * @since windows6.0.6000
 */
export DsMapSchemaGuidsW(hDs, cGuids, rGuids, ppGuidMap) {
    ppGuidMapMarshal := ppGuidMap is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsMapSchemaGuidsW", HANDLE, hDs, "uint", cGuids, Guid.Ptr, rGuids, ppGuidMapMarshal, ppGuidMap, UInt32)
    return result
}

/**
 * Frees memory that the DsMapSchemaGuids function has allocated for a DS_SCHEMA_GUID_MAP structure. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsFreeSchemaGuidMap as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<DS_SCHEMA_GUID_MAPW>} pGuidMap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapa">DS_SCHEMA_GUID_MAP</a> structure to deallocate.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsfreeschemaguidmapw
 * @since windows6.0.6000
 */
export DsFreeSchemaGuidMapW(pGuidMap) {
    DllCall("NTDSAPI.dll\DsFreeSchemaGuidMapW", DS_SCHEMA_GUID_MAPW.Ptr, pGuidMap)
}

/**
 * Retrieves data about the domain controllers in a domain. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsGetDomainControllerInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} DomainName Pointer to a null-terminated string that specifies the domain name.
 * @param {Integer} InfoLevel 
 * @param {Pointer<Integer>} pcOut Pointer to a <b>DWORD</b> variable that receives the number of items returned in <i>ppInfo</i> array.
 * @param {Pointer<Pointer<Void>>} ppInfo Pointer to a pointer variable that receives an array of  <b>DS_DOMAIN_CONTROLLER_INFO_*</b> structures. The type of structures in this array is defined by the <i>InfoLevel</i> parameter. The caller must free this array, when it is no longer required, by using 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreedomaincontrollerinfoa">DsFreeDomainControllerInfo</a> function.
 * @returns {Integer} If the function returns domain controller data, the return value is <b>ERROR_SUCCESS</b>. If the caller does not have the privileges to access the server objects, the return value is <b>ERROR_SUCCESS</b>, but the <b>DS_DOMAIN_CONTROLLER_INFO</b> structures could be empty.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfoa
 * @since windows6.0.6000
 */
export DsGetDomainControllerInfoA(hDs, DomainName, InfoLevel, pcOut, ppInfo) {
    DomainName := DomainName is String ? StrPtr(DomainName) : DomainName

    pcOutMarshal := pcOut is VarRef ? "uint*" : "ptr"
    ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsGetDomainControllerInfoA", HANDLE, hDs, "ptr", DomainName, "uint", InfoLevel, pcOutMarshal, pcOut, ppInfoMarshal, ppInfo, UInt32)
    return result
}

/**
 * Retrieves data about the domain controllers in a domain. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsGetDomainControllerInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} DomainName Pointer to a null-terminated string that specifies the domain name.
 * @param {Integer} InfoLevel 
 * @param {Pointer<Integer>} pcOut Pointer to a <b>DWORD</b> variable that receives the number of items returned in <i>ppInfo</i> array.
 * @param {Pointer<Pointer<Void>>} ppInfo Pointer to a pointer variable that receives an array of  <b>DS_DOMAIN_CONTROLLER_INFO_*</b> structures. The type of structures in this array is defined by the <i>InfoLevel</i> parameter. The caller must free this array, when it is no longer required, by using 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreedomaincontrollerinfoa">DsFreeDomainControllerInfo</a> function.
 * @returns {Integer} If the function returns domain controller data, the return value is <b>ERROR_SUCCESS</b>. If the caller does not have the privileges to access the server objects, the return value is <b>ERROR_SUCCESS</b>, but the <b>DS_DOMAIN_CONTROLLER_INFO</b> structures could be empty.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfow
 * @since windows6.0.6000
 */
export DsGetDomainControllerInfoW(hDs, DomainName, InfoLevel, pcOut, ppInfo) {
    DomainName := DomainName is String ? StrPtr(DomainName) : DomainName

    pcOutMarshal := pcOut is VarRef ? "uint*" : "ptr"
    ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsGetDomainControllerInfoW", HANDLE, hDs, "ptr", DomainName, "uint", InfoLevel, pcOutMarshal, pcOut, ppInfoMarshal, ppInfo, UInt32)
    return result
}

/**
 * The DsFreeDomainControllerInfo function frees memory that is allocated by DsGetDomainControllerInfo for data about the domain controllers in a domain. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsFreeDomainControllerInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} InfoLevel 
 * @param {Integer} cInfo Indicates the number of items in <i>pInfo</i>.
 * @param {Pointer<Void>} pInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_domain_controller_info_1a">DS_DOMAIN_CONTROLLER_INFO</a> structures to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsfreedomaincontrollerinfoa
 * @since windows6.0.6000
 */
export DsFreeDomainControllerInfoA(InfoLevel, cInfo, pInfo) {
    pInfoMarshal := pInfo is VarRef ? "ptr" : "ptr"

    DllCall("NTDSAPI.dll\DsFreeDomainControllerInfoA", "uint", InfoLevel, "uint", cInfo, pInfoMarshal, pInfo)
}

/**
 * The DsFreeDomainControllerInfo function frees memory that is allocated by DsGetDomainControllerInfo for data about the domain controllers in a domain. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsFreeDomainControllerInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} InfoLevel 
 * @param {Integer} cInfo Indicates the number of items in <i>pInfo</i>.
 * @param {Pointer<Void>} pInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_domain_controller_info_1a">DS_DOMAIN_CONTROLLER_INFO</a> structures to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsfreedomaincontrollerinfow
 * @since windows6.0.6000
 */
export DsFreeDomainControllerInfoW(InfoLevel, cInfo, pInfo) {
    pInfoMarshal := pInfo is VarRef ? "ptr" : "ptr"

    DllCall("NTDSAPI.dll\DsFreeDomainControllerInfoW", "uint", InfoLevel, "uint", cInfo, pInfoMarshal, pInfo)
}

/**
 * Invokes the Knowledge Consistency Checker (KCC) to verify the replication topology.
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a> function.
 * @param {DS_KCC_TASKID} TaskID Identifies the task that the KCC should execute. <b>DS_KCC_TASKID_UPDATE_TOPOLOGY</b> is the only currently supported value.
 * @param {Integer} dwFlags 
 * @returns {Integer} If the function performs its operation successfully, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the return value can be one of the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicaconsistencycheck
 * @since windows6.0.6000
 */
export DsReplicaConsistencyCheck(hDS, TaskID, dwFlags) {
    result := DllCall("NTDSAPI.dll\DsReplicaConsistencyCheck", HANDLE, hDS, DS_KCC_TASKID, TaskID, "uint", dwFlags, UInt32)
    return result
}

/**
 * Verifies all objects for a naming context with a source. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaVerifyObjects as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a> function.
 * @param {PWSTR} NameContext Pointer to a null-terminated string that contains the distinguished name of the naming context.
 * @param {Pointer<Guid>} pUuidDsaSrc Pointer to a <b>UUID</b> value that contains the <b>objectGuid</b> of the directory system agent object.
 * @param {Integer} ulOptions Contains a set of flags that modify the behavior of the function. This can be zero or the following value.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error otherwise. Possible error values include the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicaverifyobjectsw
 * @since windows6.0.6000
 */
export DsReplicaVerifyObjectsW(hDS, NameContext, pUuidDsaSrc, ulOptions) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext

    result := DllCall("NTDSAPI.dll\DsReplicaVerifyObjectsW", HANDLE, hDS, "ptr", NameContext, Guid.Ptr, pUuidDsaSrc, "uint", ulOptions, UInt32)
    return result
}

/**
 * Verifies all objects for a naming context with a source. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsReplicaVerifyObjects as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a> function.
 * @param {PSTR} NameContext Pointer to a null-terminated string that contains the distinguished name of the naming context.
 * @param {Pointer<Guid>} pUuidDsaSrc Pointer to a <b>UUID</b> value that contains the <b>objectGuid</b> of the directory system agent object.
 * @param {Integer} ulOptions Contains a set of flags that modify the behavior of the function. This can be zero or the following value.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error otherwise. Possible error values include the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicaverifyobjectsa
 * @since windows6.0.6000
 */
export DsReplicaVerifyObjectsA(hDS, NameContext, pUuidDsaSrc, ulOptions) {
    NameContext := NameContext is String ? StrPtr(NameContext) : NameContext

    result := DllCall("NTDSAPI.dll\DsReplicaVerifyObjectsA", HANDLE, hDS, "ptr", NameContext, Guid.Ptr, pUuidDsaSrc, "uint", ulOptions, UInt32)
    return result
}

/**
 * Retrieves replication state data from the directory service.
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {DS_REPL_INFO_TYPE} InfoType Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a> values that specifies the type of replication data to retrieve. This value also determines which type of structure is returned in <i>ppInfo</i>.
 * 
 * Only the following values are supported for this function. If other data types are required, the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> function must be used.
 * 
 * <a id="DS_REPL_INFO_NEIGHBORS"></a>
 * <a id="ds_repl_info_neighbors"></a>
 * @param {PWSTR} pszObject Pointer to a constant null-terminated Unicode string that identifies the object to retrieve replication data for. The meaning of this parameter depends on the value of the <i>InfoType</i> parameter. The following are possible value codes.
 * @param {Pointer<Guid>} puuidForSourceDsaObjGuid Pointer to a <b>GUID</b> value that identifies a specific replication source. If this parameter is not <b>NULL</b> and the <i>InfoType</i> parameter contains <b>DS_REPL_INFO_NEIGHBORS</b>, only neighbor data for the source corresponding to the nTDSDSA object with the given <b>objectGuid</b> in the directory is returned. This parameter is ignored if <b>NULL</b> or if the <i>InfoType</i> parameter is anything other than <b>DS_REPL_INFO_NEIGHBORS</b>.
 * @param {Pointer<Pointer<Void>>} ppInfo Address of a structure pointer that receives the requested data. The value of the <i>InfoType</i> parameter determines the format of this structure. For more information and list of possible <i>InfoType</i> values and the corresponding structure types, see <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a>.
 * 
 * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicafreeinfo">DsReplicaFreeInfo</a>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise.
 *       The following are possible error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow
 * @since windows6.0.6000
 */
export DsReplicaGetInfoW(hDS, InfoType, pszObject, puuidForSourceDsaObjGuid, ppInfo) {
    pszObject := pszObject is String ? StrPtr(pszObject) : pszObject

    ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsReplicaGetInfoW", HANDLE, hDS, DS_REPL_INFO_TYPE, InfoType, "ptr", pszObject, Guid.Ptr, puuidForSourceDsaObjGuid, ppInfoMarshal, ppInfo, UInt32)
    return result
}

/**
 * Retrieves replication state data from the directory service. This function allows paging of results in cases where there are more than 1000 entries to retrieve.
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {DS_REPL_INFO_TYPE} InfoType Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a> values that specifies the type of replication data to retrieve. This value also determines which type of structure is returned in <i>ppInfo</i>.
 * @param {PWSTR} pszObject Pointer to a constant null-terminated Unicode string that identifies the object to retrieve replication data for. The meaning of this parameter depends on the value of the <i>InfoType</i> parameter. The following are possible value codes.
 * @param {Pointer<Guid>} puuidForSourceDsaObjGuid Pointer to a <b>GUID</b> value that identifies a specific replication source. If this parameter is not <b>NULL</b> and the <i>InfoType</i> parameter contains <b>DS_REPL_INFO_NEIGHBORS</b>, only neighbor data for the source corresponding to the nTDSDSA object with the given <b>objectGuid</b> in the directory is returned. This parameter is ignored if <b>NULL</b> or if the <i>InfoType</i> parameter is anything other than <b>DS_REPL_INFO_NEIGHBORS</b>.
 * @param {PWSTR} pszAttributeName Pointer to a null-terminated Unicode string that contains the name of the specific attribute to retrieve replication data for.
 * @param {PWSTR} pszValue Pointer to a null-terminated Unicode string that contains the distinguished name value to match. If the requested attribute is a distinguished name type value, this function return the attributes that contain the specified value.
 * @param {Integer} dwFlags Contains a set of flags that modify the behavior of the function. This parameter can be zero or the following value.
 * @param {Integer} dwEnumerationContext Contains the index of the next entry to retrieve.  This parameter must be set to zero the first time this function is called.
 * @param {Pointer<Pointer<Void>>} ppInfo Address of a structure pointer that receives the requested data. The value of the <i>InfoType</i> parameter determines the format of this structure. For more information and a list of possible <i>InfoType</i> values and the corresponding structure types, see <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a>.
 * 
 * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicafreeinfo">DsReplicaFreeInfo</a>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise.
 *       The following are possible error codes.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w
 * @since windows6.0.6000
 */
export DsReplicaGetInfo2W(hDS, InfoType, pszObject, puuidForSourceDsaObjGuid, pszAttributeName, pszValue, dwFlags, dwEnumerationContext, ppInfo) {
    pszObject := pszObject is String ? StrPtr(pszObject) : pszObject
    pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName
    pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

    ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NTDSAPI.dll\DsReplicaGetInfo2W", HANDLE, hDS, DS_REPL_INFO_TYPE, InfoType, "ptr", pszObject, Guid.Ptr, puuidForSourceDsaObjGuid, "ptr", pszAttributeName, "ptr", pszValue, "uint", dwFlags, "uint", dwEnumerationContext, ppInfoMarshal, ppInfo, UInt32)
    return result
}

/**
 * Frees the replication state data structure allocated by the DsReplicaGetInfo or DsReplicaGetInfo2 functions.
 * @param {DS_REPL_INFO_TYPE} InfoType Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a> values that specifies the type of replication data structure  contained in <i>pInfo</i>. This must be the same value passed to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow">DsReplicaGetInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> function when the structure was allocated.
 * @param {Pointer<Void>} pInfo Pointer to the replication data structure allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow">DsReplicaGetInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> functions.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsreplicafreeinfo
 * @since windows6.0.6000
 */
export DsReplicaFreeInfo(InfoType, pInfo) {
    pInfoMarshal := pInfo is VarRef ? "ptr" : "ptr"

    DllCall("NTDSAPI.dll\DsReplicaFreeInfo", DS_REPL_INFO_TYPE, InfoType, pInfoMarshal, pInfo)
}

/**
 * Retrieves the primary account security identifier (SID) of a security principal from one domain and adds it to the sIDHistory attribute of a security principal in another domain in a different forest. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsAddSidHistory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} SrcDomain Pointer to a null-terminated string that specifies the name of the domain to query for the SID of <i>SrcPrincipal</i>.
 * 
 * If the source domain runs on  Windows Server operating systems, <i>SrcDomain</i> can be either a domain name system (DNS) name, for example, fabrikam.com, or a flat NetBIOS, for example, Fabrikam, name. DNS names should be used when possible.
 * @param {PWSTR} SrcPrincipal Pointer to a null-terminated string that specifies the name of a security principal, user or group, in the source domain. This name is a domain-relative Security Account Manager (SAM) name, for example: evacorets.
 * @param {PWSTR} SrcDomainController Pointer to a null-terminated string that specifies the name of the primary domain controller (PDC) Emulator in the source domain to use for secure retrieval of the source principal SID and audit generation. 
 * 
 * 
 * If this parameter is <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> will select the primary domain controller.
 * 
 * <i>SrcDomainController</i> can be either a DNS name or a flat NetBIOS name. DNS names should be used when possible.
 * @param {Pointer<Void>} SrcDomainCreds Contains an identity handle that represents the identity and credentials of a user with administrative rights in the source domain. To obtain this handle, call  <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>. This user must be a member of either the Administrators or the Domain Administrators group. If this call is made from a remote computer to the destination DC, then both the remote computer and the destination DC must support 128-bit encryption to privacy-protect the credentials. If 128-bit encryption is unavailable and <i>SrcDomainCreds</i> are provided, then the call must be made on the destination DC.
 * 
 * If this parameter is <b>NULL</b>, the credentials of the caller are used for access to the source domain.
 * @param {PWSTR} DstDomain Pointer to a null-terminated string that specifies the name of the destination domain in which <i>DstPrincipal</i> resides. This name can either be a DNS name, for example, fabrikam.com, or a NetBIOS name, for example, Fabrikam. The destination domain must run Windows 2000 native mode.
 * @param {PWSTR} DstPrincipal Pointer to a null-terminated string that specifies the name of a security principal, user or group, in the destination domain. This domain-relative SAM name identifies the principal whose <b>sIDHistory</b> attribute is updated with the SID of the <i>SrcPrincipal</i>.
 * @returns {Integer} Returns a Win32 error codes including the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsaddsidhistoryw
 * @since windows6.0.6000
 */
export DsAddSidHistoryW(hDS, SrcDomain, SrcPrincipal, SrcDomainController, SrcDomainCreds, DstDomain, DstPrincipal) {
    static Flags := 0 ;Reserved parameters must always be NULL

    SrcDomain := SrcDomain is String ? StrPtr(SrcDomain) : SrcDomain
    SrcPrincipal := SrcPrincipal is String ? StrPtr(SrcPrincipal) : SrcPrincipal
    SrcDomainController := SrcDomainController is String ? StrPtr(SrcDomainController) : SrcDomainController
    DstDomain := DstDomain is String ? StrPtr(DstDomain) : DstDomain
    DstPrincipal := DstPrincipal is String ? StrPtr(DstPrincipal) : DstPrincipal

    SrcDomainCredsMarshal := SrcDomainCreds is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsAddSidHistoryW", HANDLE, hDS, "uint", Flags, "ptr", SrcDomain, "ptr", SrcPrincipal, "ptr", SrcDomainController, SrcDomainCredsMarshal, SrcDomainCreds, "ptr", DstDomain, "ptr", DstPrincipal, UInt32)
    return result
}

/**
 * Retrieves the primary account security identifier (SID) of a security principal from one domain and adds it to the sIDHistory attribute of a security principal in another domain in a different forest. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DsAddSidHistory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} SrcDomain Pointer to a null-terminated string that specifies the name of the domain to query for the SID of <i>SrcPrincipal</i>.
 * 
 * If the source domain runs on  Windows Server operating systems, <i>SrcDomain</i> can be either a domain name system (DNS) name, for example, fabrikam.com, or a flat NetBIOS, for example, Fabrikam, name. DNS names should be used when possible.
 * @param {PSTR} SrcPrincipal Pointer to a null-terminated string that specifies the name of a security principal, user or group, in the source domain. This name is a domain-relative Security Account Manager (SAM) name, for example: evacorets.
 * @param {PSTR} SrcDomainController Pointer to a null-terminated string that specifies the name of the primary domain controller (PDC) Emulator in the source domain to use for secure retrieval of the source principal SID and audit generation. 
 * 
 * 
 * If this parameter is <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> will select the primary domain controller.
 * 
 * <i>SrcDomainController</i> can be either a DNS name or a flat NetBIOS name. DNS names should be used when possible.
 * @param {Pointer<Void>} SrcDomainCreds Contains an identity handle that represents the identity and credentials of a user with administrative rights in the source domain. To obtain this handle, call  <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>. This user must be a member of either the Administrators or the Domain Administrators group. If this call is made from a remote computer to the destination DC, then both the remote computer and the destination DC must support 128-bit encryption to privacy-protect the credentials. If 128-bit encryption is unavailable and <i>SrcDomainCreds</i> are provided, then the call must be made on the destination DC.
 * 
 * If this parameter is <b>NULL</b>, the credentials of the caller are used for access to the source domain.
 * @param {PSTR} DstDomain Pointer to a null-terminated string that specifies the name of the destination domain in which <i>DstPrincipal</i> resides. This name can either be a DNS name, for example, fabrikam.com, or a NetBIOS name, for example, Fabrikam. The destination domain must run Windows 2000 native mode.
 * @param {PSTR} DstPrincipal Pointer to a null-terminated string that specifies the name of a security principal, user or group, in the destination domain. This domain-relative SAM name identifies the principal whose <b>sIDHistory</b> attribute is updated with the SID of the <i>SrcPrincipal</i>.
 * @returns {Integer} Returns a Win32 error codes including the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsaddsidhistorya
 * @since windows6.0.6000
 */
export DsAddSidHistoryA(hDS, SrcDomain, SrcPrincipal, SrcDomainController, SrcDomainCreds, DstDomain, DstPrincipal) {
    static Flags := 0 ;Reserved parameters must always be NULL

    SrcDomain := SrcDomain is String ? StrPtr(SrcDomain) : SrcDomain
    SrcPrincipal := SrcPrincipal is String ? StrPtr(SrcPrincipal) : SrcPrincipal
    SrcDomainController := SrcDomainController is String ? StrPtr(SrcDomainController) : SrcDomainController
    DstDomain := DstDomain is String ? StrPtr(DstDomain) : DstDomain
    DstPrincipal := DstPrincipal is String ? StrPtr(DstPrincipal) : DstPrincipal

    SrcDomainCredsMarshal := SrcDomainCreds is VarRef ? "ptr" : "ptr"

    result := DllCall("NTDSAPI.dll\DsAddSidHistoryA", HANDLE, hDS, "uint", Flags, "ptr", SrcDomain, "ptr", SrcPrincipal, "ptr", SrcDomainController, SrcDomainCredsMarshal, SrcDomainCreds, "ptr", DstDomain, "ptr", DstPrincipal, UInt32)
    return result
}

/**
 * Appends the objectSid and sidHistory attributes of SrcPrincipal to the sidHistory of DstPrincipal and then deletes SrcPrincipal, all in a single transaction. (Unicode)
 * @remarks
 * With an operating system upgrade domain applications, which span both upgraded and non-upgraded domains, may have security principals inside and outside the forest for the same logical entity at the same time.
 * 
 * When all upgraded domains have joined the same forest, <b>DsInheritSecurityIdentity</b> eliminates the duplicate objects while ensuring that the remaining objects have all the security rights and privileges belonging to their respective deleted object.
 * 
 * A <b>DsInheritSecurityIdentity</b> implementation:
 * 
 * <ul>
 * <li>Verifies that <i>SrcPrincipal</i> and <i>DstPrincipal</i> are in the same domain.</li>
 * <li>Verifies that the domain is writable at the bind to the server.</li>
 * <li>Verifies that auditing is enabled for the domain.</li>
 * <li>Verifies that the caller is a member of the domain administrators for the domain.</li>
 * <li>Verifies that the domain is in the native mode.</li>
 * <li>Verifies that <i>SrcPrincipal</i> exists, that it is a security principal and has read its <b>objectSid</b> and <b>sidHistory</b> properties.</li>
 * <li>Verifies that <i>DstPrincipal</i> exists, that it is a security principal, and has read certain properties required for auditing and verification.</li>
 * <li>Deletes <i>SrcPrincipal</i> in the database only if the entire operation is committed at completion. This operation fails if the caller does not have delete rights or if <i>SrcPrincipal</i> has children.</li>
 * <li>Fails the operation if the <b>objectSid</b> of <i>SrcPrincipal</i> or <i>DstPrincipal</i> is a well-known SID.</li>
 * <li>Adds the <b>objectSid</b> and the <b>sidHistory</b> (if present) of <i>SrcPrincipal</i> to the <b>sidHistory</b> of <i>DstPrincipal</i>.</li>
 * <li>Forces an audit event and fails the operation if the audit fails.</li>
 * <li>Enters events into the Directory Service Log. Do not confuse this with the Security Audit Log.</li>
 * </ul>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsInheritSecurityIdentity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PWSTR} SrcPrincipal Pointer to a null-terminated string that specifies the name of a security principal (user or group) in the source domain. This name is a domain-relative SAM name.
 * @param {PWSTR} DstPrincipal Pointer to a null-terminated string that specifies the name of a security principal (user or group) in the destination domain. This domain-relative SAM name identifies the principal whose <b>sidHistory</b> attribute will be updated with the SID of <i>SrcPrincipal</i>.
 * @returns {Integer} Returns a system or RPC error code including the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsinheritsecurityidentityw
 * @since windows6.0.6000
 */
export DsInheritSecurityIdentityW(hDS, SrcPrincipal, DstPrincipal) {
    static Flags := 0 ;Reserved parameters must always be NULL

    SrcPrincipal := SrcPrincipal is String ? StrPtr(SrcPrincipal) : SrcPrincipal
    DstPrincipal := DstPrincipal is String ? StrPtr(DstPrincipal) : DstPrincipal

    result := DllCall("NTDSAPI.dll\DsInheritSecurityIdentityW", HANDLE, hDS, "uint", Flags, "ptr", SrcPrincipal, "ptr", DstPrincipal, UInt32)
    return result
}

/**
 * Appends the objectSid and sidHistory attributes of SrcPrincipal to the sidHistory of DstPrincipal and then deletes SrcPrincipal, all in a single transaction. (ANSI)
 * @remarks
 * With an operating system upgrade domain applications, which span both upgraded and non-upgraded domains, may have security principals inside and outside the forest for the same logical entity at the same time.
 * 
 * When all upgraded domains have joined the same forest, <b>DsInheritSecurityIdentity</b> eliminates the duplicate objects while ensuring that the remaining objects have all the security rights and privileges belonging to their respective deleted object.
 * 
 * A <b>DsInheritSecurityIdentity</b> implementation:
 * 
 * <ul>
 * <li>Verifies that <i>SrcPrincipal</i> and <i>DstPrincipal</i> are in the same domain.</li>
 * <li>Verifies that the domain is writable at the bind to the server.</li>
 * <li>Verifies that auditing is enabled for the domain.</li>
 * <li>Verifies that the caller is a member of the domain administrators for the domain.</li>
 * <li>Verifies that the domain is in the native mode.</li>
 * <li>Verifies that <i>SrcPrincipal</i> exists, that it is a security principal and has read its <b>objectSid</b> and <b>sidHistory</b> properties.</li>
 * <li>Verifies that <i>DstPrincipal</i> exists, that it is a security principal, and has read certain properties required for auditing and verification.</li>
 * <li>Deletes <i>SrcPrincipal</i> in the database only if the entire operation is committed at completion. This operation fails if the caller does not have delete rights or if <i>SrcPrincipal</i> has children.</li>
 * <li>Fails the operation if the <b>objectSid</b> of <i>SrcPrincipal</i> or <i>DstPrincipal</i> is a well-known SID.</li>
 * <li>Adds the <b>objectSid</b> and the <b>sidHistory</b> (if present) of <i>SrcPrincipal</i> to the <b>sidHistory</b> of <i>DstPrincipal</i>.</li>
 * <li>Forces an audit event and fails the operation if the audit fails.</li>
 * <li>Enters events into the Directory Service Log. Do not confuse this with the Security Audit Log.</li>
 * </ul>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DsInheritSecurityIdentity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
 * @param {PSTR} SrcPrincipal Pointer to a null-terminated string that specifies the name of a security principal (user or group) in the source domain. This name is a domain-relative SAM name.
 * @param {PSTR} DstPrincipal Pointer to a null-terminated string that specifies the name of a security principal (user or group) in the destination domain. This domain-relative SAM name identifies the principal whose <b>sidHistory</b> attribute will be updated with the SID of <i>SrcPrincipal</i>.
 * @returns {Integer} Returns a system or RPC error code including the following.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/nf-ntdsapi-dsinheritsecurityidentitya
 * @since windows6.0.6000
 */
export DsInheritSecurityIdentityA(hDS, SrcPrincipal, DstPrincipal) {
    static Flags := 0 ;Reserved parameters must always be NULL

    SrcPrincipal := SrcPrincipal is String ? StrPtr(SrcPrincipal) : SrcPrincipal
    DstPrincipal := DstPrincipal is String ? StrPtr(DstPrincipal) : DstPrincipal

    result := DllCall("NTDSAPI.dll\DsInheritSecurityIdentityA", HANDLE, hDS, "uint", Flags, "ptr", SrcPrincipal, "ptr", DstPrincipal, UInt32)
    return result
}

/**
 * Retrieves state data for the computer.
 * @param {PWSTR} lpServer Pointer to null-terminated Unicode string that contains the name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
 * @param {DSROLE_PRIMARY_DOMAIN_INFO_LEVEL} InfoLevel Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ne-dsrole-dsrole_primary_domain_info_level">DSROLE_PRIMARY_DOMAIN_INFO_LEVEL</a> values that specify the type of data to retrieve. This parameter also determines the format of the data supplied in <i>Buffer</i>.
 * @param {Pointer<Pointer<Integer>>} _Buffer Pointer to the address of a buffer that receives the requested data. The format of this data depends on the value of the <i>InfoLevel</i> parameter.
 * 
 * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/nf-dsrole-dsrolefreememory">DsRoleFreeMemory</a>.
 * @returns {Integer} If the function is successful, the return value is <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value can be one of the following values.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/nf-dsrole-dsrolegetprimarydomaininformation
 * @since windows6.0.6000
 */
export DsRoleGetPrimaryDomainInformation(lpServer, InfoLevel, _Buffer) {
    lpServer := lpServer is String ? StrPtr(lpServer) : lpServer

    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsRoleGetPrimaryDomainInformation", "ptr", lpServer, DSROLE_PRIMARY_DOMAIN_INFO_LEVEL, InfoLevel, _BufferMarshal, _Buffer, UInt32)
    return result
}

/**
 * Frees memory allocated by the DsRoleGetPrimaryDomainInformation function.
 * @param {Pointer<Void>} _Buffer Pointer to the buffer to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/nf-dsrole-dsrolefreememory
 * @since windows6.0.6000
 */
export DsRoleFreeMemory(_Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    DllCall("NETAPI32.dll\DsRoleFreeMemory", _BufferMarshal, _Buffer)
}

/**
 * Returns the name of a domain controller in a specified domain. (ANSI)
 * @remarks
 * The <b>DsGetDcName</b> function is sent to the Netlogon service 
 *     on the remote computer specified by <i>ComputerName</i>. If 
 *     <i>ComputerName</i> is <b>NULL</b>, the function is processed on the local 
 *     computer.
 * 
 * <b>DsGetDcName</b> does not verify that  the domain controller name 
 *      returned is the name of an actual domain controller or global catalog. If mutual authentication is required, the 
 *      caller must  perform the authentication.
 * 
 * <b>DsGetDcName</b> does not require any particular access to the 
 *      specified domain. By default, this function does not ensure that the returned domain controller is currently 
 *      available. Instead, the caller should attempt to use the returned domain controller. If the domain controller is 
 *      not available, the caller should call the <b>DsGetDcName</b> 
 *      function again, specifying the <b>DS_FORCE_REDISCOVERY</b> flag.
 * 
 * <h3><a id="Response_Time"></a><a id="response_time"></a><a id="RESPONSE_TIME"></a>Response Time</h3>
 * When using <b>DsGetDcName</b> be aware of the following timing 
 *       details:
 * 
 * <ul>
 * <li>
 * <b>DsGetDcName</b> makes network calls and can take from a few 
 *          seconds  up to one minute, depending on network traffic, topology, DC load, and so on.
 * 
 * </li>
 * <li>
 * It is NOT recommended to call <b>DsGetDcName</b> from a UI or 
 *         other timing critical thread.
 * 
 * </li>
 * <li>
 * The DC Locator does use optimized logic to provide the DC information as quickly as possible. It also uses 
 *         cached information at the site to contact the closest DC.
 * 
 * </li>
 * </ul>
 * <h3><a id="Notes_on_Domain_Controller_Stickiness"></a><a id="notes_on_domain_controller_stickiness"></a><a id="NOTES_ON_DOMAIN_CONTROLLER_STICKINESS"></a>Notes on Domain Controller Stickiness</h3>
 * In Active Directory Domain Services, the domain controller locator function is designed so that once a client 
 *       finds a preferred  domain controller, the client will not look for another unless that domain controller stops 
 *       responding or the client is restarted. This is referred to as "Domain Controller Stickiness." Because 
 *       workstations typically operate for months without a problem or restart,   one unintended consequence of this 
 *       behavior is that if a particular domain controller goes down for maintenance, all of the clients that were 
 *       connected to it shift their connections to another domain controller.  But when the domain controller comes back 
 *       up, no  clients ever reconnect to it because the clients do not restart very often.  This can cause 
 *       load-balancing problems.
 * 
 * Previously, the most common solution to this problem was to deploy a script on each client machine that 
 *       periodically called <b>DsGetDcName</b> using the 
 *       <c>DS_FORCE_REDISCOVERY</c> flag. This was a somewhat cumbersome solution, so 
 *       Windows Server 2008 and Windows Vista introduced a new mechanism that caused issues with  domain 
 *       controller stickiness.
 * 
 * Whenever <b>DsGetDcName</b> retrieves a domain controller name 
 *       from its cache, it checks to see if this cached entry is expired, and if so, discards that domain controller 
 *       name and tries to rediscover a domain controller name. The life span of a cached entry is controlled by the 
 *       value in the following registry keys
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SYSTEM</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>Netlogon</b>&#92;<b>Parameters</b>&#92;<b>ForceRediscoveryInterval</b>
 * 
 * 
 * 
 * and
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Policies</b>&#92;<b>Microsoft</b>&#92;<b>Netlogon</b>&#92;<b>Parameters</b>&#92;<b>ForceRediscoveryInterval</b>
 * 
 * 
 * 
 * The values in these registry keys are of type <b>REG_DWORD</b>. They specify the length in 
 *       seconds before <b>DsGetDcName</b> should try to rediscover the 
 *       domain controller name. The default value is 43200 seconds (12 hours).  If the value of the 
 *       <b>ForceRediscoveryInterval</b> registry entry is set to 0, the client always 
 *   performs rediscovery. If the value is set to 4294967295, the cache never expires, and the cached domain controller 
 *   continues to be used. We recommend that you do not set the 
 *   <b>ForceRediscoveryInterval</b> registry entry to a value that is less than 3600 seconds 
 *   (60 minutes).
 * 
 * <div class="alert"><b>Note</b>  The registry settings of <b>ForceRediscoveryInterval</b> are group policy 
 *     enabled. If you disable the policy setting, Force Rediscovery will used by default for the machine at every 12 
 *   hour interval. If you do not configure this policy setting, Force Rediscovery will used by default for the machine 
 *   at every 12 hour interval, unless the local machine setting in the registry is a different value.</div>
 * <div> </div>
 * Note that if the <b>DS_BACKGROUND_ONLY</b> flag is specified, 
 *       <b>DsGetDcName</b> will never try to rediscover the domain 
 *       controller name, since the point of that flag is to force 
 *       <b>DsGetDcName</b> to use the cached domain controller name even 
 *       if it is expired.
 * 
 * <h3><a id="ETW_Tracing_in_DsGetDcName"></a><a id="etw_tracing_in_dsgetdcname"></a><a id="ETW_TRACING_IN_DSGETDCNAME"></a>ETW Tracing in DsGetDcName</h3>
 * To turn on <a href="https://docs.microsoft.com/windows-hardware/drivers/hid/event-tracing">ETW Tracing</a> for 
 *       <b>DsGetDcName</b>, create the following registry key:
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>System</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>DCLocator</b>&#92;<b>Tracing</b>
 * 
 * 
 * 
 * The key will have a structure as follows:
 * 
 * 
 * ```cpp
 * String ProcessName
 *   DWORD  PID <optional>
 * ```
 * 
 * 
 * <i>ProcessName</i> must be the full name including extension of the process that you want 
 *       to get trace information for. <i>PID</i> is only required when multiple processes with the 
 *       same name exist.  If it is defined, then only the process with that PID will be enabled for tracing.  It is not 
 *       possible to trace only 2 out of 3 (or more) processes with the same name.  You can enable one instance or all 
 *       instances (when multiple instances with the same process name exist and PID is not specified, all instances will 
 *       be enabled for tracing).
 * 
 * For example, this would trace all instances of App1.exe and App2.exe, but only the instance of App3.exe that 
 *       has a PID of 999:
 * 
 * 
 * ``` syntax
 * App1.exe 
 * App2.exe
 * App3.exe
 *      PID 999
 * ```
 * 
 * Run the following command to start the tracing session:
 * 
 * <b>tracelog.exe -start &lt;sessionname&gt; -guid #cfaa5446-c6c4-4f5c-866f-31c9b55b962d -f &lt;filename&gt; -flag &lt;traceFlags&gt;</b>
 * 
 * <i>sessionname</i> is the name given for the trace session. The 
 *       <i>guid</i> for the DCLocator tracing provider is 
 *       "cfaa5446-c6c4-4f5c-866f-31c9b55b962d". <i>filename</i> is the name of the 
 *       log file to which the events are written. <i>traceFlags</i> is one or more of the following 
 *       flags which signify which areas to trace:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Hex Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_MISC</b>
 * 
 * </td>
 * <td>
 * 0x00000002
 * 
 * </td>
 * <td>
 * Miscellaneous debugging
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_MAILSLOT</b>
 * 
 * </td>
 * <td>
 * 0x00000010
 * 
 * </td>
 * <td>
 * Mailslot messages
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_SITE</b>
 * 
 * </td>
 * <td>
 * 0x00000020
 * 
 * </td>
 * <td>
 * Sites
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_CRITICAL</b>
 * 
 * </td>
 * <td>
 * 0x00000100
 * 
 * </td>
 * <td>
 * Important errors
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_SESSION_SETUP</b>
 * 
 * </td>
 * <td>
 * 0x00000200
 * 
 * </td>
 * <td>
 * Trusted Domain Maintenance
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_DNS</b>
 * 
 * </td>
 * <td>
 * 0x00004000
 * 
 * </td>
 * <td>
 * Name Registration
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_DNS_MORE</b>
 * 
 * </td>
 * <td>
 * 0x00020000
 * 
 * </td>
 * <td>
 * Verbose Name Registration
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_MAILBOX_TEXT</b>
 * 
 * </td>
 * <td>
 * 0x02000000
 * 
 * </td>
 * <td>
 * Verbose Mailbox Messages
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_SITE_MORE</b>
 * 
 * </td>
 * <td>
 * 0x08000000
 * 
 * </td>
 * <td>
 * Verbose sites
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Run the following command to stop the trace session:
 * 
 * <b>tracelog.exe -stop &lt;sessionname&gt;</b>
 * 
 * <i>sessionname</i> is the same name as the name you used when starting the session.
 * 
 * <div class="alert"><b>Note</b>  The registry key for the process being traced must be present in the registry at the time the trace session 
 *       is started. When the session starts, the process will verify whether or not it should be generating trace 
 *       messages (based on the presence or absence of a registry key for that process name and optional PID). The 
 *       process checks the registry only at the start of the session. Any changes in the registry occurring after that 
 *       will not have any effect on tracing.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetDcName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ComputerName Pointer to a null-terminated string that specifies the name of the server to process this function. 
 *       Typically, this parameter is <b>NULL</b>, which indicates that the local computer is 
 *       used.
 * @param {PSTR} DomainName Pointer to a null-terminated string that specifies the name of the domain or application partition to 
 *        query. This name can either be a DNS style name, for example, fabrikam.com, or a flat-style name, for example, 
 *        Fabrikam. If a DNS style name is specified, the name may be specified with or without a trailing period.
 * 
 * If the <i>Flags</i> parameter contains the <b>DS_GC_SERVER_REQUIRED</b> 
 *        flag, <i>DomainName</i> must be the name of the forest. In this case, 
 *        <b>DsGetDcName</b> fails if <i>DomainName</i> 
 *        specifies a name that is not the forest root.
 * 
 * If the <i>Flags</i> parameter contains 
 *        the <b>DS_GC_SERVER_REQUIRED</b> flag and <i>DomainName</i> is 
 *        <b>NULL</b>, <b>DsGetDcName</b> attempts to 
 *        find a global catalog in the forest of the computer identified by <i>ComputerName</i>, which 
 *        is the local computer if <i>ComputerName</i> is <b>NULL</b>.
 * 
 * If <i>DomainName</i> is <b>NULL</b> and the 
 *        <i>Flags</i> parameter does not contain the <b>DS_GC_SERVER_REQUIRED</b> 
 *        flag, <i>ComputerName</i> is set to the default domain name of the primary domain of the 
 *        computer identified by <i>ComputerName</i>.
 * @param {Pointer<Guid>} DomainGuid Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that specifies the 
 *     <b>GUID</b> of the domain queried. If <i>DomainGuid</i> is not 
 *   <b>NULL</b> and the domain specified by <i>DomainName</i> or 
 *   <i>ComputerName</i> cannot be found, 
 *   <b>DsGetDcName</b> attempts to locate a domain controller in the 
 *       domain having the GUID specified by <i>DomainGuid</i>.
 * @param {PSTR} SiteName Pointer to a null-terminated string that specifies the name of the site where the returned domain 
 *       controller should physically exist. If this parameter is <b>NULL</b>, 
 *       <b>DsGetDcName</b> attempts to return a domain controller in the 
 *       site closest to the site of the computer specified by <i>ComputerName</i>. This parameter 
 *       should be <b>NULL</b>, by default.
 * @param {Integer} Flags Contains a set of flags that provide additional data used to process the request. This parameter can be a
 * @param {Pointer<Pointer<DOMAIN_CONTROLLER_INFOA>>} DomainControllerInfo Pointer to a <b>PDOMAIN_CONTROLLER_INFO</b> value that receives a pointer to a 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/ns-dsgetdc-domain_controller_infoa">DOMAIN_CONTROLLER_INFO</a> structure that contains 
 *       data  about the domain controller selected. This structure is allocated by 
 *       <b>DsGetDcName</b>. The caller must free the structure using the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function when it is no longer 
 *       required.
 * @returns {Integer} If the function returns domain controller data, the return value is 
 *        <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetdcnamea
 * @since windows6.0.6000
 */
export DsGetDcNameA(ComputerName, DomainName, DomainGuid, SiteName, Flags, DomainControllerInfo) {
    ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName
    DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
    SiteName := SiteName is String ? StrPtr(SiteName) : SiteName

    DomainControllerInfoMarshal := DomainControllerInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsGetDcNameA", "ptr", ComputerName, "ptr", DomainName, Guid.Ptr, DomainGuid, "ptr", SiteName, "uint", Flags, DomainControllerInfoMarshal, DomainControllerInfo, UInt32)
    return result
}

/**
 * Returns the name of a domain controller in a specified domain. (Unicode)
 * @remarks
 * The <b>DsGetDcName</b> function is sent to the Netlogon service 
 *     on the remote computer specified by <i>ComputerName</i>. If 
 *     <i>ComputerName</i> is <b>NULL</b>, the function is processed on the local 
 *     computer.
 * 
 * <b>DsGetDcName</b> does not verify that  the domain controller name 
 *      returned is the name of an actual domain controller or global catalog. If mutual authentication is required, the 
 *      caller must  perform the authentication.
 * 
 * <b>DsGetDcName</b> does not require any particular access to the 
 *      specified domain. By default, this function does not ensure that the returned domain controller is currently 
 *      available. Instead, the caller should attempt to use the returned domain controller. If the domain controller is 
 *      not available, the caller should call the <b>DsGetDcName</b> 
 *      function again, specifying the <b>DS_FORCE_REDISCOVERY</b> flag.
 * 
 * <h3><a id="Response_Time"></a><a id="response_time"></a><a id="RESPONSE_TIME"></a>Response Time</h3>
 * When using <b>DsGetDcName</b> be aware of the following timing 
 *       details:
 * 
 * <ul>
 * <li>
 * <b>DsGetDcName</b> makes network calls and can take from a few 
 *          seconds  up to one minute, depending on network traffic, topology, DC load, and so on.
 * 
 * </li>
 * <li>
 * It is NOT recommended to call <b>DsGetDcName</b> from a UI or 
 *         other timing critical thread.
 * 
 * </li>
 * <li>
 * The DC Locator does use optimized logic to provide the DC information as quickly as possible. It also uses 
 *         cached information at the site to contact the closest DC.
 * 
 * </li>
 * </ul>
 * <h3><a id="Notes_on_Domain_Controller_Stickiness"></a><a id="notes_on_domain_controller_stickiness"></a><a id="NOTES_ON_DOMAIN_CONTROLLER_STICKINESS"></a>Notes on Domain Controller Stickiness</h3>
 * In Active Directory Domain Services, the domain controller locator function is designed so that once a client 
 *       finds a preferred  domain controller, the client will not look for another unless that domain controller stops 
 *       responding or the client is restarted. This is referred to as "Domain Controller Stickiness." Because 
 *       workstations typically operate for months without a problem or restart,   one unintended consequence of this 
 *       behavior is that if a particular domain controller goes down for maintenance, all of the clients that were 
 *       connected to it shift their connections to another domain controller.  But when the domain controller comes back 
 *       up, no  clients ever reconnect to it because the clients do not restart very often.  This can cause 
 *       load-balancing problems.
 * 
 * Previously, the most common solution to this problem was to deploy a script on each client machine that 
 *       periodically called <b>DsGetDcName</b> using the 
 *       <c>DS_FORCE_REDISCOVERY</c> flag. This was a somewhat cumbersome solution, so 
 *       Windows Server 2008 and Windows Vista introduced a new mechanism that caused issues with  domain 
 *       controller stickiness.
 * 
 * Whenever <b>DsGetDcName</b> retrieves a domain controller name 
 *       from its cache, it checks to see if this cached entry is expired, and if so, discards that domain controller 
 *       name and tries to rediscover a domain controller name. The life span of a cached entry is controlled by the 
 *       value in the following registry keys
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SYSTEM</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>Netlogon</b>&#92;<b>Parameters</b>&#92;<b>ForceRediscoveryInterval</b>
 * 
 * 
 * 
 * and
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Policies</b>&#92;<b>Microsoft</b>&#92;<b>Netlogon</b>&#92;<b>Parameters</b>&#92;<b>ForceRediscoveryInterval</b>
 * 
 * 
 * 
 * The values in these registry keys are of type <b>REG_DWORD</b>. They specify the length in 
 *       seconds before <b>DsGetDcName</b> should try to rediscover the 
 *       domain controller name. The default value is 43200 seconds (12 hours).  If the value of the 
 *       <b>ForceRediscoveryInterval</b> registry entry is set to 0, the client always 
 *   performs rediscovery. If the value is set to 4294967295, the cache never expires, and the cached domain controller 
 *   continues to be used. We recommend that you do not set the 
 *   <b>ForceRediscoveryInterval</b> registry entry to a value that is less than 3600 seconds 
 *   (60 minutes).
 * 
 * <div class="alert"><b>Note</b>  The registry settings of <b>ForceRediscoveryInterval</b> are group policy 
 *     enabled. If you disable the policy setting, Force Rediscovery will used by default for the machine at every 12 
 *   hour interval. If you do not configure this policy setting, Force Rediscovery will used by default for the machine 
 *   at every 12 hour interval, unless the local machine setting in the registry is a different value.</div>
 * <div> </div>
 * Note that if the <b>DS_BACKGROUND_ONLY</b> flag is specified, 
 *       <b>DsGetDcName</b> will never try to rediscover the domain 
 *       controller name, since the point of that flag is to force 
 *       <b>DsGetDcName</b> to use the cached domain controller name even 
 *       if it is expired.
 * 
 * <h3><a id="ETW_Tracing_in_DsGetDcName"></a><a id="etw_tracing_in_dsgetdcname"></a><a id="ETW_TRACING_IN_DSGETDCNAME"></a>ETW Tracing in DsGetDcName</h3>
 * To turn on <a href="https://docs.microsoft.com/windows-hardware/drivers/hid/event-tracing">ETW Tracing</a> for 
 *       <b>DsGetDcName</b>, create the following registry key:
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>System</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>DCLocator</b>&#92;<b>Tracing</b>
 * 
 * 
 * 
 * The key will have a structure as follows:
 * 
 * 
 * ```cpp
 * String ProcessName
 *   DWORD  PID <optional>
 * ```
 * 
 * 
 * <i>ProcessName</i> must be the full name including extension of the process that you want 
 *       to get trace information for. <i>PID</i> is only required when multiple processes with the 
 *       same name exist.  If it is defined, then only the process with that PID will be enabled for tracing.  It is not 
 *       possible to trace only 2 out of 3 (or more) processes with the same name.  You can enable one instance or all 
 *       instances (when multiple instances with the same process name exist and PID is not specified, all instances will 
 *       be enabled for tracing).
 * 
 * For example, this would trace all instances of App1.exe and App2.exe, but only the instance of App3.exe that 
 *       has a PID of 999:
 * 
 * 
 * ``` syntax
 * App1.exe 
 * App2.exe
 * App3.exe
 *      PID 999
 * ```
 * 
 * Run the following command to start the tracing session:
 * 
 * <b>tracelog.exe -start &lt;sessionname&gt; -guid #cfaa5446-c6c4-4f5c-866f-31c9b55b962d -f &lt;filename&gt; -flag &lt;traceFlags&gt;</b>
 * 
 * <i>sessionname</i> is the name given for the trace session. The 
 *       <i>guid</i> for the DCLocator tracing provider is 
 *       "cfaa5446-c6c4-4f5c-866f-31c9b55b962d". <i>filename</i> is the name of the 
 *       log file to which the events are written. <i>traceFlags</i> is one or more of the following 
 *       flags which signify which areas to trace:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Hex Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_MISC</b>
 * 
 * </td>
 * <td>
 * 0x00000002
 * 
 * </td>
 * <td>
 * Miscellaneous debugging
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_MAILSLOT</b>
 * 
 * </td>
 * <td>
 * 0x00000010
 * 
 * </td>
 * <td>
 * Mailslot messages
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_SITE</b>
 * 
 * </td>
 * <td>
 * 0x00000020
 * 
 * </td>
 * <td>
 * Sites
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_CRITICAL</b>
 * 
 * </td>
 * <td>
 * 0x00000100
 * 
 * </td>
 * <td>
 * Important errors
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_SESSION_SETUP</b>
 * 
 * </td>
 * <td>
 * 0x00000200
 * 
 * </td>
 * <td>
 * Trusted Domain Maintenance
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_DNS</b>
 * 
 * </td>
 * <td>
 * 0x00004000
 * 
 * </td>
 * <td>
 * Name Registration
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_DNS_MORE</b>
 * 
 * </td>
 * <td>
 * 0x00020000
 * 
 * </td>
 * <td>
 * Verbose Name Registration
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_MAILBOX_TEXT</b>
 * 
 * </td>
 * <td>
 * 0x02000000
 * 
 * </td>
 * <td>
 * Verbose Mailbox Messages
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>DCLOCATOR_SITE_MORE</b>
 * 
 * </td>
 * <td>
 * 0x08000000
 * 
 * </td>
 * <td>
 * Verbose sites
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Run the following command to stop the trace session:
 * 
 * <b>tracelog.exe -stop &lt;sessionname&gt;</b>
 * 
 * <i>sessionname</i> is the same name as the name you used when starting the session.
 * 
 * <div class="alert"><b>Note</b>  The registry key for the process being traced must be present in the registry at the time the trace session 
 *       is started. When the session starts, the process will verify whether or not it should be generating trace 
 *       messages (based on the presence or absence of a registry key for that process name and optional PID). The 
 *       process checks the registry only at the start of the session. Any changes in the registry occurring after that 
 *       will not have any effect on tracing.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetDcName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ComputerName Pointer to a null-terminated string that specifies the name of the server to process this function. 
 *       Typically, this parameter is <b>NULL</b>, which indicates that the local computer is 
 *       used.
 * @param {PWSTR} DomainName Pointer to a null-terminated string that specifies the name of the domain or application partition to 
 *        query. This name can either be a DNS style name, for example, fabrikam.com, or a flat-style name, for example, 
 *        Fabrikam. If a DNS style name is specified, the name may be specified with or without a trailing period.
 * 
 * If the <i>Flags</i> parameter contains the <b>DS_GC_SERVER_REQUIRED</b> 
 *        flag, <i>DomainName</i> must be the name of the forest. In this case, 
 *        <b>DsGetDcName</b> fails if <i>DomainName</i> 
 *        specifies a name that is not the forest root.
 * 
 * If the <i>Flags</i> parameter contains 
 *        the <b>DS_GC_SERVER_REQUIRED</b> flag and <i>DomainName</i> is 
 *        <b>NULL</b>, <b>DsGetDcName</b> attempts to 
 *        find a global catalog in the forest of the computer identified by <i>ComputerName</i>, which 
 *        is the local computer if <i>ComputerName</i> is <b>NULL</b>.
 * 
 * If <i>DomainName</i> is <b>NULL</b> and the 
 *        <i>Flags</i> parameter does not contain the <b>DS_GC_SERVER_REQUIRED</b> 
 *        flag, <i>ComputerName</i> is set to the default domain name of the primary domain of the 
 *        computer identified by <i>ComputerName</i>.
 * @param {Pointer<Guid>} DomainGuid Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that specifies the 
 *     <b>GUID</b> of the domain queried. If <i>DomainGuid</i> is not 
 *   <b>NULL</b> and the domain specified by <i>DomainName</i> or 
 *   <i>ComputerName</i> cannot be found, 
 *   <b>DsGetDcName</b> attempts to locate a domain controller in the 
 *       domain having the GUID specified by <i>DomainGuid</i>.
 * @param {PWSTR} SiteName Pointer to a null-terminated string that specifies the name of the site where the returned domain 
 *       controller should physically exist. If this parameter is <b>NULL</b>, 
 *       <b>DsGetDcName</b> attempts to return a domain controller in the 
 *       site closest to the site of the computer specified by <i>ComputerName</i>. This parameter 
 *       should be <b>NULL</b>, by default.
 * @param {Integer} Flags Contains a set of flags that provide additional data used to process the request. This parameter can be a
 * @param {Pointer<Pointer<DOMAIN_CONTROLLER_INFOW>>} DomainControllerInfo Pointer to a <b>PDOMAIN_CONTROLLER_INFO</b> value that receives a pointer to a 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/ns-dsgetdc-domain_controller_infoa">DOMAIN_CONTROLLER_INFO</a> structure that contains 
 *       data  about the domain controller selected. This structure is allocated by 
 *       <b>DsGetDcName</b>. The caller must free the structure using the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function when it is no longer 
 *       required.
 * @returns {Integer} If the function returns domain controller data, the return value is 
 *        <b>ERROR_SUCCESS</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetdcnamew
 * @since windows6.0.6000
 */
export DsGetDcNameW(ComputerName, DomainName, DomainGuid, SiteName, Flags, DomainControllerInfo) {
    ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName
    DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
    SiteName := SiteName is String ? StrPtr(SiteName) : SiteName

    DomainControllerInfoMarshal := DomainControllerInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsGetDcNameW", "ptr", ComputerName, "ptr", DomainName, Guid.Ptr, DomainGuid, "ptr", SiteName, "uint", Flags, DomainControllerInfoMarshal, DomainControllerInfo, UInt32)
    return result
}

/**
 * The DsGetSiteName function returns the name of the site where a computer resides. (ANSI)
 * @remarks
 * The <b>DsGetSiteName</b> function does not require any particular access to the specified domain. The function is sent to the "NetLogon" service on the computer specified by <i>ComputerName</i>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetSiteName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ComputerName Pointer to a null-terminated string that specifies the name of the server to send this function. A <b>NULL</b> implies the local computer.
 * @param {Pointer<PSTR>} SiteName Pointer to a variable that receives a pointer to a null-terminated string specifying the site location of this computer. This string is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
 * @returns {Integer} If the function returns account information, the return value is <b>NO_ERROR</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetsitenamea
 * @since windows6.0.6000
 */
export DsGetSiteNameA(ComputerName, SiteName) {
    ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

    SiteNameMarshal := SiteName is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsGetSiteNameA", "ptr", ComputerName, SiteNameMarshal, SiteName, UInt32)
    return result
}

/**
 * The DsGetSiteName function returns the name of the site where a computer resides. (Unicode)
 * @remarks
 * The <b>DsGetSiteName</b> function does not require any particular access to the specified domain. The function is sent to the "NetLogon" service on the computer specified by <i>ComputerName</i>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetSiteName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ComputerName Pointer to a null-terminated string that specifies the name of the server to send this function. A <b>NULL</b> implies the local computer.
 * @param {Pointer<PWSTR>} SiteName Pointer to a variable that receives a pointer to a null-terminated string specifying the site location of this computer. This string is allocated by the system and must be freed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
 * @returns {Integer} If the function returns account information, the return value is <b>NO_ERROR</b>.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetsitenamew
 * @since windows6.0.6000
 */
export DsGetSiteNameW(ComputerName, SiteName) {
    ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

    SiteNameMarshal := SiteName is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsGetSiteNameW", "ptr", ComputerName, SiteNameMarshal, SiteName, UInt32)
    return result
}

/**
 * The DsValidateSubnetName function validates a subnet name in the form xxx.xxx.xxx.xxx/YY. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsValidateSubnetName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} SubnetName Pointer to a null-terminated string that specifies the name of the subnet to validate.
 * @returns {Integer} If the function returns account information, the return value is <b>NO_ERROR</b>.
 * 
 * If the function fails, the return value is the following error code.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsvalidatesubnetnamew
 * @since windows6.0.6000
 */
export DsValidateSubnetNameW(SubnetName) {
    SubnetName := SubnetName is String ? StrPtr(SubnetName) : SubnetName

    result := DllCall("NETAPI32.dll\DsValidateSubnetNameW", "ptr", SubnetName, UInt32)
    return result
}

/**
 * The DsValidateSubnetName function validates a subnet name in the form xxx.xxx.xxx.xxx/YY. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsValidateSubnetName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} SubnetName Pointer to a null-terminated string that specifies the name of the subnet to validate.
 * @returns {Integer} If the function returns account information, the return value is <b>NO_ERROR</b>.
 * 
 * If the function fails, the return value is the following error code.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsvalidatesubnetnamea
 * @since windows6.0.6000
 */
export DsValidateSubnetNameA(SubnetName) {
    SubnetName := SubnetName is String ? StrPtr(SubnetName) : SubnetName

    result := DllCall("NETAPI32.dll\DsValidateSubnetNameA", "ptr", SubnetName, UInt32)
    return result
}

/**
 * Obtains the site names corresponding to the specified addresses. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsAddressToSiteNames as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ComputerName Pointer to a null-terminated string that specifies the name of the remote server to process this function. This parameter must be the name of a domain controller. A non-domain controller can call this function by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to find the domain controller.
 * @param {Integer} EntryCount Contains the number of elements in the <i>SocketAddresses</i> array.
 * @param {Pointer<SOCKET_ADDRESS>} SocketAddresses Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that contain the addresses to convert. Each address in this array must be of the type <b>AF_INET</b>. <i>EntryCount</i> contains the number of elements in this array.
 * @param {Pointer<Pointer<PWSTR>>} SiteNames Receives an array of null-terminated string pointers that contain the site names for the addresses. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address does not map to any known site or if the address entry is not of the proper form. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 or RPC error otherwise. The following list lists possible error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsaddresstositenamesw
 * @since windows6.0.6000
 */
export DsAddressToSiteNamesW(ComputerName, EntryCount, SocketAddresses, SiteNames) {
    ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

    SiteNamesMarshal := SiteNames is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsAddressToSiteNamesW", "ptr", ComputerName, "uint", EntryCount, SOCKET_ADDRESS.Ptr, SocketAddresses, SiteNamesMarshal, SiteNames, UInt32)
    return result
}

/**
 * Obtains the site names corresponding to the specified addresses. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsAddressToSiteNames as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ComputerName Pointer to a null-terminated string that specifies the name of the remote server to process this function. This parameter must be the name of a domain controller. A non-domain controller can call this function by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to find the domain controller.
 * @param {Integer} EntryCount Contains the number of elements in the <i>SocketAddresses</i> array.
 * @param {Pointer<SOCKET_ADDRESS>} SocketAddresses Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that contain the addresses to convert. Each address in this array must be of the type <b>AF_INET</b>. <i>EntryCount</i> contains the number of elements in this array.
 * @param {Pointer<Pointer<PSTR>>} SiteNames Receives an array of null-terminated string pointers that contain the site names for the addresses. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address does not map to any known site or if the address entry is not of the proper form. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 or RPC error otherwise. The following list lists possible error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsaddresstositenamesa
 * @since windows6.0.6000
 */
export DsAddressToSiteNamesA(ComputerName, EntryCount, SocketAddresses, SiteNames) {
    ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

    SiteNamesMarshal := SiteNames is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsAddressToSiteNamesA", "ptr", ComputerName, "uint", EntryCount, SOCKET_ADDRESS.Ptr, SocketAddresses, SiteNamesMarshal, SiteNames, UInt32)
    return result
}

/**
 * Obtains the site and subnet names corresponding to the addresses specified. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsAddressToSiteNamesEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ComputerName Pointer to a null-terminated string that specifies the name of the remote server to process this function. This parameter must be the name of a domain controller. A non-domain controller can call this function by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to find the domain controller.
 * @param {Integer} EntryCount Contains the number of elements in the <i>SocketAddresses</i> array.
 * @param {Pointer<SOCKET_ADDRESS>} SocketAddresses Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that contain the addresses to convert. Each address in this array must be of the type <b>AF_INET</b>. <i>EntryCount</i> contains the number of elements in this array.
 * @param {Pointer<Pointer<PWSTR>>} SiteNames Receives an array of null-terminated string pointers that contain the site names for the addresses. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address does not map to any known site or if the address entry is not of the proper form. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @param {Pointer<Pointer<PWSTR>>} SubnetNames Receives an array of null-terminated string pointers that contain the subnet names used to perform the address to site name mappings. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address to site name mapping was not determined or if no subnet was used to perform the
 *         corresponding address to site mapping. The latter will be the case when there is exactly
 *         one site in the enterprise with no subnet objects mapped to it. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 or RPC error otherwise. The following are possible error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsaddresstositenamesexw
 * @since windows6.0.6000
 */
export DsAddressToSiteNamesExW(ComputerName, EntryCount, SocketAddresses, SiteNames, SubnetNames) {
    ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

    SiteNamesMarshal := SiteNames is VarRef ? "ptr*" : "ptr"
    SubnetNamesMarshal := SubnetNames is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsAddressToSiteNamesExW", "ptr", ComputerName, "uint", EntryCount, SOCKET_ADDRESS.Ptr, SocketAddresses, SiteNamesMarshal, SiteNames, SubnetNamesMarshal, SubnetNames, UInt32)
    return result
}

/**
 * Obtains the site and subnet names corresponding to the addresses specified. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsAddressToSiteNamesEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ComputerName Pointer to a null-terminated string that specifies the name of the remote server to process this function. This parameter must be the name of a domain controller. A non-domain controller can call this function by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to find the domain controller.
 * @param {Integer} EntryCount Contains the number of elements in the <i>SocketAddresses</i> array.
 * @param {Pointer<SOCKET_ADDRESS>} SocketAddresses Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that contain the addresses to convert. Each address in this array must be of the type <b>AF_INET</b>. <i>EntryCount</i> contains the number of elements in this array.
 * @param {Pointer<Pointer<PSTR>>} SiteNames Receives an array of null-terminated string pointers that contain the site names for the addresses. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address does not map to any known site or if the address entry is not of the proper form. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @param {Pointer<Pointer<PSTR>>} SubnetNames Receives an array of null-terminated string pointers that contain the subnet names used to perform the address to site name mappings. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address to site name mapping was not determined or if no subnet was used to perform the
 *         corresponding address to site mapping. The latter will be the case when there is exactly
 *         one site in the enterprise with no subnet objects mapped to it. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 or RPC error otherwise. The following are possible error codes.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsaddresstositenamesexa
 * @since windows6.0.6000
 */
export DsAddressToSiteNamesExA(ComputerName, EntryCount, SocketAddresses, SiteNames, SubnetNames) {
    ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

    SiteNamesMarshal := SiteNames is VarRef ? "ptr*" : "ptr"
    SubnetNamesMarshal := SubnetNames is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsAddressToSiteNamesExA", "ptr", ComputerName, "uint", EntryCount, SOCKET_ADDRESS.Ptr, SocketAddresses, SiteNamesMarshal, SiteNames, SubnetNamesMarshal, SubnetNames, UInt32)
    return result
}

/**
 * Obtains domain trust data for a specified domain. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsEnumerateDomainTrusts as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ServerName Pointer to a null-terminated string that specifies the name of a computer in the domain to obtain the trust information for. If this parameter is <b>NULL</b>, the name of the local computer is used. The caller must be an authenticated user in this domain.
 * 
 * If this computer is a domain controller, this function returns the trust data immediately. If this computer is not a domain controller, this function  obtains the trust data  from cached data if the cached data is not expired. If the cached data is expired, this function obtains the trust data from a domain controller in the domain that this computer is a member of and updates the cache. The cached data automatically expires after five minutes.
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<DS_DOMAIN_TRUSTSW>>} Domains Pointer to a <b>PDS_DOMAIN_TRUSTS</b> value that receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/ns-dsgetdc-ds_domain_trustsa">DS_DOMAIN_TRUSTS</a> structures. Each structure in this array contains trust data about a domain. The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @param {Pointer<Integer>} DomainCount Pointer to a <b>ULONG</b> value that receives the number of elements returned in the <i>Domains</i> array.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error code otherwise. Possible error codes include those listed in the following list.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsw
 * @since windows6.0.6000
 */
export DsEnumerateDomainTrustsW(ServerName, Flags, Domains, DomainCount) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

    DomainsMarshal := Domains is VarRef ? "ptr*" : "ptr"
    DomainCountMarshal := DomainCount is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\DsEnumerateDomainTrustsW", "ptr", ServerName, "uint", Flags, DomainsMarshal, Domains, DomainCountMarshal, DomainCount, UInt32)
    return result
}

/**
 * Obtains domain trust data for a specified domain. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsEnumerateDomainTrusts as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ServerName Pointer to a null-terminated string that specifies the name of a computer in the domain to obtain the trust information for. If this parameter is <b>NULL</b>, the name of the local computer is used. The caller must be an authenticated user in this domain.
 * 
 * If this computer is a domain controller, this function returns the trust data immediately. If this computer is not a domain controller, this function  obtains the trust data  from cached data if the cached data is not expired. If the cached data is expired, this function obtains the trust data from a domain controller in the domain that this computer is a member of and updates the cache. The cached data automatically expires after five minutes.
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<DS_DOMAIN_TRUSTSA>>} Domains Pointer to a <b>PDS_DOMAIN_TRUSTS</b> value that receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/ns-dsgetdc-ds_domain_trustsa">DS_DOMAIN_TRUSTS</a> structures. Each structure in this array contains trust data about a domain. The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @param {Pointer<Integer>} DomainCount Pointer to a <b>ULONG</b> value that receives the number of elements returned in the <i>Domains</i> array.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error code otherwise. Possible error codes include those listed in the following list.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsa
 * @since windows6.0.6000
 */
export DsEnumerateDomainTrustsA(ServerName, Flags, Domains, DomainCount) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

    DomainsMarshal := Domains is VarRef ? "ptr*" : "ptr"
    DomainCountMarshal := DomainCount is VarRef ? "uint*" : "ptr"

    result := DllCall("NETAPI32.dll\DsEnumerateDomainTrustsA", "ptr", ServerName, "uint", Flags, DomainsMarshal, Domains, DomainCountMarshal, DomainCount, UInt32)
    return result
}

/**
 * Obtains forest trust data for a specified domain.
 * @param {PWSTR} ServerName Contains the name of the domain controller that <b>DsGetForestTrustInformationW</b> is connected to remotely.
 *         The caller must be an authenticated user on this server.
 *         If this parameter is <b>NULL</b>, the local server is used.
 * @param {PWSTR} TrustedDomainName Contains the NETBIOS or DNS name of the trusted domain that the forest trust data
 *         is to be retrieved for.  This domain must have  the
 *         <b>TRUST_ATTRIBUTE_FOREST_TRANSITIVE</b> trust attribute. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a>.
 * 
 * If this parameter is <b>NULL</b>, the forest trust
 *         data for the domain hosted by <i>ServerName</i> is retrieved.
 * @param {Integer} Flags Contains a set of flags that modify the behavior of this function. This can be zero or the following value.
 * @param {Pointer<Pointer<LSA_FOREST_TRUST_INFORMATION>>} ForestTrustInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_information">LSA_FOREST_TRUST_INFORMATION</a> structure pointer that receives the forest trust data that describes the namespaces claimed by the
 *         domain specified by <i>TrustedDomainName</i>. The <b>Time</b> member of all returned records will be zero.
 * 
 * The caller must free this structure when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 error code otherwise. Possible error codes include the following.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetforesttrustinformationw
 * @since windows6.0.6000
 */
export DsGetForestTrustInformationW(ServerName, TrustedDomainName, Flags, ForestTrustInfo) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    TrustedDomainName := TrustedDomainName is String ? StrPtr(TrustedDomainName) : TrustedDomainName

    ForestTrustInfoMarshal := ForestTrustInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsGetForestTrustInformationW", "ptr", ServerName, "ptr", TrustedDomainName, "uint", Flags, ForestTrustInfoMarshal, ForestTrustInfo, UInt32)
    return result
}

/**
 * Merges the changes from a new forest trust data structure with an old forest trust data structure.
 * @param {PWSTR} DomainName Pointer to a null-terminated Unicode string that specifies the trusted domain to  update.
 * @param {Pointer<LSA_FOREST_TRUST_INFORMATION>} NewForestTrustInfo Pointer to an <b>LSA_FOREST_TRUST_INFORMATION</b> structure that contains the new forest trust data to be merged.
 *         The <b>Flags</b> and <b>Time</b> members of the entries are ignored.
 * @param {Pointer<LSA_FOREST_TRUST_INFORMATION>} OldForestTrustInfo Pointer to an <b>LSA_FOREST_TRUST_INFORMATION</b> structure that contains the old forest trust data to be merged.
 *         This parameter may be <b>NULL</b> if no records exist.
 * @param {Pointer<Pointer<LSA_FOREST_TRUST_INFORMATION>>} MergedForestTrustInfo Pointer to an <b>LSA_FOREST_TRUST_INFORMATION</b> structure pointer that receives the merged forest trust data.
 * 
 * The caller must free this structure when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Windows error code otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsmergeforesttrustinformationw
 * @since windows6.0.6000
 */
export DsMergeForestTrustInformationW(DomainName, NewForestTrustInfo, OldForestTrustInfo, MergedForestTrustInfo) {
    DomainName := DomainName is String ? StrPtr(DomainName) : DomainName

    MergedForestTrustInfoMarshal := MergedForestTrustInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsMergeForestTrustInformationW", "ptr", DomainName, LSA_FOREST_TRUST_INFORMATION.Ptr, NewForestTrustInfo, LSA_FOREST_TRUST_INFORMATION.Ptr, OldForestTrustInfo, MergedForestTrustInfoMarshal, MergedForestTrustInfo, UInt32)
    return result
}

/**
 * The DsGetDcSiteCoverage function returns the site names of all sites covered by a domain controller. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetDcSiteCoverage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ServerName The null-terminated string value that specifies the name of the remote domain controller.
 * @param {Pointer<Integer>} EntryCount Pointer to a <b>ULONG</b> value that receives  the number of sites covered by the domain controller.
 * @param {Pointer<Pointer<PWSTR>>} SiteNames Pointer to an array of pointers to null-terminated strings that receives the site names. To free the returned buffer, call the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
 * @returns {Integer} This function returns DSGETDCAPI DWORD.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetdcsitecoveragew
 * @since windows6.0.6000
 */
export DsGetDcSiteCoverageW(ServerName, EntryCount, SiteNames) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

    EntryCountMarshal := EntryCount is VarRef ? "uint*" : "ptr"
    SiteNamesMarshal := SiteNames is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsGetDcSiteCoverageW", "ptr", ServerName, EntryCountMarshal, EntryCount, SiteNamesMarshal, SiteNames, UInt32)
    return result
}

/**
 * The DsGetDcSiteCoverage function returns the site names of all sites covered by a domain controller. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetDcSiteCoverage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ServerName The null-terminated string value that specifies the name of the remote domain controller.
 * @param {Pointer<Integer>} EntryCount Pointer to a <b>ULONG</b> value that receives  the number of sites covered by the domain controller.
 * @param {Pointer<Pointer<PSTR>>} SiteNames Pointer to an array of pointers to null-terminated strings that receives the site names. To free the returned buffer, call the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
 * @returns {Integer} This function returns DSGETDCAPI DWORD.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetdcsitecoveragea
 * @since windows6.0.6000
 */
export DsGetDcSiteCoverageA(ServerName, EntryCount, SiteNames) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

    EntryCountMarshal := EntryCount is VarRef ? "uint*" : "ptr"
    SiteNamesMarshal := SiteNames is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsGetDcSiteCoverageA", "ptr", ServerName, EntryCountMarshal, EntryCount, SiteNamesMarshal, SiteNames, UInt32)
    return result
}

/**
 * The DsDeregisterDnsHostRecords function deletes DNS entries, except for type A records registered by a domain controller. Only an administrator, account operator, or server operator may call this function. (Unicode)
 * @remarks
 * This function deregisters SRV and CNAME records only. It leaves type A records intact. Deletion of site specific records, for example, _ldap._tcp._&lt;SiteName&gt;._sites.dc._msdcs.&lt;DnsDomainName&gt;, is attempted for every site (&lt;SiteName&gt; in this example) in the enterprise of the domain controller on which the function is executed. Therefore, this function call could create a time-consuming run and may generate significant network traffic for enterprises with many sites.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsgetdc.h header defines DsDeregisterDnsHostRecords as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ServerName The null-terminated string that specifies the name of the remote domain controller. Can be set to <b>NULL</b> if the calling application is running on the domain controller being updated.
 * @param {PWSTR} DnsDomainName The null-terminated string that specifies the DNS domain name of the domain occupied by the domain controller. It is unnecessary for this to be a domain hosted by this domain controller. If <b>NULL</b>, the <i>DnsHostName</i> with the leftmost label removed is specified.
 * @param {Pointer<Guid>} DomainGuid Pointer to the Domain GUID of the domain. If <b>NULL</b>, GUID specific names are not removed.
 * @param {Pointer<Guid>} DsaGuid Pointer to the GUID of the <b>NTDS-DSA</b> object to be deleted. If <b>NULL</b>, <b>NTDS-DSA</b> specific names are not removed.
 * @param {PWSTR} DnsHostName Pointer to the null-terminated string that specifies the DNS host name of the domain controller whose DNS records are being deleted.
 * @returns {Integer} This function returns DSGETDCAPI DWORD.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsderegisterdnshostrecordsw
 * @since windows6.0.6000
 */
export DsDeregisterDnsHostRecordsW(ServerName, DnsDomainName, DomainGuid, DsaGuid, DnsHostName) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
    DnsHostName := DnsHostName is String ? StrPtr(DnsHostName) : DnsHostName

    result := DllCall("NETAPI32.dll\DsDeregisterDnsHostRecordsW", "ptr", ServerName, "ptr", DnsDomainName, Guid.Ptr, DomainGuid, Guid.Ptr, DsaGuid, "ptr", DnsHostName, UInt32)
    return result
}

/**
 * The DsDeregisterDnsHostRecords function deletes DNS entries, except for type A records registered by a domain controller. Only an administrator, account operator, or server operator may call this function. (ANSI)
 * @remarks
 * This function deregisters SRV and CNAME records only. It leaves type A records intact. Deletion of site specific records, for example, _ldap._tcp._&lt;SiteName&gt;._sites.dc._msdcs.&lt;DnsDomainName&gt;, is attempted for every site (&lt;SiteName&gt; in this example) in the enterprise of the domain controller on which the function is executed. Therefore, this function call could create a time-consuming run and may generate significant network traffic for enterprises with many sites.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsgetdc.h header defines DsDeregisterDnsHostRecords as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ServerName The null-terminated string that specifies the name of the remote domain controller. Can be set to <b>NULL</b> if the calling application is running on the domain controller being updated.
 * @param {PSTR} DnsDomainName The null-terminated string that specifies the DNS domain name of the domain occupied by the domain controller. It is unnecessary for this to be a domain hosted by this domain controller. If <b>NULL</b>, the <i>DnsHostName</i> with the leftmost label removed is specified.
 * @param {Pointer<Guid>} DomainGuid Pointer to the Domain GUID of the domain. If <b>NULL</b>, GUID specific names are not removed.
 * @param {Pointer<Guid>} DsaGuid Pointer to the GUID of the <b>NTDS-DSA</b> object to be deleted. If <b>NULL</b>, <b>NTDS-DSA</b> specific names are not removed.
 * @param {PSTR} DnsHostName Pointer to the null-terminated string that specifies the DNS host name of the domain controller whose DNS records are being deleted.
 * @returns {Integer} This function returns DSGETDCAPI DWORD.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsderegisterdnshostrecordsa
 * @since windows6.0.6000
 */
export DsDeregisterDnsHostRecordsA(ServerName, DnsDomainName, DomainGuid, DsaGuid, DnsHostName) {
    ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
    DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
    DnsHostName := DnsHostName is String ? StrPtr(DnsHostName) : DnsHostName

    result := DllCall("NETAPI32.dll\DsDeregisterDnsHostRecordsA", "ptr", ServerName, "ptr", DnsDomainName, Guid.Ptr, DomainGuid, Guid.Ptr, DsaGuid, "ptr", DnsHostName, UInt32)
    return result
}

/**
 * Opens a new domain controller enumeration operation. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetDcOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} DnsName Pointer to a null-terminated string that contains the domain naming system (DNS) name of the domain to enumerate the domain controllers for. This parameter cannot be <b>NULL</b>.
 * @param {Integer} OptionFlags 
 * @param {PWSTR} SiteName Pointer to a null-terminated string that contains the name of site the client is in. This parameter is optional and may be <b>NULL</b>.
 * @param {Pointer<Guid>} DomainGuid Pointer to a <b>GUID</b> value that contains the identifier of the domain specified by <i>DnsName</i>.
 *         This identifier is used to handle the case of a renamed domain.  If this
 *         value is specified and the domain specified in <i>DnsName</i> is renamed, this function attempts to enumerate domain controllers in the domain that contains the specified identifier. This parameter is optional and may be <b>NULL</b>.
 * @param {PWSTR} DnsForestName Pointer to a null-terminated string that contains the name of the forest that contains the <i>DnsName</i> domain.  This value is used in conjunction with <i>DomainGuid</i> to enumerate the domain controllers if the  domain has been renamed. This parameter is optional and may be <b>NULL</b>.
 * @param {Integer} DcFlags 
 * @param {Pointer<HANDLE>} RetGetDcContext Pointer to a <b>HANDLE</b> value that receives the domain controller enumeration context handle. This handle is used with the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnexta">DsGetDcNext</a> function to identify the domain controller enumeration operation. This handle is passed to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcclosew">DsGetDcClose</a> to close the domain controller enumeration operation.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise. Possible error values include the following.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetdcopenw
 * @since windows6.0.6000
 */
export DsGetDcOpenW(DnsName, OptionFlags, SiteName, DomainGuid, DnsForestName, DcFlags, RetGetDcContext) {
    DnsName := DnsName is String ? StrPtr(DnsName) : DnsName
    SiteName := SiteName is String ? StrPtr(SiteName) : SiteName
    DnsForestName := DnsForestName is String ? StrPtr(DnsForestName) : DnsForestName

    result := DllCall("NETAPI32.dll\DsGetDcOpenW", "ptr", DnsName, "uint", OptionFlags, "ptr", SiteName, Guid.Ptr, DomainGuid, "ptr", DnsForestName, "uint", DcFlags, HANDLE.Ptr, RetGetDcContext, UInt32)
    return result
}

/**
 * Opens a new domain controller enumeration operation. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetDcOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} DnsName Pointer to a null-terminated string that contains the domain naming system (DNS) name of the domain to enumerate the domain controllers for. This parameter cannot be <b>NULL</b>.
 * @param {Integer} OptionFlags 
 * @param {PSTR} SiteName Pointer to a null-terminated string that contains the name of site the client is in. This parameter is optional and may be <b>NULL</b>.
 * @param {Pointer<Guid>} DomainGuid Pointer to a <b>GUID</b> value that contains the identifier of the domain specified by <i>DnsName</i>.
 *         This identifier is used to handle the case of a renamed domain.  If this
 *         value is specified and the domain specified in <i>DnsName</i> is renamed, this function attempts to enumerate domain controllers in the domain that contains the specified identifier. This parameter is optional and may be <b>NULL</b>.
 * @param {PSTR} DnsForestName Pointer to a null-terminated string that contains the name of the forest that contains the <i>DnsName</i> domain.  This value is used in conjunction with <i>DomainGuid</i> to enumerate the domain controllers if the  domain has been renamed. This parameter is optional and may be <b>NULL</b>.
 * @param {Integer} DcFlags 
 * @param {Pointer<HANDLE>} RetGetDcContext Pointer to a <b>HANDLE</b> value that receives the domain controller enumeration context handle. This handle is used with the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnexta">DsGetDcNext</a> function to identify the domain controller enumeration operation. This handle is passed to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcclosew">DsGetDcClose</a> to close the domain controller enumeration operation.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise. Possible error values include the following.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetdcopena
 * @since windows6.0.6000
 */
export DsGetDcOpenA(DnsName, OptionFlags, SiteName, DomainGuid, DnsForestName, DcFlags, RetGetDcContext) {
    DnsName := DnsName is String ? StrPtr(DnsName) : DnsName
    SiteName := SiteName is String ? StrPtr(SiteName) : SiteName
    DnsForestName := DnsForestName is String ? StrPtr(DnsForestName) : DnsForestName

    result := DllCall("NETAPI32.dll\DsGetDcOpenA", "ptr", DnsName, "uint", OptionFlags, "ptr", SiteName, Guid.Ptr, DomainGuid, "ptr", DnsForestName, "uint", DcFlags, HANDLE.Ptr, RetGetDcContext, UInt32)
    return result
}

/**
 * Retrieves the next domain controller in a domain controller enumeration operation. (Unicode)
 * @remarks
 * To reset the enumeration, close the current enumeration by calling <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcclosew">DsGetDcClose</a> and then reopen the enumeration by calling <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> again.
 * 
 * The DC returned by <b>DsGetDcNext</b> will not be a Read-only DC (RODC) because those DCs only register site-specific and CName records, and both <b>DsGetDcNext</b> and <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> look for DNS SRV records.
 * 
 * The following procedure shows how to get a complete DC list from a computer running Windows Server 2008.
 * 
 * <p class="proch"><b>To obtain a complete list of domain controllers</b>
 * 
 * <ol>
 * <li>Use <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to get a domain controller name.</li>
 * <li>Use <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> to connect to that domain controller.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfoa">DsGetDomainControllerInfo</a> with InfoLevel 3 (<b>DS_DOMAIN_CONTROLLER_INFO_3</b>) to get the complete list, including RODCs.</li>
 * </ol>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetDcNext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} GetDcContextHandle Contains the domain controller enumeration context handle provided by the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> function.
 * @param {Pointer<Integer>} SockAddressCount Pointer to a <b>ULONG</b> value that receives the number of elements in the <i>SockAddresses</i> array.
 *         If this parameter is <b>NULL</b>, socket addresses are not retrieved.
 * @param {Pointer<Pointer<SOCKET_ADDRESS>>} SockAddresses Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that receives the socket address data for the domain controller. <i>SockAddressCount</i> receives the number of elements in this array.
 * 
 * All returned addresses will be of type <b>AF_INET</b> or <b>AF_INET6</b>.
 *         The <b>sin_port</b> member contains the port from the server record.
 *             A port of 0 indicates no port is available from DNS.
 * 
 * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
 * 
 * This parameter is ignored if <i>SockAddressCount</i> is <b>NULL</b>.
 * @param {Pointer<PWSTR>} DnsHostName Pointer to a string pointer that receives the DNS name of the domain controller.
 *         This parameter receives <b>NULL</b> if no host name is known. The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise. Possible error values include the following.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetdcnextw
 * @since windows6.0.6000
 */
export DsGetDcNextW(GetDcContextHandle, SockAddressCount, SockAddresses, DnsHostName) {
    SockAddressCountMarshal := SockAddressCount is VarRef ? "uint*" : "ptr"
    SockAddressesMarshal := SockAddresses is VarRef ? "ptr*" : "ptr"
    DnsHostNameMarshal := DnsHostName is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsGetDcNextW", HANDLE, GetDcContextHandle, SockAddressCountMarshal, SockAddressCount, SockAddressesMarshal, SockAddresses, DnsHostNameMarshal, DnsHostName, UInt32)
    return result
}

/**
 * Retrieves the next domain controller in a domain controller enumeration operation. (ANSI)
 * @remarks
 * To reset the enumeration, close the current enumeration by calling <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcclosew">DsGetDcClose</a> and then reopen the enumeration by calling <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> again.
 * 
 * The DC returned by <b>DsGetDcNext</b> will not be a Read-only DC (RODC) because those DCs only register site-specific and CName records, and both <b>DsGetDcNext</b> and <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> look for DNS SRV records.
 * 
 * The following procedure shows how to get a complete DC list from a computer running Windows Server 2008.
 * 
 * <p class="proch"><b>To obtain a complete list of domain controllers</b>
 * 
 * <ol>
 * <li>Use <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to get a domain controller name.</li>
 * <li>Use <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> to connect to that domain controller.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfoa">DsGetDomainControllerInfo</a> with InfoLevel 3 (<b>DS_DOMAIN_CONTROLLER_INFO_3</b>) to get the complete list, including RODCs.</li>
 * </ol>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dsgetdc.h header defines DsGetDcNext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} GetDcContextHandle Contains the domain controller enumeration context handle provided by the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> function.
 * @param {Pointer<Integer>} SockAddressCount Pointer to a <b>ULONG</b> value that receives the number of elements in the <i>SockAddresses</i> array.
 *         If this parameter is <b>NULL</b>, socket addresses are not retrieved.
 * @param {Pointer<Pointer<SOCKET_ADDRESS>>} SockAddresses Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that receives the socket address data for the domain controller. <i>SockAddressCount</i> receives the number of elements in this array.
 * 
 * All returned addresses will be of type <b>AF_INET</b> or <b>AF_INET6</b>.
 *         The <b>sin_port</b> member contains the port from the server record.
 *             A port of 0 indicates no port is available from DNS.
 * 
 * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
 * 
 * This parameter is ignored if <i>SockAddressCount</i> is <b>NULL</b>.
 * @param {Pointer<PSTR>} DnsHostName Pointer to a string pointer that receives the DNS name of the domain controller.
 *         This parameter receives <b>NULL</b> if no host name is known. The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise. Possible error values include the following.
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetdcnexta
 * @since windows6.0.6000
 */
export DsGetDcNextA(GetDcContextHandle, SockAddressCount, SockAddresses, DnsHostName) {
    SockAddressCountMarshal := SockAddressCount is VarRef ? "uint*" : "ptr"
    SockAddressesMarshal := SockAddresses is VarRef ? "ptr*" : "ptr"
    DnsHostNameMarshal := DnsHostName is VarRef ? "ptr*" : "ptr"

    result := DllCall("NETAPI32.dll\DsGetDcNextA", HANDLE, GetDcContextHandle, SockAddressCountMarshal, SockAddressCount, SockAddressesMarshal, SockAddresses, DnsHostNameMarshal, DnsHostName, UInt32)
    return result
}

/**
 * Closes a domain controller enumeration operation.
 * @remarks
 * When this function is called, <i>GetDcContextHandle</i> is invalid and cannot be used.
 * @param {HANDLE} GetDcContextHandle Contains the domain controller enumeration context handle provided by the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> function.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/nf-dsgetdc-dsgetdcclosew
 * @since windows6.0.6000
 */
export DsGetDcCloseW(GetDcContextHandle) {
    DllCall("NETAPI32.dll\DsGetDcCloseW", HANDLE, GetDcContextHandle)
}

;@endregion Functions
