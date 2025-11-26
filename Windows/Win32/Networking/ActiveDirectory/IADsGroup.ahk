#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADsMembers.ahk
#Include .\IADs.ahk

/**
 * Manages group membership data in a directory service.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsgroup
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsGroup extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsGroup
     * @type {Guid}
     */
    static IID => Guid("{27636b00-410f-11cf-b1ff-02608c9e7553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description", "put_Description", "Members", "IsMember", "Add", "Remove"]

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
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(21, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of the immediate members of the group.
     * @returns {IADsMembers} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsmembers">IADsMembers</a> interface pointer that receives the collection of group members. The caller must  release this interface when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsgroup-members
     */
    Members() {
        result := ComCall(22, this, "ptr*", &ppMembers := 0, "HRESULT")
        return IADsMembers(ppMembers)
    }

    /**
     * Determines if a directory service object is an immediate member of the group.
     * @param {BSTR} bstrMember Contains the ADsPath of the directory service object to verify membership. This ADsPath must use the same ADSI provider used to bind to the group. For example, if the group was bound to using the LDAP provider, this ADsPath must also use the LDAP provider.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> value that receives <b>VARIANT_TRUE</b> if the object is an immediate member of the group or <b>VARIANT_FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsgroup-ismember
     */
    IsMember(bstrMember) {
        bstrMember := bstrMember is String ? BSTR.Alloc(bstrMember).Value : bstrMember

        result := ComCall(23, this, "ptr", bstrMember, "short*", &bMember := 0, "HRESULT")
        return bMember
    }

    /**
     * Adds an ADSI object to an existing group.
     * @param {BSTR} bstrNewItem Contains a <b>BSTR</b> that specifies the ADsPath of the object to add to the group. For more information, see Remarks.
     * @returns {HRESULT} The following are the most common return values. For more information about return values, see <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsgroup-add
     */
    Add(bstrNewItem) {
        bstrNewItem := bstrNewItem is String ? BSTR.Alloc(bstrNewItem).Value : bstrNewItem

        result := ComCall(24, this, "ptr", bstrNewItem, "HRESULT")
        return result
    }

    /**
     * The IADsGroup::Remove method removes the specified user object from this group. The operation does not remove the group object itself even when there is no member remaining in the group.
     * @param {BSTR} bstrItemToBeRemoved Contains a <b>BSTR</b> that specifies the ADsPath of the object to remove from the group. For more information about this parameter, see the Remarks section.
     * @returns {HRESULT} The following are the most common return values. For more information about return values, see <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsgroup-remove
     */
    Remove(bstrItemToBeRemoved) {
        bstrItemToBeRemoved := bstrItemToBeRemoved is String ? BSTR.Alloc(bstrItemToBeRemoved).Value : bstrItemToBeRemoved

        result := ComCall(25, this, "ptr", bstrItemToBeRemoved, "HRESULT")
        return result
    }
}
