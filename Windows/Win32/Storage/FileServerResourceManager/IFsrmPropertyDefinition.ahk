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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Type", "put_Type", "get_PossibleValues", "put_PossibleValues", "get_ValueDescriptions", "put_ValueDescriptions", "get_Parameters", "put_Parameters"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(12, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_type
     */
    get_Type() {
        result := ComCall(14, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_type
     */
    put_Type(type) {
        result := ComCall(15, this, "int", type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_possiblevalues
     */
    get_PossibleValues() {
        result := ComCall(16, this, "ptr*", &possibleValues := 0, "HRESULT")
        return possibleValues
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} possibleValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_possiblevalues
     */
    put_PossibleValues(possibleValues) {
        result := ComCall(17, this, "ptr", possibleValues, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_valuedescriptions
     */
    get_ValueDescriptions() {
        result := ComCall(18, this, "ptr*", &valueDescriptions := 0, "HRESULT")
        return valueDescriptions
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} valueDescriptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_valuedescriptions
     */
    put_ValueDescriptions(valueDescriptions) {
        result := ComCall(19, this, "ptr", valueDescriptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_parameters
     */
    get_Parameters() {
        result := ComCall(20, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(21, this, "ptr", parameters, "HRESULT")
        return result
    }
}
