#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes the dependency of one package on another package. (IAppxManifestPackageDependency)
 * @remarks
 * A dependency package is a package that the current package depends on, as specified in the package manifest using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-packagedependency">PackageDependency</a> element.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestpackagedependency
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestPackageDependency extends IUnknown {
    /**
     * The interface identifier for IAppxManifestPackageDependency
     * @type {Guid}
     */
    static IID := Guid("{e4946b59-733e-43f0-a724-3bde4c1285a0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestPackageDependency interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName       : IntPtr
        GetPublisher  : IntPtr
        GetMinVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestPackageDependency.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(3, this, PWSTR.Ptr, &name := 0, "HRESULT")
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
        result := ComCall(4, this, PWSTR.Ptr, &publisher := 0, "HRESULT")
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

    Query(iid) {
        if (IAppxManifestPackageDependency.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetPublisher := CallbackCreate(GetMethod(implObj, "GetPublisher"), flags, 2)
        this.vtbl.GetMinVersion := CallbackCreate(GetMethod(implObj, "GetMinVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetPublisher)
        CallbackFree(this.vtbl.GetMinVersion)
    }
}
