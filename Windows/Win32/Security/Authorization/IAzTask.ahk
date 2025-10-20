#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Describes a set of operations.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iaztask
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
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_name
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_description
     */
    get_Description(pbstrDescription) {
        result := ComCall(9, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(10, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrApplicationData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_applicationdata
     */
    get_ApplicationData(pbstrApplicationData) {
        result := ComCall(11, this, "ptr", pbstrApplicationData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(12, this, "ptr", bstrApplicationData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_bizrule
     */
    get_BizRule(pbstrProp) {
        result := ComCall(13, this, "ptr", pbstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-put_bizrule
     */
    put_BizRule(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(14, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_bizrulelanguage
     */
    get_BizRuleLanguage(pbstrProp) {
        result := ComCall(15, this, "ptr", pbstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-put_bizrulelanguage
     */
    put_BizRuleLanguage(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(16, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_bizruleimportedpath
     */
    get_BizRuleImportedPath(pbstrProp) {
        result := ComCall(17, this, "ptr", pbstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-put_bizruleimportedpath
     */
    put_BizRuleImportedPath(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(18, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_isroledefinition
     */
    get_IsRoleDefinition(pfProp) {
        result := ComCall(19, this, "ptr", pfProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-put_isroledefinition
     */
    put_IsRoleDefinition(fProp) {
        result := ComCall(20, this, "int", fProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_operations
     */
    get_Operations(pvarProp) {
        result := ComCall(21, this, "ptr", pvarProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_tasks
     */
    get_Tasks(pvarProp) {
        result := ComCall(22, this, "ptr", pvarProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrOp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-addoperation
     */
    AddOperation(bstrOp, varReserved) {
        bstrOp := bstrOp is String ? BSTR.Alloc(bstrOp).Value : bstrOp

        result := ComCall(23, this, "ptr", bstrOp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrOp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-deleteoperation
     */
    DeleteOperation(bstrOp, varReserved) {
        bstrOp := bstrOp is String ? BSTR.Alloc(bstrOp).Value : bstrOp

        result := ComCall(24, this, "ptr", bstrOp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTask 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-addtask
     */
    AddTask(bstrTask, varReserved) {
        bstrTask := bstrTask is String ? BSTR.Alloc(bstrTask).Value : bstrTask

        result := ComCall(25, this, "ptr", bstrTask, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTask 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-deletetask
     */
    DeleteTask(bstrTask, varReserved) {
        bstrTask := bstrTask is String ? BSTR.Alloc(bstrTask).Value : bstrTask

        result := ComCall(26, this, "ptr", bstrTask, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-get_writable
     */
    get_Writable(pfProp) {
        result := ComCall(27, this, "ptr", pfProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varReserved 
     * @param {Pointer<VARIANT>} pvarProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-getproperty
     */
    GetProperty(lPropId, varReserved, pvarProp) {
        result := ComCall(28, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-setproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-addpropertyitem
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-deletepropertyitem
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(32, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }
}
