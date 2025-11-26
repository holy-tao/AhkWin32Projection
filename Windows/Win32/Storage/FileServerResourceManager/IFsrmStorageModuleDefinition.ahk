#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmPipelineModuleDefinition.ahk

/**
 * Defines a local storage module that is used to read and write property values.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmstoragemoduledefinition
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmStorageModuleDefinition extends IFsrmPipelineModuleDefinition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmStorageModuleDefinition
     * @type {Guid}
     */
    static IID => Guid("{15a81350-497d-4aba-80e9-d4dbcc5521fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Capabilities", "put_Capabilities", "get_StorageType", "put_StorageType", "get_UpdatesFileContent", "put_UpdatesFileContent"]

    /**
     * @type {Integer} 
     */
    Capabilities {
        get => this.get_Capabilities()
        set => this.put_Capabilities(value)
    }

    /**
     * @type {Integer} 
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
     * Flags that specify capabilities of the storage module.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_capabilities
     */
    get_Capabilities() {
        result := ComCall(31, this, "int*", &capabilities := 0, "HRESULT")
        return capabilities
    }

    /**
     * Flags that specify capabilities of the storage module.
     * @param {Integer} capabilities 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-put_capabilities
     */
    put_Capabilities(capabilities) {
        result := ComCall(32, this, "int", capabilities, "HRESULT")
        return result
    }

    /**
     * The type of storage that the storage module uses.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_storagetype
     */
    get_StorageType() {
        result := ComCall(33, this, "int*", &storageType := 0, "HRESULT")
        return storageType
    }

    /**
     * The type of storage that the storage module uses.
     * @param {Integer} storageType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-put_storagetype
     */
    put_StorageType(storageType) {
        result := ComCall(34, this, "int", storageType, "HRESULT")
        return result
    }

    /**
     * Determines whether the module updates the contents of the file.
     * @remarks
     * 
     * Setting this property to <b>VARIANT_TRUE</b> does not require that the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_storagetype">IFsrmStorageModuleDefinition::StorageType</a> 
     *     property to be set to <b>FsrmStorageModuleType_InFile</b>. For example, you can set this 
     *     property to <b>VARIANT_TRUE</b> if you need to update the file to let another process know that 
     *     you have processed the file.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_updatesfilecontent
     */
    get_UpdatesFileContent() {
        result := ComCall(35, this, "short*", &updatesFileContent := 0, "HRESULT")
        return updatesFileContent
    }

    /**
     * Determines whether the module updates the contents of the file.
     * @remarks
     * 
     * Setting this property to <b>VARIANT_TRUE</b> does not require that the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_storagetype">IFsrmStorageModuleDefinition::StorageType</a> 
     *     property to be set to <b>FsrmStorageModuleType_InFile</b>. For example, you can set this 
     *     property to <b>VARIANT_TRUE</b> if you need to update the file to let another process know that 
     *     you have processed the file.
     * 
     * 
     * @param {VARIANT_BOOL} updatesFileContent 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-put_updatesfilecontent
     */
    put_UpdatesFileContent(updatesFileContent) {
        result := ComCall(36, this, "short", updatesFileContent, "HRESULT")
        return result
    }
}
