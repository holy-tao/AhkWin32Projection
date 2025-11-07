#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to attribute values of the main package dependency.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestmainpackagedependency
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
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getpublisher
     */
    GetPublisher() {
        result := ComCall(4, this, "ptr*", &publisher := 0, "HRESULT")
        return publisher
    }

    /**
     * Gets the package family name for the specified process.
     * @returns {PWSTR} Type: <b>PWSTR</b>
     * 
     * The package family name.
     * @see https://docs.microsoft.com/windows/win32/api//appmodel/nf-appmodel-getpackagefamilyname
     */
    GetPackageFamilyName() {
        result := ComCall(5, this, "ptr*", &packageFamilyName := 0, "HRESULT")
        return packageFamilyName
    }
}
