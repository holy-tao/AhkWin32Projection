#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to attribute values of the application.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestapplication
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestApplication extends IUnknown {
    /**
     * The interface identifier for IAppxManifestApplication
     * @type {Guid}
     */
    static IID := Guid("{5da89bf4-3773-46be-b650-7e744863b7e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestApplication interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStringValue    : IntPtr
        GetAppUserModelId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the value of a string element in the application metadata section of the manifest.
     * @remarks
     * If the *name* parameter is not a supported name of an element or attribute in the manifest, this method returns **E_INVALIDARG**. If the *name* parameter is supported but the element or attribute is not found in the manifest, this method returns **S_OK** and the return value of the *value* parameter is **NULL**.
     * 
     * The caller must free the memory allocated for *value* using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {PWSTR} name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the element or attribute value to get from the application metadata. Supported names include:
     * 
     * * AppListEntry
     * * BackgroundColor
     * * DefaultSize
     * * Description
     * * DisplayName
     * * EntryPoint
     * * Executable
     * * ForegroundText
     * * ID
     * * LockScreenLogo
     * * LockScreenNotification
     * * Logo
     * * MinWidth
     * * ShortName
     * * SmallLogo
     * * Square150x150Logo
     * * Square30x30Logo
     * * Square310x310Logo
     * * Square44x44Logo
     * * Square70x70Logo
     * * Square71x71Logo
     * * StartPage
     * * Tall150x310Logo
     * * VisualGroup
     * * WideLogo
     * * Wide310x150Logo
     * 
     * Refer to the [schema](/uwp/schemas/appxpackage/uapmanifestschema/schema-root) to determine where these values are being read from in the manifest.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The value of the requested element or attribute.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestapplication-getstringvalue
     */
    GetStringValue(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the application user model identifier.
     * @remarks
     * The caller must free the memory allocated for <i>appUserModelId</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The user model identifier.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestapplication-getappusermodelid
     */
    GetAppUserModelId() {
        result := ComCall(4, this, PWSTR.Ptr, &appUserModelId := 0, "HRESULT")
        return appUserModelId
    }

    Query(iid) {
        if (IAppxManifestApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStringValue := CallbackCreate(GetMethod(implObj, "GetStringValue"), flags, 3)
        this.vtbl.GetAppUserModelId := CallbackCreate(GetMethod(implObj, "GetAppUserModelId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStringValue)
        CallbackFree(this.vtbl.GetAppUserModelId)
    }
}
