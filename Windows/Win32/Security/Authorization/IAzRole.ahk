#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Defines the set of operations that can be performed by a set of users within a scope.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazrole
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzRole extends IDispatch {
    /**
     * The interface identifier for IAzRole
     * @type {Guid}
     */
    static IID := Guid("{859e0d8d-62d7-41d8-a034-c0cd5d43fdfa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzRole interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name            : IntPtr
        put_Name            : IntPtr
        get_Description     : IntPtr
        put_Description     : IntPtr
        get_ApplicationData : IntPtr
        put_ApplicationData : IntPtr
        AddAppMember        : IntPtr
        DeleteAppMember     : IntPtr
        AddTask             : IntPtr
        DeleteTask          : IntPtr
        AddOperation        : IntPtr
        DeleteOperation     : IntPtr
        AddMember           : IntPtr
        DeleteMember        : IntPtr
        get_Writable        : IntPtr
        GetProperty         : IntPtr
        SetProperty         : IntPtr
        get_AppMembers      : IntPtr
        get_Members         : IntPtr
        get_Operations      : IntPtr
        get_Tasks           : IntPtr
        AddPropertyItem     : IntPtr
        DeletePropertyItem  : IntPtr
        Submit              : IntPtr
        AddMemberName       : IntPtr
        DeleteMemberName    : IntPtr
        get_MembersName     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzRole.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Sets or retrieves the name of the role. (Get)
     * @remarks
     * The maximum length of the <b>Name</b> property is 64 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrieves the name of the role. (Put)
     * @remarks
     * The maximum length of the <b>Name</b> property is 64 characters.
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, BSTR, bstrName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a comment that describes the role. (Get)
     * @remarks
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_description
     */
    get_Description() {
        pbstrDescription := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * Sets or retrieves a comment that describes the role. (Put)
     * @remarks
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(10, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * The ApplicationData property of IAzRole sets or retrieves an opaque field that can be used by the application to store information. (Get)
     * @remarks
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_applicationdata
     */
    get_ApplicationData() {
        pbstrApplicationData := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrApplicationData, "HRESULT")
        return pbstrApplicationData
    }

    /**
     * The ApplicationData property of IAzRole sets or retrieves an opaque field that can be used by the application to store information. (Put)
     * @remarks
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(12, this, BSTR, bstrApplicationData, "HRESULT")
        return result
    }

    /**
     * Adds the specified IAzApplicationGroup object to the list of application groups that belong to this role.
     * @remarks
     * To view the list of application groups that belong to this role, use the [AppMembers](nf-azroles-iazrole-get_appmembers.md) property.
     * 
     * You must call the [Submit](nf-azroles-iazrole-submit.md) method to persist any changes made by this method.
     * @param {BSTR} bstrProp String that contains the [Name](nf-azroles-iazapplicationgroup-get_name.md) property of the [IAzApplicationGroup](nn-azroles-iazapplicationgroup.md) object to add to the list of the application groups that belong to this role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addappmember
     */
    AddAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(13, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified IAzApplicationGroup object from the list of application groups that belong to the role.
     * @remarks
     * To view the list of application groups that belong to the role, use the [AppMembers](nf-azroles-iazrole-get_appmembers.md) property.
     * @param {BSTR} bstrProp String that contains the [Name](nf-azroles-iazapplicationgroup-get_name.md) property of the [IAzApplicationGroup](nn-azroles-iazapplicationgroup.md) object to remove from the list of  application groups that belong to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deleteappmember
     */
    DeleteAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(14, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the IAzTask object with the specified name to the role.
     * @remarks
     * You must call the [Submit](nf-azroles-iazrole-submit.md) method to persist any changes made by this method.
     * @param {BSTR} bstrProp Name of the [IAzTask](nn-azroles-iaztask.md) object to add to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addtask
     */
    AddTask(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(15, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the IAzTask object with the specified name from the role.
     * @remarks
     * If there are any [IAzTask](nn-azroles-iaztask.md) references to an **IAzTask** object that has been deleted from the cache, the **IAzTask** object can no longer be used. In C++, you must release references to deleted **IAzTask** objects by calling the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method. In C# and Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrProp Name of the [IAzTask](nn-azroles-iaztask.md) object to remove from the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deletetask
     */
    DeleteTask(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(16, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the IAzOperation object with the specified name to the role.
     * @remarks
     * You must call the [Submit](nf-azroles-iazrole-submit.md) method to persist any changes made by this method.
     * @param {BSTR} bstrProp Name of the [IAzOperation](nn-azroles-iazoperation.md) object to add to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addoperation
     */
    AddOperation(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(17, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the IAzOperation object with the specified name from the role.
     * @remarks
     * If there are any [IAzOperation](nn-azroles-iazoperation.md) references to an **IAzOperation** object that has been deleted from the cache, the **IAzOperation** object can no longer be used. In C++, you must release references to deleted **IAzOperation** objects by calling the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method. In C# and Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrProp Name of the [IAzOperation](nn-azroles-iazoperation.md) object to remove from the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deleteoperation
     */
    DeleteOperation(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(18, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of Windows accounts that belong to the role.
     * @remarks
     * To view the list of SIDs of Windows accounts that belong to this role in text form, use the [Members](nf-azroles-iazrole-get_members.md) property.
     * 
     * You must call the [Submit](nf-azroles-iazrole-submit.md) method to persist any changes made by this method.
     * @param {BSTR} bstrProp String that contains the text form of the SID to add to the list of Windows accounts that belong to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addmember
     */
    AddMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(19, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified security identifier (SID) in text form from the list of Windows accounts that belong to the role.
     * @remarks
     * To view the list of SIDs of Windows accounts that belong to the role in text form, use the [Members](nf-azroles-iazrole-get_members.md) property.
     * @param {BSTR} bstrProp String that contains the text form of the SID to remove from the list of Windows accounts that belong to the role.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deletemember
     */
    DeleteMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(20, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the role can be modified by the user context that initialized it.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_writable
     */
    get_Writable() {
        result := ComCall(21, this, BOOL.Ptr, &pfProp := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(22, this, "int", lPropId, VARIANT, varReserved, VARIANT.Ptr, pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Sets the specified value to the IAzRole object property with the specified property ID.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">Submit</a> method to persist any changes made by this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(23, this, "int", lPropId, VARIANT, varProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the application groups that belong to the role.
     * @remarks
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_appmembers
     */
    get_AppMembers() {
        pvarProp := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the security identifiers (SIDs), in text form, of Windows accounts that belong to the role.
     * @remarks
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_members
     */
    get_Members() {
        pvarProp := VARIANT()
        result := ComCall(25, this, VARIANT.Ptr, pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the operations associated with the role.
     * @remarks
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_operations
     */
    get_Operations() {
        pvarProp := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Retrieves the tasks associated with the role.
     * @remarks
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_tasks
     */
    get_Tasks() {
        pvarProp := VARIANT()
        result := ComCall(27, this, VARIANT.Ptr, pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Adds the specified entity to the specified list. (IAzRole.AddPropertyItem)
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">Submit</a> method to persist any changes made by this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(28, this, "int", lPropId, VARIANT, varProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified entity from the specified list. (IAzRole.DeletePropertyItem)
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(29, this, "int", lPropId, VARIANT, varProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Persists changes made to the IAzRole object.
     * @remarks
     * Any additions or modifications to an [IAzRole](nn-azroles-iazrole.md) object are not persisted until the **Submit** method is called.
     * @param {Integer} lFlags Flags that modify the behavior of the **Submit** method. The default value is zero. If the **AZ_SUBMIT_FLAG_ABORT** flag is specified, the changes to the object are discarded and the object is updated to match the underlying policy store.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(30, this, "int", lFlags, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified account name to the list of accounts that belong to the role.
     * @remarks
     * To view the list of account names of accounts that belong to this role, use the [MembersName](nf-azroles-iazrole-get_membersname.md) property.
     * 
     * You must call the [Submit](nf-azroles-iazrole-submit.md) method to persist any changes made by this method.
     * @param {BSTR} bstrProp String that contains the account name to add to the list of accounts that belong to the role. The account name can be in either user principal name (UPN) format (for example, `someone@example.com`) or in the `ExampleDomain\UserName` format. If the domain is not in the `ExampleDomain\UserName` format, the [LookupAccountName](/windows/win32/api/winbase/nf-winbase-lookupaccountnamea) function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addmembername
     */
    AddMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(31, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of accounts that belong to the role.
     * @remarks
     * To view the list of account names of accounts that belong to the role, use the [MembersName](nf-azroles-iazrole-get_membersname.md) property.
     * @param {BSTR} bstrProp String that contains the account name to remove from the list of accounts that belong to the role. The account name can be in either user principal name (UPN) format (for example, `someone@example.com`) or in the `ExampleDomain\UserName` format. If the domain is not in the `ExampleDomain\UserName` format, the [LookupAccountName](/windows/win32/api/winbase/nf-winbase-lookupaccountnamea) function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deletemembername
     */
    DeleteMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(32, this, BSTR, bstrProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the account names of accounts that belong to the role.
     * @remarks
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_membersname
     */
    get_MembersName() {
        pvarProp := VARIANT()
        result := ComCall(33, this, VARIANT.Ptr, pvarProp, "HRESULT")
        return pvarProp
    }

    Query(iid) {
        if (IAzRole.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_ApplicationData := CallbackCreate(GetMethod(implObj, "get_ApplicationData"), flags, 2)
        this.vtbl.put_ApplicationData := CallbackCreate(GetMethod(implObj, "put_ApplicationData"), flags, 2)
        this.vtbl.AddAppMember := CallbackCreate(GetMethod(implObj, "AddAppMember"), flags, 3)
        this.vtbl.DeleteAppMember := CallbackCreate(GetMethod(implObj, "DeleteAppMember"), flags, 3)
        this.vtbl.AddTask := CallbackCreate(GetMethod(implObj, "AddTask"), flags, 3)
        this.vtbl.DeleteTask := CallbackCreate(GetMethod(implObj, "DeleteTask"), flags, 3)
        this.vtbl.AddOperation := CallbackCreate(GetMethod(implObj, "AddOperation"), flags, 3)
        this.vtbl.DeleteOperation := CallbackCreate(GetMethod(implObj, "DeleteOperation"), flags, 3)
        this.vtbl.AddMember := CallbackCreate(GetMethod(implObj, "AddMember"), flags, 3)
        this.vtbl.DeleteMember := CallbackCreate(GetMethod(implObj, "DeleteMember"), flags, 3)
        this.vtbl.get_Writable := CallbackCreate(GetMethod(implObj, "get_Writable"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 4)
        this.vtbl.get_AppMembers := CallbackCreate(GetMethod(implObj, "get_AppMembers"), flags, 2)
        this.vtbl.get_Members := CallbackCreate(GetMethod(implObj, "get_Members"), flags, 2)
        this.vtbl.get_Operations := CallbackCreate(GetMethod(implObj, "get_Operations"), flags, 2)
        this.vtbl.get_Tasks := CallbackCreate(GetMethod(implObj, "get_Tasks"), flags, 2)
        this.vtbl.AddPropertyItem := CallbackCreate(GetMethod(implObj, "AddPropertyItem"), flags, 4)
        this.vtbl.DeletePropertyItem := CallbackCreate(GetMethod(implObj, "DeletePropertyItem"), flags, 4)
        this.vtbl.Submit := CallbackCreate(GetMethod(implObj, "Submit"), flags, 3)
        this.vtbl.AddMemberName := CallbackCreate(GetMethod(implObj, "AddMemberName"), flags, 3)
        this.vtbl.DeleteMemberName := CallbackCreate(GetMethod(implObj, "DeleteMemberName"), flags, 3)
        this.vtbl.get_MembersName := CallbackCreate(GetMethod(implObj, "get_MembersName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_ApplicationData)
        CallbackFree(this.vtbl.put_ApplicationData)
        CallbackFree(this.vtbl.AddAppMember)
        CallbackFree(this.vtbl.DeleteAppMember)
        CallbackFree(this.vtbl.AddTask)
        CallbackFree(this.vtbl.DeleteTask)
        CallbackFree(this.vtbl.AddOperation)
        CallbackFree(this.vtbl.DeleteOperation)
        CallbackFree(this.vtbl.AddMember)
        CallbackFree(this.vtbl.DeleteMember)
        CallbackFree(this.vtbl.get_Writable)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.get_AppMembers)
        CallbackFree(this.vtbl.get_Members)
        CallbackFree(this.vtbl.get_Operations)
        CallbackFree(this.vtbl.get_Tasks)
        CallbackFree(this.vtbl.AddPropertyItem)
        CallbackFree(this.vtbl.DeletePropertyItem)
        CallbackFree(this.vtbl.Submit)
        CallbackFree(this.vtbl.AddMemberName)
        CallbackFree(this.vtbl.DeleteMemberName)
        CallbackFree(this.vtbl.get_MembersName)
    }
}
