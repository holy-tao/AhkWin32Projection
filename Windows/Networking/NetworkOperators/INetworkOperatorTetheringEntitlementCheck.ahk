#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class INetworkOperatorTetheringEntitlementCheck extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkOperatorTetheringEntitlementCheck
     * @type {Guid}
     */
    static IID => Guid("{0108916d-9e9a-4af6-8da3-60493b19c204}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AuthorizeTethering"]

    /**
     * 
     * @param {Boolean} allow 
     * @param {HSTRING} entitlementFailureReason 
     * @returns {HRESULT} 
     */
    AuthorizeTethering(allow, entitlementFailureReason) {
        if(entitlementFailureReason is String) {
            pin := HSTRING.Create(entitlementFailureReason)
            entitlementFailureReason := pin.Value
        }
        entitlementFailureReason := entitlementFailureReason is Win32Handle ? NumGet(entitlementFailureReason, "ptr") : entitlementFailureReason

        result := ComCall(6, this, "int", allow, "ptr", entitlementFailureReason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
