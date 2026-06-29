#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPX_PACKAGE_ARCHITECTURE.ahk" { APPX_PACKAGE_ARCHITECTURE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the package identity.
 * @remarks
 * Package identity information is specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest.
 * 
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getpackageid">IAppxManifestReader::GetPackageId</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestpackageid
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestPackageId extends IUnknown {
    /**
     * The interface identifier for IAppxManifestPackageId
     * @type {Guid}
     */
    static IID := Guid("{283ce2d7-7153-4a91-9649-7a0f7240945f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestPackageId interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName              : IntPtr
        GetArchitecture      : IntPtr
        GetPublisher         : IntPtr
        GetVersion           : IntPtr
        GetResourceId        : IntPtr
        ComparePublisher     : IntPtr
        GetPackageFullName   : IntPtr
        GetPackageFamilyName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestPackageId.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(3, this, PWSTR.Ptr, &name := 0, "HRESULT")
        return name
    }

    /**
     * Gets the processor architecture as defined in the manifest. (IAppxManifestPackageId.GetArchitecture)
     * @remarks
     * Processor architecture information is specified using the <b>ProcessorArchitecture</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-identity">Identity</a> element in the package manifest.
     * 
     * If no architecture is defined in the manifest, this method returns the <b>APPX_PACKAGE_ARCHITECTURE_NEUTRAL</b> value of the  <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_package_architecture">APPX_PACKAGE_ARCHITECTURE</a> enumeration.
     * @returns {APPX_PACKAGE_ARCHITECTURE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_package_architecture">APPX_PACKAGE_ARCHITECTURE</a>*</b>
     * 
     * The architecture specified for the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid-getarchitecture
     */
    GetArchitecture() {
        result := ComCall(4, this, "int*", &_architecture := 0, "HRESULT")
        return _architecture
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
        result := ComCall(5, this, PWSTR.Ptr, &publisher := 0, "HRESULT")
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
        result := ComCall(7, this, PWSTR.Ptr, &resourceId := 0, "HRESULT")
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

        result := ComCall(8, this, "ptr", other, BOOL.Ptr, &isSame := 0, "HRESULT")
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
        result := ComCall(9, this, PWSTR.Ptr, &packageFullName := 0, "HRESULT")
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
        result := ComCall(10, this, PWSTR.Ptr, &packageFamilyName := 0, "HRESULT")
        return packageFamilyName
    }

    Query(iid) {
        if (IAppxManifestPackageId.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetArchitecture := CallbackCreate(GetMethod(implObj, "GetArchitecture"), flags, 2)
        this.vtbl.GetPublisher := CallbackCreate(GetMethod(implObj, "GetPublisher"), flags, 2)
        this.vtbl.GetVersion := CallbackCreate(GetMethod(implObj, "GetVersion"), flags, 2)
        this.vtbl.GetResourceId := CallbackCreate(GetMethod(implObj, "GetResourceId"), flags, 2)
        this.vtbl.ComparePublisher := CallbackCreate(GetMethod(implObj, "ComparePublisher"), flags, 3)
        this.vtbl.GetPackageFullName := CallbackCreate(GetMethod(implObj, "GetPackageFullName"), flags, 2)
        this.vtbl.GetPackageFamilyName := CallbackCreate(GetMethod(implObj, "GetPackageFamilyName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetArchitecture)
        CallbackFree(this.vtbl.GetPublisher)
        CallbackFree(this.vtbl.GetVersion)
        CallbackFree(this.vtbl.GetResourceId)
        CallbackFree(this.vtbl.ComparePublisher)
        CallbackFree(this.vtbl.GetPackageFullName)
        CallbackFree(this.vtbl.GetPackageFamilyName)
    }
}
