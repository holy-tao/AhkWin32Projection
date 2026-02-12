#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\AppInfo.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides an interface definition for the [AppInfo](appinfo.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.iappinfostatics
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IAppInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{cf1f782a-e48b-4f0c-9b0b-79c3f8957dd7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "GetFromAppUserModelId", "GetFromAppUserModelIdForUser"]

    /**
     * Provides an interface definition for the [AppInfo.Current](appinfo_current.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.iappinfostatics.current
     * @type {AppInfo} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppInfo(value)
    }

    /**
     * Provides an interface definition for the [AppInfo.GetFromAppUserModelId](appinfo_getfromappusermodelid_491110690.md) method.
     * @param {HSTRING} appUserModelId The AUMID to retrieve the AppInfo from.
     * @returns {AppInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.iappinfostatics.getfromappusermodelid
     */
    GetFromAppUserModelId(appUserModelId) {
        if(appUserModelId is String) {
            pin := HSTRING.Create(appUserModelId)
            appUserModelId := pin.Value
        }
        appUserModelId := appUserModelId is Win32Handle ? NumGet(appUserModelId, "ptr") : appUserModelId

        result := ComCall(7, this, "ptr", appUserModelId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppInfo(result_)
    }

    /**
     * Provides an interface definition for the [AppInfo.GetFromAppUserModelIdForUser](appinfo_getfromappusermodelidforuser_807432373.md) method.
     * @param {User} user_ The User whose AppInfos you wish to access.
     * @param {HSTRING} appUserModelId The AUMID to retrieve the AppInfo from.
     * @returns {AppInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.iappinfostatics.getfromappusermodelidforuser
     */
    GetFromAppUserModelIdForUser(user_, appUserModelId) {
        if(appUserModelId is String) {
            pin := HSTRING.Create(appUserModelId)
            appUserModelId := pin.Value
        }
        appUserModelId := appUserModelId is Win32Handle ? NumGet(appUserModelId, "ptr") : appUserModelId

        result := ComCall(8, this, "ptr", user_, "ptr", appUserModelId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppInfo(result_)
    }
}
