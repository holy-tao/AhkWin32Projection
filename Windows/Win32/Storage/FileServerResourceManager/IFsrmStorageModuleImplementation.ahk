#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmPipelineModuleImplementation.ahk

/**
 * Storage modules implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmstoragemoduleimplementation
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmStorageModuleImplementation extends IFsrmPipelineModuleImplementation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmStorageModuleImplementation
     * @type {Guid}
     */
    static IID => Guid("{0af4a0da-895a-4e50-8712-a96724bcec64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UseDefinitions", "LoadProperties", "SaveProperties"]

    /**
     * 
     * @param {IFsrmCollection} propertyDefinitions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-usedefinitions
     */
    UseDefinitions(propertyDefinitions) {
        result := ComCall(9, this, "ptr", propertyDefinitions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFsrmPropertyBag} propertyBag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-loadproperties
     */
    LoadProperties(propertyBag) {
        result := ComCall(10, this, "ptr", propertyBag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFsrmPropertyBag} propertyBag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-saveproperties
     */
    SaveProperties(propertyBag) {
        result := ComCall(11, this, "ptr", propertyBag, "HRESULT")
        return result
    }
}
