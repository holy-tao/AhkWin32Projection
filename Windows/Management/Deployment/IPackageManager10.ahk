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
class IPackageManager10 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager10
     * @type {Guid}
     */
    static IID => Guid("{a7d7d07e-2e66-4093-aed5-e093ed87b3bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProvisionPackageForAllUsersWithOptionsAsync"]

    /**
     * 
     * @param {HSTRING} mainPackageFamilyName 
     * @param {PackageAllUserProvisioningOptions} options 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    ProvisionPackageForAllUsersWithOptionsAsync(mainPackageFamilyName, options) {
        if(mainPackageFamilyName is String) {
            pin := HSTRING.Create(mainPackageFamilyName)
            mainPackageFamilyName := pin.Value
        }
        mainPackageFamilyName := mainPackageFamilyName is Win32Handle ? NumGet(mainPackageFamilyName, "ptr") : mainPackageFamilyName

        result := ComCall(6, this, "ptr", mainPackageFamilyName, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), operation)
    }
}
