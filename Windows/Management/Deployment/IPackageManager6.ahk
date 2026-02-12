#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DeploymentResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageManager6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager6
     * @type {Guid}
     */
    static IID => Guid("{0847e909-53cd-4e4f-832e-57d180f6e447}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProvisionPackageForAllUsersAsync", "AddPackageByAppInstallerFileAsync", "RequestAddPackageByAppInstallerFileAsync", "AddPackageToVolumeAndRelatedSetAsync", "StagePackageToVolumeAndRelatedSetAsync", "RequestAddPackageAsync"]

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    ProvisionPackageForAllUsersAsync(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(6, this, "ptr", packageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), operation)
    }

    /**
     * 
     * @param {Uri} appInstallerFileUri 
     * @param {Integer} options 
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    AddPackageByAppInstallerFileAsync(appInstallerFileUri, options, targetVolume) {
        result := ComCall(7, this, "ptr", appInstallerFileUri, "uint", options, "ptr", targetVolume, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), operation)
    }

    /**
     * 
     * @param {Uri} appInstallerFileUri 
     * @param {Integer} options 
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RequestAddPackageByAppInstallerFileAsync(appInstallerFileUri, options, targetVolume) {
        result := ComCall(8, this, "ptr", appInstallerFileUri, "uint", options, "ptr", targetVolume, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), operation)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} options 
     * @param {PackageVolume} targetVolume 
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @param {IIterable<Uri>} packageUrisToInstall 
     * @param {IIterable<Uri>} relatedPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    AddPackageToVolumeAndRelatedSetAsync(packageUri, dependencyPackageUris, options, targetVolume, optionalPackageFamilyNames, packageUrisToInstall, relatedPackageUris) {
        result := ComCall(9, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", options, "ptr", targetVolume, "ptr", optionalPackageFamilyNames, "ptr", packageUrisToInstall, "ptr", relatedPackageUris, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), operation)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} options 
     * @param {PackageVolume} targetVolume 
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @param {IIterable<Uri>} packageUrisToInstall 
     * @param {IIterable<Uri>} relatedPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    StagePackageToVolumeAndRelatedSetAsync(packageUri, dependencyPackageUris, options, targetVolume, optionalPackageFamilyNames, packageUrisToInstall, relatedPackageUris) {
        result := ComCall(10, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", options, "ptr", targetVolume, "ptr", optionalPackageFamilyNames, "ptr", packageUrisToInstall, "ptr", relatedPackageUris, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), operation)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} targetVolume 
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @param {IIterable<Uri>} relatedPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RequestAddPackageAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, relatedPackageUris) {
        result := ComCall(11, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr", targetVolume, "ptr", optionalPackageFamilyNames, "ptr", relatedPackageUris, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), operation)
    }
}
