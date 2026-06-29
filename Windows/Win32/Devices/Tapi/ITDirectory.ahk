#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumDirectoryObject.ahk" { IEnumDirectoryObject }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\DIRECTORY_OBJECT_TYPE.ahk" { DIRECTORY_OBJECT_TYPE }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\DIRECTORY_TYPE.ahk" { DIRECTORY_TYPE }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ITDirectoryObject.ahk" { ITDirectoryObject }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The ITDirectory interface is exposed by the Directory object, which corresponds to a particular directory.
 * @see https://learn.microsoft.com/windows/win32/api/rend/nn-rend-itdirectory
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITDirectory extends IDispatch {
    /**
     * The interface identifier for ITDirectory
     * @type {Guid}
     */
    static IID := Guid("{34621d6c-6cff-11d1-aff7-00c04fc31fee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITDirectory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DirectoryType         : IntPtr
        get_DisplayName           : IntPtr
        get_IsDynamic             : IntPtr
        get_DefaultObjectTTL      : IntPtr
        put_DefaultObjectTTL      : IntPtr
        EnableAutoRefresh         : IntPtr
        Connect                   : IntPtr
        Bind                      : IntPtr
        AddDirectoryObject        : IntPtr
        ModifyDirectoryObject     : IntPtr
        RefreshDirectoryObject    : IntPtr
        DeleteDirectoryObject     : IntPtr
        get_DirectoryObjects      : IntPtr
        EnumerateDirectoryObjects : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITDirectory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {DIRECTORY_TYPE} 
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
     * @returns {DIRECTORY_TYPE} Pointer to type of the directory.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_directorytype
     */
    get_DirectoryType() {
        result := ComCall(7, this, "int*", &pDirectoryType := 0, "HRESULT")
        return pDirectoryType
    }

    /**
     * The get_DisplayName method gets displayable name for directory.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>pName</i> parameter.
     * @returns {BSTR} Pointer to a <b>BSTR</b> representation of the directory name.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_displayname
     */
    get_DisplayName() {
        pName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * The get_IsDynamic method gets an indicator of whether the object on the server needs to be refreshed.
     * @returns {VARIANT_BOOL} Pointer to a Boolean <b>VARIANT</b>; VARIANT_TRUE if server needs to be refreshed and VARIANT_FALSE if it does not.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_isdynamic
     */
    get_IsDynamic() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pfDynamic := 0, "HRESULT")
        return pfDynamic
    }

    /**
     * The get_DefaultObjectTTL method gets the default time to live (TTL) value, in seconds, for objects created. Only applies to dynamic servers.
     * @returns {Integer} Pointer to TTL value, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_defaultobjectttl
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
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-put_defaultobjectttl
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
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-enableautorefresh
     */
    EnableAutoRefresh(fEnable) {
        result := ComCall(12, this, VARIANT_BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * The Connect method establishes a connection to the directory server.
     * @remarks
     * The 
     * <b>Connect</b> method must be successfully called before any other function except 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nf-rend-itdirectory-get_directorytype">get_DirectoryType</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/itconferenceblob-init">ITConferenceBlob::Init</a> has not been run or did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-connect
     */
    Connect(fSecure) {
        result := ComCall(13, this, VARIANT_BOOL, fSecure, "HRESULT")
        return result
    }

    /**
     * The Bind method binds to the server.
     * @remarks
     * The input variables <i>pDomainName</i>, <i>pUserName</i>, and <i>pPassword</i> can be <b>NULL</b>.
     * 
     * Calling this function is optional. However, some directory operations require the user to be authenticated first. It is always safe to call 
     * <b>Bind</b>.
     * 
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pDomainName</i>, <i>pUserName</i>, and <i>pPassword</i> parameters. The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variables are no longer needed.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-bind
     */
    Bind(pDomainName, pUserName, pPassword, lFlags) {
        pDomainName := pDomainName is String ? BSTR.Alloc(pDomainName).Value : pDomainName
        pUserName := pUserName is String ? BSTR.Alloc(pUserName).Value : pUserName
        pPassword := pPassword is String ? BSTR.Alloc(pPassword).Value : pPassword

        result := ComCall(14, this, BSTR, pDomainName, BSTR, pUserName, BSTR, pPassword, "int", lFlags, "HRESULT")
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
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
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-adddirectoryobject
     */
    AddDirectoryObject(pDirectoryObject) {
        result := ComCall(15, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * The ModifyDirectoryObject method commits directory modifications to the server.
     * @remarks
     * Changes made to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> will not take effect on the server until this method is called.
     * 
     * Some attributes cannot be modified, and an attempt to modify them will fail. For an example, see the Remarks section of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nf-rend-itdirectoryobjectuser-put_ipphoneprimary">ITDirectoryObjectUser::put_IPPhonePrimary</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
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
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-modifydirectoryobject
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-refreshdirectoryobject
     */
    RefreshDirectoryObject(pDirectoryObject) {
        result := ComCall(17, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * The DeleteDirectoryObject method deletes an object from the server.
     * @remarks
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nf-rend-itdirectory-connect">ITDirectory::Connect</a> method has not been invoked or did not succeed.
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
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-deletedirectoryobject
     */
    DeleteDirectoryObject(pDirectoryObject) {
        result := ComCall(18, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * The get_DirectoryObjects method gets the collection of objects in a given directory that matches certain criteria. This method performs the same function as EnumerateDirectoryObjects but is used by Visual Basic and other scripting languages.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pName</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> interface returned by <b>ITDirectory::get_DirectoryObjects</b>. The application must call <b>Release</b> on the 
     * <b>ITDirectoryObject</b> interface to free resources associated with it.
     * @param {DIRECTORY_OBJECT_TYPE} DirectoryObjectType The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-directory_object_type">DIRECTORY_OBJECT_TYPE</a> criteria for object desired.
     * @param {BSTR} pName Pointer to a <b>BSTR</b> containing the full or partial name of the object. The "*" wildcard is supported.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> objects in the server that match the description.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_directoryobjects
     */
    get_DirectoryObjects(DirectoryObjectType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        pVariant := VARIANT()
        result := ComCall(19, this, DIRECTORY_OBJECT_TYPE, DirectoryObjectType, BSTR, pName, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateDirectoryObjects method creates an enumeration of directory objects of a given type and name.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pName</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdirectoryobject">IEnumDirectoryObject</a> interface returned by <b>ITDirectory::EnumerateDirectoryObjects</b>. The application must call <b>Release</b> on the 
     * <b>IEnumDirectoryObject</b> interface to free resources associated with it.
     * @param {DIRECTORY_OBJECT_TYPE} DirectoryObjectType The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-directory_object_type">DIRECTORY_OBJECT_TYPE</a> criteria for object desired.
     * @param {BSTR} pName Pointer to a <b>BSTR</b> containing the full or partial name of the object. The "*" wildcard is supported.
     * @returns {IEnumDirectoryObject} Pointer to receive 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdirectoryobject">IEnumDirectoryObject</a> interface pointer for the enumerator of matching objects.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-enumeratedirectoryobjects
     */
    EnumerateDirectoryObjects(DirectoryObjectType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(20, this, DIRECTORY_OBJECT_TYPE, DirectoryObjectType, BSTR, pName, "ptr*", &ppEnumObject := 0, "HRESULT")
        return IEnumDirectoryObject(ppEnumObject)
    }

    Query(iid) {
        if (ITDirectory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DirectoryType := CallbackCreate(GetMethod(implObj, "get_DirectoryType"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.get_IsDynamic := CallbackCreate(GetMethod(implObj, "get_IsDynamic"), flags, 2)
        this.vtbl.get_DefaultObjectTTL := CallbackCreate(GetMethod(implObj, "get_DefaultObjectTTL"), flags, 2)
        this.vtbl.put_DefaultObjectTTL := CallbackCreate(GetMethod(implObj, "put_DefaultObjectTTL"), flags, 2)
        this.vtbl.EnableAutoRefresh := CallbackCreate(GetMethod(implObj, "EnableAutoRefresh"), flags, 2)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 2)
        this.vtbl.Bind := CallbackCreate(GetMethod(implObj, "Bind"), flags, 5)
        this.vtbl.AddDirectoryObject := CallbackCreate(GetMethod(implObj, "AddDirectoryObject"), flags, 2)
        this.vtbl.ModifyDirectoryObject := CallbackCreate(GetMethod(implObj, "ModifyDirectoryObject"), flags, 2)
        this.vtbl.RefreshDirectoryObject := CallbackCreate(GetMethod(implObj, "RefreshDirectoryObject"), flags, 2)
        this.vtbl.DeleteDirectoryObject := CallbackCreate(GetMethod(implObj, "DeleteDirectoryObject"), flags, 2)
        this.vtbl.get_DirectoryObjects := CallbackCreate(GetMethod(implObj, "get_DirectoryObjects"), flags, 4)
        this.vtbl.EnumerateDirectoryObjects := CallbackCreate(GetMethod(implObj, "EnumerateDirectoryObjects"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DirectoryType)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.get_IsDynamic)
        CallbackFree(this.vtbl.get_DefaultObjectTTL)
        CallbackFree(this.vtbl.put_DefaultObjectTTL)
        CallbackFree(this.vtbl.EnableAutoRefresh)
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Bind)
        CallbackFree(this.vtbl.AddDirectoryObject)
        CallbackFree(this.vtbl.ModifyDirectoryObject)
        CallbackFree(this.vtbl.RefreshDirectoryObject)
        CallbackFree(this.vtbl.DeleteDirectoryObject)
        CallbackFree(this.vtbl.get_DirectoryObjects)
        CallbackFree(this.vtbl.EnumerateDirectoryObjects)
    }
}
