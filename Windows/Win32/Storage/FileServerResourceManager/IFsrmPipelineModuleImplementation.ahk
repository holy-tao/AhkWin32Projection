#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Abstract interface for IFsrmClassifierModuleImplementation and IFsrmStorageModuleImplementation.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleimplementation
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPipelineModuleImplementation extends IDispatch{
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
     * 
     * @param {Pointer<IFsrmPipelineModuleDefinition>} moduleDefinition 
     * @param {Pointer<IFsrmPipelineModuleConnector>} moduleConnector 
     * @returns {HRESULT} 
     */
    OnLoad(moduleDefinition, moduleConnector) {
        result := ComCall(7, this, "ptr", moduleDefinition, "ptr", moduleConnector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnUnload() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
