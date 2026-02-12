#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UserActivity.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityStatics
     * @type {Guid}
     */
    static IID => Guid("{8c8fd333-0e09-47f6-9ac7-95cf5c39367b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryParseFromJson", "TryParseFromJsonArray", "ToJsonArray"]

    /**
     * 
     * @param {HSTRING} json 
     * @returns {UserActivity} 
     */
    TryParseFromJson(json) {
        if(json is String) {
            pin := HSTRING.Create(json)
            json := pin.Value
        }
        json := json is Win32Handle ? NumGet(json, "ptr") : json

        result := ComCall(6, this, "ptr", json, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserActivity(result_)
    }

    /**
     * 
     * @param {HSTRING} json 
     * @returns {IVector<UserActivity>} 
     */
    TryParseFromJsonArray(json) {
        if(json is String) {
            pin := HSTRING.Create(json)
            json := pin.Value
        }
        json := json is Win32Handle ? NumGet(json, "ptr") : json

        result := ComCall(7, this, "ptr", json, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(UserActivity, result_)
    }

    /**
     * 
     * @param {IIterable<UserActivity>} activities 
     * @returns {HSTRING} 
     */
    ToJsonArray(activities) {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", activities, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
