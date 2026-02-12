#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NetworkOperatorNotificationTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class INetworkOperatorNotificationTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkOperatorNotificationTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{0a223e00-27d7-4353-adb9-9265aaea579d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} networkAccountId 
     * @returns {NetworkOperatorNotificationTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(networkAccountId) {
        if(networkAccountId is String) {
            pin := HSTRING.Create(networkAccountId)
            networkAccountId := pin.Value
        }
        networkAccountId := networkAccountId is Win32Handle ? NumGet(networkAccountId, "ptr") : networkAccountId

        result := ComCall(6, this, "ptr", networkAccountId, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkOperatorNotificationTrigger(trigger)
    }
}
