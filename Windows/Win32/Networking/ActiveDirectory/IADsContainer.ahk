#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsContainer interface enables an ADSI container object to create, delete, and manage contained ADSI objects. Container objects represent hierarchical directory trees, such as in a file system, and to organize the directory hierarchy.
 * @remarks
 * To determine if an object is a container, use the <a href="https://docs.microsoft.com/windows/desktop/ADSI/iadsclass-property-methods">IADsClass.Container</a> property of the object.
 * 
 * When you bind to a container object using its GUID (or SID), you can only perform specific operations on the container object. These operations include examination of the object attributes and enumeration of the object's immediate children. These operations are shown in the following code example.
 * 
 * 
 * ```vb
 * Dim con As IADsContainer
 * Dim obj As IADs
 * Set con = GetObject("LDAP://svr01/<GUID=xxxx>")
 * con.Filter = Array("user")
 * For Each item In con
 *     debug.print item.Name " &  " of " & item.Class
 * Next
 * ```
 * 
 * 
 * All other operations, that is, <b>GetObject</b>, <b>Create</b>, <b>Delete</b>, <b>CopyHere</b>, and <b>MoveHere</b> are not supported in the container's GUID representation. For example, the last line of the following code example will result in an error.
 * 
 * 
 * ```vb
 * Dim con As IADsContainer
 * Dim obj As IADs
 * Set con = GetObject("LDAP://svr01/<GUID=xxxx>")
 * Set obj = con.GetObject("user", "CN=Jeff Smith")
 * ```
 * 
 * 
 * Binding, using GUID (or SID), is intended for low overhead and, thus, fast binds, which are often used for object introspection.
 * 
 * To call these methods of the container bound with its GUID (or SID), rebind to the object using its distinguished name.
 * 
 * 
 * ```vb
 * Dim conGUID, conDN As IADsContainer
 * Dim obj As IADs
 * Set conGUID = GetObject("LDAP://svr/<GUID=xxxx>")
 * Set conDN=GetObject("LDAP://svr/" & conGUID.Get("distinguishedName"))
 * Set obj = conDN.GetObject("user", "CN=Jeff Smith")
 * ```
 * 
 * 
 * For more information about object GUID representation, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/iads-property-methods">IADs.GUID</a>.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadscontainer
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsContainer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsContainer
     * @type {Guid}
     */
    static IID => Guid("{001677d0-fd16-11ce-abc4-02608c9e7553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Filter", "put_Filter", "get_Hints", "put_Hints", "GetObject", "Create", "Delete", "CopyHere", "MoveHere"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {VARIANT} 
     */
    Filter {
        get => this.get_Filter()
        set => this.put_Filter(value)
    }

    /**
     * @type {VARIANT} 
     */
    Hints {
        get => this.get_Hints()
        set => this.put_Hints(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Retrieves an enumerator object for the container.
     * @remarks
     * There are two underscore characters ("__") in the function name between "get" and "NewEnum".
     * 
     * In Visual Basic, use the <b>For</b><b>Each</b>… statement to invoke the <b>IADsContainer::get__NewEnum</b> method implicitly.
     * 
     * In C/C++, use the  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsbuildenumerator">ADsBuildEnumerator</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsenumeratenext">ADsEnumerateNext</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsfreeenumerator">AdsFreeEnumerator</a> helper functions.
     * @returns {IUnknown} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer that receives the enumerator object. The caller must release this interface when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Filter() {
        pVar := VARIANT()
        result := ComCall(9, this, "ptr", pVar, "HRESULT")
        return pVar
    }

    /**
     * 
     * @param {VARIANT} Var 
     * @returns {HRESULT} 
     */
    put_Filter(Var) {
        result := ComCall(10, this, "ptr", Var, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Hints() {
        pvFilter := VARIANT()
        result := ComCall(11, this, "ptr", pvFilter, "HRESULT")
        return pvFilter
    }

    /**
     * 
     * @param {VARIANT} vHints 
     * @returns {HRESULT} 
     */
    put_Hints(vHints) {
        result := ComCall(12, this, "ptr", vHints, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface for a directory object in the container.
     * @remarks
     * For the LDAP provider, the <i>bstrRelativeName</i> parameter must contain the name prefix, such as "CN=Jeff Smith". The <i>bstrRelativeName</i> parameter can also contain more than one level of name, such as "CN=Jeff Smith,OU=Sales".
     * 
     * In C++, when <b>GetObject</b> has succeeded, the caller must query the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface for the desired interface using the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method.
     * 
     * The <i>bstrClassName</i> parameter can be either a valid class name or <b>NULL</b>. If the class name is not valid, including when it contains a blank space, this method will throw an <a href="https://docs.microsoft.com/windows/desktop/ADSI/generic-adsi-error-codes">E_ADS_UNKNOWN_OBJECT</a> error.
     * @param {BSTR} ClassName A <b>BSTR</b> that specifies the name of the object class as of the object to retrieve. If this parameter is <b>NULL</b>, the provider returns the first item found in the container.
     * @param {BSTR} RelativeName A <b>BSTR</b> that specifies the relative distinguished name of the object to retrieve.
     * @returns {IDispatch} A pointer to a pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface on the specified object.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-getobject
     */
    GetObject(ClassName, RelativeName) {
        ClassName := ClassName is String ? BSTR.Alloc(ClassName).Value : ClassName
        RelativeName := RelativeName is String ? BSTR.Alloc(RelativeName).Value : RelativeName

        result := ComCall(13, this, "ptr", ClassName, "ptr", RelativeName, "ptr*", &ppObject := 0, "HRESULT")
        return IDispatch(ppObject)
    }

    /**
     * Sets up a request to create a directory object of the specified schema class and a given name in the container.
     * @param {BSTR} ClassName Name of the schema class object to be created. The name is that returned from the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs::get_Schema</a> property method.
     * @param {BSTR} RelativeName Relative name of the object as it is known in the underlying directory and identical to the one retrieved through the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs::get_Name</a> property method.
     * @returns {IDispatch} Indirect pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface on the newly created object.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-create
     */
    Create(ClassName, RelativeName) {
        ClassName := ClassName is String ? BSTR.Alloc(ClassName).Value : ClassName
        RelativeName := RelativeName is String ? BSTR.Alloc(RelativeName).Value : RelativeName

        result := ComCall(14, this, "ptr", ClassName, "ptr", RelativeName, "ptr*", &ppObject := 0, "HRESULT")
        return IDispatch(ppObject)
    }

    /**
     * Deletes a specified directory object from this container.
     * @remarks
     * The object to be deleted must be a leaf object or a childless subcontainer. To delete a container and its children, that is, a subtree, use  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsdeleteops-deleteobject">IADsDeleteOps::DeleteObject</a>.
     * 
     * The specified object is immediately removed after calling  <b>IADsContainer::Delete</b> and calling  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-setinfo">IADs::SetInfo</a> on the container object is unnecessary.
     * 
     * When using the  <b>IADsContainer::Delete</b> method to delete an object in C/C++ applications, release the interface pointers to that object as well. This is because the method removes the object from the underlying directory immediately, but leave intact any interface pointers held, in memory, by the application, for the deleted object. If not released, confusion can occur in that you may call  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-get">IADs::Get</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-put">IADs::Put</a> on the deleted object without error, but will receive an error when you call  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-setinfo">IADs::SetInfo</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getinfo">IADs::GetInfo</a> on the deleted object.
     * @param {BSTR} bstrClassName The schema class object to delete. The name is that returned from the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs::get_Class</a> method. Also, <b>NULL</b> is a valid option for this parameter.   Providing <b>NULL</b> for this parameter is the only way to deal with defunct schema classes. If an instance was created before the class became defunct, the only way to  delete the instance of the defunct class is to call <b>IADsContainer::Delete</b> and provide <b>NULL</b> for this parameter.
     * @param {BSTR} bstrRelativeName Name of the object as it is known in the underlying directory and identical to the name retrieved with the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs::get_Name</a> method.
     * @returns {HRESULT} This method supports the standard return values, including S_OK for a successful operation. For more information about error codes, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-delete
     */
    Delete(bstrClassName, bstrRelativeName) {
        bstrClassName := bstrClassName is String ? BSTR.Alloc(bstrClassName).Value : bstrClassName
        bstrRelativeName := bstrRelativeName is String ? BSTR.Alloc(bstrRelativeName).Value : bstrRelativeName

        result := ComCall(15, this, "ptr", bstrClassName, "ptr", bstrRelativeName, "HRESULT")
        return result
    }

    /**
     * The IADsContainer::CopyHere method creates a copy of the specified directory object in this container.
     * @remarks
     * The destination container must be in the same directory service as the source container. An object cannot be copied across a directory service implementation.
     * 
     * The  providers supplied with ADSI return the <b>E_NOTIMPL</b> error message.
     * @param {BSTR} SourceName The ADsPath of the object to copy.
     * @param {BSTR} NewName Optional name of the new object within the container. If a new name is not specified  for the object, set to <b>NULL</b>; the new object will have the same name as the source object.
     * @returns {IDispatch} Indirect pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> interface on the copied object.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-copyhere
     */
    CopyHere(SourceName, NewName) {
        SourceName := SourceName is String ? BSTR.Alloc(SourceName).Value : SourceName
        NewName := NewName is String ? BSTR.Alloc(NewName).Value : NewName

        result := ComCall(16, this, "ptr", SourceName, "ptr", NewName, "ptr*", &ppObject := 0, "HRESULT")
        return IDispatch(ppObject)
    }

    /**
     * Moves a specified object to the container that implements this interface.
     * @remarks
     * In Active Directory, you can move an object within the same domain
     *     or from different domains in the same directory forest. For the cross domain
     *     move, the following restrictions apply:
     * 
     * <ul>
     * <li>The destination domain must be in the native mode.</li>
     * <li>Objects to be moved must be a leaf object or an empty
     *     container.</li>
     * <li>NT LAN Manager (NTLM) cannot perform authentication; use Kerberos authentication or delegation. Be aware that if Kerberos authentication is not used, the password transmits in plaintext over the network. To avoid this, use delegation with secure authentication.</li>
     * <li>You cannot move security principals (for example, user, group, computer, and
     *     so on) belonging to a global group. When a security principal is moved, a new
     *     SID is created for the object at the destination. However, its old SID from the
     *     source, stored in the <b>sIDHistory</b> attribute,
     *     is preserved, as well as the password of the object.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  Use the Movetree.exe utility to move a subtree among
     *     different domains. To move objects from a source domain to a destination domain
     *     using the Movetree command-line tool, you must connect to the domain controller
     *     holding the source domain's RID master role. If the RID master is unavailable
     *     then objects cannot be moved to other domains. If you attempt to move an object
     *     from one domain to another using the Movetree.exe tool and you specify a source
     *     domain controller that is not the RID master, a nonspecific "Movetree failed"
     *     error message results.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  When using the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsopenobject">ADsOpenObject</a> function to bind to
     *     an ADSI object, you must use the <b>ADS_USE_DELEGATION</b> flag of the 
     *      <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum">ADS_AUTHENTICATION_ENUM</a> in the <i>dwReserved</i> parameter of this function
     *     in order to create cross-domain moves with <b>IADsContainer::MoveHere</b>. The
     *     <b>ADsOpenObject</b> function is equivalent to the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsopendsobject-opendsobject">IADsOpenDSObject::OpenDsObject</a> method. Likewise, using the <b>OpenDsObject</b> method to bind to an ADSI object, the <i>InReserved</i> parameter of this method must contain the
     *     <b>ADS_USE_DELEGATION</b> flag of the
     *     <b>ADS_AUTHENTICATION_ENUM</b> in order to make cross-domain moves with
     *     <b>IADsContainer::MoveHere</b>.</div>
     * <div> </div>
     * The following code example moves the user, "jeffsmith" from the
     *     "South.Fabrikam.Com" domain to the "North.Fabrikam.Com" domain. First, it gets
     *     an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscontainer">IADsContainer</a> pointer to the destination
     *     container, then the <b>MoveHere</b> call specifies
     *     the path of the object to move.
     * 
     * 
     * ```vb
     * Set ou = GetObject("LDAP://server1/OU=Support,DC=North,DC=Fabrikam,DC=COM")
     * ou.MoveHere("LDAP://server2/CN=jeffsmith,OU=Sales,DC=South,DC=Fabrikam,DC=Com", vbNullString)
     * ```
     * 
     * 
     * A serverless ADsPath can be used for either the source or the
     *     destination or both.
     * 
     * The <b>IADsContainer::MoveHere</b> method can be used either to rename an object within the same container or to
     *     move an object among different containers. Moving an object retains the
     *     object RDN, whereas renaming an object alters the RDN.
     * 
     * For example, the following code example performs the rename action.
     * 
     * 
     * ```vb
     * set cont = GetObject("LDAP://dc=dom,dc=com")
     * set newobj = cont.MoveHere("LDAP://cn=Jeff Smith,dc=dom,dc=com", "cn=Denise Smith")
     * ```
     * 
     * 
     * The following code example performs the move.
     * 
     * 
     * ```vb
     * set cont = GetObject("LDAP://dc=dom,dc=com")
     * set newobj = cont.MoveHere("LDAP://cn=jeffsmith,ou=sales,dc=dom,dc=com", "cn=jeffsmith")
     * ```
     * 
     * 
     * In Visual Basic applications, you can pass
     *     <b>vbNullString</b> as the second parameter when
     *     moving an object from one container to another.
     * 
     * 
     * ```vb
     * Set newobj =  cont.MoveHere("LDAP://cn=jeffsmith,ou=sale,dc=dom,dc=com", vbNullString)
     * ```
     * 
     * 
     * However, you cannot do the same with VBScript. This is because
     *     VBScript maps <b>vbNullString</b> to an empty string instead of to a null string, as
     *     does Visual Basic. You must use the RDN explicitly, as shown in the previous
     *     example.
     * 
     * <div class="alert"><b>Note</b>  The WinNT provider supports <b>IADsContainer::MoveHere</b>, but only for renaming users &amp;
     *     groups within a domain.</div>
     * <div> </div>
     * @param {BSTR} SourceName The null-terminated Unicode string that specifies the <b>ADsPath</b> of the object to be moved.
     * @param {BSTR} NewName The null-terminated Unicode string that specifies the relative name of the new object within the container. This can be
     *     <b>NULL</b>, in which case the object is moved. If it is not <b>NULL</b>, the object is
     *     renamed accordingly in the process.
     * @returns {IDispatch} Pointer to a pointer to the 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface on the moved
     *     object.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-movehere
     */
    MoveHere(SourceName, NewName) {
        SourceName := SourceName is String ? BSTR.Alloc(SourceName).Value : SourceName
        NewName := NewName is String ? BSTR.Alloc(NewName).Value : NewName

        result := ComCall(17, this, "ptr", SourceName, "ptr", NewName, "ptr*", &ppObject := 0, "HRESULT")
        return IDispatch(ppObject)
    }
}
