#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DeploymentResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PackageManagerDebugSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageManager5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager5
     * @type {Guid}
     */
    static IID => Guid("{711f3117-1afd-4313-978c-9bb6e1b864a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPackageToVolumeAndOptionalPackagesAsync", "StagePackageToVolumeAndOptionalPackagesAsync", "RegisterPackageByFamilyNameAndOptionalPackagesAsync", "get_DebugSettings"]

    /**
     * @type {PackageManagerDebugSettings} 
     */
    DebugSettings {
        get => this.get_DebugSettings()
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} targetVolume 
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @param {IIterable<Uri>} externalPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    AddPackageToVolumeAndOptionalPackagesAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, externalPackageUris) {
        result := ComCall(6, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr", targetVolume, "ptr", optionalPackageFamilyNames, "ptr", externalPackageUris, "ptr*", &deploymentOperation := 0, "int")
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
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @param {IIterable<Uri>} externalPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    StagePackageToVolumeAndOptionalPackagesAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, externalPackageUris) {
        result := ComCall(7, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr", targetVolume, "ptr", optionalPackageFamilyNames, "ptr", externalPackageUris, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {HSTRING} mainPackageFamilyName 
     * @param {IIterable<HSTRING>} dependencyPackageFamilyNames 
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} appDataVolume 
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RegisterPackageByFamilyNameAndOptionalPackagesAsync(mainPackageFamilyName, dependencyPackageFamilyNames, deploymentOptions_, appDataVolume, optionalPackageFamilyNames) {
        if(mainPackageFamilyName is String) {
            pin := HSTRING.Create(mainPackageFamilyName)
            mainPackageFamilyName := pin.Value
        }
        mainPackageFamilyName := mainPackageFamilyName is Win32Handle ? NumGet(mainPackageFamilyName, "ptr") : mainPackageFamilyName

        result := ComCall(8, this, "ptr", mainPackageFamilyName, "ptr", dependencyPackageFamilyNames, "uint", deploymentOptions_, "ptr", appDataVolume, "ptr", optionalPackageFamilyNames, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @returns {PackageManagerDebugSettings} 
     */
    get_DebugSettings() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageManagerDebugSettings(value)
    }
}
