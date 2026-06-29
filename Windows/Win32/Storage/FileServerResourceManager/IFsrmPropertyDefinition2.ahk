#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmPropertyDefinition.ahk" { IFsrmPropertyDefinition }
#Import ".\IFsrmCollection.ahk" { IFsrmCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Defines a property that you want to use to classify files. (IFsrmPropertyDefinition2)
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinition2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPropertyDefinition2 extends IFsrmPropertyDefinition {
    /**
     * The interface identifier for IFsrmPropertyDefinition2
     * @type {Guid}
     */
    static IID := Guid("{47782152-d16c-4229-b4e1-0ddfe308b9f6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPropertyDefinition2 interfaces
    */
    struct Vtbl extends IFsrmPropertyDefinition.Vtbl {
        get_PropertyDefinitionFlags : IntPtr
        get_DisplayName             : IntPtr
        put_DisplayName             : IntPtr
        get_AppliesTo               : IntPtr
        get_ValueDefinitions        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPropertyDefinition2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    PropertyDefinitionFlags {
        get => this.get_PropertyDefinitionFlags()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {Integer} 
     */
    AppliesTo {
        get => this.get_AppliesTo()
    }

    /**
     * @type {IFsrmCollection} 
     */
    ValueDefinitions {
        get => this.get_ValueDefinitions()
    }

    /**
     * Contains the flags for the property definition.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-get_propertydefinitionflags
     */
    get_PropertyDefinitionFlags() {
        result := ComCall(22, this, "int*", &propertyDefinitionFlags := 0, "HRESULT")
        return propertyDefinitionFlags
    }

    /**
     * The display name of the property definition. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-get_displayname
     */
    get_DisplayName() {
        name := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * The display name of the property definition. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-put_displayname
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(24, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * This property contains flags with values from the FsrmPropertyDefinitionAppliesTo enumeration that indicate what a FSRM property definition can be applied to.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-get_appliesto
     */
    get_AppliesTo() {
        result := ComCall(25, this, "int*", &appliesTo := 0, "HRESULT")
        return appliesTo
    }

    /**
     * This property contains the possible value definitions of the property definition.
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-get_valuedefinitions
     */
    get_ValueDefinitions() {
        result := ComCall(26, this, "ptr*", &valueDefinitions := 0, "HRESULT")
        return IFsrmCollection(valueDefinitions)
    }

    Query(iid) {
        if (IFsrmPropertyDefinition2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PropertyDefinitionFlags := CallbackCreate(GetMethod(implObj, "get_PropertyDefinitionFlags"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.put_DisplayName := CallbackCreate(GetMethod(implObj, "put_DisplayName"), flags, 2)
        this.vtbl.get_AppliesTo := CallbackCreate(GetMethod(implObj, "get_AppliesTo"), flags, 2)
        this.vtbl.get_ValueDefinitions := CallbackCreate(GetMethod(implObj, "get_ValueDefinitions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PropertyDefinitionFlags)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.put_DisplayName)
        CallbackFree(this.vtbl.get_AppliesTo)
        CallbackFree(this.vtbl.get_ValueDefinitions)
    }
}
