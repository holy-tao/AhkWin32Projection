#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsOpenDSObject interface is designed to supply a security context for binding to an object in the underlying directory store.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsopendsobject
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsOpenDSObject extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsOpenDSObject
     * @type {Guid}
     */
    static IID => Guid("{ddf2891e-0f9c-11d0-8ad4-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenDSObject"]

    /**
     * Binds to an ADSI object, using the given credentials, and retrieves an IDispatch pointer to the specified object.
     * @remarks
     * This method should not be used just to validate user credentials. 
     * 
     * When <i>lnReserved</i> is set, the behavior of <b>OpenDSObject</b> depends on the provider it connects to. High security namespaces may ignore these flags and always require authentication.
     * 
     * The <b>IADsOpenDSObject::OpenDSObject</b> method maintains the authenticated and encrypted user credentials in the cache. Cached credentials may be used in subsequent operations for binding to any other directory objects. The ADSI client applications should not cache the credentials supplied by the user. Instead, they should rely on ADSI infrastructure to perform  caching. To use the cached credentials, <i>lpszPassword</i> and <i>lpszUserName</i> must remain unchanged in any subsequent calls of <b>OpenDSObject</b>. The following code example shows this operation.
     * 
     * 
     * ```vb
     * Dim dso As IADsOpenDSObject
     * Dim obj1, obj2 As IADs
     * Dim szUsername As String
     * Dim szPassword As String
     * 
     * Set dso = GetObject("LDAP:")
     * 
     * ' Insert code securely.
     * 
     * ' Supply full credentials to initiate a server connection.
     * Set obj1 = dso.OpenDSObject( _
     *     "LDAP://server1/CN=Dept1,DC=Fabrikam,DC=com", _
     *     szUsername, _
     *     szPassword, _
     *     ADS_SECURE_AUTHENTICATION + ADS_SERVER_BIND)
     * 
     * ' Perform an operation with the bound object, obj1
     * MsgBox obj1.Class
     * 
     * ' Bind to another object with the cached user credential.
     * Set obj2 = dso.OpenDSObject( _
     *     "LDAP://server1/CN=Dept2,DC=Fabrikam,DC=com", _
     *     szUsername, _
     *     szPassword, _
     *     ADS_SECURE_AUTHENTICATION + ADS_SERVER_BIND)
     * 
     * MsgBox obj2.Class
     * 
     * ```
     * 
     * 
     * The  credentials passed to the <b>IADsOpenDSObject::OpenDSObject</b> function are used only with the particular object bound to and do not affect the security context of the calling thread. This means that, in the following code example, the  call to <b>IADsOpenDSObject::OpenDSObject</b> will use different credentials than the  call to <b>GetObject</b>.
     * 
     * 
     * ```vb
     * Dim dso As IADsOpenDSObject
     * Dim obj1, obj2 As IADs
     * Dim szUsername As String
     * Dim szPassword As String
     * 
     * Set dso = GetObject("LDAP:")
     * 
     * ' Insert code securely.
     * 
     * ' Bind using full credentials.
     * Set obj1 = dso.OpenDSObject( _
     *     "LDAP://server1/CN=Dept1,DC=Fabrikam,DC=com", _
     *     szUsername, _
     *     szPassword, _
     *     ADS_SECURE_AUTHENTICATION + ADS_SERVER_BIND)
     * 
     * ' Bind to another object with the default credentials.
     * Set obj2 = GetObject("LDAP://server1/CN=Dept2,DC=Fabrikam,DC=com")
     * ```
     * 
     * 
     * With a serverless binding, the server name, "server1", is not stated explicitly. The default server is used instead. Only the LDAP provider supports the serverless binding. To use this feature, the client computer must be on an Active Directory domain. To attempt a serverless binding from a computer, you must bind as a domain user.
     * 
     * For credential caching to work properly, it is important to keep an object reference outstanding to maintain the cache handle. In the example given above, an attempt to open "obj2" after releasing "obj1" will result in an authentication failure.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsopendsobject">IADsOpenDSObject</a> method uses the default credentials when <i>lpszUserName</i> and <i>lpszPassword</i> are set to <b>NULL</b>.
     * 
     * If Kerberos authentication is required for the successful completion of a specific directory request using the LDAP provider, the <i>lpszDNName</i> binding string must use either a serverless ADsPath, such as "LDAP://CN=Jeff Smith,CN=admin,DC=Fabrikam,DC=com", or it must use an ADsPath with a fully qualified DNS server name, such as "LDAP://central3.corp.Fabrikam.com/CN=Jeff Smith,CN=admin,DC=Fabrikam,DC=com". Binding to the server using a flat NETBIOS name or a short DNS name, for example, using the short name "central3" instead of "central3.corp.Fabrikam.com", may or may not yield Kerberos authentication.
     * 
     * The  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsopenobject">ADsOpenObject</a> helper function offers the same features as the <b>IADsOpenDSObject::OpenDSObject</b> method.
     * 
     * With the LDAP provider for Active Directory, you may pass in <i>lpszUserName</i> as one of the following strings:
     * 
     * <ul>
     * <li>The name of a user account, such as "jeffsmith". To use a user name by itself, you must set only the <b>ADS_SECURE_AUTHENTICATION</b> flag in the <i>lnReserved</i> parameter.</li>
     * <li>The user path from a previous version of Windows, such as "Fabrikam\jeffsmith".</li>
     * <li>Distinguished Name, such as "CN=Jeff Smith,OU=Sales,DC=Fabrikam,DC=Com". To use a DN, the <i>lnReserved</i> parameter must be zero or it must include the <b>ADS_USE_SSL</b> flag</li>
     * <li>User Principal Name (UPN), such as "jeffsmith@Fabrikam.com". To use a UPN, you must assign the appropriate UPN value for the <i>userPrincipalName</i> attribute of the target user object.</li>
     * </ul>
     * @param {BSTR} lpszDNName The null-terminated Unicode string that specifies the ADsPath of the ADSI object. For more information and examples of binding strings for this parameter, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/ldap-adspath">LDAP ADsPath</a>. When using the LDAP provider with an ADsPath that includes a specific server name, the <i>lnReserved</i> parameter should include the <b>ADS_SERVER_BIND</b> flag.
     * @param {BSTR} lpszUserName The null-terminated Unicode string that specifies the user name to be used for securing permission from the namespace server. For more information, see the following Remarks section.
     * @param {BSTR} lpszPassword The null-terminated Unicode string that specifies the password to be used to obtain permission from the namespace server.
     * @param {Integer} lnReserved Authentication flags used to define the binding options. For more information, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum">ADS_AUTHENTICATION_ENUM</a>.
     * @returns {IDispatch} Pointer to a pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface on the requested object.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsopendsobject-opendsobject
     */
    OpenDSObject(lpszDNName, lpszUserName, lpszPassword, lnReserved) {
        lpszDNName := lpszDNName is String ? BSTR.Alloc(lpszDNName).Value : lpszDNName
        lpszUserName := lpszUserName is String ? BSTR.Alloc(lpszUserName).Value : lpszUserName
        lpszPassword := lpszPassword is String ? BSTR.Alloc(lpszPassword).Value : lpszPassword

        result := ComCall(7, this, "ptr", lpszDNName, "ptr", lpszUserName, "ptr", lpszPassword, "int", lnReserved, "ptr*", &ppOleDsObj := 0, "HRESULT")
        return IDispatch(ppOleDsObj)
    }
}
