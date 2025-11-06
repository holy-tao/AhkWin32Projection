#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines a collection of principals.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazapplicationgroup
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzApplicationGroup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzApplicationGroup
     * @type {Guid}
     */
    static IID => Guid("{f1b744cd-58a6-4e06-9fbf-36f6d779e21e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Type", "put_Type", "get_LdapQuery", "put_LdapQuery", "get_AppMembers", "get_AppNonMembers", "get_Members", "get_NonMembers", "get_Description", "put_Description", "AddAppMember", "DeleteAppMember", "AddAppNonMember", "DeleteAppNonMember", "AddMember", "DeleteMember", "AddNonMember", "DeleteNonMember", "get_Writable", "GetProperty", "SetProperty", "AddPropertyItem", "DeletePropertyItem", "Submit", "AddMemberName", "DeleteMemberName", "AddNonMemberName", "DeleteNonMemberName", "get_MembersName", "get_NonMembersName"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_type
     */
    get_Type() {
        result := ComCall(9, this, "int*", &plProp := 0, "HRESULT")
        return plProp
    }

    /**
     * 
     * @param {Integer} lProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-put_type
     */
    put_Type(lProp) {
        result := ComCall(10, this, "int", lProp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_ldapquery
     */
    get_LdapQuery() {
        pbstrProp := BSTR()
        result := ComCall(11, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-put_ldapquery
     */
    put_LdapQuery(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(12, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_appmembers
     */
    get_AppMembers() {
        pvarProp := VARIANT()
        result := ComCall(13, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_appnonmembers
     */
    get_AppNonMembers() {
        pvarProp := VARIANT()
        result := ComCall(14, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_members
     */
    get_Members() {
        pvarProp := VARIANT()
        result := ComCall(15, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_nonmembers
     */
    get_NonMembers() {
        pvarProp := VARIANT()
        result := ComCall(16, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(17, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(18, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-addappmember
     */
    AddAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(19, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-deleteappmember
     */
    DeleteAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(20, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-addappnonmember
     */
    AddAppNonMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(21, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-deleteappnonmember
     */
    DeleteAppNonMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(22, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-addmember
     */
    AddMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(23, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-deletemember
     */
    DeleteMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(24, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-addnonmember
     */
    AddNonMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(25, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-deletenonmember
     */
    DeleteNonMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(26, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_writable
     */
    get_Writable() {
        result := ComCall(27, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varReserved 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(28, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(29, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(30, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(31, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(32, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-addmembername
     */
    AddMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(33, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-deletemembername
     */
    DeleteMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(34, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-addnonmembername
     */
    AddNonMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(35, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-deletenonmembername
     */
    DeleteNonMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(36, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_membersname
     */
    get_MembersName() {
        pvarProp := VARIANT()
        result := ComCall(37, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup-get_nonmembersname
     */
    get_NonMembersName() {
        pvarProp := VARIANT()
        result := ComCall(38, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }
}
