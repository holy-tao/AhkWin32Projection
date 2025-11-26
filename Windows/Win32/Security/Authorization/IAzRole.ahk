#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines the set of operations that can be performed by a set of users within a scope.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazrole
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzRole extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzRole
     * @type {Guid}
     */
    static IID => Guid("{859e0d8d-62d7-41d8-a034-c0cd5d43fdfa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Description", "put_Description", "get_ApplicationData", "put_ApplicationData", "AddAppMember", "DeleteAppMember", "AddTask", "DeleteTask", "AddOperation", "DeleteOperation", "AddMember", "DeleteMember", "get_Writable", "GetProperty", "SetProperty", "get_AppMembers", "get_Members", "get_Operations", "get_Tasks", "AddPropertyItem", "DeletePropertyItem", "Submit", "AddMemberName", "DeleteMemberName", "get_MembersName"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    ApplicationData {
        get => this.get_ApplicationData()
        set => this.put_ApplicationData(value)
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
    AppMembers {
        get => this.get_AppMembers()
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
    Operations {
        get => this.get_Operations()
    }

    /**
     * @type {VARIANT} 
     */
    Tasks {
        get => this.get_Tasks()
    }

    /**
     * @type {VARIANT} 
     */
    MembersName {
        get => this.get_MembersName()
    }

    /**
     * Sets or retrieves the name of the role.
     * @remarks
     * 
     * The maximum length of the <b>Name</b> property is 64 characters.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrieves the name of the role.
     * @remarks
     * 
     * The maximum length of the <b>Name</b> property is 64 characters.
     * 
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a comment that describes the role.
     * @remarks
     * 
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(9, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * Sets or retrieves a comment that describes the role.
     * @remarks
     * 
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * 
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(10, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * The ApplicationData property of IAzRole sets or retrieves an opaque field that can be used by the application to store information.
     * @remarks
     * 
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-get_applicationdata
     */
    get_ApplicationData() {
        pbstrApplicationData := BSTR()
        result := ComCall(11, this, "ptr", pbstrApplicationData, "HRESULT")
        return pbstrApplicationData
    }

    /**
     * The ApplicationData property of IAzRole sets or retrieves an opaque field that can be used by the application to store information.
     * @remarks
     * 
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * 
     * 
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(12, this, "ptr", bstrApplicationData, "HRESULT")
        return result
    }

    /**
     * Adds the specified IAzApplicationGroup object to the list of application groups that belong to this role.
     * @remarks
     * 
     * To view the list of application groups that belong to this role, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_appmembers">AppMembers</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp String that contains the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to add to the list of the application groups that belong to this role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-addappmember
     */
    AddAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(13, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified IAzApplicationGroup object from the list of application groups that belong to the role.
     * @remarks
     * 
     * To view the list of application groups that belong to the role, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_appmembers">AppMembers</a> property.
     * 
     * @param {BSTR} bstrProp String that contains the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to remove from the list of  application groups that belong to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-deleteappmember
     */
    DeleteAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(14, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the IAzTask object with the specified name to the role.
     * @remarks
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object to add to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-addtask
     */
    AddTask(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(15, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the IAzTask object with the specified name from the role.
     * @remarks
     * 
     * If there are any <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> references to an <b>IAzTask</b> object that has been deleted from the cache, the <b>IAzTask</b> object can no longer be used. In C++, you must release references to deleted <b>IAzTask</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * 
     * @param {BSTR} bstrProp Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object to remove from the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-deletetask
     */
    DeleteTask(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(16, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the IAzOperation object with the specified name to the role.
     * @remarks
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object to add to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-addoperation
     */
    AddOperation(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(17, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the IAzOperation object with the specified name from the role.
     * @remarks
     * 
     * If there are any <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> references to an <b>IAzOperation</b> object that has been deleted from the cache, the <b>IAzOperation</b> object can no longer be used. In C++, you must release references to deleted <b>IAzOperation</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * 
     * @param {BSTR} bstrProp Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object to remove from the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-deleteoperation
     */
    DeleteOperation(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(18, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of Windows accounts that belong to the role.
     * @remarks
     * 
     * To view the list of SIDs of Windows accounts that belong to this role in text form, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_members">Members</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp String that contains the text form of the SID to add to the list of Windows  accounts that belong to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-addmember
     */
    AddMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(19, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified security identifier (SID) in text form from the list of Windows accounts that belong to the role.
     * @remarks
     * 
     * To view the list of SIDs of Windows accounts that belong to the role in text form, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_members">Members</a> property.
     * 
     * @param {BSTR} bstrProp String that contains the text form of the SID to remove from the list of Windows  accounts that belong to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-deletemember
     */
    DeleteMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(20, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the role can be modified by the user context that initialized it.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-get_writable
     */
    get_Writable() {
        result := ComCall(21, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * Returns the IAzRole object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object property  to return. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_applicationdata">ApplicationData</a>  property
     * 
     * </td>
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
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_description">Description</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_name">Name</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_APP_MEMBERS"></a><a id="az_prop_role_app_members"></a><dl>
     * <dt><b>AZ_PROP_ROLE_APP_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_appmembers">AppMembers</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_MEMBERS"></a><a id="az_prop_role_members"></a><dl>
     * <dt><b>AZ_PROP_ROLE_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_members">Members</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_MEMBERS_NAME"></a><a id="az_prop_role_members_name"></a><dl>
     * <dt><b>AZ_PROP_ROLE_MEMBERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_membersname">MembersName</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_OPERATIONS"></a><a id="az_prop_role_operations"></a><dl>
     * <dt><b>AZ_PROP_ROLE_OPERATIONS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_operations">Operations</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_TASKS"></a><a id="az_prop_role_tasks"></a><dl>
     * <dt><b>AZ_PROP_ROLE_TASKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_tasks">Tasks</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_WRITABLE"></a><a id="az_prop_writable"></a><dl>
     * <dt><b>AZ_PROP_WRITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_writable">Writable</a>  property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {VARIANT} A pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object property.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(22, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Sets the specified value to the IAzRole object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object property  to set. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_applicationdata">ApplicationData</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_description">Description</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_name">Name</a>  property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp The value to set to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object property  specified by the <i>lPropId</i> parameter. The following table shows the type of data that must be used depending on the value of the <i>lPropId</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>lPropId</i> value</th>
     * <th>Data type (C++/Visual Basic)</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
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
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Any other value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(23, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the application groups that belong to the role.
     * @remarks
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-get_appmembers
     */
    get_AppMembers() {
        pvarProp := VARIANT()
        result := ComCall(24, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the security identifiers (SIDs), in text form, of Windows accounts that belong to the role.
     * @remarks
     * 
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-get_members
     */
    get_Members() {
        pvarProp := VARIANT()
        result := ComCall(25, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the operations associated with the role.
     * @remarks
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-get_operations
     */
    get_Operations() {
        pvarProp := VARIANT()
        result := ComCall(26, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the tasks associated with the role.
     * @remarks
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-get_tasks
     */
    get_Tasks() {
        pvarProp := VARIANT()
        result := ComCall(27, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Adds the specified entity to the specified list.
     * @param {Integer} lPropId Property ID of the  list to which to add the entity specified by the <i>varProp</i> parameter. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_APP_MEMBERS"></a><a id="az_prop_role_app_members"></a><dl>
     * <dt><b>AZ_PROP_ROLE_APP_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-addappmember">AddAppMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_MEMBERS"></a><a id="az_prop_role_members"></a><dl>
     * <dt><b>AZ_PROP_ROLE_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-addmember">AddMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_MEMBERS_NAME"></a><a id="az_prop_role_members_name"></a><dl>
     * <dt><b>AZ_PROP_ROLE_MEMBERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-addmembername">AddMemberName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_OPERATIONS"></a><a id="az_prop_role_operations"></a><dl>
     * <dt><b>AZ_PROP_ROLE_OPERATIONS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-addoperation">AddOperation</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_TASKS"></a><a id="az_prop_role_tasks"></a><dl>
     * <dt><b>AZ_PROP_ROLE_TASKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-addtask">AddTask</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Entity to add to the list  specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * 
     * If AZ_PROP_ROLE_MEMBERS is specified for the <i>lPropId</i> parameter, the string is the text form of the   <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the Windows account to add to the list. If AZ_PROP_ROLE_MEMBERS_NAME is specified for the <i>lPropId</i> parameter, the string is the account name of the account to add to the list. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the  "ExampleDomain\UserName" format. If AZ_PROP_ROLE_APP_MEMBERS is specified for the <i>lPropId</i> parameter, the string is the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to add to the list.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Any other value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(28, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
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
     * <td width="40%"><a id="AZ_PROP_ROLE_APP_MEMBERS"></a><a id="az_prop_role_app_members"></a><dl>
     * <dt><b>AZ_PROP_ROLE_APP_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-deleteappmember">DeleteAppMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_MEMBERS"></a><a id="az_prop_role_members"></a><dl>
     * <dt><b>AZ_PROP_ROLE_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-deletemember">DeleteMember</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_MEMBERS_NAME"></a><a id="az_prop_role_members_name"></a><dl>
     * <dt><b>AZ_PROP_ROLE_MEMBERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-deletemembername">DeleteMemberName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_OPERATIONS"></a><a id="az_prop_role_operations"></a><dl>
     * <dt><b>AZ_PROP_ROLE_OPERATIONS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-deleteoperation">DeleteOperation</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_ROLE_TASKS"></a><a id="az_prop_role_tasks"></a><dl>
     * <dt><b>AZ_PROP_ROLE_TASKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-deletetask">DeleteTask</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Entity to remove from the list  specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * 
     * If AZ_PROP_ROLE_MEMBERS is specified for the <i>lPropId</i> parameter, the string is the  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the Windows account to remove from the list. If AZ_PROP_ROLE_MEMBERS_NAME is specified for the <i>lPropId</i> parameter, the string is the account name of the account to remove from the list. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the "ExampleDomain\UserName" format. If AZ_PROP_ROLE_APP_MEMBERS is specified for the <i>lPropId</i> parameter, the string is the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-get_name">Name</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to remove from the list.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Any other value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(29, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Persists changes made to the IAzRole object.
     * @remarks
     * 
     * Any additions or modifications to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object are not persisted until the <b>Submit</b> method is called.
     * 
     * @param {Integer} lFlags Flags that modify the behavior of the <b>Submit</b> method. The default value is zero. If the AZ_SUBMIT_FLAG_ABORT flag is specified, the changes to the object are discarded and the object is updated to match the underlying policy store.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(30, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified account name to the list of accounts that belong to the role.
     * @remarks
     * 
     * To view the list of account names of accounts that belong to this role, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_membersname">MembersName</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrProp String that contains the account name to add to the list of   accounts that belong to the role. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the  "ExampleDomain\UserName" format. If the domain is not  in the "ExampleDomain\UserName" format, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-addmembername
     */
    AddMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(31, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of accounts that belong to the role.
     * @remarks
     * 
     * To view the list of account names of accounts that belong to the role, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-get_membersname">MembersName</a> property.
     * 
     * @param {BSTR} bstrProp String that contains the account name to remove from the list of  accounts that belong to the role. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the "ExampleDomain\UserName" format. If the domain is not  in the "ExampleDomain\UserName" format, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-deletemembername
     */
    DeleteMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(32, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the account names of accounts that belong to the role.
     * @remarks
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazrole-get_membersname
     */
    get_MembersName() {
        pvarProp := VARIANT()
        result := ComCall(33, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }
}
