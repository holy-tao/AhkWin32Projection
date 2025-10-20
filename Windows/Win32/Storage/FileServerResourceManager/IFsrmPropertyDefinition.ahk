#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmObject.ahk

/**
 * Defines a property that you want to use to classify files.
 * @remarks
 * 
  * The name and type properties define a unique property; you cannot rename a property or change its type.
  * 
  * You cannot delete a property definition that is referenced by a classification rule or report. The 
  *     classification rule uses the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_propertyaffected">IFsrmRule::PropertyAffected</a> 
  *     property to reference the property definition.
  * 
  * You cannot delete a property  that is referenced by a file management job property condition. To determine if 
  *     a property condition is holding a reference, look for property conditions that have the "name" 
  *     property of the condition equal to the name of the property definition that is being deleted.
  * 
  * Reports use the property definition only as a filter in the report type 
  *     <b>FsrmReportType_FilesByProperty</b>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinition
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPropertyDefinition extends IFsrmObject{
    /**
     * The interface identifier for IFsrmPropertyDefinition
     * @type {Guid}
     */
    static IID => Guid("{ede0150f-e9a3-419c-877c-01fe5d24c5d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(12, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} type 
     * @returns {HRESULT} 
     */
    get_Type(type) {
        result := ComCall(14, this, "int*", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {HRESULT} 
     */
    put_Type(type) {
        result := ComCall(15, this, "int", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} possibleValues 
     * @returns {HRESULT} 
     */
    get_PossibleValues(possibleValues) {
        result := ComCall(16, this, "ptr", possibleValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} possibleValues 
     * @returns {HRESULT} 
     */
    put_PossibleValues(possibleValues) {
        result := ComCall(17, this, "ptr", possibleValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} valueDescriptions 
     * @returns {HRESULT} 
     */
    get_ValueDescriptions(valueDescriptions) {
        result := ComCall(18, this, "ptr", valueDescriptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} valueDescriptions 
     * @returns {HRESULT} 
     */
    put_ValueDescriptions(valueDescriptions) {
        result := ComCall(19, this, "ptr", valueDescriptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     */
    get_Parameters(parameters) {
        result := ComCall(20, this, "ptr", parameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     */
    put_Parameters(parameters) {
        result := ComCall(21, this, "ptr", parameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
