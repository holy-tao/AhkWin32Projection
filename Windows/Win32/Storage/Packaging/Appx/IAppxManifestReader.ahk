#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * Gets the package identifier (ID) for the specified process.
     * @param {Pointer<IAppxManifestPackageId>} packageId 
     * @returns {HRESULT} Type: <b>LONG</b>
     * 
     * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process has no package identity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//appmodel/nf-appmodel-getpackageid
     */
    GetPackageId(packageId) {
        result := ComCall(3, this, "ptr", packageId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestProperties>} packageProperties 
     * @returns {HRESULT} 
     */
    GetProperties(packageProperties) {
        result := ComCall(4, this, "ptr", packageProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestPackageDependenciesEnumerator>} dependencies 
     * @returns {HRESULT} 
     */
    GetPackageDependencies(dependencies) {
        result := ComCall(5, this, "ptr", dependencies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} capabilities 
     * @returns {HRESULT} 
     */
    GetCapabilities(capabilities) {
        result := ComCall(6, this, "int*", capabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestResourcesEnumerator>} resources 
     * @returns {HRESULT} 
     */
    GetResources(resources) {
        result := ComCall(7, this, "ptr", resources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestDeviceCapabilitiesEnumerator>} deviceCapabilities 
     * @returns {HRESULT} 
     */
    GetDeviceCapabilities(deviceCapabilities) {
        result := ComCall(8, this, "ptr", deviceCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<UInt64>} value 
     * @returns {HRESULT} 
     */
    GetPrerequisite(name, value) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(9, this, "ptr", name, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestApplicationsEnumerator>} applications 
     * @returns {HRESULT} 
     */
    GetApplications(applications) {
        result := ComCall(10, this, "ptr", applications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} manifestStream 
     * @returns {HRESULT} 
     */
    GetStream(manifestStream) {
        result := ComCall(11, this, "ptr", manifestStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
