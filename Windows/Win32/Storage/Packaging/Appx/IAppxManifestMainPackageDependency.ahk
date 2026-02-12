#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to attribute values of the main package dependency.
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxmanifestmainpackagedependency
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestMainPackageDependency extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestMainPackageDependency
     * @type {Guid}
     */
    static IID => Guid("{05d0611c-bc29-46d5-97e2-84b9c79bd8ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetPublisher", "GetPackageFamilyName"]

    /**
     * Gets the name of the main package dependency from the AppxManifest.xml.
     * @returns {PWSTR} The name of the main package dependency.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }

    /**
     * Gets the publisher of the main package dependency from the AppxManifest.xml.
     * @returns {PWSTR} The publisher of the main package dependency.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getpublisher
     */
    GetPublisher() {
        result := ComCall(4, this, "ptr*", &publisher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return publisher
    }

    /**
     * Gets the package family name of the main package dependency from the AppxManifest.xml.
     * @returns {PWSTR} The package family name of the main package dependency.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getpackagefamilyname
     */
    GetPackageFamilyName() {
        result := ComCall(5, this, "ptr*", &packageFamilyName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return packageFamilyName
    }
}
