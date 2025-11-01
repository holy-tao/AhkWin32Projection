#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmRule.ahk

/**
 * Defines a classification rule.
 * @remarks
 * 
  * The rule runs when you call the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-runclassification">IFsrmClassificationManager::RunClassification</a> 
  *     method. You can also schedule the classification process to run on a specified schedule.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmclassificationrule
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmClassificationRule extends IFsrmRule{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmClassificationRule
     * @type {Guid}
     */
    static IID => Guid("{afc052c2-5315-45ab-841b-c6db0e120148}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExecutionOption", "put_ExecutionOption", "get_PropertyAffected", "put_PropertyAffected", "get_Value", "put_Value"]

    /**
     * 
     * @param {Pointer<Integer>} executionOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_executionoption
     */
    get_ExecutionOption(executionOption) {
        executionOptionMarshal := executionOption is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, executionOptionMarshal, executionOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} executionOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-put_executionoption
     */
    put_ExecutionOption(executionOption) {
        result := ComCall(25, this, "int", executionOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} property 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_propertyaffected
     */
    get_PropertyAffected(property) {
        result := ComCall(26, this, "ptr", property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} property 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-put_propertyaffected
     */
    put_PropertyAffected(property) {
        property := property is String ? BSTR.Alloc(property).Value : property

        result := ComCall(27, this, "ptr", property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_value
     */
    get_Value(value) {
        result := ComCall(28, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-put_value
     */
    put_Value(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(29, this, "ptr", value, "HRESULT")
        return result
    }
}
