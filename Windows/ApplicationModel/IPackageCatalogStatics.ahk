#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\PackageCatalog.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines a package catalog which implements the OpenForPackage static method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.ipackagecatalogstatics2
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackageCatalogStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageCatalogStatics
     * @type {Guid}
     */
    static IID => Guid("{a18c9696-e65b-4634-ba21-5e63eb7244a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenForCurrentPackage", "OpenForCurrentUser"]

    /**
     * 
     * @returns {PackageCatalog} 
     */
    OpenForCurrentPackage() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageCatalog(value)
    }

    /**
     * 
     * @returns {PackageCatalog} 
     */
    OpenForCurrentUser() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageCatalog(value)
    }
}
