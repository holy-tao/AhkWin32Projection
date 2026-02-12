#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UserActivity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityFactory
     * @type {Guid}
     */
    static IID => Guid("{7c385758-361d-4a67-8a3b-34ca2978f9a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithActivityId"]

    /**
     * 
     * @param {HSTRING} activityId 
     * @returns {UserActivity} 
     */
    CreateWithActivityId(activityId) {
        if(activityId is String) {
            pin := HSTRING.Create(activityId)
            activityId := pin.Value
        }
        activityId := activityId is Win32Handle ? NumGet(activityId, "ptr") : activityId

        result := ComCall(6, this, "ptr", activityId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserActivity(value)
    }
}
