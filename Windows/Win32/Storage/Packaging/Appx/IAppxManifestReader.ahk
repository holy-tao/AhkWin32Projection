#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxManifestResourcesEnumerator.ahk" { IAppxManifestResourcesEnumerator }
#Import ".\IAppxManifestPackageId.ahk" { IAppxManifestPackageId }
#Import ".\IAppxManifestApplicationsEnumerator.ahk" { IAppxManifestApplicationsEnumerator }
#Import ".\IAppxManifestProperties.ahk" { IAppxManifestProperties }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\APPX_CAPABILITIES.ahk" { APPX_CAPABILITIES }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAppxManifestPackageDependenciesEnumerator.ahk" { IAppxManifestPackageDependenciesEnumerator }
#Import ".\IAppxManifestDeviceCapabilitiesEnumerator.ahk" { IAppxManifestDeviceCapabilitiesEnumerator }

/**
 * Represents an object model of the package manifest that provides methods to access manifest elements and attributes. (IAppxManifestReader)
 * @remarks
 * Do  not implement this object. Use the provided implementation instead.
 * 
 * This <b>IAppxManifestReader</b> object parses and validates the app package manifest and exposes elements and attributes in the manifest in a type-safe manner. This object can also be used to get an underlying <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> for the raw XML if needed.
 * 
 * <div class="alert"><b>Note</b>  Starting with Windows 8.1, we recommend not to use <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getresources">IAppxManifestReader::GetResources</a> anymore to only iterate over the <b>Language</b> values in the manifest. Instead, use <b>IAppxManifestReader2::GetResources</b> because it iterates over other resource qualifiers as well, such as, <b>Scale</b> and <b>DXFeatureLevel</b>. </div>
 * <div> </div>
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createmanifestreader">CreateManifestReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a> interface or the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getmanifest">GetManifest</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagereader">IAppxPackageReader</a> interface. In either case, the manifest is validated before returning the <b>IAppxManifestReader</b> object. If the XML is not syntactically valid, then the above mentioned methods fail, and the <b>IAppxManifestReader</b> object is not returned.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestReader extends IUnknown {
    /**
     * The interface identifier for IAppxManifestReader
     * @type {Guid}
     */
    static IID := Guid("{4e1bd148-55a0-4480-a3d1-15544710637c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPackageId           : IntPtr
        GetProperties          : IntPtr
        GetPackageDependencies : IntPtr
        GetCapabilities        : IntPtr
        GetResources           : IntPtr
        GetDeviceCapabilities  : IntPtr
        GetPrerequisite        : IntPtr
        GetApplications        : IntPtr
        GetStream              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the package identifier defined in the manifest.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method when you have finished using the <i>packageId</i> object.
     * @returns {IAppxManifestPackageId} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestpackageid">IAppxManifestPackageId</a>**</b>
     * 
     * The package identifier.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getpackageid
     */
    GetPackageId() {
        result := ComCall(3, this, "ptr*", &packageId := 0, "HRESULT")
        return IAppxManifestPackageId(packageId)
    }

    /**
     * Gets the properties of the package as defined in the manifest.
     * @remarks
     * Properties are specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-properties">Properties</a> element in the manifest.
     * @returns {IAppxManifestProperties} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestproperties">IAppxManifestProperties</a>**</b>
     * 
     * Properties of the package as described by the manifest.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getproperties
     */
    GetProperties() {
        result := ComCall(4, this, "ptr*", &packageProperties := 0, "HRESULT")
        return IAppxManifestProperties(packageProperties)
    }

    /**
     * Gets an enumerator that iterates through dependencies defined in the manifest.
     * @remarks
     * If no package dependencies are found in the manifest, this method returns <b>S_OK</b> with an empty enumerator.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method when you have finished using the <i>dependencies</i> object.
     * @returns {IAppxManifestPackageDependenciesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestpackagedependenciesenumerator">IAppxManifestPackageDependenciesEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the dependencies.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getpackagedependencies
     */
    GetPackageDependencies() {
        result := ComCall(5, this, "ptr*", &dependencies := 0, "HRESULT")
        return IAppxManifestPackageDependenciesEnumerator(dependencies)
    }

    /**
     * Gets the list of capabilities requested by the package.
     * @remarks
     * Capabilities are specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-capability">Capability</a> element in the package manifest.
     * 
     * If no package capabilities are defined in the manifest, this method returns <b>S_OK</b> with a zero value.
     * @returns {APPX_CAPABILITIES} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_capabilities">APPX_CAPABILITIES</a>*</b>
     * 
     * The list of capabilities requested by the package. This is a bitwise combination of  the values of the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(6, this, "int*", &capabilities := 0, "HRESULT")
        return capabilities
    }

    /**
     * Gets an enumerator that iterates through the resources defined in the manifest.
     * @remarks
     * Resources are specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-resources">Resources</a> element in the manifest.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method when you have finished using the <i>resources</i> object.
     * @returns {IAppxManifestResourcesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestresourcesenumerator">IAppxManifestResourcesEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the resources.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getresources
     */
    GetResources() {
        result := ComCall(7, this, "ptr*", &resources := 0, "HRESULT")
        return IAppxManifestResourcesEnumerator(resources)
    }

    /**
     * Gets an enumerator that iterates through the device capabilities defined in the manifest.
     * @remarks
     * Device capabilities are specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-devicecapability">DeviceCapability</a> element in the package manifest.
     * 
     * If no package device capabilities are defined in the manifest, this method returns <b>S_OK</b> with an empty enumerator.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method when you have finished using the <i>deviceCapabilities</i> object.
     * @returns {IAppxManifestDeviceCapabilitiesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestdevicecapabilitiesenumerator">IAppxManifestDeviceCapabilitiesEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the device capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getdevicecapabilities
     */
    GetDeviceCapabilities() {
        result := ComCall(8, this, "ptr*", &deviceCapabilities := 0, "HRESULT")
        return IAppxManifestDeviceCapabilitiesEnumerator(deviceCapabilities)
    }

    /**
     * Gets the specified prerequisite as defined in the package manifest.
     * @remarks
     * Prerequisites are specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-osminversion">OSMinVersion</a> and <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-osmaxversiontested">OSMaxVersionTested</a> elements in the package manifest.
     * @param {PWSTR} name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the prerequisite, either "OSMinVersion" or "OSMaxVersionTested".
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a>*</b>
     * 
     * The specified prerequisite. In the manifest the dot-trio representation is Major.Minor.AppPlatform. This is converted to the 64-bit value as the follows:
     * The highest order word contains the Major version. The next word contains the Minor version.	The next word contains the optional AppPlatform version, if specified.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getprerequisite
     */
    GetPrerequisite(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(9, this, "ptr", name, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets an enumerator that iterates through the applications defined in the manifest.
     * @remarks
     * If no applications are defined in the manifest, this method returns <b>S_OK</b> with an empty <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestapplicationsenumerator">IAppxManifestApplicationsEnumerator</a> object.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method when you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestreader">IAppxManifestReader</a> object.
     * @returns {IAppxManifestApplicationsEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestapplicationsenumerator">IAppxManifestApplicationsEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the applications.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getapplications
     */
    GetApplications() {
        result := ComCall(10, this, "ptr*", &applications := 0, "HRESULT")
        return IAppxManifestApplicationsEnumerator(applications)
    }

    /**
     * Gets the raw XML parsed and read by the manifest reader.
     * @remarks
     * The raw XML stream is the entire source stream, and may contain elements and attributes in other namespaces that are ignored by the manifest reader.  For example, the XML stream may have elements in other namespaces that were marked in the <b>IgnorableNamespaces</b> attribute in the <b>Package</b> element, which were not validated. Therefore, you should consider this XML as untrusted. 
     * 
     * It is recommended that you use the packaging API to get information from the manifest, rather than parsing the raw XML.
     * 
     * If you parse the XML, you must include XML data validation and XML security testing.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method when you have finished using the <i>manifestStream</i> object.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The read-only stream that represents the XML content of the manifest.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getstream
     */
    GetStream() {
        result := ComCall(11, this, "ptr*", &manifestStream := 0, "HRESULT")
        return IStream(manifestStream)
    }

    Query(iid) {
        if (IAppxManifestReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPackageId := CallbackCreate(GetMethod(implObj, "GetPackageId"), flags, 2)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.GetPackageDependencies := CallbackCreate(GetMethod(implObj, "GetPackageDependencies"), flags, 2)
        this.vtbl.GetCapabilities := CallbackCreate(GetMethod(implObj, "GetCapabilities"), flags, 2)
        this.vtbl.GetResources := CallbackCreate(GetMethod(implObj, "GetResources"), flags, 2)
        this.vtbl.GetDeviceCapabilities := CallbackCreate(GetMethod(implObj, "GetDeviceCapabilities"), flags, 2)
        this.vtbl.GetPrerequisite := CallbackCreate(GetMethod(implObj, "GetPrerequisite"), flags, 3)
        this.vtbl.GetApplications := CallbackCreate(GetMethod(implObj, "GetApplications"), flags, 2)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPackageId)
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetPackageDependencies)
        CallbackFree(this.vtbl.GetCapabilities)
        CallbackFree(this.vtbl.GetResources)
        CallbackFree(this.vtbl.GetDeviceCapabilities)
        CallbackFree(this.vtbl.GetPrerequisite)
        CallbackFree(this.vtbl.GetApplications)
        CallbackFree(this.vtbl.GetStream)
    }
}
