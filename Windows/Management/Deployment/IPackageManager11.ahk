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
class IPackageManager11 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager11
     * @type {Guid}
     */
    static IID => Guid("{12950b24-c77e-4ea7-8859-325318074e15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemovePackageByUriAsync"]

    /**
     * 
     * @param {Uri} packageUri 
     * @param {RemovePackageOptions} options 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RemovePackageByUriAsync(packageUri, options) {
        result := ComCall(6, this, "ptr", packageUri, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DeploymentResult, (ptr) => IPropertyValue(ptr).GetDeploymentProgress(), operation)
    }
}
