#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Description(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
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
     * 
     * @param {Pointer<IADsMembers>} ppMembers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsgroup-members
     */
    Members(ppMembers) {
        result := ComCall(22, this, "ptr*", ppMembers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMember 
     * @param {Pointer<VARIANT_BOOL>} bMember 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsgroup-ismember
     */
    IsMember(bstrMember, bMember) {
        bstrMember := bstrMember is String ? BSTR.Alloc(bstrMember).Value : bstrMember

        result := ComCall(23, this, "ptr", bstrMember, "ptr", bMember, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrNewItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsgroup-add
     */
    Add(bstrNewItem) {
        bstrNewItem := bstrNewItem is String ? BSTR.Alloc(bstrNewItem).Value : bstrNewItem

        result := ComCall(24, this, "ptr", bstrNewItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemToBeRemoved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsgroup-remove
     */
    Remove(bstrItemToBeRemoved) {
        bstrItemToBeRemoved := bstrItemToBeRemoved is String ? BSTR.Alloc(bstrItemToBeRemoved).Value : bstrItemToBeRemoved

        result := ComCall(25, this, "ptr", bstrItemToBeRemoved, "HRESULT")
        return result
    }
}
