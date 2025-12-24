#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsOpenDSObject interface is designed to supply a security context for binding to an object in the underlying directory store.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsopendsobject
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
     * @param {BSTR} lpszDNName The null-terminated Unicode string that specifies the ADsPath of the ADSI object. For more information and examples of binding strings for this parameter, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/ldap-adspath">LDAP ADsPath</a>. When using the LDAP provider with an ADsPath that includes a specific server name, the <i>lnReserved</i> parameter should include the <b>ADS_SERVER_BIND</b> flag.
     * @param {BSTR} lpszUserName The null-terminated Unicode string that specifies the user name to be used for securing permission from the namespace server. For more information, see the following Remarks section.
     * @param {BSTR} lpszPassword The null-terminated Unicode string that specifies the password to be used to obtain permission from the namespace server.
     * @param {Integer} lnReserved Authentication flags used to define the binding options. For more information, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum">ADS_AUTHENTICATION_ENUM</a>.
     * @returns {IDispatch} Pointer to a pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface on the requested object.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsopendsobject-opendsobject
     */
    OpenDSObject(lpszDNName, lpszUserName, lpszPassword, lnReserved) {
        lpszDNName := lpszDNName is String ? BSTR.Alloc(lpszDNName).Value : lpszDNName
        lpszUserName := lpszUserName is String ? BSTR.Alloc(lpszUserName).Value : lpszUserName
        lpszPassword := lpszPassword is String ? BSTR.Alloc(lpszPassword).Value : lpszPassword

        result := ComCall(7, this, "ptr", lpszDNName, "ptr", lpszUserName, "ptr", lpszPassword, "int", lnReserved, "ptr*", &ppOleDsObj := 0, "HRESULT")
        return IDispatch(ppOleDsObj)
    }
}
