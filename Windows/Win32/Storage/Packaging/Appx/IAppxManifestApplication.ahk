#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to attribute values of the application.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestapplication
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
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestapplication-getstringvalue
     */
    GetStringValue(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the application user model identifier.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The user model identifier.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestapplication-getappusermodelid
     */
    GetAppUserModelId() {
        result := ComCall(4, this, "ptr*", &appUserModelId := 0, "HRESULT")
        return appUserModelId
    }
}
