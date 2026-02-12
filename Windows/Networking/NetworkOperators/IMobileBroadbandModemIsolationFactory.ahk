#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MobileBroadbandModemIsolation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandModemIsolationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandModemIsolationFactory
     * @type {Guid}
     */
    static IID => Guid("{21d7ec58-c2b1-4c2f-a030-72820a24ecd9}")

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
     * @param {HSTRING} modemDeviceId 
     * @param {HSTRING} ruleGroupId 
     * @returns {MobileBroadbandModemIsolation} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(modemDeviceId, ruleGroupId) {
        if(modemDeviceId is String) {
            pin := HSTRING.Create(modemDeviceId)
            modemDeviceId := pin.Value
        }
        modemDeviceId := modemDeviceId is Win32Handle ? NumGet(modemDeviceId, "ptr") : modemDeviceId
        if(ruleGroupId is String) {
            pin := HSTRING.Create(ruleGroupId)
            ruleGroupId := pin.Value
        }
        ruleGroupId := ruleGroupId is Win32Handle ? NumGet(ruleGroupId, "ptr") : ruleGroupId

        result := ComCall(6, this, "ptr", modemDeviceId, "ptr", ruleGroupId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandModemIsolation(result_)
    }
}
