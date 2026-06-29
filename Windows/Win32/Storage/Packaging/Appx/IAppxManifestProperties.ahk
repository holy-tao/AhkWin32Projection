#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides read-only access to the properties section of a package manifest.
 * @remarks
 * The properties section of the manifest is defined using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-properties">Properties</a> element.
 * 
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getproperties">IAppxManifestReader::GetProperties</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestproperties
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestProperties extends IUnknown {
    /**
     * The interface identifier for IAppxManifestProperties
     * @type {Guid}
     */
    static IID := Guid("{03faf64d-f26f-4b2c-aaf7-8fe7789b8bca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBoolValue   : IntPtr
        GetStringValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the value of the specified Boolean element in the properties section.
     * @remarks
     * If a valid Boolean property with this name is not defined in the manifest, this method  returns <b>E_INVALIDARG</b> and <i>value</i> is <b>FALSE</b>.
     * @param {PWSTR} name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the Boolean element. Valid values include:
     * 
     * <p class="indent">"Framework"
     * 
     * <p class="indent">"ResourcePackage" for Windows 8.1 and later
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * The value of the specified Boolean element.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestproperties-getboolvalue
     */
    GetBoolValue(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the value of the specified string element in the properties section.
     * @remarks
     * If a valid string property with this name is not defined in the manifest, this method  returns <b>E_INVALIDARG</b> and  <i>value</i> receives a null string.
     * 
     * The caller must free the memory allocated for <i>value</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {PWSTR} name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the string element. Valid values include:
     * 
     * <p class="indent">"Description"
     * 
     * <p class="indent">"DisplayName"
     * 
     * <p class="indent">"Logo"
     * 
     * <p class="indent">"PublisherDisplayName"
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The value of the specified element.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestproperties-getstringvalue
     */
    GetStringValue(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "ptr", name, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IAppxManifestProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBoolValue := CallbackCreate(GetMethod(implObj, "GetBoolValue"), flags, 3)
        this.vtbl.GetStringValue := CallbackCreate(GetMethod(implObj, "GetStringValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBoolValue)
        CallbackFree(this.vtbl.GetStringValue)
    }
}
