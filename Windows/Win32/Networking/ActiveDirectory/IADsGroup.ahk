#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADsMembers.ahk" { IADsMembers }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IADs.ahk" { IADs }

/**
 * Manages group membership data in a directory service.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsgroup
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsGroup extends IADs {
    /**
     * The interface identifier for IADsGroup
     * @type {Guid}
     */
    static IID := Guid("{27636b00-410f-11cf-b1ff-02608c9e7553}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsGroup interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_Description : IntPtr
        put_Description : IntPtr
        Members         : IntPtr
        IsMember        : IntPtr
        Add             : IntPtr
        Remove          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(21, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of the immediate members of the group.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsmembers">IADsMembers</a><b>Members</b> method will use the same provider.
     * @returns {IADsMembers} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsmembers">IADsMembers</a> interface pointer that receives the collection of group members. The caller must  release this interface when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsgroup-members
     */
    Members() {
        result := ComCall(22, this, "ptr*", &ppMembers := 0, "HRESULT")
        return IADsMembers(ppMembers)
    }

    /**
     * Determines if a directory service object is an immediate member of the group.
     * @remarks
     * Although you can add or remove a security principal to or from a group using the member SID through the WinNT provider, the <b>IADsGroup.IsMember</b> method does not support using a SID ADsPath for verification if a member belongs to a group through the WinNT provider.
     * 
     * The <b>IADsGroup::IsMember</b> method will only work correctly if the group and the object are in the same domain. If the object is in a different domain than the group, <b>IADsGroup::IsMember</b> will always return <b>VARIANT_FALSE</b>.
     * @param {BSTR} bstrMember Contains the ADsPath of the directory service object to verify membership. This ADsPath must use the same ADSI provider used to bind to the group. For example, if the group was bound to using the LDAP provider, this ADsPath must also use the LDAP provider.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> value that receives <b>VARIANT_TRUE</b> if the object is an immediate member of the group or <b>VARIANT_FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsgroup-ismember
     */
    IsMember(bstrMember) {
        bstrMember := bstrMember is String ? BSTR.Alloc(bstrMember).Value : bstrMember

        result := ComCall(23, this, BSTR, bstrMember, VARIANT_BOOL.Ptr, &bMember := 0, "HRESULT")
        return bMember
    }

    /**
     * Adds an ADSI object to an existing group.
     * @remarks
     * If the LDAP provider is used to bind to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a> object, the same form of ADsPath must be specified in the <i>bstrNewItem</i> parameter. For example, if the ADsPath used to bind to the <b>IADsGroup</b> object includes a server, the ADsPath in the <i>bstrNewItem</i> parameter must contain the same server prefix. Likewise, if a serverless path is used to bind to the <b>IADsGroup</b> object, the <i>bstrNewItem</i> parameter must also contain a serverless path. When using server prefix, delays may occur if the group and the new member are from different domains, as requests may be sent to the wrong domain controller and referred to a domain controller of the correct domain and retried there. An exception occurs when adding or removing a member using a GUID or security identifier (SID) ADsPath. In this case, a serverless path should always be used in <i>bstrNewItem</i>.
     * 
     * The LDAP provider for Active Directory enables a member to be added to a group using the string form of the member SID. The <i>bstrNewItem</i> parameter can contain a SID string in the following form.
     * 
     * 
     * ```cpp
     * LDAP://SID=<010500000000000515000000c6bb507afbda8b7f43170a325b040000>
     * ```
     * 
     * 
     * For more information about SID strings in Active Directory, see <a href="https://docs.microsoft.com/windows/desktop/AD/binding-to-an-object-using-a-sid">Binding to an Object Using a SID</a>.
     * 
     * The WinNT provider for Active Directory also enables a member to be added to a group using the string form of the member's SID. The <i>bstrNewItem</i> parameter can contain a SID string in the following form.
     * 
     * 
     * ```cpp
     * WinNT://S-1-5-21-35135249072896"
     * ```
     * @param {BSTR} bstrNewItem Contains a <b>BSTR</b> that specifies the ADsPath of the object to add to the group. For more information, see Remarks.
     * @returns {HRESULT} The following are the most common return values. For more information about return values, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsgroup-add
     */
    Add(bstrNewItem) {
        bstrNewItem := bstrNewItem is String ? BSTR.Alloc(bstrNewItem).Value : bstrNewItem

        result := ComCall(24, this, BSTR, bstrNewItem, "HRESULT")
        return result
    }

    /**
     * The IADsGroup::Remove method removes the specified user object from this group. The operation does not remove the group object itself even when there is no member remaining in the group.
     * @remarks
     * If the LDAP provider is used to bind to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a> object, the same form of ADsPath must be specified in the <i>bstrItemToBeRemoved</i> parameter. For example, if the ADsPath used to bind to the <b>IADsGroup</b> object includes a server, the ADsPath in the <i>bstrItemToBeRemoved</i> parameter must contain the same server prefix. Likewise, if a serverless path is used to bind to the <b>IADsGroup</b> object, the <i>bstrItemToBeRemoved</i> parameter must also contain a serverless path. The exception is when adding or removing a member using a GUID or SID ADsPath. In this case, a serverless path should always be used in <i>bstrItemToBeRemoved</i>.
     * 
     * You can use a SID in the ADsPath to remove a security principal from the group through the WinNT provider. For example, suppose the SID of a user, "Fabrikam\jeffsmith", is S-1-5-21-35135249072896, the following statement:
     * 
     * 
     * ```vb
     * Dim group As IADsGroup
     * group.Remove("WinNT://S-1-5-21-35135249072896")
     * ```
     * 
     * 
     * is equivalent to
     * 
     * 
     * ```vb
     * Dim group As IADsGroup
     * group.Remove("WinNT://Fabrikam/jeffsmith")
     * ```
     * 
     * 
     * Removing a member using its SID through the WinNT provider is a new feature in Windows 2000 and the DSCLIENT package.
     * @param {BSTR} bstrItemToBeRemoved Contains a <b>BSTR</b> that specifies the ADsPath of the object to remove from the group. For more information about this parameter, see the Remarks section.
     * @returns {HRESULT} The following are the most common return values. For more information about return values, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsgroup-remove
     */
    Remove(bstrItemToBeRemoved) {
        bstrItemToBeRemoved := bstrItemToBeRemoved is String ? BSTR.Alloc(bstrItemToBeRemoved).Value : bstrItemToBeRemoved

        result := ComCall(25, this, BSTR, bstrItemToBeRemoved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.Members := CallbackCreate(GetMethod(implObj, "Members"), flags, 2)
        this.vtbl.IsMember := CallbackCreate(GetMethod(implObj, "IsMember"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.Members)
        CallbackFree(this.vtbl.IsMember)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
    }
}
