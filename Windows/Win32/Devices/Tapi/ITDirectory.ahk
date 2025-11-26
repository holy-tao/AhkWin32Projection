#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumDirectoryObject.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDirectory interface is exposed by the Directory object, which corresponds to a particular directory.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-itdirectory
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDirectory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDirectory
     * @type {Guid}
     */
    static IID => Guid("{34621d6c-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DirectoryType", "get_DisplayName", "get_IsDynamic", "get_DefaultObjectTTL", "put_DefaultObjectTTL", "EnableAutoRefresh", "Connect", "Bind", "AddDirectoryObject", "ModifyDirectoryObject", "RefreshDirectoryObject", "DeleteDirectoryObject", "get_DirectoryObjects", "EnumerateDirectoryObjects"]

    /**
     * @type {Integer} 
     */
    DirectoryType {
        get => this.get_DirectoryType()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsDynamic {
        get => this.get_IsDynamic()
    }

    /**
     * @type {Integer} 
     */
    DefaultObjectTTL {
        get => this.get_DefaultObjectTTL()
        set => this.put_DefaultObjectTTL(value)
    }

    /**
     * The get_DirectoryType method gets DIRECTORY_TYPE indicator of the type of the directory.
     * @returns {Integer} Pointer to type of the directory.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-get_directorytype
     */
    get_DirectoryType() {
        result := ComCall(7, this, "int*", &pDirectoryType := 0, "HRESULT")
        return pDirectoryType
    }

    /**
     * The get_DisplayName method gets displayable name for directory.
     * @returns {BSTR} Pointer to a <b>BSTR</b> representation of the directory name.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-get_displayname
     */
    get_DisplayName() {
        pName := BSTR()
        result := ComCall(8, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * The get_IsDynamic method gets an indicator of whether the object on the server needs to be refreshed.
     * @returns {VARIANT_BOOL} Pointer to a Boolean <b>VARIANT</b>; VARIANT_TRUE if server needs to be refreshed and VARIANT_FALSE if it does not.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-get_isdynamic
     */
    get_IsDynamic() {
        result := ComCall(9, this, "short*", &pfDynamic := 0, "HRESULT")
        return pfDynamic
    }

    /**
     * The get_DefaultObjectTTL method gets the default time to live (TTL) value, in seconds, for objects created. Only applies to dynamic servers.
     * @returns {Integer} Pointer to TTL value, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-get_defaultobjectttl
     */
    get_DefaultObjectTTL() {
        result := ComCall(10, this, "int*", &pTTL := 0, "HRESULT")
        return pTTL
    }

    /**
     * The put_DefaultObjectTTL method sets the default time to live (TTL) value, in seconds, for objects created. Only applies to dynamic servers. The minimum value is 300 seconds.
     * @param {Integer} TTL TTL value, in seconds.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>TTL</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-put_defaultobjectttl
     */
    put_DefaultObjectTTL(TTL) {
        result := ComCall(11, this, "int", TTL, "HRESULT")
        return result
    }

    /**
     * The EnableAutoRefresh method enables auto refresh for directory objects created after it is called. Only applies to dynamic servers.
     * @param {VARIANT_BOOL} fEnable Set to VARIANT_TRUE if auto refresh is to be enabled.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>fEnable</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-enableautorefresh
     */
    EnableAutoRefresh(fEnable) {
        result := ComCall(12, this, "short", fEnable, "HRESULT")
        return result
    }

    /**
     * The Connect method establishes a connection to the directory server.
     * @param {VARIANT_BOOL} fSecure Boolean indicator of whether to use SSL connection.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RND_ALREADY_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A successful connection has already been made.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RND_NULL_SERVER_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server name is <b>NULL</b>, probably because 
     * <a href="/windows/desktop/Tapi/itconferenceblob-init">ITConferenceBlob::Init</a> has not been run or did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-connect
     */
    Connect(fSecure) {
        result := ComCall(13, this, "short", fSecure, "HRESULT")
        return result
    }

    /**
     * The Bind method binds to the server.
     * @param {BSTR} pDomainName Pointer to a <b>BSTR</b> containing the user's domain name.
     * @param {BSTR} pUserName Pointer to a <b>BSTR</b> containing the user's name.
     * @param {BSTR} pPassword Pointer to a <b>BSTR</b> containing the user's password.
     * @param {Integer} lFlags <a href="https://docs.microsoft.com/windows/desktop/Tapi/rendbind--constants">RENDBIND</a> flags indicator of whether all parameters must be validated or can take a default.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDomainName</i>, <i>pUserName</i>, or <i>pPassword</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A password is required but was not supplied, the domain and user are not supplied, or the domain was supplied but the user was not.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RND_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-bind
     */
    Bind(pDomainName, pUserName, pPassword, lFlags) {
        pDomainName := pDomainName is String ? BSTR.Alloc(pDomainName).Value : pDomainName
        pUserName := pUserName is String ? BSTR.Alloc(pUserName).Value : pUserName
        pPassword := pPassword is String ? BSTR.Alloc(pPassword).Value : pPassword

        result := ComCall(14, this, "ptr", pDomainName, "ptr", pUserName, "ptr", pPassword, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The AddDirectoryObject method adds an ITDirectoryObject object to the server. This may be a directory or a user machine mapping.
     * @param {ITDirectoryObject} pDirectoryObject The object that will be added into the directory.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDirectoryObject</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RND_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-adddirectoryobject
     */
    AddDirectoryObject(pDirectoryObject) {
        result := ComCall(15, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * The ModifyDirectoryObject method commits directory modifications to the server.
     * @param {ITDirectoryObject} pDirectoryObject Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> modified.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDirectoryObject</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RND_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-modifydirectoryobject
     */
    ModifyDirectoryObject(pDirectoryObject) {
        result := ComCall(16, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * The RefreshDirectoryObject method refreshes the time to live (TTL) for an object on the server. Only applies to dynamic servers.
     * @param {ITDirectoryObject} pDirectoryObject Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> to be refreshed.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDirectoryObject</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RND_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-refreshdirectoryobject
     */
    RefreshDirectoryObject(pDirectoryObject) {
        result := ComCall(17, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * The DeleteDirectoryObject method deletes an object from the server.
     * @param {ITDirectoryObject} pDirectoryObject Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> that will be deleted from the directory.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDirectoryObject</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RND_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-deletedirectoryobject
     */
    DeleteDirectoryObject(pDirectoryObject) {
        result := ComCall(18, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * The get_DirectoryObjects method gets the collection of objects in a given directory that matches certain criteria. This method performs the same function as EnumerateDirectoryObjects but is used by Visual Basic and other scripting languages.
     * @param {Integer} DirectoryObjectType The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-directory_object_type">DIRECTORY_OBJECT_TYPE</a> criteria for object desired.
     * @param {BSTR} pName Pointer to a <b>BSTR</b> containing the full or partial name of the object. The "*" wildcard is supported.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> objects in the server that match the description.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-get_directoryobjects
     */
    get_DirectoryObjects(DirectoryObjectType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        pVariant := VARIANT()
        result := ComCall(19, this, "int", DirectoryObjectType, "ptr", pName, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateDirectoryObjects method creates an enumeration of directory objects of a given type and name.
     * @param {Integer} DirectoryObjectType The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-directory_object_type">DIRECTORY_OBJECT_TYPE</a> criteria for object desired.
     * @param {BSTR} pName Pointer to a <b>BSTR</b> containing the full or partial name of the object. The "*" wildcard is supported.
     * @returns {IEnumDirectoryObject} Pointer to receive 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdirectoryobject">IEnumDirectoryObject</a> interface pointer for the enumerator of matching objects.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectory-enumeratedirectoryobjects
     */
    EnumerateDirectoryObjects(DirectoryObjectType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(20, this, "int", DirectoryObjectType, "ptr", pName, "ptr*", &ppEnumObject := 0, "HRESULT")
        return IEnumDirectoryObject(ppEnumObject)
    }
}
