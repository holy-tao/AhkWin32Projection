#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IAzApplicationGroups.ahk
#Include .\IAzApplicationGroup.ahk
#Include .\IAzRoles.ahk
#Include .\IAzRole.ahk
#Include .\IAzTasks.ahk
#Include .\IAzTask.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines a logical container of resources to which the application manages access.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazscope
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzScope extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzScope
     * @type {Guid}
     */
    static IID => Guid("{00e52487-e08d-4514-b62e-877d5645f5ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Description", "put_Description", "get_ApplicationData", "put_ApplicationData", "get_Writable", "GetProperty", "SetProperty", "AddPropertyItem", "DeletePropertyItem", "get_PolicyAdministrators", "get_PolicyReaders", "AddPolicyAdministrator", "DeletePolicyAdministrator", "AddPolicyReader", "DeletePolicyReader", "get_ApplicationGroups", "OpenApplicationGroup", "CreateApplicationGroup", "DeleteApplicationGroup", "get_Roles", "OpenRole", "CreateRole", "DeleteRole", "get_Tasks", "OpenTask", "CreateTask", "DeleteTask", "Submit", "get_CanBeDelegated", "get_BizrulesWritable", "get_PolicyAdministratorsName", "get_PolicyReadersName", "AddPolicyAdministratorName", "DeletePolicyAdministratorName", "AddPolicyReaderName", "DeletePolicyReaderName"]

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
    PolicyAdministrators {
        get => this.get_PolicyAdministrators()
    }

    /**
     * @type {VARIANT} 
     */
    PolicyReaders {
        get => this.get_PolicyReaders()
    }

    /**
     * @type {IAzApplicationGroups} 
     */
    ApplicationGroups {
        get => this.get_ApplicationGroups()
    }

    /**
     * @type {IAzRoles} 
     */
    Roles {
        get => this.get_Roles()
    }

    /**
     * @type {IAzTasks} 
     */
    Tasks {
        get => this.get_Tasks()
    }

    /**
     * @type {BOOL} 
     */
    CanBeDelegated {
        get => this.get_CanBeDelegated()
    }

    /**
     * @type {BOOL} 
     */
    BizrulesWritable {
        get => this.get_BizrulesWritable()
    }

    /**
     * @type {VARIANT} 
     */
    PolicyAdministratorsName {
        get => this.get_PolicyAdministratorsName()
    }

    /**
     * @type {VARIANT} 
     */
    PolicyReadersName {
        get => this.get_PolicyReadersName()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_name
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(9, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(10, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_applicationdata
     */
    get_ApplicationData() {
        pbstrApplicationData := BSTR()
        result := ComCall(11, this, "ptr", pbstrApplicationData, "HRESULT")
        return pbstrApplicationData
    }

    /**
     * 
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(12, this, "ptr", bstrApplicationData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_writable
     */
    get_Writable() {
        result := ComCall(13, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varReserved 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(14, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(15, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(16, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(17, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_policyadministrators
     */
    get_PolicyAdministrators() {
        pvarAdmins := VARIANT()
        result := ComCall(18, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_policyreaders
     */
    get_PolicyReaders() {
        pvarReaders := VARIANT()
        result := ComCall(19, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-addpolicyadministrator
     */
    AddPolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(20, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-deletepolicyadministrator
     */
    DeletePolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(21, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-addpolicyreader
     */
    AddPolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(22, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-deletepolicyreader
     */
    DeletePolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(23, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAzApplicationGroups} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_applicationgroups
     */
    get_ApplicationGroups() {
        result := ComCall(24, this, "ptr*", &ppGroupCollection := 0, "HRESULT")
        return IAzApplicationGroups(ppGroupCollection)
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @returns {IAzApplicationGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-openapplicationgroup
     */
    OpenApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(25, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @returns {IAzApplicationGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-createapplicationgroup
     */
    CreateApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(26, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-deleteapplicationgroup
     */
    DeleteApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(27, this, "ptr", bstrGroupName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAzRoles} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_roles
     */
    get_Roles() {
        result := ComCall(28, this, "ptr*", &ppRoleCollection := 0, "HRESULT")
        return IAzRoles(ppRoleCollection)
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @returns {IAzRole} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-openrole
     */
    OpenRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(29, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", &ppRole := 0, "HRESULT")
        return IAzRole(ppRole)
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @returns {IAzRole} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-createrole
     */
    CreateRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(30, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", &ppRole := 0, "HRESULT")
        return IAzRole(ppRole)
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-deleterole
     */
    DeleteRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(31, this, "ptr", bstrRoleName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAzTasks} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_tasks
     */
    get_Tasks() {
        result := ComCall(32, this, "ptr*", &ppTaskCollection := 0, "HRESULT")
        return IAzTasks(ppTaskCollection)
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @returns {IAzTask} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-opentask
     */
    OpenTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(33, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", &ppTask := 0, "HRESULT")
        return IAzTask(ppTask)
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @returns {IAzTask} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-createtask
     */
    CreateTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(34, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", &ppTask := 0, "HRESULT")
        return IAzTask(ppTask)
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-deletetask
     */
    DeleteTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(35, this, "ptr", bstrTaskName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(36, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_canbedelegated
     */
    get_CanBeDelegated() {
        result := ComCall(37, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_bizruleswritable
     */
    get_BizrulesWritable() {
        result := ComCall(38, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_policyadministratorsname
     */
    get_PolicyAdministratorsName() {
        pvarAdmins := VARIANT()
        result := ComCall(39, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-get_policyreadersname
     */
    get_PolicyReadersName() {
        pvarReaders := VARIANT()
        result := ComCall(40, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-addpolicyadministratorname
     */
    AddPolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(41, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-deletepolicyadministratorname
     */
    DeletePolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(42, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-addpolicyreadername
     */
    AddPolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(43, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope-deletepolicyreadername
     */
    DeletePolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(44, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }
}
