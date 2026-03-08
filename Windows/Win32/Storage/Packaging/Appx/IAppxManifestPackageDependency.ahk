#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Describes the dependency of one package on another package. (IAppxManifestPackageDependency)
 * @remarks
 * A dependency package is a package that the current package depends on, as specified in the package manifest using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-packagedependency">PackageDependency</a> element.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestpackagedependency
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestPackageDependency extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestPackageDependency
     * @type {Guid}
     */
    static IID => Guid("{e4946b59-733e-43f0-a724-3bde4c1285a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetPublisher", "GetMinVersion"]

    /**
     * Gets the name of the package on which the current package has a dependency.
     * @remarks
     * The caller must free the memory allocated for <i>name</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The name of the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackagedependency-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * Gets the name of the publisher that produced the package on which the current package depends.
     * @remarks
     * If the publisher is not defined for the dependency, this method returns <b>S_OK</b>, and <i>publisher</i> is <b>NULL</b>.
     * 
     * The caller must free the memory allocated for <i>publisher</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The name of the publisher.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackagedependency-getpublisher
     */
    GetPublisher() {
        result := ComCall(4, this, "ptr*", &publisher := 0, "HRESULT")
        return publisher
    }

    /**
     * Gets the minimum version of the package on which the current package has a dependency.
     * @remarks
     * If the minimum version is not defined for the dependency, this method returns <b>S_OK</b> and <i>minVersion</i> is 0.
     * 
     * The version is specified using the <b>MinVersion</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-packagedependency">PackageDependency</a> element in the package manifest. The specification in the manifest is in quad notation:
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
     * The minimum version of the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackagedependency-getminversion
     */
    GetMinVersion() {
        result := ComCall(5, this, "uint*", &minVersion := 0, "HRESULT")
        return minVersion
    }
}
