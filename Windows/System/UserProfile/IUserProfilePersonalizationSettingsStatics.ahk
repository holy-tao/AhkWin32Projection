#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UserProfilePersonalizationSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class IUserProfilePersonalizationSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserProfilePersonalizationSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{91acb841-5037-454b-9883-bb772d08dd16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "IsSupported"]

    /**
     * @type {UserProfilePersonalizationSettings} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {UserProfilePersonalizationSettings} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserProfilePersonalizationSettings(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsSupported() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
