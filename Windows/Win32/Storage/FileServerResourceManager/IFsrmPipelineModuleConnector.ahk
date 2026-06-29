#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmPipelineModuleDefinition.ahk" { IFsrmPipelineModuleDefinition }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmPipelineModuleImplementation.ahk" { IFsrmPipelineModuleImplementation }

/**
 * Creates the communication channel between FSRM and your pipeline module implementation.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleconnector
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPipelineModuleConnector extends IDispatch {
    /**
     * The interface identifier for IFsrmPipelineModuleConnector
     * @type {Guid}
     */
    static IID := Guid("{c16014f3-9aa1-46b3-b0a7-ab146eb205f2}")

    /**
     * The class identifier for FsrmPipelineModuleConnector
     * @type {Guid}
     */
    static CLSID := Guid("{c7643375-1eb5-44de-a062-623547d933bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPipelineModuleConnector interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ModuleImplementation : IntPtr
        get_ModuleName           : IntPtr
        get_HostingUserAccount   : IntPtr
        get_HostingProcessPid    : IntPtr
        Bind                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPipelineModuleConnector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IFsrmPipelineModuleImplementation} 
     */
    ModuleImplementation {
        get => this.get_ModuleImplementation()
    }

    /**
     * @type {BSTR} 
     */
    ModuleName {
        get => this.get_ModuleName()
    }

    /**
     * @type {BSTR} 
     */
    HostingUserAccount {
        get => this.get_HostingUserAccount()
    }

    /**
     * @type {Integer} 
     */
    HostingProcessPid {
        get => this.get_HostingProcessPid()
    }

    /**
     * The interface that implements the pipeline module.
     * @returns {IFsrmPipelineModuleImplementation} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleconnector-get_moduleimplementation
     */
    get_ModuleImplementation() {
        result := ComCall(7, this, "ptr*", &pipelineModuleImplementation := 0, "HRESULT")
        return IFsrmPipelineModuleImplementation(pipelineModuleImplementation)
    }

    /**
     * The name of the module.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleconnector-get_modulename
     */
    get_ModuleName() {
        userName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, userName, "HRESULT")
        return userName
    }

    /**
     * The user account under which the module runs.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleconnector-get_hostinguseraccount
     */
    get_HostingUserAccount() {
        userAccount := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, userAccount, "HRESULT")
        return userAccount
    }

    /**
     * The process identifier of the module.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleconnector-get_hostingprocesspid
     */
    get_HostingProcessPid() {
        result := ComCall(10, this, "int*", &pid := 0, "HRESULT")
        return pid
    }

    /**
     * Binds the pipeline module implementation to the FSRM communication channel.
     * @remarks
     * Call this method from your <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> implementation.
     * @param {IFsrmPipelineModuleDefinition} moduleDefinition An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduledefinition">IFsrmPipelineModuleDefinition</a> interface that contains the definition of the module.
     * @param {IFsrmPipelineModuleImplementation} moduleImplementation An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleimplementation">IFsrmPipelineModuleImplementation</a> interface to the module's implementation.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleconnector-bind
     */
    Bind(moduleDefinition, moduleImplementation) {
        result := ComCall(11, this, "ptr", moduleDefinition, "ptr", moduleImplementation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmPipelineModuleConnector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ModuleImplementation := CallbackCreate(GetMethod(implObj, "get_ModuleImplementation"), flags, 2)
        this.vtbl.get_ModuleName := CallbackCreate(GetMethod(implObj, "get_ModuleName"), flags, 2)
        this.vtbl.get_HostingUserAccount := CallbackCreate(GetMethod(implObj, "get_HostingUserAccount"), flags, 2)
        this.vtbl.get_HostingProcessPid := CallbackCreate(GetMethod(implObj, "get_HostingProcessPid"), flags, 2)
        this.vtbl.Bind := CallbackCreate(GetMethod(implObj, "Bind"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ModuleImplementation)
        CallbackFree(this.vtbl.get_ModuleName)
        CallbackFree(this.vtbl.get_HostingUserAccount)
        CallbackFree(this.vtbl.get_HostingProcessPid)
        CallbackFree(this.vtbl.Bind)
    }
}
