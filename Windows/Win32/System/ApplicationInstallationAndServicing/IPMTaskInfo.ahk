#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMTaskInfo extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(4, this, "ptr", pTaskID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pNavigationPage 
     * @returns {HRESULT} 
     */
    get_NavigationPage(pNavigationPage) {
        result := ComCall(5, this, "ptr", pNavigationPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTaskTransition 
     * @returns {HRESULT} 
     */
    get_TaskTransition(pTaskTransition) {
        result := ComCall(6, this, "int*", pTaskTransition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRuntimetype 
     * @returns {HRESULT} 
     */
    get_RuntimeType(pRuntimetype) {
        result := ComCall(7, this, "int*", pRuntimetype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pActivationPolicy 
     * @returns {HRESULT} 
     */
    get_ActivationPolicy(pActivationPolicy) {
        result := ComCall(8, this, "int*", pActivationPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTaskType 
     * @returns {HRESULT} 
     */
    get_TaskType(pTaskType) {
        result := ComCall(9, this, "int*", pTaskType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(10, this, "ptr", pImageUrn, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImagePath 
     * @returns {HRESULT} 
     */
    get_ImagePath(pImagePath) {
        result := ComCall(11, this, "ptr", pImagePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageParams 
     * @returns {HRESULT} 
     */
    get_ImageParams(pImageParams) {
        result := ComCall(12, this, "ptr", pImageParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pInstallRootFolder 
     * @returns {HRESULT} 
     */
    get_InstallRootFolder(pInstallRootFolder) {
        result := ComCall(13, this, "ptr", pInstallRootFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDataRootFolder 
     * @returns {HRESULT} 
     */
    get_DataRootFolder(pDataRootFolder) {
        result := ComCall(14, this, "ptr", pDataRootFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsSingleInstanceHost 
     * @returns {HRESULT} 
     */
    get_IsSingleInstanceHost(pIsSingleInstanceHost) {
        result := ComCall(15, this, "ptr", pIsSingleInstanceHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsInteropEnabled 
     * @returns {HRESULT} 
     */
    get_IsInteropEnabled(pIsInteropEnabled) {
        result := ComCall(16, this, "ptr", pIsInteropEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pApplicationState 
     * @returns {HRESULT} 
     */
    get_ApplicationState(pApplicationState) {
        result := ComCall(17, this, "int*", pApplicationState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pInstallType 
     * @returns {HRESULT} 
     */
    get_InstallType(pInstallType) {
        result := ComCall(18, this, "int*", pInstallType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pTargetMajorVersion 
     * @param {Pointer<Byte>} pTargetMinorVersion 
     * @returns {HRESULT} 
     */
    get_Version(pTargetMajorVersion, pTargetMinorVersion) {
        result := ComCall(19, this, "char*", pTargetMajorVersion, "char*", pTargetMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pBitsPerPixel 
     * @returns {HRESULT} 
     */
    get_BitsPerPixel(pBitsPerPixel) {
        result := ComCall(20, this, "ushort*", pBitsPerPixel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pSuppressesDehydration 
     * @returns {HRESULT} 
     */
    get_SuppressesDehydration(pSuppressesDehydration) {
        result := ComCall(21, this, "ptr", pSuppressesDehydration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBackgroundExecutionAbilities 
     * @returns {HRESULT} 
     */
    get_BackgroundExecutionAbilities(pBackgroundExecutionAbilities) {
        result := ComCall(22, this, "ptr", pBackgroundExecutionAbilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsOptedIn 
     * @returns {HRESULT} 
     */
    get_IsOptedForExtendedMem(pIsOptedIn) {
        result := ComCall(23, this, "ptr", pIsOptedIn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
