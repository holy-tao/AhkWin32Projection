#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\PackageCatalogAddResourcePackageResult.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\PackageCatalogRemoveResourcePackagesResult.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackageCatalog4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageCatalog4
     * @type {Guid}
     */
    static IID => Guid("{c37c399b-44cc-4b7b-8baf-796c04ead3b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddResourcePackageAsync", "RemoveResourcePackagesAsync"]

    /**
     * 
     * @param {HSTRING} resourcePackageFamilyName 
     * @param {HSTRING} resourceID 
     * @param {Integer} options 
     * @returns {IAsyncOperationWithProgress<PackageCatalogAddResourcePackageResult, PackageInstallProgress>} 
     */
    AddResourcePackageAsync(resourcePackageFamilyName, resourceID, options) {
        if(resourcePackageFamilyName is String) {
            pin := HSTRING.Create(resourcePackageFamilyName)
            resourcePackageFamilyName := pin.Value
        }
        resourcePackageFamilyName := resourcePackageFamilyName is Win32Handle ? NumGet(resourcePackageFamilyName, "ptr") : resourcePackageFamilyName
        if(resourceID is String) {
            pin := HSTRING.Create(resourceID)
            resourceID := pin.Value
        }
        resourceID := resourceID is Win32Handle ? NumGet(resourceID, "ptr") : resourceID

        result := ComCall(6, this, "ptr", resourcePackageFamilyName, "ptr", resourceID, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(PackageCatalogAddResourcePackageResult, (ptr) => IPropertyValue(ptr).GetPackageInstallProgress(), operation)
    }

    /**
     * 
     * @param {IIterable<Package>} resourcePackages 
     * @returns {IAsyncOperation<PackageCatalogRemoveResourcePackagesResult>} 
     */
    RemoveResourcePackagesAsync(resourcePackages) {
        result := ComCall(7, this, "ptr", resourcePackages, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PackageCatalogRemoveResourcePackagesResult, operation)
    }
}
