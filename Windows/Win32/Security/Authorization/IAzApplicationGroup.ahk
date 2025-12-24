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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {BSTR} 
     */
    LdapQuery {
        get => this.get_LdapQuery()
        set => this.put_LdapQuery(value)
    }

    /**
     * @type {VARIANT} 
     */
    AppMembers {
        get => this.get_AppMembers()
    }

    /**
     * @type {VARIANT} 
     */
    AppNonMembers {
        get => this.get_AppNonMembers()
    }

    /**
     * @type {VARIANT} 
     */
    Members {
        get => this.get_Members()
    }

    /**
     * @type {VARIANT} 
     */
    NonMembers {
        get => this.get_NonMembers()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BOOL} 
     */
    Writable {
        get => this.get_Writable()
    }

    /**
     * @type {VARIANT} 
     */
    MembersName {
        get => this.get_MembersName()
    }

    /**
     * @type {VARIANT} 
     */
    NonMembersName {
        get => this.get_NonMembersName()
    }

    /**
     * Sets or retrieves the name of the application group.
     * @remarks
     * 
     * The maximum length of the <b>Name</b> property is 64 characters.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrieves the name of the application group.
     * @remarks
     * 
     * The maximum length of the <b>Name</b> property is 64 characters.
     * 
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the group type of the application group.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_type
     */
    get_Type() {
        result := ComCall(9, this, "int*", &plProp := 0, "HRESULT")
        return plProp
    }

    /**
     * Sets or retrieves the group type of the application group.
     * @param {Integer} lProp 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-put_type
     */
    put_Type(lProp) {
        result := ComCall(10, this, "int", lProp, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the Lightweight Directory Access Protocol (LDAP) query used to define membership for an LDAP query application group.
     * @remarks
     * 
     * This property is ignored unless the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_type">Type</a> property is AZ_GROUPTYPE_LDAP_QUERY. 
     * 
     * The maximum length of this property is 4,096 characters.
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_ldapquery
     */
    get_LdapQuery() {
        pbstrProp := BSTR()
        result := ComCall(11, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Sets or retrieves the Lightweight Directory Access Protocol (LDAP) query used to define membership for an LDAP query application group.
     * @remarks
     * 
     * This property is ignored unless the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_type">Type</a> property is AZ_GROUPTYPE_LDAP_QUERY. 
     * 
     * The maximum length of this property is 4,096 characters.
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-put_ldapquery
     */
    put_LdapQuery(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(12, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * Retrieves the application groups that belong to this application group.
     * @remarks
     * 
     * This property allows the nesting of <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> objects within another <b>IAzApplicationGroup</b> object.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_appmembers
     */
    get_AppMembers() {
        pvarProp := VARIANT()
        result := ComCall(13, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the application groups that are refused membership in this application group.
     * @remarks
     * 
     * Denying membership to an account in an application group does not prevent that account from being assigned to a role through a different application group, nor from being granted permission to a resource through assignment to any other role.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_appnonmembers
     */
    get_AppNonMembers() {
        pvarProp := VARIANT()
        result := ComCall(14, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the security identifiers (SIDs), in text form, of accounts that belong to the application group.
     * @remarks
     * 
     * This property is ignored unless the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_type">Type</a> property is AZ_GROUPTYPE_BASIC.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_members
     */
    get_Members() {
        pvarProp := VARIANT()
        result := ComCall(15, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the security identifiers (SIDs), in text form, of accounts that are refused membership in the application group.
     * @remarks
     * 
     * The application group will never have an  account specified by this property as a member, even if that account is specified directly or indirectly by the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_members">Members</a> property.
     * 
     * This property is ignored unless the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_type">Type</a> property is AZ_GROUPTYPE_BASIC.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * Denying membership to an account in an application group does not prevent that account from being assigned to a role through a different application group, nor from being granted permission to a resource through assignment to any other role.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_nonmembers
     */
    get_NonMembers() {
        pvarProp := VARIANT()
        result := ComCall(16, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Sets or retrieves a comment that describes the application group.
     * @remarks
     * 
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(17, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * Sets or retrieves a comment that describes the application group.
     * @remarks
     * 
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * 
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(18, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * Adds the specified IAzApplicationGroup object to the list of application groups that belong to this application group.
     * @remarks
     * 
     * To view the list of application groups that belong to this application group, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_appmembers">AppMembers</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp String that contains the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to add to the list of the application groups that belong to this application group.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-addappmember
     */
    AddAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(19, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified IAzApplicationGroup object from the list of application groups that belong to this application group.
     * @remarks
     * 
     * To view the list of application groups that belong to this application group, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_appmembers">AppMembers</a> property.
     * 
     * @param {BSTR} bstrProp String that contains the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to remove from the list of  application groups that belong to this application group.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-deleteappmember
     */
    DeleteAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(20, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified IAzApplicationGroup object to the list of application groups that are refused membership in this application group.
     * @remarks
     * 
     * To view the list of application groups that are refused membership in this application group, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_appnonmembers">AppNonMembers</a> property.
     * 
     * Denying membership to an account in an application group does not prevent that account from being assigned to a role through a different application group, nor from being granted permission to a resource through assignment to any other role.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp String that contains the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to add to the list of the application groups that are refused membership in this application group.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-addappnonmember
     */
    AddAppNonMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(21, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified IAzApplicationGroup object from the list of application groups that are refused membership in this application group.
     * @remarks
     * 
     * To view the list of application groups that are refused membership in this application group, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_appnonmembers">AppNonMembers</a> property.
     * 
     * @param {BSTR} bstrProp String that contains the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to remove from the list of the application groups that are refused membership in this application group.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-deleteappnonmember
     */
    DeleteAppNonMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(22, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of accounts that belong to the application group.
     * @remarks
     * 
     * To view the list of SIDs of accounts that belong to this application group in text form, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_members">Members</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp String that contains the text form of the SID to add to the list of  accounts that belong to the application group.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-addmember
     */
    AddMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(23, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified security identifier (SID) in text form from the list of accounts that belong to the application group.
     * @remarks
     * 
     * To view the list of SIDs of accounts that belong to this application group in text form, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_members">Members</a> property.
     * 
     * @param {BSTR} bstrProp String that contains the text form of the SID to remove from the list of  accounts that belong to the application group.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-deletemember
     */
    DeleteMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(24, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of accounts that are refused membership in the application group.
     * @remarks
     * 
     * The application group will never have an  account added using this method as a member, even if that account is specified directly or indirectly by the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_members">Members</a> property.
     * 
     * Denying membership to an account in an application group does not prevent that account from being assigned to a role through a different application group, nor from being granted permission to a resource through assignment to any other role.
     * 
     * To view the list of SIDs of accounts that are refused membership in this application group in text form, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_nonmembers">NonMembers</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp String that contains the text form of the SID to add to the list of  accounts that are refused membership in the application group.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-addnonmember
     */
    AddNonMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(25, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified security identifier (SID) in text form from the list of accounts that are refused membership in the application group.
     * @remarks
     * 
     * To view the list of SIDs of accounts that are refused membership in this application group in text form, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_nonmembers">NonMembers</a> property.
     * 
     * @param {BSTR} bstrProp String that contains the text form of the SID to remove from the list of  accounts that are refused membership in the application group.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-deletenonmember
     */
    DeleteNonMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(26, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the application group can be modified by the user context that initialized it.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_writable
     */
    get_Writable() {
        result := ComCall(27, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * Returns the IAzApplicationGroup object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object property  to return. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CHILD_CREATE"></a><a id="az_prop_child_create"></a><dl>
     * <dt><b>AZ_PROP_CHILD_CREATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Determines whether the current user has permission to create child objects. This value will always be <b>FALSE</b> because this object cannot have child objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_description">Description</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_APP_MEMBERS"></a><a id="az_prop_group_app_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_APP_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_appmembers">AppMembers</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_APP_NON_MEMBERS"></a><a id="az_prop_group_app_non_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_APP_NON_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_appnonmembers">AppNonMembers</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_MEMBERS"></a><a id="az_prop_group_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_members">Members</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_MEMBERS_NAME"></a><a id="az_prop_group_members_name"></a><dl>
     * <dt><b>AZ_PROP_GROUP_MEMBERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_membersname">MembersName</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_NON_MEMBERS"></a><a id="az_prop_group_non_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_NON_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_nonmembers">NonMembers</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_NON_MEMBERS_NAME"></a><a id="az_prop_group_non_members_name"></a><dl>
     * <dt><b>AZ_PROP_GROUP_NON_MEMBERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_nonmembersname">NonMembersName</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_TYPE"></a><a id="az_prop_group_type"></a><dl>
     * <dt><b>AZ_PROP_GROUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_type">Type</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_LDAP_QUERY"></a><a id="az_prop_group_ldap_query"></a><dl>
     * <dt><b>AZ_PROP_GROUP_LDAP_QUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_ldapquery">LdapQuery</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_WRITABLE"></a><a id="az_prop_writable"></a><dl>
     * <dt><b>AZ_PROP_WRITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_writable">Writable</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {VARIANT} A pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object property.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(28, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Sets the specified value to the IAzApplicationGroup object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object property  to set. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_description">Description</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_TYPE"></a><a id="az_prop_group_type"></a><dl>
     * <dt><b>AZ_PROP_GROUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_type">Type</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_LDAP_QUERY"></a><a id="az_prop_group_ldap_query"></a><dl>
     * <dt><b>AZ_PROP_GROUP_LDAP_QUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_ldapquery">LdapQuery</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Value to set to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object property  specified by the <i>lPropId</i> parameter. The following table shows the type of data that must be used depending on the value of the <i>lPropId</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>lPropId</i> value</th>
     * <th>Data type (C++/Visual Basic)</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_LDAP_QUERY"></a><a id="az_prop_group_ldap_query"></a><dl>
     * <dt><b>AZ_PROP_GROUP_LDAP_QUERY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_TYPE"></a><a id="az_prop_group_type"></a><dl>
     * <dt><b>AZ_PROP_GROUP_TYPE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>LONG</b>/<b>Long</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(29, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified entity to the specified list.
     * @remarks
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {Integer} lPropId Property ID of the  list to which to add the entity specified by the <i>varProp</i> parameter. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_APP_MEMBERS"></a><a id="az_prop_group_app_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_APP_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-addappmember">AddAppMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_APP_NON_MEMBERS"></a><a id="az_prop_group_app_non_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_APP_NON_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-addappnonmember">AddAppNonMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_MEMBERS"></a><a id="az_prop_group_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-addmember">AddMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_MEMBERS_NAME"></a><a id="az_prop_group_members_name"></a><dl>
     * <dt><b>AZ_PROP_GROUP_MEMBERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-addmembername">AddMemberName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_NON_MEMBERS"></a><a id="az_prop_group_non_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_NON_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-addnonmember">AddNonMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_NON_MEMBERS_NAME"></a><a id="az_prop_group_non_members_name"></a><dl>
     * <dt><b>AZ_PROP_GROUP_NON_MEMBERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-addnonmembername">AddNonMemberName</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp TBD
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(30, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified entity from the specified list.
     * @param {Integer} lPropId Property ID of the  list from which to remove the entity specified by the <i>varProp</i> parameter. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_APP_MEMBERS"></a><a id="az_prop_group_app_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_APP_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-deleteappmember">DeleteAppMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_APP_NON_MEMBERS"></a><a id="az_prop_group_app_non_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_APP_NON_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-deleteappnonmember">DeleteAppNonMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_MEMBERS"></a><a id="az_prop_group_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-deletemember">DeleteMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_MEMBERS_NAME"></a><a id="az_prop_group_members_name"></a><dl>
     * <dt><b>AZ_PROP_GROUP_MEMBERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-deletemembername">DeleteMemberName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_NON_MEMBERS"></a><a id="az_prop_group_non_members"></a><dl>
     * <dt><b>AZ_PROP_GROUP_NON_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-deletenonmember">DeleteNonMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GROUP_NON_MEMBERS_NAME"></a><a id="az_prop_group_non_members_name"></a><dl>
     * <dt><b>AZ_PROP_GROUP_NON_MEMBERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-deletenonmembername">DeleteNonMemberName</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp The entity to remove from the list  specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * 
     * If AZ_PROP_GROUP_MEMBERS_NAME or AZ_PROP_GROUP_NON_MEMBERS_NAME is specified for the <i>lPropId</i> parameter, the string is the account name of the account to remove from the list. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). If AZ_PROP_GROUP_APP_MEMBERS or AZ_PROP_GROUP_APP_NON_MEMBERS is specified for the <i>lPropId</i> parameter, the string is the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to remove from the list.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(31, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Persists changes made to the IAzApplicationGroup object.
     * @remarks
     * 
     * Any additions or modifications to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object are not persisted until the <b>Submit</b> method is called. 
     * 
     * A created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object must be submitted before it can be referenced. The destructor for an object silently discards unsubmitted changes.
     * 
     * @param {Integer} lFlags Flags that modify the behavior of the <b>Submit</b> method. The default value is zero. If the AZ_SUBMIT_FLAG_ABORT flag is specified, the changes to the object are discarded and the object is updated to match the underlying policy store.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(32, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified account name to the list of accounts that belong to the application group.
     * @remarks
     * 
     * To view the list of account names of  accounts that belong to this application group, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_membersname">MembersName</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp String that contains the account name to add to the list of accounts that belong to the application group. The account name must be in user principal name (UPN) format. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-addmembername
     */
    AddMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(33, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of accounts that belong to the application group.
     * @remarks
     * 
     * To view the list of account names of  accounts that belong to this application group, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_membersname">MembersName</a> property.
     * 
     * @param {BSTR} bstrProp String that contains the account name to remove from the list of   accounts that belong to the application group. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-deletemembername
     */
    DeleteMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(34, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified account name to the list of accounts that are refused membership in the application group.
     * @remarks
     * 
     * The application group will never have an  account added using this method as a member, even if that account is specified directly or indirectly by the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_members">Members</a> property.
     * 
     * Denying membership to an account in an application group does not prevent that account from being assigned to a role through a different application group, nor from being granted permission to a resource through assignment to any other role.
     * 
     * To view the list of account names of  accounts that are refused membership in this application group, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_nonmembersname">NonMembersName</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp String that contains the SID to add to the list of accounts that are refused membership in the application group. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-addnonmembername
     */
    AddNonMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(35, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of accounts that are refused membership in the application group.
     * @remarks
     * 
     * To view the list of account names of accounts that are refused membership in this application group, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_nonmembersname">NonMembersName</a> property.
     * 
     * @param {BSTR} bstrProp String that contains the account name to remove from the list of   accounts that are refused membership in the application group. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-deletenonmembername
     */
    DeleteNonMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(36, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the account names of accounts that belong to the application group.
     * @remarks
     * 
     * This property is ignored unless the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_type">Type</a> property is AZ_GROUPTYPE_BASIC.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_membersname
     */
    get_MembersName() {
        pvarProp := VARIANT()
        result := ComCall(37, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the account names of accounts that are refused membership in the application group.
     * @remarks
     * 
     * The application group will never have an  account specified by this property as a member, even if that account is specified directly or indirectly by the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_members">Members</a> property.
     * 
     * Denying membership to an account in an application group does not prevent that account from being assigned to a role through a different application group, nor from being granted permission to a resource through assignment to any other role.
     * 
     * This property is ignored unless the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_type">Type</a> property is AZ_GROUPTYPE_BASIC.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplicationgroup-get_nonmembersname
     */
    get_NonMembersName() {
        pvarProp := VARIANT()
        result := ComCall(38, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }
}
