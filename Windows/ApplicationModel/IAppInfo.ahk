#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppDisplayInfo.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides an interface definition for the [AppInfo](appinfo.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.iappinfostatics
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IAppInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInfo
     * @type {Guid}
     */
    static IID => Guid("{cf7f59b3-6a09-4de8-a6c0-5792d56880d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_AppUserModelId", "get_DisplayInfo", "get_PackageFamilyName"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * @type {AppDisplayInfo} 
     */
    DisplayInfo {
        get => this.get_DisplayInfo()
    }

    /**
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppDisplayInfo} 
     */
    get_DisplayInfo() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppDisplayInfo(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
