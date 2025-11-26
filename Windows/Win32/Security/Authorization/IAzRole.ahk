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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_name
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_description
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(10, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_applicationdata
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(12, this, "ptr", bstrApplicationData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addappmember
     */
    AddAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(13, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deleteappmember
     */
    DeleteAppMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(14, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addtask
     */
    AddTask(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(15, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deletetask
     */
    DeleteTask(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(16, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addoperation
     */
    AddOperation(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(17, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deleteoperation
     */
    DeleteOperation(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(18, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addmember
     */
    AddMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(19, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deletemember
     */
    DeleteMember(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(20, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_writable
     */
    get_Writable() {
        result := ComCall(21, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varReserved 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(22, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(23, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_appmembers
     */
    get_AppMembers() {
        pvarProp := VARIANT()
        result := ComCall(24, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_members
     */
    get_Members() {
        pvarProp := VARIANT()
        result := ComCall(25, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_operations
     */
    get_Operations() {
        pvarProp := VARIANT()
        result := ComCall(26, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_tasks
     */
    get_Tasks() {
        pvarProp := VARIANT()
        result := ComCall(27, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(28, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(29, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(30, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-addmembername
     */
    AddMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(31, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-deletemembername
     */
    DeleteMemberName(bstrProp, varReserved) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(32, this, "ptr", bstrProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazrole-get_membersname
     */
    get_MembersName() {
        pvarProp := VARIANT()
        result := ComCall(33, this, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }
}
