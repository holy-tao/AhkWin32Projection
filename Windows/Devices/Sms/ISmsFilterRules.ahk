#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\SmsFilterRule.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsFilterRules extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsFilterRules
     * @type {Guid}
     */
    static IID => Guid("{4e47eafb-79cd-4881-9894-55a4135b23fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActionType", "get_Rules"]

    /**
     * @type {Integer} 
     */
    ActionType {
        get => this.get_ActionType()
    }

    /**
     * @type {IVector<SmsFilterRule>} 
     */
    Rules {
        get => this.get_Rules()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActionType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<SmsFilterRule>} 
     */
    get_Rules() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SmsFilterRule, value)
    }
}
