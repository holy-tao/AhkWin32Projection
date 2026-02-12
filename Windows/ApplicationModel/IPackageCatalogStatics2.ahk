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
class IPackageCatalogStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageCatalogStatics2
     * @type {Guid}
     */
    static IID => Guid("{4c11c159-9a28-598c-b185-55e1899b2be4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenForPackage"]

    /**
     * Allows listening to any **Package** and its dependents (optional, resource, and hostRuntime).
     * @param {Package} package_ The **Package** which will be monitored for notifications.
     * @returns {PackageCatalog} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.ipackagecatalogstatics2.openforpackage
     */
    OpenForPackage(package_) {
        result := ComCall(6, this, "ptr", package_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageCatalog(result_)
    }
}
