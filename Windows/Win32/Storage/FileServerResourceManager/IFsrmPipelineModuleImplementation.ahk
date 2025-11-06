#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmPipelineModuleConnector.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Abstract interface for IFsrmClassifierModuleImplementation and IFsrmStorageModuleImplementation.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleimplementation
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPipelineModuleImplementation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmPipelineModuleImplementation
     * @type {Guid}
     */
    static IID => Guid("{b7907906-2b02-4cb5-84a9-fdf54613d6cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLoad", "OnUnload"]

    /**
     * 
     * @param {IFsrmPipelineModuleDefinition} moduleDefinition 
     * @returns {IFsrmPipelineModuleConnector} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload
     */
    OnLoad(moduleDefinition) {
        result := ComCall(7, this, "ptr", moduleDefinition, "ptr*", &moduleConnector := 0, "HRESULT")
        return IFsrmPipelineModuleConnector(moduleConnector)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onunload
     */
    OnUnload() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
