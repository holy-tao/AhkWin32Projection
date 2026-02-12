#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\ApplicationModel\Package.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DeploymentResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageManager9 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager9
     * @type {Guid}
     */
    static IID => Guid("{1aa79035-cc71-4b2e-80a6-c7041d8579a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindProvisionedPackages", "AddPackageByUriAsync", "StagePackageByUriAsync", "RegisterPackageByUriAsync", "RegisterPackagesByFullNameAsync", "SetPackageStubPreference", "GetPackageStubPreference"]

    /**
     * 
     * @returns {IVector<Package>} 
     */
    FindProvisionedPackages() {
        result := ComCall(6, this, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {AddPackageOptions} options 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    AddPackageByUriAsync(packageUri, options) {
        result := ComCall(7, this, "ptr", packageUri, "ptr", options, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {StagePackageOptions} options 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    StagePackageByUriAsync(packageUri, options) {
        result := ComCall(8, this, "ptr", packageUri, "ptr", options, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {Uri} manifestUri 
     * @param {RegisterPackageOptions} options 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RegisterPackageByUriAsync(manifestUri, options) {
        result := ComCall(9, this, "ptr", manifestUri, "ptr", options, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} packageFullNames 
     * @param {RegisterPackageOptions} options 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RegisterPackagesByFullNameAsync(packageFullNames, options) {
        result := ComCall(10, this, "ptr", packageFullNames, "ptr", options, "ptr*", &deploymentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), deploymentOperation)
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @param {Integer} useStub 
     * @returns {HRESULT} 
     */
    SetPackageStubPreference(packageFamilyName, useStub) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(11, this, "ptr", packageFamilyName, "int", useStub, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @returns {Integer} 
     */
    GetPackageStubPreference(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(12, this, "ptr", packageFamilyName, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
