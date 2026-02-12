#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\PackageId.ahk
#Include ..\Storage\StorageFolder.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include .\Package.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines a package catalog which implements the OpenForPackage static method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.ipackagecatalogstatics2
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackage
     * @type {Guid}
     */
    static IID => Guid("{163c792f-bd75-413c-bf23-b1fe7b95d825}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_InstalledLocation", "get_IsFramework", "get_Dependencies"]

    /**
     * @type {PackageId} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {StorageFolder} 
     */
    InstalledLocation {
        get => this.get_InstalledLocation()
    }

    /**
     * @type {Boolean} 
     */
    IsFramework {
        get => this.get_IsFramework()
    }

    /**
     * @type {IVectorView<Package>} 
     */
    Dependencies {
        get => this.get_Dependencies()
    }

    /**
     * 
     * @returns {PackageId} 
     */
    get_Id() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageId(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_InstalledLocation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFramework() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Package>} 
     */
    get_Dependencies() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Package, value)
    }
}
