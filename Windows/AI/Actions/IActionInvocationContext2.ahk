#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\UI\WindowId.ahk
#Include .\ActionInvocationHelpDetails.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionInvocationContext2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionInvocationContext2
     * @type {Guid}
     */
    static IID => Guid("{7c843086-9279-5bcd-8f2e-d15121e7a827}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InvokerWindowId", "get_HelpDetails", "get_ActionId", "get_InvokerAppUserModelId"]

    /**
     * @type {WindowId} 
     */
    InvokerWindowId {
        get => this.get_InvokerWindowId()
    }

    /**
     * @type {ActionInvocationHelpDetails} 
     */
    HelpDetails {
        get => this.get_HelpDetails()
    }

    /**
     * @type {HSTRING} 
     */
    ActionId {
        get => this.get_ActionId()
    }

    /**
     * @type {HSTRING} 
     */
    InvokerAppUserModelId {
        get => this.get_InvokerAppUserModelId()
    }

    /**
     * 
     * @returns {WindowId} 
     */
    get_InvokerWindowId() {
        value := WindowId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ActionInvocationHelpDetails} 
     */
    get_HelpDetails() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionInvocationHelpDetails(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActionId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InvokerAppUserModelId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
