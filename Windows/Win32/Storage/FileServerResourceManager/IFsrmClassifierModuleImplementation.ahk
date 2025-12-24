#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {VARIANT} 
     */
    LastModified {
        get => this.get_LastModified()
    }

    /**
     * The last time the classifier's internal rules were modified as a 64-bit FILETIME value.
     * @remarks
     * 
     * The last modified time is used by FSRM to determine whether rules using this classifier need to be run. If any classifier returns a time that is more recent than the time a file was last modified, FSRM will re-evaluate any applicable rules for that file.
     * 
     * A value corresponding to <b>FsrmNeverModified</b> can be returned if the classifier has no internal policies that are ever updated. An example of such a classifier is one that bases its classification decision on the attributes (such as path or owner) or content of a file.
     * 
     * A value corresponding to <b>FsrmAlwaysModified</b> can be returned if the classifier has internal policies that affect rules that always need to be reevaluated on each classification run. In this case, applicable rules for each file will always be evaluated. An example of such a classifier is one that bases its classification decision on a volatile set of policies that are outside the control of FSRM. A classifier that returns <b>FsrmAlwaysModified</b> will affect the performance of file classification because in such cases FSRM will skip optimizations that normally can avoid unnecessary rule reevaluations.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-get_lastmodified
     */
    get_LastModified() {
        lastModified := VARIANT()
        result := ComCall(9, this, "ptr", lastModified, "HRESULT")
        return lastModified
    }

    /**
     * Specifies the collection of rules and relevant property definitions the classifier should expect to process.
     * @param {IFsrmCollection} rules Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> instance representing a collection 
     *        of rules that will be used during the current classification session.
     * @param {IFsrmCollection} propertyDefinitions Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> instance representing a collection 
     *        of property definitions that are referenced by the specified collection of rules.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns the following return values.
     * 
     * Other values will result in the client application receiving a 
     *          <b>FSRM_E_MODULE_SESSION_INITIALIZATION</b> error.
     * 
     * <b>Windows Server 2008 R2:  </b>The client application will receive a <b>FSRM_E_UNEXPECTED</b> error.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-userulesanddefinitions
     */
    UseRulesAndDefinitions(rules, propertyDefinitions) {
        result := ComCall(10, this, "ptr", rules, "ptr", propertyDefinitions, "HRESULT")
        return result
    }

    /**
     * Instructs the classifier to prepare for processing a file with the specified property bag.
     * @param {IFsrmPropertyBag} propertyBag The property bag that corresponds to the file to be processed.
     * @param {Pointer<SAFEARRAY>} arrayRuleIds A <b>SAFEARRAY</b> of variants that contains one or more strings listing the identifiers of rules that will be processed. Each identifier corresponds to a rule object that is in the rule collection passed in by a previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-userulesanddefinitions">IFsrmClassifierModuleImplementation::UseRulesAndDefinitions</a> method. The rule object can also be obtained by using this identifier in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmcollection-getbyid">IFsrmCollection::GetById</a> method on this collection.
     * @returns {HRESULT} The method returns the following return values. Implementers should return an <b>HRESULT</b> error code for any other errors.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-onbeginfile
     */
    OnBeginFile(propertyBag, arrayRuleIds) {
        result := ComCall(11, this, "ptr", propertyBag, "ptr", arrayRuleIds, "HRESULT")
        return result
    }

    /**
     * Queries the classifier to find out whether the specified property value applies to the file most recently specified by the IFsrmClassifierModuleImplementation::OnBeginFile method.
     * @param {BSTR} property Name of the property to query.
     * @param {BSTR} value Value of the property to check in the query.
     * @param {Guid} idRule The identifier of the rule object associated with the property value being queried. This rule object is in the rule collection passed in by a previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-userulesanddefinitions">IFsrmClassifierModuleImplementation::UseRulesAndDefinitions</a> method. The rule object can also be obtained by using this identifier in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmcollection-getbyid">IFsrmCollection::GetById</a> method on this collection.
     * @param {Guid} idPropDef The identifier of the property definition object that corresponds to the property being queried. This property definition object is in the property definition collection passed in by a previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-userulesanddefinitions">IFsrmClassifierModuleImplementation::UseRulesAndDefinitions</a> method. The property definition object can also be obtained by using this identifier in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmcollection-getbyid">IFsrmCollection::GetById</a> method on this collection.
     * @returns {VARIANT_BOOL} Is <b>VARIANT_TRUE</b> if the property applies; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-doespropertyvalueapply
     */
    DoesPropertyValueApply(property, value, idRule, idPropDef) {
        property := property is String ? BSTR.Alloc(property).Value : property
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(12, this, "ptr", property, "ptr", value, "short*", &applyValue := 0, "ptr", idRule, "ptr", idPropDef, "HRESULT")
        return applyValue
    }

    /**
     * Retrieves the value from the classifier that should be applied for the specified property of the file most recently specified by the IFsrmClassifierModuleImplementation::OnBeginFile method.
     * @param {BSTR} property Name of the property.
     * @param {Guid} idRule The identifier of the rule object associated with the property value being queried. This rule object should be in the rule collection passed in by a previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-userulesanddefinitions">IFsrmClassifierModuleImplementation::UseRulesAndDefinitions</a> method. The rule object can also be obtained by using this identifier in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmcollection-getbyid">IFsrmCollection::GetById</a> method on this collection.
     * @param {Guid} idPropDef The identifier of the property definition object that corresponds to the property being queried. This property definition object is in the property definition collection passed in by a previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-userulesanddefinitions">IFsrmClassifierModuleImplementation::UseRulesAndDefinitions</a> method. The property definition object can also be obtained by using this identifier in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmcollection-getbyid">IFsrmCollection::GetById</a> method on this collection.
     * @returns {BSTR} Value of the property.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-getpropertyvaluetoapply
     */
    GetPropertyValueToApply(property, idRule, idPropDef) {
        property := property is String ? BSTR.Alloc(property).Value : property

        value := BSTR()
        result := ComCall(13, this, "ptr", property, "ptr", value, "ptr", idRule, "ptr", idPropDef, "HRESULT")
        return value
    }

    /**
     * Instructs the classifier to perform any cleanup after processing a file.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-onendfile
     */
    OnEndFile() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
