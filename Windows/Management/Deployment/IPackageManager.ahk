#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DeploymentResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\ApplicationModel\Package.ahk
#Include .\PackageUserInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager
     * @type {Guid}
     */
    static IID => Guid("{9a7d4b65-5e8f-4fc7-a2e5-7f6925cb8b53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPackageAsync", "UpdatePackageAsync", "RemovePackageAsync", "StagePackageAsync", "RegisterPackageAsync", "FindPackages", "FindPackagesByUserSecurityId", "FindPackagesByNamePublisher", "FindPackagesByUserSecurityIdNamePublisher", "FindUsers", "SetPackageState", "FindPackageByPackageFullName", "CleanupPackageForUserAsync", "FindPackagesByPackageFamilyName", "FindPackagesByUserSecurityIdPackageFamilyName", "FindPackageByUserSecurityIdPackageFullName"]

    /**
     * 
     * @param {Uri} packageUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} deploymentOptions_ 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    AddPackageAsync(packageUri, dependencyPackageUris, deploymentOptions_) {
        result := ComCall(6, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr*", &deploymentOperation := 0, "int")
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
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    UpdatePackageAsync(packageUri, dependencyPackageUris, deploymentOptions_) {
        result := ComCall(7, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RemovePackageAsync(packageFullName) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(8, this, "ptr", packageFullName, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    StagePackageAsync(packageUri, dependencyPackageUris) {
        result := ComCall(9, this, "ptr", packageUri, "ptr", dependencyPackageUris, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {Uri} manifestUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} deploymentOptions_ 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RegisterPackageAsync(manifestUri, dependencyPackageUris, deploymentOptions_) {
        result := ComCall(10, this, "ptr", manifestUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * Finds the packages with the specified family name for the current user.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-findpackagesbypackagefamily
     */
    FindPackages() {
        result := ComCall(11, this, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @returns {IIterable<Package>} 
     */
    FindPackagesByUserSecurityId(userSecurityId) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId

        result := ComCall(12, this, "ptr", userSecurityId, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * Finds the packages with the specified family name for the current user.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-findpackagesbypackagefamily
     */
    FindPackagesByNamePublisher(packageName, packagePublisher) {
        if(packageName is String) {
            pin := HSTRING.Create(packageName)
            packageName := pin.Value
        }
        packageName := packageName is Win32Handle ? NumGet(packageName, "ptr") : packageName
        if(packagePublisher is String) {
            pin := HSTRING.Create(packagePublisher)
            packagePublisher := pin.Value
        }
        packagePublisher := packagePublisher is Win32Handle ? NumGet(packagePublisher, "ptr") : packagePublisher

        result := ComCall(13, this, "ptr", packageName, "ptr", packagePublisher, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IIterable<Package>} 
     */
    FindPackagesByUserSecurityIdNamePublisher(userSecurityId, packageName, packagePublisher) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId
        if(packageName is String) {
            pin := HSTRING.Create(packageName)
            packageName := pin.Value
        }
        packageName := packageName is Win32Handle ? NumGet(packageName, "ptr") : packageName
        if(packagePublisher is String) {
            pin := HSTRING.Create(packagePublisher)
            packagePublisher := pin.Value
        }
        packagePublisher := packagePublisher is Win32Handle ? NumGet(packagePublisher, "ptr") : packagePublisher

        result := ComCall(14, this, "ptr", userSecurityId, "ptr", packageName, "ptr", packagePublisher, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @returns {IIterable<PackageUserInformation>} 
     */
    FindUsers(packageFullName) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(15, this, "ptr", packageFullName, "ptr*", &users := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(PackageUserInformation, users)
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @param {Integer} packageState_ 
     * @returns {HRESULT} 
     */
    SetPackageState(packageFullName, packageState_) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(16, this, "ptr", packageFullName, "int", packageState_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Finds the packages with the specified family name for the current user.
     * @param {HSTRING} packageFullName 
     * @returns {Package} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-findpackagesbypackagefamily
     */
    FindPackageByPackageFullName(packageFullName) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(17, this, "ptr", packageFullName, "ptr*", &packageInformation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Package(packageInformation)
    }

    /**
     * 
     * @param {HSTRING} packageName 
     * @param {HSTRING} userSecurityId 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    CleanupPackageForUserAsync(packageName, userSecurityId) {
        if(packageName is String) {
            pin := HSTRING.Create(packageName)
            packageName := pin.Value
        }
        packageName := packageName is Win32Handle ? NumGet(packageName, "ptr") : packageName
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId

        result := ComCall(18, this, "ptr", packageName, "ptr", userSecurityId, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * Finds the packages with the specified family name for the current user.
     * @param {HSTRING} packageFamilyName Type: <b>PCWSTR</b>
     * 
     * The package family name.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-findpackagesbypackagefamily
     */
    FindPackagesByPackageFamilyName(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(19, this, "ptr", packageFamilyName, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {HSTRING} packageFamilyName 
     * @returns {IIterable<Package>} 
     */
    FindPackagesByUserSecurityIdPackageFamilyName(userSecurityId, packageFamilyName) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(20, this, "ptr", userSecurityId, "ptr", packageFamilyName, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {HSTRING} packageFullName 
     * @returns {Package} 
     */
    FindPackageByUserSecurityIdPackageFullName(userSecurityId, packageFullName) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(21, this, "ptr", userSecurityId, "ptr", packageFullName, "ptr*", &packageInformation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Package(packageInformation)
    }
}
