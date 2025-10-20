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
     * 
     * @param {Pointer<Int32>} executionOption 
     * @returns {HRESULT} 
     */
    get_ExecutionOption(executionOption) {
        result := ComCall(24, this, "int*", executionOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} executionOption 
     * @returns {HRESULT} 
     */
    put_ExecutionOption(executionOption) {
        result := ComCall(25, this, "int", executionOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} property 
     * @returns {HRESULT} 
     */
    get_PropertyAffected(property) {
        result := ComCall(26, this, "ptr", property, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} property 
     * @returns {HRESULT} 
     */
    put_PropertyAffected(property) {
        property := property is String ? BSTR.Alloc(property).Value : property

        result := ComCall(27, this, "ptr", property, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_Value(value) {
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
