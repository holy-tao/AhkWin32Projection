#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FsrmStorageModuleType.ahk" { FsrmStorageModuleType }
#Import ".\IFsrmPipelineModuleDefinition.ahk" { IFsrmPipelineModuleDefinition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmStorageModuleCaps.ahk" { FsrmStorageModuleCaps }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Defines a local storage module that is used to read and write property values.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmstoragemoduledefinition
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmStorageModuleDefinition extends IFsrmPipelineModuleDefinition {
    /**
     * The interface identifier for IFsrmStorageModuleDefinition
     * @type {Guid}
     */
    static IID := Guid("{15a81350-497d-4aba-80e9-d4dbcc5521fe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmStorageModuleDefinition interfaces
    */
    struct Vtbl extends IFsrmPipelineModuleDefinition.Vtbl {
        get_Capabilities       : IntPtr
        put_Capabilities       : IntPtr
        get_StorageType        : IntPtr
        put_StorageType        : IntPtr
        get_UpdatesFileContent : IntPtr
        put_UpdatesFileContent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmStorageModuleDefinition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {FsrmStorageModuleCaps} 
     */
    Capabilities {
        get => this.get_Capabilities()
        set => this.put_Capabilities(value)
    }

    /**
     * @type {FsrmStorageModuleType} 
     */
    StorageType {
        get => this.get_StorageType()
        set => this.put_StorageType(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UpdatesFileContent {
        get => this.get_UpdatesFileContent()
        set => this.put_UpdatesFileContent(value)
    }

    /**
     * Flags that specify capabilities of the storage module. (Get)
     * @returns {FsrmStorageModuleCaps} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_capabilities
     */
    get_Capabilities() {
        result := ComCall(31, this, "int*", &capabilities := 0, "HRESULT")
        return capabilities
    }

    /**
     * Flags that specify capabilities of the storage module. (Put)
     * @param {FsrmStorageModuleCaps} capabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-put_capabilities
     */
    put_Capabilities(capabilities) {
        result := ComCall(32, this, FsrmStorageModuleCaps, capabilities, "HRESULT")
        return result
    }

    /**
     * The type of storage that the storage module uses. (Get)
     * @returns {FsrmStorageModuleType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_storagetype
     */
    get_StorageType() {
        result := ComCall(33, this, "int*", &storageType := 0, "HRESULT")
        return storageType
    }

    /**
     * The type of storage that the storage module uses. (Put)
     * @param {FsrmStorageModuleType} storageType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-put_storagetype
     */
    put_StorageType(storageType) {
        result := ComCall(34, this, FsrmStorageModuleType, storageType, "HRESULT")
        return result
    }

    /**
     * Determines whether the module updates the contents of the file. (Get)
     * @remarks
     * Setting this property to <b>VARIANT_TRUE</b> does not require that the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_storagetype">IFsrmStorageModuleDefinition::StorageType</a> 
     *     property to be set to <b>FsrmStorageModuleType_InFile</b>. For example, you can set this 
     *     property to <b>VARIANT_TRUE</b> if you need to update the file to let another process know that 
     *     you have processed the file.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_updatesfilecontent
     */
    get_UpdatesFileContent() {
        result := ComCall(35, this, VARIANT_BOOL.Ptr, &updatesFileContent := 0, "HRESULT")
        return updatesFileContent
    }

    /**
     * Determines whether the module updates the contents of the file. (Put)
     * @remarks
     * Setting this property to <b>VARIANT_TRUE</b> does not require that the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_storagetype">IFsrmStorageModuleDefinition::StorageType</a> 
     *     property to be set to <b>FsrmStorageModuleType_InFile</b>. For example, you can set this 
     *     property to <b>VARIANT_TRUE</b> if you need to update the file to let another process know that 
     *     you have processed the file.
     * @param {VARIANT_BOOL} updatesFileContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-put_updatesfilecontent
     */
    put_UpdatesFileContent(updatesFileContent) {
        result := ComCall(36, this, VARIANT_BOOL, updatesFileContent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmStorageModuleDefinition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Capabilities := CallbackCreate(GetMethod(implObj, "get_Capabilities"), flags, 2)
        this.vtbl.put_Capabilities := CallbackCreate(GetMethod(implObj, "put_Capabilities"), flags, 2)
        this.vtbl.get_StorageType := CallbackCreate(GetMethod(implObj, "get_StorageType"), flags, 2)
        this.vtbl.put_StorageType := CallbackCreate(GetMethod(implObj, "put_StorageType"), flags, 2)
        this.vtbl.get_UpdatesFileContent := CallbackCreate(GetMethod(implObj, "get_UpdatesFileContent"), flags, 2)
        this.vtbl.put_UpdatesFileContent := CallbackCreate(GetMethod(implObj, "put_UpdatesFileContent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Capabilities)
        CallbackFree(this.vtbl.put_Capabilities)
        CallbackFree(this.vtbl.get_StorageType)
        CallbackFree(this.vtbl.put_StorageType)
        CallbackFree(this.vtbl.get_UpdatesFileContent)
        CallbackFree(this.vtbl.put_UpdatesFileContent)
    }
}
