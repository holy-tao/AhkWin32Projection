#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmPipelineModuleDefinition.ahk" { IFsrmPipelineModuleDefinition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Defines a classifier module.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduledefinition
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmClassifierModuleDefinition extends IFsrmPipelineModuleDefinition {
    /**
     * The interface identifier for IFsrmClassifierModuleDefinition
     * @type {Guid}
     */
    static IID := Guid("{bb36ea26-6318-4b8c-8592-f72dd602e7a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmClassifierModuleDefinition interfaces
    */
    struct Vtbl extends IFsrmPipelineModuleDefinition.Vtbl {
        get_PropertiesAffected : IntPtr
        put_PropertiesAffected : IntPtr
        get_PropertiesUsed     : IntPtr
        put_PropertiesUsed     : IntPtr
        get_NeedsExplicitValue : IntPtr
        put_NeedsExplicitValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmClassifierModuleDefinition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    PropertiesAffected {
        get => this.get_PropertiesAffected()
        set => this.put_PropertiesAffected(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    PropertiesUsed {
        get => this.get_PropertiesUsed()
        set => this.put_PropertiesUsed(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NeedsExplicitValue {
        get => this.get_NeedsExplicitValue()
        set => this.put_NeedsExplicitValue(value)
    }

    /**
     * The list of property names that the classifier can affect. (Get)
     * @remarks
     * This list is optional. Specify a list of properties only if you want to limit the properties that this classifier can affect; otherwise, if the list is empty, the classifier can affect any property in the file.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_propertiesaffected
     */
    get_PropertiesAffected() {
        result := ComCall(31, this, "ptr*", &propertiesAffected := 0, "HRESULT")
        return propertiesAffected
    }

    /**
     * The list of property names that the classifier can affect. (Put)
     * @remarks
     * This list is optional. Specify a list of properties only if you want to limit the properties that this classifier can affect; otherwise, if the list is empty, the classifier can affect any property in the file.
     * @param {Pointer<SAFEARRAY>} propertiesAffected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-put_propertiesaffected
     */
    put_PropertiesAffected(propertiesAffected) {
        result := ComCall(32, this, SAFEARRAY.Ptr, propertiesAffected, "HRESULT")
        return result
    }

    /**
     * The list of property names that the classifier inspects. (Get)
     * @remarks
     * The classifier may inspect the properties to determine the property value or if it should perform other processes.
     * 
     * The list is optional. Specify a list of properties only if you want to limit the properties that this classifier can inspect; otherwise, if the list is empty, the classifier can inspect any property in the file.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_propertiesused
     */
    get_PropertiesUsed() {
        result := ComCall(33, this, "ptr*", &propertiesUsed := 0, "HRESULT")
        return propertiesUsed
    }

    /**
     * The list of property names that the classifier inspects. (Put)
     * @remarks
     * The classifier may inspect the properties to determine the property value or if it should perform other processes.
     * 
     * The list is optional. Specify a list of properties only if you want to limit the properties that this classifier can inspect; otherwise, if the list is empty, the classifier can inspect any property in the file.
     * @param {Pointer<SAFEARRAY>} propertiesUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-put_propertiesused
     */
    put_PropertiesUsed(propertiesUsed) {
        result := ComCall(34, this, SAFEARRAY.Ptr, propertiesUsed, "HRESULT")
        return result
    }

    /**
     * Determines whether a rule that uses the classifier needs to provide the value for the classification property. (Get)
     * @remarks
     * If this value is <b>VARIANT_FALSE</b>, the classifier determines and provides the value.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_needsexplicitvalue
     */
    get_NeedsExplicitValue() {
        result := ComCall(35, this, VARIANT_BOOL.Ptr, &needsExplicitValue := 0, "HRESULT")
        return needsExplicitValue
    }

    /**
     * Determines whether a rule that uses the classifier needs to provide the value for the classification property. (Put)
     * @remarks
     * If this value is <b>VARIANT_FALSE</b>, the classifier determines and provides the value.
     * @param {VARIANT_BOOL} needsExplicitValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-put_needsexplicitvalue
     */
    put_NeedsExplicitValue(needsExplicitValue) {
        result := ComCall(36, this, VARIANT_BOOL, needsExplicitValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmClassifierModuleDefinition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PropertiesAffected := CallbackCreate(GetMethod(implObj, "get_PropertiesAffected"), flags, 2)
        this.vtbl.put_PropertiesAffected := CallbackCreate(GetMethod(implObj, "put_PropertiesAffected"), flags, 2)
        this.vtbl.get_PropertiesUsed := CallbackCreate(GetMethod(implObj, "get_PropertiesUsed"), flags, 2)
        this.vtbl.put_PropertiesUsed := CallbackCreate(GetMethod(implObj, "put_PropertiesUsed"), flags, 2)
        this.vtbl.get_NeedsExplicitValue := CallbackCreate(GetMethod(implObj, "get_NeedsExplicitValue"), flags, 2)
        this.vtbl.put_NeedsExplicitValue := CallbackCreate(GetMethod(implObj, "put_NeedsExplicitValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PropertiesAffected)
        CallbackFree(this.vtbl.put_PropertiesAffected)
        CallbackFree(this.vtbl.get_PropertiesUsed)
        CallbackFree(this.vtbl.put_PropertiesUsed)
        CallbackFree(this.vtbl.get_NeedsExplicitValue)
        CallbackFree(this.vtbl.put_NeedsExplicitValue)
    }
}
