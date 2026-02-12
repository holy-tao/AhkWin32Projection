#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DeploymentResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageManager7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager7
     * @type {Guid}
     */
    static IID => Guid("{f28654f4-2ba7-4b80-88d6-be15f9a23fba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAddPackageAndRelatedSetAsync"]

    /**
     * 
     * @param {Uri} packageUri 
     * @param {IIterable<Uri>} dependencyPackageUris 
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} targetVolume 
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @param {IIterable<Uri>} relatedPackageUris 
     * @param {IIterable<Uri>} packageUrisToInstall 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RequestAddPackageAndRelatedSetAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, relatedPackageUris, packageUrisToInstall) {
        result := ComCall(6, this, "ptr", packageUri, "ptr", dependencyPackageUris, "uint", deploymentOptions_, "ptr", targetVolume, "ptr", optionalPackageFamilyNames, "ptr", relatedPackageUris, "ptr", packageUrisToInstall, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), operation)
    }
}
