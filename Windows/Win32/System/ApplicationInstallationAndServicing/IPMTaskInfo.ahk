#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMTaskInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMTaskInfo
     * @type {Guid}
     */
    static IID => Guid("{bf1d8c33-1bf5-4ee0-b549-6b9dd3834942}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductID", "get_TaskID", "get_NavigationPage", "get_TaskTransition", "get_RuntimeType", "get_ActivationPolicy", "get_TaskType", "get_InvocationInfo", "get_ImagePath", "get_ImageParams", "get_InstallRootFolder", "get_DataRootFolder", "get_IsSingleInstanceHost", "get_IsInteropEnabled", "get_ApplicationState", "get_InstallType", "get_Version", "get_BitsPerPixel", "get_SuppressesDehydration", "get_BackgroundExecutionAbilities", "get_IsOptedForExtendedMem"]

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
     * @type {Integer} 
     */
    TaskTransition {
        get => this.get_TaskTransition()
    }

    /**
     * @type {Integer} 
     */
    RuntimeType {
        get => this.get_RuntimeType()
    }

    /**
     * @type {Integer} 
     */
    ActivationPolicy {
        get => this.get_ActivationPolicy()
    }

    /**
     * @type {Integer} 
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
     * @type {Integer} 
     */
    ApplicationState {
        get => this.get_ApplicationState()
    }

    /**
     * @type {Integer} 
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
        result := ComCall(3, this, "ptr", pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(4, this, "ptr", pTaskID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pNavigationPage 
     * @returns {HRESULT} 
     */
    get_NavigationPage(pNavigationPage) {
        result := ComCall(5, this, "ptr", pNavigationPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TaskTransition() {
        result := ComCall(6, this, "int*", &pTaskTransition := 0, "HRESULT")
        return pTaskTransition
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RuntimeType() {
        result := ComCall(7, this, "int*", &pRuntimetype := 0, "HRESULT")
        return pRuntimetype
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActivationPolicy() {
        result := ComCall(8, this, "int*", &pActivationPolicy := 0, "HRESULT")
        return pActivationPolicy
    }

    /**
     * 
     * @returns {Integer} 
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
        result := ComCall(10, this, "ptr", pImageUrn, "ptr", pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImagePath 
     * @returns {HRESULT} 
     */
    get_ImagePath(pImagePath) {
        result := ComCall(11, this, "ptr", pImagePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageParams 
     * @returns {HRESULT} 
     */
    get_ImageParams(pImageParams) {
        result := ComCall(12, this, "ptr", pImageParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pInstallRootFolder 
     * @returns {HRESULT} 
     */
    get_InstallRootFolder(pInstallRootFolder) {
        result := ComCall(13, this, "ptr", pInstallRootFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDataRootFolder 
     * @returns {HRESULT} 
     */
    get_DataRootFolder(pDataRootFolder) {
        result := ComCall(14, this, "ptr", pDataRootFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsSingleInstanceHost() {
        result := ComCall(15, this, "int*", &pIsSingleInstanceHost := 0, "HRESULT")
        return pIsSingleInstanceHost
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsInteropEnabled() {
        result := ComCall(16, this, "int*", &pIsInteropEnabled := 0, "HRESULT")
        return pIsInteropEnabled
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ApplicationState() {
        result := ComCall(17, this, "int*", &pApplicationState := 0, "HRESULT")
        return pApplicationState
    }

    /**
     * 
     * @returns {Integer} 
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
        result := ComCall(21, this, "int*", &pSuppressesDehydration := 0, "HRESULT")
        return pSuppressesDehydration
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBackgroundExecutionAbilities 
     * @returns {HRESULT} 
     */
    get_BackgroundExecutionAbilities(pBackgroundExecutionAbilities) {
        result := ComCall(22, this, "ptr", pBackgroundExecutionAbilities, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOptedForExtendedMem() {
        result := ComCall(23, this, "int*", &pIsOptedIn := 0, "HRESULT")
        return pIsOptedIn
    }
}
