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
     * 
     * @param {Pointer<Integer>} capabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_capabilities
     */
    get_Capabilities(capabilities) {
        result := ComCall(31, this, "int*", capabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} capabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-put_capabilities
     */
    put_Capabilities(capabilities) {
        result := ComCall(32, this, "int", capabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} storageType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_storagetype
     */
    get_StorageType(storageType) {
        result := ComCall(33, this, "int*", storageType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} storageType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-put_storagetype
     */
    put_StorageType(storageType) {
        result := ComCall(34, this, "int", storageType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} updatesFileContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_updatesfilecontent
     */
    get_UpdatesFileContent(updatesFileContent) {
        result := ComCall(35, this, "ptr", updatesFileContent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} updatesFileContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-put_updatesfilecontent
     */
    put_UpdatesFileContent(updatesFileContent) {
        result := ComCall(36, this, "short", updatesFileContent, "HRESULT")
        return result
    }
}
