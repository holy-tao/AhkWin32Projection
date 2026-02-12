#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DeploymentResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\ApplicationModel\Package.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager2
     * @type {Guid}
     */
    static IID => Guid("{f7aad08d-0840-46f2-b5d8-cad47693a095}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemovePackageWithOptionsAsync", "StagePackageWithOptionsAsync", "RegisterPackageByFullNameAsync", "FindPackagesWithPackageTypes", "FindPackagesByUserSecurityIdWithPackageTypes", "FindPackagesByNamePublisherWithPackageTypes", "FindPackagesByUserSecurityIdNamePublisherWithPackageTypes", "FindPackagesByPackageFamilyNameWithPackageTypes", "FindPackagesByUserSecurityIdPackageFamilyNameWithPackageTypes", "StageUserDataAsync"]

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @param {Integer} removalOptions_ 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RemovePackageWithOptionsAsync(packageFullName, removalOptions_) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(6, this, "ptr", packageFullName, "uint", removalOptions_, "ptr*", &deploymentOperation := 0, "int")
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
    StagePackageWithOptionsAsync(packageUri, dependencyPackageUris, deploymentOptions_) {
        result := ComCall(7, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {HSTRING} mainPackageFullName 
     * @param {IIterable<HSTRING>} dependencyPackageFullNames 
     * @param {Integer} deploymentOptions_ 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RegisterPackageByFullNameAsync(mainPackageFullName, dependencyPackageFullNames, deploymentOptions_) {
        if(mainPackageFullName is String) {
            pin := HSTRING.Create(mainPackageFullName)
            mainPackageFullName := pin.Value
        }
        mainPackageFullName := mainPackageFullName is Win32Handle ? NumGet(mainPackageFullName, "ptr") : mainPackageFullName

        result := ComCall(8, this, "ptr", mainPackageFullName, "ptr", dependencyPackageFullNames, "uint", deploymentOptions_, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {Integer} packageTypes_ 
     * @returns {IIterable<Package>} 
     */
    FindPackagesWithPackageTypes(packageTypes_) {
        result := ComCall(9, this, "uint", packageTypes_, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {Integer} packageTypes_ 
     * @returns {IIterable<Package>} 
     */
    FindPackagesByUserSecurityIdWithPackageTypes(userSecurityId, packageTypes_) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId

        result := ComCall(10, this, "ptr", userSecurityId, "uint", packageTypes_, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @param {Integer} packageTypes_ 
     * @returns {IIterable<Package>} 
     */
    FindPackagesByNamePublisherWithPackageTypes(packageName, packagePublisher, packageTypes_) {
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

        result := ComCall(11, this, "ptr", packageName, "ptr", packagePublisher, "uint", packageTypes_, "ptr*", &packageCollection := 0, "int")
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
     * @param {Integer} packageTypes_ 
     * @returns {IIterable<Package>} 
     */
    FindPackagesByUserSecurityIdNamePublisherWithPackageTypes(userSecurityId, packageName, packagePublisher, packageTypes_) {
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

        result := ComCall(12, this, "ptr", userSecurityId, "ptr", packageName, "ptr", packagePublisher, "uint", packageTypes_, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @param {Integer} packageTypes_ 
     * @returns {IIterable<Package>} 
     */
    FindPackagesByPackageFamilyNameWithPackageTypes(packageFamilyName, packageTypes_) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(13, this, "ptr", packageFamilyName, "uint", packageTypes_, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {HSTRING} packageFamilyName 
     * @param {Integer} packageTypes_ 
     * @returns {IIterable<Package>} 
     */
    FindPackagesByUserSecurityIdPackageFamilyNameWithPackageTypes(userSecurityId, packageFamilyName, packageTypes_) {
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

        result := ComCall(14, this, "ptr", userSecurityId, "ptr", packageFamilyName, "uint", packageTypes_, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    StageUserDataAsync(packageFullName) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(15, this, "ptr", packageFullName, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }
}
