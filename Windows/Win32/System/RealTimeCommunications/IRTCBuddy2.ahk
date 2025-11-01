#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCBuddy.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCBuddy2 extends IRTCBuddy{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCBuddy2
     * @type {Guid}
     */
    static IID => Guid("{102f9588-23e7-40e3-954d-cd7a1d5c0361}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Profile", "Refresh", "EnumerateGroups", "get_Groups", "get_PresenceProperty", "EnumeratePresenceDevices", "get_PresenceDevices", "get_SubscriptionType"]

    /**
     * 
     * @param {Pointer<IRTCProfile2>} ppProfile 
     * @returns {HRESULT} 
     */
    get_Profile(ppProfile) {
        result := ComCall(13, this, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCEnumGroups>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateGroups(ppEnum) {
        result := ComCall(15, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    get_Groups(ppCollection) {
        result := ComCall(16, this, "ptr*", ppCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enProperty 
     * @param {Pointer<BSTR>} pbstrProperty 
     * @returns {HRESULT} 
     */
    get_PresenceProperty(enProperty, pbstrProperty) {
        result := ComCall(17, this, "int", enProperty, "ptr", pbstrProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCEnumPresenceDevices>} ppEnumDevices 
     * @returns {HRESULT} 
     */
    EnumeratePresenceDevices(ppEnumDevices) {
        result := ComCall(18, this, "ptr*", ppEnumDevices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppDevicesCollection 
     * @returns {HRESULT} 
     */
    get_PresenceDevices(ppDevicesCollection) {
        result := ComCall(19, this, "ptr*", ppDevicesCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penSubscriptionType 
     * @returns {HRESULT} 
     */
    get_SubscriptionType(penSubscriptionType) {
        penSubscriptionTypeMarshal := penSubscriptionType is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, penSubscriptionTypeMarshal, penSubscriptionType, "HRESULT")
        return result
    }
}
