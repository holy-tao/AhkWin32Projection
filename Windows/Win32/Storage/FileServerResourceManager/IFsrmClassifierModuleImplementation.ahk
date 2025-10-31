#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmPipelineModuleImplementation.ahk

/**
 * Classifier modules implement this interface. FSRM calls the module's implementation when it runs classification.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduleimplementation
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmClassifierModuleImplementation extends IFsrmPipelineModuleImplementation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmClassifierModuleImplementation
     * @type {Guid}
     */
    static IID => Guid("{4c968fc6-6edb-4051-9c18-73b7291ae106}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LastModified", "UseRulesAndDefinitions", "OnBeginFile", "DoesPropertyValueApply", "GetPropertyValueToApply", "OnEndFile"]

    /**
     * 
     * @param {Pointer<VARIANT>} lastModified 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-get_lastmodified
     */
    get_LastModified(lastModified) {
        result := ComCall(9, this, "ptr", lastModified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFsrmCollection} rules 
     * @param {IFsrmCollection} propertyDefinitions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-userulesanddefinitions
     */
    UseRulesAndDefinitions(rules, propertyDefinitions) {
        result := ComCall(10, this, "ptr", rules, "ptr", propertyDefinitions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFsrmPropertyBag} propertyBag 
     * @param {Pointer<SAFEARRAY>} arrayRuleIds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-onbeginfile
     */
    OnBeginFile(propertyBag, arrayRuleIds) {
        result := ComCall(11, this, "ptr", propertyBag, "ptr", arrayRuleIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} property 
     * @param {BSTR} value 
     * @param {Pointer<VARIANT_BOOL>} applyValue 
     * @param {Guid} idRule 
     * @param {Guid} idPropDef 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-doespropertyvalueapply
     */
    DoesPropertyValueApply(property, value, applyValue, idRule, idPropDef) {
        property := property is String ? BSTR.Alloc(property).Value : property
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(12, this, "ptr", property, "ptr", value, "ptr", applyValue, "ptr", idRule, "ptr", idPropDef, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} property 
     * @param {Pointer<BSTR>} value 
     * @param {Guid} idRule 
     * @param {Guid} idPropDef 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-getpropertyvaluetoapply
     */
    GetPropertyValueToApply(property, value, idRule, idPropDef) {
        property := property is String ? BSTR.Alloc(property).Value : property

        result := ComCall(13, this, "ptr", property, "ptr", value, "ptr", idRule, "ptr", idPropDef, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-onendfile
     */
    OnEndFile() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
