#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ITetheringEntitlementCheckTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITetheringEntitlementCheckTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{03c65e9d-5926-41f3-a94e-b50926fc421b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NetworkAccountId", "AllowTethering", "DenyTethering"]

    /**
     * @type {HSTRING} 
     */
    NetworkAccountId {
        get => this.get_NetworkAccountId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NetworkAccountId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AllowTethering() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} entitlementFailureReason 
     * @returns {HRESULT} 
     */
    DenyTethering(entitlementFailureReason) {
        if(entitlementFailureReason is String) {
            pin := HSTRING.Create(entitlementFailureReason)
            entitlementFailureReason := pin.Value
        }
        entitlementFailureReason := entitlementFailureReason is Win32Handle ? NumGet(entitlementFailureReason, "ptr") : entitlementFailureReason

        result := ComCall(8, this, "ptr", entitlementFailureReason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
