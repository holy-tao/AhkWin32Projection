#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmExecutionOption.ahk" { FsrmExecutionOption }
#Import ".\IFsrmRule.ahk" { IFsrmRule }

/**
 * Defines a classification rule.
 * @remarks
 * The rule runs when you call the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-runclassification">IFsrmClassificationManager::RunClassification</a> 
 *     method. You can also schedule the classification process to run on a specified schedule.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassificationrule
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmClassificationRule extends IFsrmRule {
    /**
     * The interface identifier for IFsrmClassificationRule
     * @type {Guid}
     */
    static IID := Guid("{afc052c2-5315-45ab-841b-c6db0e120148}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmClassificationRule interfaces
    */
    struct Vtbl extends IFsrmRule.Vtbl {
        get_ExecutionOption  : IntPtr
        put_ExecutionOption  : IntPtr
        get_PropertyAffected : IntPtr
        put_PropertyAffected : IntPtr
        get_Value            : IntPtr
        put_Value            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmClassificationRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {FsrmExecutionOption} 
     */
    ExecutionOption {
        get => this.get_ExecutionOption()
        set => this.put_ExecutionOption(value)
    }

    /**
     * @type {BSTR} 
     */
    PropertyAffected {
        get => this.get_PropertyAffected()
        set => this.put_PropertyAffected(value)
    }

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Determines how to apply the rule to the file. (Get)
     * @returns {FsrmExecutionOption} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_executionoption
     */
    get_ExecutionOption() {
        result := ComCall(24, this, "int*", &executionOption := 0, "HRESULT")
        return executionOption
    }

    /**
     * Determines how to apply the rule to the file. (Put)
     * @param {FsrmExecutionOption} executionOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-put_executionoption
     */
    put_ExecutionOption(executionOption) {
        result := ComCall(25, this, FsrmExecutionOption, executionOption, "HRESULT")
        return result
    }

    /**
     * The name of the property that this rule affects. (Get)
     * @remarks
     * If the classifier specifies a list of properties that it affects (see 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_propertiesaffected">IFsrmClassifierModuleDefinition::PropertiesAffected</a>), the property that you specify must exist in the list of affected properties.
     * 
     * To enumerate the properties that have been defined, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumpropertydefinitions">IFsrmClassificationManager::EnumPropertyDefinitions</a> method. To access the name of the property, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_name">IFsrmPropertyDefinition.Name</a> 
     *     property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_propertyaffected
     */
    get_PropertyAffected() {
        _property := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, _property, "HRESULT")
        return _property
    }

    /**
     * The name of the property that this rule affects. (Put)
     * @remarks
     * If the classifier specifies a list of properties that it affects (see 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_propertiesaffected">IFsrmClassifierModuleDefinition::PropertiesAffected</a>), the property that you specify must exist in the list of affected properties.
     * 
     * To enumerate the properties that have been defined, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumpropertydefinitions">IFsrmClassificationManager::EnumPropertyDefinitions</a> method. To access the name of the property, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_name">IFsrmPropertyDefinition.Name</a> 
     *     property.
     * @param {BSTR} _property 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-put_propertyaffected
     */
    put_PropertyAffected(_property) {
        _property := _property is String ? BSTR.Alloc(_property).Value : _property

        result := ComCall(27, this, BSTR, _property, "HRESULT")
        return result
    }

    /**
     * The value that this rule will set the property to. (Get)
     * @remarks
     * The classifier determines whether you must specify a value. If the classifier sets the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_needsexplicitvalue">IFsrmClassifierModuleDefinition.NeedsExplicitValue</a> 
     *     property to <b>VARIANT_TRUE</b>, then you must provide a value; otherwise, the classifier 
     *     determines the value to set the property's value to (do not set this property).
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_value
     */
    get_Value() {
        value := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * The value that this rule will set the property to. (Put)
     * @remarks
     * The classifier determines whether you must specify a value. If the classifier sets the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_needsexplicitvalue">IFsrmClassifierModuleDefinition.NeedsExplicitValue</a> 
     *     property to <b>VARIANT_TRUE</b>, then you must provide a value; otherwise, the classifier 
     *     determines the value to set the property's value to (do not set this property).
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-put_value
     */
    put_Value(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(29, this, BSTR, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmClassificationRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ExecutionOption := CallbackCreate(GetMethod(implObj, "get_ExecutionOption"), flags, 2)
        this.vtbl.put_ExecutionOption := CallbackCreate(GetMethod(implObj, "put_ExecutionOption"), flags, 2)
        this.vtbl.get_PropertyAffected := CallbackCreate(GetMethod(implObj, "get_PropertyAffected"), flags, 2)
        this.vtbl.put_PropertyAffected := CallbackCreate(GetMethod(implObj, "put_PropertyAffected"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ExecutionOption)
        CallbackFree(this.vtbl.put_ExecutionOption)
        CallbackFree(this.vtbl.get_PropertyAffected)
        CallbackFree(this.vtbl.put_PropertyAffected)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
    }
}
