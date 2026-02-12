#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GattServiceProviderTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IGattServiceProviderTriggerResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattServiceProviderTriggerResult
     * @type {Guid}
     */
    static IID => Guid("{3c4691b1-b198-4e84-bad4-cf4ad299ed3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Trigger", "get_Error"]

    /**
     * @type {GattServiceProviderTrigger} 
     */
    Trigger {
        get => this.get_Trigger()
    }

    /**
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * 
     * @returns {GattServiceProviderTrigger} 
     */
    get_Trigger() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattServiceProviderTrigger(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
