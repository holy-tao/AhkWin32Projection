#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TileFlyoutNotification.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ITileFlyoutNotificationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITileFlyoutNotificationFactory
     * @type {Guid}
     */
    static IID => Guid("{ef556ff5-5226-4f2b-b278-88a35dfe569f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTileFlyoutNotification"]

    /**
     * 
     * @param {XmlDocument} content 
     * @returns {TileFlyoutNotification} 
     */
    CreateTileFlyoutNotification(content) {
        result := ComCall(6, this, "ptr", content, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileFlyoutNotification(value)
    }
}
