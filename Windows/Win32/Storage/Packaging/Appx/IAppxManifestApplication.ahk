#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to attribute values of the application.
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxmanifestapplication
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestApplication extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestApplication
     * @type {Guid}
     */
    static IID => Guid("{5da89bf4-3773-46be-b650-7e744863b7e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStringValue", "GetAppUserModelId"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxmanifestapplication-getstringvalue
     */
    GetStringValue(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the application user model identifier.
     * @remarks
     * The caller must free the memory allocated for <i>appUserModelId</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The user model identifier.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxmanifestapplication-getappusermodelid
     */
    GetAppUserModelId() {
        result := ComCall(4, this, "ptr*", &appUserModelId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return appUserModelId
    }
}
