#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmPipelineModuleConnector.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Abstract interface for IFsrmClassifierModuleImplementation and IFsrmStorageModuleImplementation.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleimplementation
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
     * Initializes the pipeline module.
     * @remarks
     * Your <b>OnLoad</b> implementation 
     *     must create and bind to an instance of an object implementing the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleconnector">IFsrmPipelineModuleConnector</a> interface and 
     *     return it in the <i>moduleConnector</i> parameter. For more information on how to create and 
     *     bind this instance, see 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fsrm/initializing-and-binding-a-pipeline-module">Initializing and Binding a Pipeline Module</a>.
     * @param {IFsrmPipelineModuleDefinition} moduleDefinition Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduledefinition">IFsrmPipelineModuleDefinition</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduledefinition">IFsrmPipelineModuleDefinition</a> 
     *        instance representing the pipeline module definition to use.
     * @returns {IFsrmPipelineModuleConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleconnector">IFsrmPipelineModuleConnector</a>**</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleconnector">IFsrmPipelineModuleConnector</a> instance 
     *        representing the pipeline module connector to use.
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload
     */
    OnLoad(moduleDefinition) {
        result := ComCall(7, this, "ptr", moduleDefinition, "ptr*", &moduleConnector := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFsrmPipelineModuleConnector(moduleConnector)
    }

    /**
     * Notifies the module to perform any cleanup tasks.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onunload
     */
    OnUnload() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
