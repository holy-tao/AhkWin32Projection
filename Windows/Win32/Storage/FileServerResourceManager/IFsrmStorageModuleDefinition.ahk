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
     * 
     * @param {Pointer<Int32>} capabilities 
     * @returns {HRESULT} 
     */
    get_Capabilities(capabilities) {
        result := ComCall(31, this, "int*", capabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} capabilities 
     * @returns {HRESULT} 
     */
    put_Capabilities(capabilities) {
        result := ComCall(32, this, "int", capabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} storageType 
     * @returns {HRESULT} 
     */
    get_StorageType(storageType) {
        result := ComCall(33, this, "int*", storageType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} storageType 
     * @returns {HRESULT} 
     */
    put_StorageType(storageType) {
        result := ComCall(34, this, "int", storageType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} updatesFileContent 
     * @returns {HRESULT} 
     */
    get_UpdatesFileContent(updatesFileContent) {
        result := ComCall(35, this, "ptr", updatesFileContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} updatesFileContent 
     * @returns {HRESULT} 
     */
    put_UpdatesFileContent(updatesFileContent) {
        result := ComCall(36, this, "short", updatesFileContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
