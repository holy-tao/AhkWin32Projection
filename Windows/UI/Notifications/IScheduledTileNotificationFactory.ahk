#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ScheduledTileNotification.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IScheduledTileNotificationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScheduledTileNotificationFactory
     * @type {Guid}
     */
    static IID => Guid("{3383138a-98c0-4c3b-bbd6-4a633c7cfc29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateScheduledTileNotification"]

    /**
     * 
     * @param {XmlDocument} content 
     * @param {DateTime} deliveryTime 
     * @returns {ScheduledTileNotification} 
     */
    CreateScheduledTileNotification(content, deliveryTime) {
        result := ComCall(6, this, "ptr", content, "ptr", deliveryTime, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScheduledTileNotification(value)
    }
}
