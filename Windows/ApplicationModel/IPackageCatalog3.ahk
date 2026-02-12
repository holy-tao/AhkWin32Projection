#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\PackageCatalogRemoveOptionalPackagesResult.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackageCatalog3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageCatalog3
     * @type {Guid}
     */
    static IID => Guid("{96dd5c88-8837-43f9-9015-033434ba14f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemoveOptionalPackagesAsync"]

    /**
     * 
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @returns {IAsyncOperation<PackageCatalogRemoveOptionalPackagesResult>} 
     */
    RemoveOptionalPackagesAsync(optionalPackageFamilyNames) {
        result := ComCall(6, this, "ptr", optionalPackageFamilyNames, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PackageCatalogRemoveOptionalPackagesResult, operation)
    }
}
