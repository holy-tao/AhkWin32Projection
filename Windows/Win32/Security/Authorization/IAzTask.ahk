#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Describes a set of operations.
 * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nn-azroles-iaztask
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzTask extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzTask
     * @type {Guid}
     */
    static IID => Guid("{cb94e592-2e0e-4a6c-a336-b89a6dc1e388}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Description", "put_Description", "get_ApplicationData", "put_ApplicationData", "get_BizRule", "put_BizRule", "get_BizRuleLanguage", "put_BizRuleLanguage", "get_BizRuleImportedPath", "put_BizRuleImportedPath", "get_IsRoleDefinition", "put_IsRoleDefinition", "get_Operations", "get_Tasks", "AddOperation", "DeleteOperation", "AddTask", "DeleteTask", "get_Writable", "GetProperty", "SetProperty", "AddPropertyItem", "DeletePropertyItem", "Submit"]

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
     * @type {BSTR} 
     */
    BizRule {
        get => this.get_BizRule()
        set => this.put_BizRule(value)
    }

    /**
     * @type {BSTR} 
     */
    BizRuleLanguage {
        get => this.get_BizRuleLanguage()
        set => this.put_BizRuleLanguage(value)
    }

    /**
     * @type {BSTR} 
     */
    BizRuleImportedPath {
        get => this.get_BizRuleImportedPath()
        set => this.put_BizRuleImportedPath(value)
    }

    /**
     * @type {BOOL} 
     */
    IsRoleDefinition {
        get => this.get_IsRoleDefinition()
        set => this.put_IsRoleDefinition(value)
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
     * @type {BOOL} 
     */
    Writable {
        get => this.get_Writable()
    }

    /**
     * Sets or retrieves the name of the task. (Get)
     * @remarks
     * The maximum length of the <b>Name</b> property is 64 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * Sets or retrieves the name of the task. (Put)
     * @remarks
     * The maximum length of the <b>Name</b> property is 64 characters.
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-put_name
     */
    put_Name(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves a comment that describes the task. (Get)
     * @remarks
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(9, this, "ptr", pbstrDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrDescription
    }

    /**
     * Sets or retrieves a comment that describes the task. (Put)
     * @remarks
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-put_description
     */
    put_Description(bstrDescription) {
        if(bstrDescription is String) {
            pin := BSTR.Alloc(bstrDescription)
            bstrDescription := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ApplicationData property of IAzTask sets or retrieves an opaque field that can be used by the application to store information. (Get)
     * @remarks
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_applicationdata
     */
    get_ApplicationData() {
        pbstrApplicationData := BSTR()
        result := ComCall(11, this, "ptr", pbstrApplicationData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrApplicationData
    }

    /**
     * The ApplicationData property of IAzTask sets or retrieves an opaque field that can be used by the application to store information. (Put)
     * @remarks
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        if(bstrApplicationData is String) {
            pin := BSTR.Alloc(bstrApplicationData)
            bstrApplicationData := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrApplicationData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves the text of the script that implements the business rule (BizRule). (Get)
     * @remarks
     * The maximum length of this property is 65,536 characters.
     * 
     * <div class="alert"><b>Important</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_bizrulelanguage">BizRuleLanguage</a> property must be set before this property is set.</div>
     * <div> </div>
     * An <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object that is a child object of a delegated <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object cannot have an associated BizRule.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_bizrule
     */
    get_BizRule() {
        pbstrProp := BSTR()
        result := ComCall(13, this, "ptr", pbstrProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrProp
    }

    /**
     * Sets or retrieves the text of the script that implements the business rule (BizRule). (Put)
     * @remarks
     * The maximum length of this property is 65,536 characters.
     * 
     * <div class="alert"><b>Important</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_bizrulelanguage">BizRuleLanguage</a> property must be set before this property is set.</div>
     * <div> </div>
     * An <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object that is a child object of a delegated <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object cannot have an associated BizRule.
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-put_bizrule
     */
    put_BizRule(bstrProp) {
        if(bstrProp is String) {
            pin := BSTR.Alloc(bstrProp)
            bstrProp := pin.Value
        }

        result := ComCall(14, this, "ptr", bstrProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves the scripting language in which the business rule (BizRule) is implemented. (Get)
     * @remarks
     * This property must be set before the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_bizrule">BizRule</a> property is set.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_bizrulelanguage
     */
    get_BizRuleLanguage() {
        pbstrProp := BSTR()
        result := ComCall(15, this, "ptr", pbstrProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrProp
    }

    /**
     * Sets or retrieves the scripting language in which the business rule (BizRule) is implemented. (Put)
     * @remarks
     * This property must be set before the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_bizrule">BizRule</a> property is set.
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-put_bizrulelanguage
     */
    put_BizRuleLanguage(bstrProp) {
        if(bstrProp is String) {
            pin := BSTR.Alloc(bstrProp)
            bstrProp := pin.Value
        }

        result := ComCall(16, this, "ptr", bstrProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves the path to the file from which the business rule (BizRule) is imported. (Get)
     * @remarks
     * The path information is stored for use by the UI. The UI should supply a mechanism to synchronize the contents of the file and this property.
     * 
     * The maximum length of this property is 512 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_bizruleimportedpath
     */
    get_BizRuleImportedPath() {
        pbstrProp := BSTR()
        result := ComCall(17, this, "ptr", pbstrProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrProp
    }

    /**
     * Sets or retrieves the path to the file from which the business rule (BizRule) is imported. (Put)
     * @remarks
     * The path information is stored for use by the UI. The UI should supply a mechanism to synchronize the contents of the file and this property.
     * 
     * The maximum length of this property is 512 characters.
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-put_bizruleimportedpath
     */
    put_BizRuleImportedPath(bstrProp) {
        if(bstrProp is String) {
            pin := BSTR.Alloc(bstrProp)
            bstrProp := pin.Value
        }

        result := ComCall(18, this, "ptr", bstrProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the task is a role definition. (Get)
     * @remarks
     * This property represents a user interface abstraction and does not affect the functionality of the task.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_isroledefinition
     */
    get_IsRoleDefinition() {
        result := ComCall(19, this, "int*", &pfProp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfProp
    }

    /**
     * Sets or retrieves a value that indicates whether the task is a role definition. (Put)
     * @remarks
     * This property represents a user interface abstraction and does not affect the functionality of the task.
     * @param {BOOL} fProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-put_isroledefinition
     */
    put_IsRoleDefinition(fProp) {
        result := ComCall(20, this, "int", fProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the operations associated with the task.
     * @remarks
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_operations
     */
    get_Operations() {
        pvarProp := VARIANT()
        result := ComCall(21, this, "ptr", pvarProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarProp
    }

    /**
     * Retrieves the tasks associated with the task.
     * @remarks
     * This property shows the nesting of <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> objects within another <b>IAzTask</b> object.
     * 
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_tasks
     */
    get_Tasks() {
        pvarProp := VARIANT()
        result := ComCall(22, this, "ptr", pvarProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarProp
    }

    /**
     * Adds the IAzOperation object with the specified name to the task.
     * @remarks
     * You must call the [Submit](nf-azroles-iaztask-submit.md) method to persist any changes made by this method.
     * @param {BSTR} bstrOp Name of the [IAzOperation](nn-azroles-iazoperation.md) object to add to the task.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-addoperation
     */
    AddOperation(bstrOp, varReserved) {
        if(bstrOp is String) {
            pin := BSTR.Alloc(bstrOp)
            bstrOp := pin.Value
        }

        result := ComCall(23, this, "ptr", bstrOp, "ptr", varReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the IAzOperation object with the specified name from the task.
     * @remarks
     * If there are any [IAzOperation](nn-azroles-iazoperation.md) references to an **IAzOperation** object that has been deleted from the cache, the **IAzOperation** object can no longer be used. In C++, you must release references to deleted **IAzOperation** objects by calling the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method. In C# and Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrOp Name of the [IAzOperation](nn-azroles-iazoperation.md) object to remove from the task.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-deleteoperation
     */
    DeleteOperation(bstrOp, varReserved) {
        if(bstrOp is String) {
            pin := BSTR.Alloc(bstrOp)
            bstrOp := pin.Value
        }

        result := ComCall(24, this, "ptr", bstrOp, "ptr", varReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds the IAzTask object with the specified name to the task.
     * @remarks
     * This method allows the nesting of [IAzTask](nn-azroles-iaztask.md) objects within another **IAzTask** object.
     * 
     * You must call the [Submit](nf-azroles-iaztask-submit.md) method to persist any changes made by this method.
     * @param {BSTR} bstrTask Name of the [IAzTask](nn-azroles-iaztask.md) object to add to the task.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-addtask
     */
    AddTask(bstrTask, varReserved) {
        if(bstrTask is String) {
            pin := BSTR.Alloc(bstrTask)
            bstrTask := pin.Value
        }

        result := ComCall(25, this, "ptr", bstrTask, "ptr", varReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the IAzTask object with the specified name from the task.
     * @remarks
     * If there are any [IAzTask](nn-azroles-iaztask.md) references to an **IAzTask** object that has been deleted from the cache, the **IAzTask** object can no longer be used. In C++, you must release references to deleted **IAzTask** objects by calling the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method. In C# and Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrTask Name of the [IAzTask](nn-azroles-iaztask.md) object to remove from the task.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-deletetask
     */
    DeleteTask(bstrTask, varReserved) {
        if(bstrTask is String) {
            pin := BSTR.Alloc(bstrTask)
            bstrTask := pin.Value
        }

        result := ComCall(26, this, "ptr", bstrTask, "ptr", varReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a value that indicates whether the task can be modified by the user context that initialized it.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-get_writable
     */
    get_Writable() {
        result := ComCall(27, this, "int*", &pfProp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfProp
    }

    /**
     * Returns the IAzTask object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object property  to return. The following table shows the possible values.
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
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_applicationdata">ApplicationData</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CHILD_CREATE"></a><a id="az_prop_child_create"></a><dl>
     * <dt><b>AZ_PROP_CHILD_CREATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Determines whether the current user has permission to create child objects. This value is <b>TRUE</b> if the current user has permission; otherwise, <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_description">Description</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_name">Name</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_BIZRULE"></a><a id="az_prop_task_bizrule"></a><dl>
     * <dt><b>AZ_PROP_TASK_BIZRULE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_bizrule">BizRule</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_BIZRULE_LANGUAGE"></a><a id="az_prop_task_bizrule_language"></a><dl>
     * <dt><b>AZ_PROP_TASK_BIZRULE_LANGUAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_bizrulelanguage">BizRuleLanguage</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_IS_ROLE_DEFINITION"></a><a id="az_prop_task_is_role_definition"></a><dl>
     * <dt><b>AZ_PROP_TASK_IS_ROLE_DEFINITION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_isroledefinition">IsRoleDefinition</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_OPERATIONS"></a><a id="az_prop_task_operations"></a><dl>
     * <dt><b>AZ_PROP_TASK_OPERATIONS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_operations">Operations</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_TASKS"></a><a id="az_prop_task_tasks"></a><dl>
     * <dt><b>AZ_PROP_TASK_TASKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_tasks">Tasks</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_WRITABLE"></a><a id="az_prop_writable"></a><dl>
     * <dt><b>AZ_PROP_WRITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_writable">Writable</a>  property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {VARIANT} A pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object property.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(28, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarProp
    }

    /**
     * Sets the specified value to the IAzTask object property with the specified property ID.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-submit">Submit</a> method to persist any changes made by this method.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object property  to set. The following table shows the possible values.
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
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_applicationdata">ApplicationData</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_description">Description</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_name">Name</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_BIZRULE"></a><a id="az_prop_task_bizrule"></a><dl>
     * <dt><b>AZ_PROP_TASK_BIZRULE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_bizrule">BizRule</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_BIZRULE_LANGUAGE"></a><a id="az_prop_task_bizrule_language"></a><dl>
     * <dt><b>AZ_PROP_TASK_BIZRULE_LANGUAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_bizrulelanguage">BizRuleLanguage</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_IS_ROLE_DEFINITION"></a><a id="az_prop_task_is_role_definition"></a><dl>
     * <dt><b>AZ_PROP_TASK_IS_ROLE_DEFINITION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also  accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-get_isroledefinition">IsRoleDefinition</a>  property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Value to set to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object property  specified by the <i>lPropId</i> parameter. The following table shows the type of data that must be used depending on the value of the <i>lPropId</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>lPropId</i> value</th>
     * <th>Data type</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>
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
     * <b>BSTR</b>
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
     * <b>BSTR</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_BIZRULE"></a><a id="az_prop_task_bizrule"></a><dl>
     * <dt><b>AZ_PROP_TASK_BIZRULE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_BIZRULE_LANGUAGE"></a><a id="az_prop_task_bizrule_language"></a><dl>
     * <dt><b>AZ_PROP_TASK_BIZRULE_LANGUAGE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_IS_ROLE_DEFINITION"></a><a id="az_prop_is_role_definition"></a><dl>
     * <dt><b>AZ_PROP_IS_ROLE_DEFINITION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BOOL</b>
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success. Any other value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(29, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds the specified entity to the specified list. (IAzTask.AddPropertyItem)
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-submit">Submit</a> method to persist any changes made by this method.
     * @param {Integer} lPropId Property ID of the  list to which to add the entity specified by the <i>varProp</i> parameter. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_OPERATIONS"></a><a id="az_prop_task_operations"></a><dl>
     * <dt><b>AZ_PROP_TASK_OPERATIONS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-addoperation">AddOperation</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_TASKS"></a><a id="az_prop_task_tasks"></a><dl>
     * <dt><b>AZ_PROP_TASK_TASKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-addtask">AddTask</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Name of the entity to add to the list  specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Any other value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(30, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the specified entity from the specified list. (IAzTask.DeletePropertyItem)
     * @param {Integer} lPropId Property ID of the  list from which to remove the entity specified by the <i>varProp</i> parameter. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_OPERATIONS"></a><a id="az_prop_task_operations"></a><dl>
     * <dt><b>AZ_PROP_TASK_OPERATIONS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-deleteoperation">DeleteOperation</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_TASK_TASKS"></a><a id="az_prop_task_tasks"></a><dl>
     * <dt><b>AZ_PROP_TASK_TASKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-deletetask">DeleteTask</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Name of the entity to remove from the list  specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Any other value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(31, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Persists changes made to the IAzTask object.
     * @remarks
     * Any additions or modifications to an [IAzTask](nn-azroles-iaztask.md) object are not persisted until the **Submit** method is called.
     * @param {Integer} lFlags Flags that modify the behavior of the **Submit** method. The default value is zero. If the **AZ_SUBMIT_FLAG_ABORT** flag is specified, the changes to the object are discarded and the object is updated to match the underlying policy store.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iaztask-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(32, this, "int", lFlags, "ptr", varReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
