#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestPackageId.ahk
#Include .\IAppxManifestProperties.ahk
#Include .\IAppxManifestPackageDependenciesEnumerator.ahk
#Include .\IAppxManifestResourcesEnumerator.ahk
#Include .\IAppxManifestDeviceCapabilitiesEnumerator.ahk
#Include .\IAppxManifestApplicationsEnumerator.ahk
#Include ..\..\..\System\Com\IStream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents an object model of the package manifest that provides methods to access manifest elements and attributes.
 * @remarks
 * 
 * Do  not implement this object. Use the provided implementation instead.
 * 
 * This <b>IAppxManifestReader</b> object parses and validates the app package manifest and exposes elements and attributes in the manifest in a type-safe manner. This object can also be used to get an underlying <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> for the raw XML if needed.
 * 
 * <div class="alert"><b>Note</b>  Starting with Windows 8.1, we recommend not to use <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getresources">IAppxManifestReader::GetResources</a> anymore to only iterate over the <b>Language</b> values in the manifest. Instead, use <b>IAppxManifestReader2::GetResources</b> because it iterates over other resource qualifiers as well, such as, <b>Scale</b> and <b>DXFeatureLevel</b>. </div>
 * <div> </div>
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createmanifestreader">CreateManifestReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a> interface or the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getmanifest">GetManifest</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagereader">IAppxPackageReader</a> interface. In either case, the manifest is validated before returning the <b>IAppxManifestReader</b> object. If the XML is not syntactically valid, then the above mentioned methods fail, and the <b>IAppxManifestReader</b> object is not returned.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestReader
     * @type {Guid}
     */
    static IID => Guid("{4e1bd148-55a0-4480-a3d1-15544710637c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPackageId", "GetProperties", "GetPackageDependencies", "GetCapabilities", "GetResources", "GetDeviceCapabilities", "GetPrerequisite", "GetApplications", "GetStream"]

    /**
     * Gets the package identifier defined in the manifest.
     * @returns {IAppxManifestPackageId} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestpackageid">IAppxManifestPackageId</a>**</b>
     * 
     * The package identifier.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestreader-getpackageid
     */
    GetPackageId() {
        result := ComCall(3, this, "ptr*", &packageId := 0, "HRESULT")
        return IAppxManifestPackageId(packageId)
    }

    /**
     * Gets the properties of the package as defined in the manifest.
     * @returns {IAppxManifestProperties} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestproperties">IAppxManifestProperties</a>**</b>
     * 
     * Properties of the package as described by the manifest.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestreader-getproperties
     */
    GetProperties() {
        result := ComCall(4, this, "ptr*", &packageProperties := 0, "HRESULT")
        return IAppxManifestProperties(packageProperties)
    }

    /**
     * Gets an enumerator that iterates through dependencies defined in the manifest.
     * @returns {IAppxManifestPackageDependenciesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestpackagedependenciesenumerator">IAppxManifestPackageDependenciesEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the dependencies.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestreader-getpackagedependencies
     */
    GetPackageDependencies() {
        result := ComCall(5, this, "ptr*", &dependencies := 0, "HRESULT")
        return IAppxManifestPackageDependenciesEnumerator(dependencies)
    }

    /**
     * Gets the list of capabilities requested by the package.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_capabilities">APPX_CAPABILITIES</a>*</b>
     * 
     * The list of capabilities requested by the package. This is a bitwise combination of  the values of the enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestreader-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(6, this, "int*", &capabilities := 0, "HRESULT")
        return capabilities
    }

    /**
     * Gets an enumerator that iterates through the resources defined in the manifest.
     * @returns {IAppxManifestResourcesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestresourcesenumerator">IAppxManifestResourcesEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the resources.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestreader-getresources
     */
    GetResources() {
        result := ComCall(7, this, "ptr*", &resources := 0, "HRESULT")
        return IAppxManifestResourcesEnumerator(resources)
    }

    /**
     * Gets an enumerator that iterates through the device capabilities defined in the manifest.
     * @returns {IAppxManifestDeviceCapabilitiesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestdevicecapabilitiesenumerator">IAppxManifestDeviceCapabilitiesEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the device capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestreader-getdevicecapabilities
     */
    GetDeviceCapabilities() {
        result := ComCall(8, this, "ptr*", &deviceCapabilities := 0, "HRESULT")
        return IAppxManifestDeviceCapabilitiesEnumerator(deviceCapabilities)
    }

    /**
     * Gets the specified prerequisite as defined in the package manifest.
     * @param {PWSTR} name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the prerequisite, either "OSMinVersion" or "OSMaxVersionTested".
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a>*</b>
     * 
     * The specified prerequisite. In the manifest the dot-trio representation is Major.Minor.AppPlatform. This is converted to the 64-bit value as the follows:
     * The highest order word contains the Major version. The next word contains the Minor version.	The next word contains the optional AppPlatform version, if specified.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestreader-getprerequisite
     */
    GetPrerequisite(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(9, this, "ptr", name, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets an enumerator that iterates through the applications defined in the manifest.
     * @returns {IAppxManifestApplicationsEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestapplicationsenumerator">IAppxManifestApplicationsEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the applications.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestreader-getapplications
     */
    GetApplications() {
        result := ComCall(10, this, "ptr*", &applications := 0, "HRESULT")
        return IAppxManifestApplicationsEnumerator(applications)
    }

    /**
     * Gets the raw XML parsed and read by the manifest reader.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The read-only stream that represents the XML content of the manifest.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestreader-getstream
     */
    GetStream() {
        result := ComCall(11, this, "ptr*", &manifestStream := 0, "HRESULT")
        return IStream(manifestStream)
    }
}
