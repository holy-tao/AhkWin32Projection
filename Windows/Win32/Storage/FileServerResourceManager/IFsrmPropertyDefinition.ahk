#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmObject.ahk" { IFsrmObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmPropertyDefinitionType.ahk" { FsrmPropertyDefinitionType }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Defines a property that you want to use to classify files. (IFsrmPropertyDefinition)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinition
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPropertyDefinition extends IFsrmObject {
    /**
     * The interface identifier for IFsrmPropertyDefinition
     * @type {Guid}
     */
    static IID := Guid("{ede0150f-e9a3-419c-877c-01fe5d24c5d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPropertyDefinition interfaces
    */
    struct Vtbl extends IFsrmObject.Vtbl {
        get_Name              : IntPtr
        put_Name              : IntPtr
        get_Type              : IntPtr
        put_Type              : IntPtr
        get_PossibleValues    : IntPtr
        put_PossibleValues    : IntPtr
        get_ValueDescriptions : IntPtr
        put_ValueDescriptions : IntPtr
        get_Parameters        : IntPtr
        put_Parameters        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPropertyDefinition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {FsrmPropertyDefinitionType} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    PossibleValues {
        get => this.get_PossibleValues()
        set => this.put_PossibleValues(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ValueDescriptions {
        get => this.get_ValueDescriptions()
        set => this.put_ValueDescriptions(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Parameters {
        get => this.get_Parameters()
        set => this.put_Parameters(value)
    }

    /**
     * The name of the property. (IFsrmPropertyDefinition.get_Name)
     * @remarks
     * You cannot change the name after you commit the definition.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * The name of the property. (IFsrmPropertyDefinition.put_Name)
     * @remarks
     * You cannot change the name after you commit the definition.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * The type of data that the property contains. (Get)
     * @remarks
     * You cannot change the type after you commit the definition.
     * @returns {FsrmPropertyDefinitionType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_type
     */
    get_Type() {
        result := ComCall(14, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * The type of data that the property contains. (Put)
     * @remarks
     * You cannot change the type after you commit the definition.
     * @param {FsrmPropertyDefinitionType} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_type
     */
    put_Type(type) {
        result := ComCall(15, this, FsrmPropertyDefinitionType, type, "HRESULT")
        return result
    }

    /**
     * The possible values to which the property can be set. (Get)
     * @remarks
     * You must specify a possible values list if the property's type is 
     *     <b>FsrmPropertyDefinitionType_OrderedList</b> or 
     *     <b>FsrmPropertyDefinitionType_MultiChoiceList.</b>
     * 
     * You cannot delete a possible value from the list if a rule specifies the value (see 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_value">IFsrmClassificationRule.Value</a>). Deleting 
     *     the value does not remove the value from files that are currently classified using that value.
     * 
     * You can change the order of the values in the list. For ordered lists, changing the order can affect 
     *     aggregation the next time classification runs.
     * 
     * To specify descriptions for each possible value, set the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_valuedescriptions">IFsrmPropertyDefinition.ValueDescriptions</a> 
     *     property.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_possiblevalues
     */
    get_PossibleValues() {
        result := ComCall(16, this, "ptr*", &possibleValues := 0, "HRESULT")
        return possibleValues
    }

    /**
     * The possible values to which the property can be set. (Put)
     * @remarks
     * You must specify a possible values list if the property's type is 
     *     <b>FsrmPropertyDefinitionType_OrderedList</b> or 
     *     <b>FsrmPropertyDefinitionType_MultiChoiceList.</b>
     * 
     * You cannot delete a possible value from the list if a rule specifies the value (see 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_value">IFsrmClassificationRule.Value</a>). Deleting 
     *     the value does not remove the value from files that are currently classified using that value.
     * 
     * You can change the order of the values in the list. For ordered lists, changing the order can affect 
     *     aggregation the next time classification runs.
     * 
     * To specify descriptions for each possible value, set the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_valuedescriptions">IFsrmPropertyDefinition.ValueDescriptions</a> 
     *     property.
     * @param {Pointer<SAFEARRAY>} possibleValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_possiblevalues
     */
    put_PossibleValues(possibleValues) {
        result := ComCall(17, this, SAFEARRAY.Ptr, possibleValues, "HRESULT")
        return result
    }

    /**
     * Descriptions for each of the possible values specified in the PossibleValues property. (Get)
     * @remarks
     * There is a one-to-one relationship between these descriptions and the list of possible values specified in the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_possiblevalues">PossibleValues</a> property. If you 
     *     do not want to specify a description for one of the values in the list, set the corresponding item in the array to 
     *     an empty string.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_valuedescriptions
     */
    get_ValueDescriptions() {
        result := ComCall(18, this, "ptr*", &valueDescriptions := 0, "HRESULT")
        return valueDescriptions
    }

    /**
     * Descriptions for each of the possible values specified in the PossibleValues property. (Put)
     * @remarks
     * There is a one-to-one relationship between these descriptions and the list of possible values specified in the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_possiblevalues">PossibleValues</a> property. If you 
     *     do not want to specify a description for one of the values in the list, set the corresponding item in the array to 
     *     an empty string.
     * @param {Pointer<SAFEARRAY>} valueDescriptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_valuedescriptions
     */
    put_ValueDescriptions(valueDescriptions) {
        result := ComCall(19, this, SAFEARRAY.Ptr, valueDescriptions, "HRESULT")
        return result
    }

    /**
     * The parameters for the property definition. (Get)
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-get_parameters
     */
    get_Parameters() {
        result := ComCall(20, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * The parameters for the property definition. (Put)
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(21, this, SAFEARRAY.Ptr, parameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmPropertyDefinition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.put_Type := CallbackCreate(GetMethod(implObj, "put_Type"), flags, 2)
        this.vtbl.get_PossibleValues := CallbackCreate(GetMethod(implObj, "get_PossibleValues"), flags, 2)
        this.vtbl.put_PossibleValues := CallbackCreate(GetMethod(implObj, "put_PossibleValues"), flags, 2)
        this.vtbl.get_ValueDescriptions := CallbackCreate(GetMethod(implObj, "get_ValueDescriptions"), flags, 2)
        this.vtbl.put_ValueDescriptions := CallbackCreate(GetMethod(implObj, "put_ValueDescriptions"), flags, 2)
        this.vtbl.get_Parameters := CallbackCreate(GetMethod(implObj, "get_Parameters"), flags, 2)
        this.vtbl.put_Parameters := CallbackCreate(GetMethod(implObj, "put_Parameters"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.put_Type)
        CallbackFree(this.vtbl.get_PossibleValues)
        CallbackFree(this.vtbl.put_PossibleValues)
        CallbackFree(this.vtbl.get_ValueDescriptions)
        CallbackFree(this.vtbl.put_ValueDescriptions)
        CallbackFree(this.vtbl.get_Parameters)
        CallbackFree(this.vtbl.put_Parameters)
    }
}
