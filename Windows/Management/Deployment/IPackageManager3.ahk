#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PackageVolume.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DeploymentResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageManager3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager3
     * @type {Guid}
     */
    static IID => Guid("{daad9948-36f1-41a7-9188-bc263e0dcb72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPackageVolumeAsync", "AddPackageToVolumeAsync", "ClearPackageStatus", "RegisterPackageWithAppDataVolumeAsync", "FindPackageVolumeByName", "FindPackageVolumes", "GetDefaultPackageVolume", "MovePackageToVolumeAsync", "RemovePackageVolumeAsync", "SetDefaultPackageVolume", "SetPackageStatus", "SetPackageVolumeOfflineAsync", "SetPackageVolumeOnlineAsync", "StagePackageToVolumeAsync", "StageUserDataWithOptionsAsync"]

    /**
     * 
     * @param {HSTRING} packageStorePath 
     * @returns {IAsyncOperation<PackageVolume>} 
     */
    AddPackageVolumeAsync(packageStorePath) {
        if(packageStorePath is String) {
            pin := HSTRING.Create(packageStorePath)
            packageStorePath := pin.Value
        }
        packageStorePath := packageStorePath is Win32Handle ? NumGet(packageStorePath, "ptr") : packageStorePath

        result := ComCall(6, this, "ptr", packageStorePath, "ptr*", &packageVolume_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PackageVolume, packageVolume_)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    AddPackageToVolumeAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume) {
        result := ComCall(7, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr", targetVolume, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @param {Integer} status_ 
     * @returns {HRESULT} 
     */
    ClearPackageStatus(packageFullName, status_) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(8, this, "ptr", packageFullName, "uint", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} manifestUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} appDataVolume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RegisterPackageWithAppDataVolumeAsync(manifestUri, dependencyPackageUris, deploymentOptions_, appDataVolume) {
        result := ComCall(9, this, "ptr", manifestUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr", appDataVolume, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {HSTRING} volumeName 
     * @returns {PackageVolume} 
     */
    FindPackageVolumeByName(volumeName) {
        if(volumeName is String) {
            pin := HSTRING.Create(volumeName)
            volumeName := pin.Value
        }
        volumeName := volumeName is Win32Handle ? NumGet(volumeName, "ptr") : volumeName

        result := ComCall(10, this, "ptr", volumeName, "ptr*", &volume := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageVolume(volume)
    }

    /**
     * 
     * @returns {IIterable<PackageVolume>} 
     */
    FindPackageVolumes() {
        result := ComCall(11, this, "ptr*", &volumeCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(PackageVolume, volumeCollection)
    }

    /**
     * 
     * @returns {PackageVolume} 
     */
    GetDefaultPackageVolume() {
        result := ComCall(12, this, "ptr*", &volume := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageVolume(volume)
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    MovePackageToVolumeAsync(packageFullName, deploymentOptions_, targetVolume) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(13, this, "ptr", packageFullName, "uint", deploymentOptions_, "ptr", targetVolume, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {PackageVolume} volume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RemovePackageVolumeAsync(volume) {
        result := ComCall(14, this, "ptr", volume, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {PackageVolume} volume 
     * @returns {HRESULT} 
     */
    SetDefaultPackageVolume(volume) {
        result := ComCall(15, this, "ptr", volume, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @param {Integer} status_ 
     * @returns {HRESULT} 
     */
    SetPackageStatus(packageFullName, status_) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(16, this, "ptr", packageFullName, "uint", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PackageVolume} packageVolume_ 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    SetPackageVolumeOfflineAsync(packageVolume_) {
        result := ComCall(17, this, "ptr", packageVolume_, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {PackageVolume} packageVolume_ 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    SetPackageVolumeOnlineAsync(packageVolume_) {
        result := ComCall(18, this, "ptr", packageVolume_, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    StagePackageToVolumeAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume) {
        result := ComCall(19, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr", targetVolume, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @param {Integer} deploymentOptions_ 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    StageUserDataWithOptionsAsync(packageFullName, deploymentOptions_) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(20, this, "ptr", packageFullName, "uint", deploymentOptions_, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }
}
