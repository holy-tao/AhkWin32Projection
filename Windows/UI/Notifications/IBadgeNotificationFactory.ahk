#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BadgeNotification.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IBadgeNotificationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBadgeNotificationFactory
     * @type {Guid}
     */
    static IID => Guid("{edf255ce-0618-4d59-948a-5a61040c52f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBadgeNotification"]

    /**
     * 
     * @param {XmlDocument} content 
     * @returns {BadgeNotification} 
     */
    CreateBadgeNotification(content) {
        result := ComCall(6, this, "ptr", content, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BadgeNotification(value)
    }
}
