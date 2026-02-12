#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmsFilterRule.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsFilterRuleFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsFilterRuleFactory
     * @type {Guid}
     */
    static IID => Guid("{00c36508-6296-4f29-9aad-8920ceba3ce8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFilterRule"]

    /**
     * 
     * @param {Integer} messageType 
     * @returns {SmsFilterRule} 
     */
    CreateFilterRule(messageType) {
        result := ComCall(6, this, "int", messageType, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsFilterRule(value)
    }
}
