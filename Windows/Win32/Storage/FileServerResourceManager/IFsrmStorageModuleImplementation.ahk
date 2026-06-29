#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmCollection.ahk" { IFsrmCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmPipelineModuleImplementation.ahk" { IFsrmPipelineModuleImplementation }
#Import ".\IFsrmPropertyBag.ahk" { IFsrmPropertyBag }

/**
 * Storage modules implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmstoragemoduleimplementation
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmStorageModuleImplementation extends IFsrmPipelineModuleImplementation {
    /**
     * The interface identifier for IFsrmStorageModuleImplementation
     * @type {Guid}
     */
    static IID := Guid("{0af4a0da-895a-4e50-8712-a96724bcec64}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmStorageModuleImplementation interfaces
    */
    struct Vtbl extends IFsrmPipelineModuleImplementation.Vtbl {
        UseDefinitions : IntPtr
        LoadProperties : IntPtr
        SaveProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmStorageModuleImplementation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the property definitions FSRM recognizes.
     * @remarks
     * The storage module may optionally use the collection of property definitions when determining how to load and 
     *     save particular properties as appropriate.
     * @param {IFsrmCollection} propertyDefinitions Collection of property definitions that are currently defined by FSRM.
     * @returns {HRESULT} The method returns the following return values.
     * 
     * Other values will result in the client application receiving a 
     *          <b>FSRM_E_MODULE_SESSION_INITIALIZATION</b> error.
     * 
     * <b>Windows Server 2008 R2:  </b>The client application will receive a <b>FSRM_E_UNEXPECTED</b> error.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-usedefinitions
     */
    UseDefinitions(propertyDefinitions) {
        result := ComCall(9, this, "ptr", propertyDefinitions, "HRESULT")
        return result
    }

    /**
     * Instructs the storage module to load all properties.
     * @remarks
     * The storage module must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-setfileproperty">IFsrmPropertyBag::SetFileProperty</a> method on the property bag that is passed in for each property it chooses to set.
     * 
     * If <b>FSRM_E_INCOMPATIBLE_FORMAT</b> or <b>FSRM_E_FILE_ENCRYPTED</b> is returned, FSRM will not indicate that the file has failed classification. If any other error value is returned, FSRM will indicate that the file has failed classification.
     * @param {IFsrmPropertyBag} propertyBag Specifies the properties to load.
     * @returns {HRESULT} The method returns the following return values. Implementers should return an HRESULT error code for any other errors.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-loadproperties
     */
    LoadProperties(propertyBag) {
        result := ComCall(10, this, "ptr", propertyBag, "HRESULT")
        return result
    }

    /**
     * Instructs the storage module to save properties associated with a file.
     * @remarks
     * If <b>FSRM_E_INCOMPATIBLE_FORMAT</b> or <b>FSRM_E_FILE_ENCRYPTED</b> is returned, FSRM will not indicate that the file has failed classification. If any other error value is returned, FSRM will indicate that the file has failed classification.
     * @param {IFsrmPropertyBag} propertyBag Specifies the location to save properties.
     * @returns {HRESULT} The method returns the following return values. Implementers should return an HRESULT error code for any other errors.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-saveproperties
     */
    SaveProperties(propertyBag) {
        result := ComCall(11, this, "ptr", propertyBag, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmStorageModuleImplementation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UseDefinitions := CallbackCreate(GetMethod(implObj, "UseDefinitions"), flags, 2)
        this.vtbl.LoadProperties := CallbackCreate(GetMethod(implObj, "LoadProperties"), flags, 2)
        this.vtbl.SaveProperties := CallbackCreate(GetMethod(implObj, "SaveProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UseDefinitions)
        CallbackFree(this.vtbl.LoadProperties)
        CallbackFree(this.vtbl.SaveProperties)
    }
}
