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
     * 
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pTaskTransition 
     * @returns {HRESULT} 
     */
    get_TaskTransition(pTaskTransition) {
        result := ComCall(6, this, "int*", pTaskTransition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRuntimetype 
     * @returns {HRESULT} 
     */
    get_RuntimeType(pRuntimetype) {
        result := ComCall(7, this, "int*", pRuntimetype, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pActivationPolicy 
     * @returns {HRESULT} 
     */
    get_ActivationPolicy(pActivationPolicy) {
        result := ComCall(8, this, "int*", pActivationPolicy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTaskType 
     * @returns {HRESULT} 
     */
    get_TaskType(pTaskType) {
        result := ComCall(9, this, "int*", pTaskType, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pIsSingleInstanceHost 
     * @returns {HRESULT} 
     */
    get_IsSingleInstanceHost(pIsSingleInstanceHost) {
        result := ComCall(15, this, "ptr", pIsSingleInstanceHost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsInteropEnabled 
     * @returns {HRESULT} 
     */
    get_IsInteropEnabled(pIsInteropEnabled) {
        result := ComCall(16, this, "ptr", pIsInteropEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pApplicationState 
     * @returns {HRESULT} 
     */
    get_ApplicationState(pApplicationState) {
        result := ComCall(17, this, "int*", pApplicationState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pInstallType 
     * @returns {HRESULT} 
     */
    get_InstallType(pInstallType) {
        result := ComCall(18, this, "int*", pInstallType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTargetMajorVersion 
     * @param {Pointer<Integer>} pTargetMinorVersion 
     * @returns {HRESULT} 
     */
    get_Version(pTargetMajorVersion, pTargetMinorVersion) {
        result := ComCall(19, this, "char*", pTargetMajorVersion, "char*", pTargetMinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBitsPerPixel 
     * @returns {HRESULT} 
     */
    get_BitsPerPixel(pBitsPerPixel) {
        result := ComCall(20, this, "ushort*", pBitsPerPixel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pSuppressesDehydration 
     * @returns {HRESULT} 
     */
    get_SuppressesDehydration(pSuppressesDehydration) {
        result := ComCall(21, this, "ptr", pSuppressesDehydration, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pIsOptedIn 
     * @returns {HRESULT} 
     */
    get_IsOptedForExtendedMem(pIsOptedIn) {
        result := ComCall(23, this, "ptr", pIsOptedIn, "HRESULT")
        return result
    }
}
