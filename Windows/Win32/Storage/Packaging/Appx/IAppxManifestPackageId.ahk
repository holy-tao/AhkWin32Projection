#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the package identity.
 * @remarks
 * Package identity information is specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest.
 * 
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getpackageid">IAppxManifestReader::GetPackageId</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestpackageid
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
     * Gets the name of the package as defined in the manifest.
     * @remarks
     * Package name information is specified using the <b>Name</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest.
     * 
     * The package name is not intended to be displayed to end users. Rather, the system uses it to uniquely identify the package.
     * 
     * The caller must free the memory allocated for <i>name</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The name of the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * Gets the processor architecture as defined in the manifest. (IAppxManifestPackageId.GetArchitecture)
     * @remarks
     * Processor architecture information is specified using the <b>ProcessorArchitecture</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest.
     * 
     * If no architecture is defined in the manifest, this method returns the <b>APPX_PACKAGE_ARCHITECTURE_NEUTRAL</b> value of the  <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_package_architecture">APPX_PACKAGE_ARCHITECTURE</a> enumeration.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_package_architecture">APPX_PACKAGE_ARCHITECTURE</a>*</b>
     * 
     * The architecture specified for the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getarchitecture
     */
    GetArchitecture() {
        result := ComCall(4, this, "int*", &architecture := 0, "HRESULT")
        return architecture
    }

    /**
     * Gets the name of the package publisher as defined in the manifest.
     * @remarks
     * Publisher name information is specified using the <b>Publisher</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest.
     * 
     * The caller must free the memory allocated for <i>publisher</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The publisher of the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getpublisher
     */
    GetPublisher() {
        result := ComCall(5, this, "ptr*", &publisher := 0, "HRESULT")
        return publisher
    }

    /**
     * Gets the version of the package as defined in the manifest.
     * @remarks
     * The version is specified using the <b>Version</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest. The specification in the manifest is in quad notation:
     * 
     * <i>major</i>.<i>minor</i>.<i>build</i>.<i>revision</i>
     * 
     * This method converts this notation to a <b>UINT64</b> value as follows:
     * 
     * <ul>
     * <li>The high-order word contains the major version</li>
     * <li>The next word contains the minor version</li>
     * <li>The next word contains the build number</li>
     * <li>The low-order word contains the revision</li>
     * </ul>
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a>*</b>
     * 
     * The version of the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getversion
     */
    GetVersion() {
        result := ComCall(6, this, "uint*", &packageVersion := 0, "HRESULT")
        return packageVersion
    }

    /**
     * Gets the package resource identifier as defined in the manifest.
     * @remarks
     * The resource identifier is specified using the <b>ResourceId</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest.
     * 
     * If no resource identifier is defined in the manifest, this method returns a null string.
     * 
     * The caller must free the memory allocated for <i>resourceId</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The resource identifier of the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getresourceid
     */
    GetResourceId() {
        result := ComCall(7, this, "ptr*", &resourceId := 0, "HRESULT")
        return resourceId
    }

    /**
     * Compares the specified publisher with the publisher defined in the manifest.
     * @remarks
     * Publisher information is specified using the <b>Publisher</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest.
     * @param {PWSTR} other Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The publisher name to be compared.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the specified publisher matches the package publisher; <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-comparepublisher
     */
    ComparePublisher(other) {
        other := other is String ? StrPtr(other) : other

        result := ComCall(8, this, "ptr", other, "int*", &isSame := 0, "HRESULT")
        return isSame
    }

    /**
     * Gets the package full name.
     * @remarks
     * The package full name string is a case-insensitive string, which can be used to uniquely identify the package. 
     * 
     * This string  is a serialized form of the package ID, and it is suitable for naming objects such as files and directories.
     * 
     * The caller must free the memory allocated for <i>packageFullName</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The package full name.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getpackagefullname
     */
    GetPackageFullName() {
        result := ComCall(9, this, "ptr*", &packageFullName := 0, "HRESULT")
        return packageFullName
    }

    /**
     * Gets the package family name.
     * @remarks
     * The package family name is a case-insensitive string, which can be used to uniquely identify a family of packages with the same name and publisher. 
     * 
     * This string is a serialized form of the package ID, and it is suitable for naming objects such as files and directories. Because the package family name does not contain information about package version, architecture, or resources, it is useful when you need a version-independent reference to a package.
     * 
     * The caller must free the memory for <i>packageFamilyName</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The package family name.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getpackagefamilyname
     */
    GetPackageFamilyName() {
        result := ComCall(10, this, "ptr*", &packageFamilyName := 0, "HRESULT")
        return packageFamilyName
    }
}
