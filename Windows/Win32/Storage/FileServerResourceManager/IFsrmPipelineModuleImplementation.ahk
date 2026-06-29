#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmPipelineModuleDefinition.ahk" { IFsrmPipelineModuleDefinition }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IFsrmPipelineModuleConnector.ahk" { IFsrmPipelineModuleConnector }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Abstract interface for IFsrmClassifierModuleImplementation and IFsrmStorageModuleImplementation.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleimplementation
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPipelineModuleImplementation extends IDispatch {
    /**
     * The interface identifier for IFsrmPipelineModuleImplementation
     * @type {Guid}
     */
    static IID := Guid("{b7907906-2b02-4cb5-84a9-fdf54613d6cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPipelineModuleImplementation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        OnLoad   : IntPtr
        OnUnload : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPipelineModuleImplementation.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload
     */
    OnLoad(moduleDefinition) {
        result := ComCall(7, this, "ptr", moduleDefinition, "ptr*", &moduleConnector := 0, "HRESULT")
        return IFsrmPipelineModuleConnector(moduleConnector)
    }

    /**
     * Notifies the module to perform any cleanup tasks.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onunload
     */
    OnUnload() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmPipelineModuleImplementation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnLoad := CallbackCreate(GetMethod(implObj, "OnLoad"), flags, 3)
        this.vtbl.OnUnload := CallbackCreate(GetMethod(implObj, "OnUnload"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnLoad)
        CallbackFree(this.vtbl.OnUnload)
    }
}
