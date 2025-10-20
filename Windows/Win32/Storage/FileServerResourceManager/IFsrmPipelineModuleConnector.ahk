#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Creates the communication channel between FSRM and your pipeline module implementation.
 * @remarks
 * 
  * Your 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> 
  *     implementation must create an instance of an object implementing this interface. To create this instance, call the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a> function. Use 
  *     <b>CLSID_FsrmPipelineModuleConnector</b> as the class identifier and 
  *     <c>__uuidof(IFsrmPipelineModuleConnector)</c> as the interface identifier. Use 
  *     the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX_INPROC_SERVER</a> class context to create the instance.
  * 
  * After the instance has been created, 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleconnector-bind">IFsrmPipelineModuleConnector::Bind</a> must 
  *     be called before you can return the instance in your 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">OnLoad</a> implementation.
  * 
  * For more information on how to create and bind an instance, see 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fsrm/initializing-and-binding-a-pipeline-module">Initializing and Binding a Pipeline Module</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleconnector
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPipelineModuleConnector extends IDispatch{
    /**
     * The interface identifier for IFsrmPipelineModuleConnector
     * @type {Guid}
     */
    static IID => Guid("{c16014f3-9aa1-46b3-b0a7-ab146eb205f2}")

    /**
     * The class identifier for FsrmPipelineModuleConnector
     * @type {Guid}
     */
    static CLSID => Guid("{c7643375-1eb5-44de-a062-623547d933bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IFsrmPipelineModuleImplementation>} pipelineModuleImplementation 
     * @returns {HRESULT} 
     */
    get_ModuleImplementation(pipelineModuleImplementation) {
        result := ComCall(7, this, "ptr", pipelineModuleImplementation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userName 
     * @returns {HRESULT} 
     */
    get_ModuleName(userName) {
        result := ComCall(8, this, "ptr", userName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userAccount 
     * @returns {HRESULT} 
     */
    get_HostingUserAccount(userAccount) {
        result := ComCall(9, this, "ptr", userAccount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pid 
     * @returns {HRESULT} 
     */
    get_HostingProcessPid(pid) {
        result := ComCall(10, this, "int*", pid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmPipelineModuleDefinition>} moduleDefinition 
     * @param {Pointer<IFsrmPipelineModuleImplementation>} moduleImplementation 
     * @returns {HRESULT} 
     */
    Bind(moduleDefinition, moduleImplementation) {
        result := ComCall(11, this, "ptr", moduleDefinition, "ptr", moduleImplementation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
