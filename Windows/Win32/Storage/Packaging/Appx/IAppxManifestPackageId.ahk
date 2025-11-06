#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the package identity.
 * @remarks
 * 
  * Package identity information is specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest.
  * 
  * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getpackageid">IAppxManifestReader::GetPackageId</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestpackageid
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestPackageId extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestPackageId
     * @type {Guid}
     */
    static IID => Guid("{283ce2d7-7153-4a91-9649-7a0f7240945f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetArchitecture", "GetPublisher", "GetVersion", "GetResourceId", "ComparePublisher", "GetPackageFullName", "GetPackageFamilyName"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getarchitecture
     */
    GetArchitecture() {
        result := ComCall(4, this, "int*", &architecture := 0, "HRESULT")
        return architecture
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getpublisher
     */
    GetPublisher() {
        result := ComCall(5, this, "ptr*", &publisher := 0, "HRESULT")
        return publisher
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion() {
        result := ComCall(6, this, "uint*", &packageVersion := 0, "HRESULT")
        return packageVersion
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getresourceid
     */
    GetResourceId() {
        result := ComCall(7, this, "ptr*", &resourceId := 0, "HRESULT")
        return resourceId
    }

    /**
     * 
     * @param {PWSTR} other 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-comparepublisher
     */
    ComparePublisher(other) {
        other := other is String ? StrPtr(other) : other

        result := ComCall(8, this, "ptr", other, "int*", &isSame := 0, "HRESULT")
        return isSame
    }

    /**
     * Gets the package full name for the specified process.
     * @returns {PWSTR} Type: <b>PWSTR</b>
     * 
     * The package full name.
     * @see https://docs.microsoft.com/windows/win32/api//appmodel/nf-appmodel-getpackagefullname
     */
    GetPackageFullName() {
        result := ComCall(9, this, "ptr*", &packageFullName := 0, "HRESULT")
        return packageFullName
    }

    /**
     * Gets the package family name for the specified process.
     * @returns {PWSTR} Type: <b>PWSTR</b>
     * 
     * The package family name.
     * @see https://docs.microsoft.com/windows/win32/api//appmodel/nf-appmodel-getpackagefamilyname
     */
    GetPackageFamilyName() {
        result := ComCall(10, this, "ptr*", &packageFamilyName := 0, "HRESULT")
        return packageFamilyName
    }
}
