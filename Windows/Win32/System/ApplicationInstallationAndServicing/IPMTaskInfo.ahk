#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PACKMAN_RUNTIME.ahk" { PACKMAN_RUNTIME }
#Import ".\PM_APPLICATION_INSTALL_TYPE.ahk" { PM_APPLICATION_INSTALL_TYPE }
#Import ".\PM_APPLICATION_STATE.ahk" { PM_APPLICATION_STATE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PM_ACTIVATION_POLICY.ahk" { PM_ACTIVATION_POLICY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\PM_TASK_TRANSITION.ahk" { PM_TASK_TRANSITION }
#Import ".\PM_TASK_TYPE.ahk" { PM_TASK_TYPE }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMTaskInfo extends IUnknown {
    /**
     * The interface identifier for IPMTaskInfo
     * @type {Guid}
     */
    static IID := Guid("{bf1d8c33-1bf5-4ee0-b549-6b9dd3834942}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMTaskInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ProductID                    : IntPtr
        get_TaskID                       : IntPtr
        get_NavigationPage               : IntPtr
        get_TaskTransition               : IntPtr
        get_RuntimeType                  : IntPtr
        get_ActivationPolicy             : IntPtr
        get_TaskType                     : IntPtr
        get_InvocationInfo               : IntPtr
        get_ImagePath                    : IntPtr
        get_ImageParams                  : IntPtr
        get_InstallRootFolder            : IntPtr
        get_DataRootFolder               : IntPtr
        get_IsSingleInstanceHost         : IntPtr
        get_IsInteropEnabled             : IntPtr
        get_ApplicationState             : IntPtr
        get_InstallType                  : IntPtr
        get_Version                      : IntPtr
        get_BitsPerPixel                 : IntPtr
        get_SuppressesDehydration        : IntPtr
        get_BackgroundExecutionAbilities : IntPtr
        get_IsOptedForExtendedMem        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMTaskInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Guid} 
     */
    ProductID {
        get => this.get_ProductID()
    }

    /**
     */
    TaskID {
        get => this.get_TaskID()
    }

    /**
     */
    NavigationPage {
        get => this.get_NavigationPage()
    }

    /**
     * @type {PM_TASK_TRANSITION} 
     */
    TaskTransition {
        get => this.get_TaskTransition()
    }

    /**
     * @type {PACKMAN_RUNTIME} 
     */
    RuntimeType {
        get => this.get_RuntimeType()
    }

    /**
     * @type {PM_ACTIVATION_POLICY} 
     */
    ActivationPolicy {
        get => this.get_ActivationPolicy()
    }

    /**
     * @type {PM_TASK_TYPE} 
     */
    TaskType {
        get => this.get_TaskType()
    }

    /**
     */
    ImagePath {
        get => this.get_ImagePath()
    }

    /**
     */
    ImageParams {
        get => this.get_ImageParams()
    }

    /**
     */
    InstallRootFolder {
        get => this.get_InstallRootFolder()
    }

    /**
     */
    DataRootFolder {
        get => this.get_DataRootFolder()
    }

    /**
     * @type {BOOL} 
     */
    IsSingleInstanceHost {
        get => this.get_IsSingleInstanceHost()
    }

    /**
     * @type {BOOL} 
     */
    IsInteropEnabled {
        get => this.get_IsInteropEnabled()
    }

    /**
     * @type {PM_APPLICATION_STATE} 
     */
    ApplicationState {
        get => this.get_ApplicationState()
    }

    /**
     * @type {PM_APPLICATION_INSTALL_TYPE} 
     */
    InstallType {
        get => this.get_InstallType()
    }

    /**
     * @type {Integer} 
     */
    BitsPerPixel {
        get => this.get_BitsPerPixel()
    }

    /**
     * @type {BOOL} 
     */
    SuppressesDehydration {
        get => this.get_SuppressesDehydration()
    }

    /**
     */
    BackgroundExecutionAbilities {
        get => this.get_BackgroundExecutionAbilities()
    }

    /**
     * @type {BOOL} 
     */
    IsOptedForExtendedMem {
        get => this.get_IsOptedForExtendedMem()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProductID() {
        pProductID := Guid()
        result := ComCall(3, this, Guid.Ptr, pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(4, this, BSTR.Ptr, pTaskID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pNavigationPage 
     * @returns {HRESULT} 
     */
    get_NavigationPage(pNavigationPage) {
        result := ComCall(5, this, BSTR.Ptr, pNavigationPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PM_TASK_TRANSITION} 
     */
    get_TaskTransition() {
        result := ComCall(6, this, "int*", &pTaskTransition := 0, "HRESULT")
        return pTaskTransition
    }

    /**
     * 
     * @returns {PACKMAN_RUNTIME} 
     */
    get_RuntimeType() {
        result := ComCall(7, this, "int*", &pRuntimetype := 0, "HRESULT")
        return pRuntimetype
    }

    /**
     * 
     * @returns {PM_ACTIVATION_POLICY} 
     */
    get_ActivationPolicy() {
        result := ComCall(8, this, "int*", &pActivationPolicy := 0, "HRESULT")
        return pActivationPolicy
    }

    /**
     * 
     * @returns {PM_TASK_TYPE} 
     */
    get_TaskType() {
        result := ComCall(9, this, "int*", &pTaskType := 0, "HRESULT")
        return pTaskType
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(10, this, BSTR.Ptr, pImageUrn, BSTR.Ptr, pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImagePath 
     * @returns {HRESULT} 
     */
    get_ImagePath(pImagePath) {
        result := ComCall(11, this, BSTR.Ptr, pImagePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageParams 
     * @returns {HRESULT} 
     */
    get_ImageParams(pImageParams) {
        result := ComCall(12, this, BSTR.Ptr, pImageParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pInstallRootFolder 
     * @returns {HRESULT} 
     */
    get_InstallRootFolder(pInstallRootFolder) {
        result := ComCall(13, this, BSTR.Ptr, pInstallRootFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDataRootFolder 
     * @returns {HRESULT} 
     */
    get_DataRootFolder(pDataRootFolder) {
        result := ComCall(14, this, BSTR.Ptr, pDataRootFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsSingleInstanceHost() {
        result := ComCall(15, this, BOOL.Ptr, &pIsSingleInstanceHost := 0, "HRESULT")
        return pIsSingleInstanceHost
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsInteropEnabled() {
        result := ComCall(16, this, BOOL.Ptr, &pIsInteropEnabled := 0, "HRESULT")
        return pIsInteropEnabled
    }

    /**
     * 
     * @returns {PM_APPLICATION_STATE} 
     */
    get_ApplicationState() {
        result := ComCall(17, this, "int*", &pApplicationState := 0, "HRESULT")
        return pApplicationState
    }

    /**
     * 
     * @returns {PM_APPLICATION_INSTALL_TYPE} 
     */
    get_InstallType() {
        result := ComCall(18, this, "int*", &pInstallType := 0, "HRESULT")
        return pInstallType
    }

    /**
     * 
     * @param {Pointer<Integer>} pTargetMajorVersion 
     * @param {Pointer<Integer>} pTargetMinorVersion 
     * @returns {HRESULT} 
     */
    get_Version(pTargetMajorVersion, pTargetMinorVersion) {
        pTargetMajorVersionMarshal := pTargetMajorVersion is VarRef ? "char*" : "ptr"
        pTargetMinorVersionMarshal := pTargetMinorVersion is VarRef ? "char*" : "ptr"

        result := ComCall(19, this, pTargetMajorVersionMarshal, pTargetMajorVersion, pTargetMinorVersionMarshal, pTargetMinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerPixel() {
        result := ComCall(20, this, "ushort*", &pBitsPerPixel := 0, "HRESULT")
        return pBitsPerPixel
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_SuppressesDehydration() {
        result := ComCall(21, this, BOOL.Ptr, &pSuppressesDehydration := 0, "HRESULT")
        return pSuppressesDehydration
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBackgroundExecutionAbilities 
     * @returns {HRESULT} 
     */
    get_BackgroundExecutionAbilities(pBackgroundExecutionAbilities) {
        result := ComCall(22, this, BSTR.Ptr, pBackgroundExecutionAbilities, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOptedForExtendedMem() {
        result := ComCall(23, this, BOOL.Ptr, &pIsOptedIn := 0, "HRESULT")
        return pIsOptedIn
    }

    Query(iid) {
        if (IPMTaskInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProductID := CallbackCreate(GetMethod(implObj, "get_ProductID"), flags, 2)
        this.vtbl.get_TaskID := CallbackCreate(GetMethod(implObj, "get_TaskID"), flags, 2)
        this.vtbl.get_NavigationPage := CallbackCreate(GetMethod(implObj, "get_NavigationPage"), flags, 2)
        this.vtbl.get_TaskTransition := CallbackCreate(GetMethod(implObj, "get_TaskTransition"), flags, 2)
        this.vtbl.get_RuntimeType := CallbackCreate(GetMethod(implObj, "get_RuntimeType"), flags, 2)
        this.vtbl.get_ActivationPolicy := CallbackCreate(GetMethod(implObj, "get_ActivationPolicy"), flags, 2)
        this.vtbl.get_TaskType := CallbackCreate(GetMethod(implObj, "get_TaskType"), flags, 2)
        this.vtbl.get_InvocationInfo := CallbackCreate(GetMethod(implObj, "get_InvocationInfo"), flags, 3)
        this.vtbl.get_ImagePath := CallbackCreate(GetMethod(implObj, "get_ImagePath"), flags, 2)
        this.vtbl.get_ImageParams := CallbackCreate(GetMethod(implObj, "get_ImageParams"), flags, 2)
        this.vtbl.get_InstallRootFolder := CallbackCreate(GetMethod(implObj, "get_InstallRootFolder"), flags, 2)
        this.vtbl.get_DataRootFolder := CallbackCreate(GetMethod(implObj, "get_DataRootFolder"), flags, 2)
        this.vtbl.get_IsSingleInstanceHost := CallbackCreate(GetMethod(implObj, "get_IsSingleInstanceHost"), flags, 2)
        this.vtbl.get_IsInteropEnabled := CallbackCreate(GetMethod(implObj, "get_IsInteropEnabled"), flags, 2)
        this.vtbl.get_ApplicationState := CallbackCreate(GetMethod(implObj, "get_ApplicationState"), flags, 2)
        this.vtbl.get_InstallType := CallbackCreate(GetMethod(implObj, "get_InstallType"), flags, 2)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 3)
        this.vtbl.get_BitsPerPixel := CallbackCreate(GetMethod(implObj, "get_BitsPerPixel"), flags, 2)
        this.vtbl.get_SuppressesDehydration := CallbackCreate(GetMethod(implObj, "get_SuppressesDehydration"), flags, 2)
        this.vtbl.get_BackgroundExecutionAbilities := CallbackCreate(GetMethod(implObj, "get_BackgroundExecutionAbilities"), flags, 2)
        this.vtbl.get_IsOptedForExtendedMem := CallbackCreate(GetMethod(implObj, "get_IsOptedForExtendedMem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProductID)
        CallbackFree(this.vtbl.get_TaskID)
        CallbackFree(this.vtbl.get_NavigationPage)
        CallbackFree(this.vtbl.get_TaskTransition)
        CallbackFree(this.vtbl.get_RuntimeType)
        CallbackFree(this.vtbl.get_ActivationPolicy)
        CallbackFree(this.vtbl.get_TaskType)
        CallbackFree(this.vtbl.get_InvocationInfo)
        CallbackFree(this.vtbl.get_ImagePath)
        CallbackFree(this.vtbl.get_ImageParams)
        CallbackFree(this.vtbl.get_InstallRootFolder)
        CallbackFree(this.vtbl.get_DataRootFolder)
        CallbackFree(this.vtbl.get_IsSingleInstanceHost)
        CallbackFree(this.vtbl.get_IsInteropEnabled)
        CallbackFree(this.vtbl.get_ApplicationState)
        CallbackFree(this.vtbl.get_InstallType)
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.get_BitsPerPixel)
        CallbackFree(this.vtbl.get_SuppressesDehydration)
        CallbackFree(this.vtbl.get_BackgroundExecutionAbilities)
        CallbackFree(this.vtbl.get_IsOptedForExtendedMem)
    }
}
