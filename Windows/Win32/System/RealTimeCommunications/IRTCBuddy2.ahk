#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCProfile2.ahk
#Include .\IRTCEnumGroups.ahk
#Include .\IRTCCollection.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCEnumPresenceDevices.ahk
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
     * @returns {IRTCProfile2} 
     */
    get_Profile() {
        result := ComCall(13, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile2(ppProfile)
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
     * @returns {IRTCEnumGroups} 
     */
    EnumerateGroups() {
        result := ComCall(15, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumGroups(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Groups() {
        result := ComCall(16, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @param {Integer} enProperty 
     * @returns {BSTR} 
     */
    get_PresenceProperty(enProperty) {
        pbstrProperty := BSTR()
        result := ComCall(17, this, "int", enProperty, "ptr", pbstrProperty, "HRESULT")
        return pbstrProperty
    }

    /**
     * 
     * @returns {IRTCEnumPresenceDevices} 
     */
    EnumeratePresenceDevices() {
        result := ComCall(18, this, "ptr*", &ppEnumDevices := 0, "HRESULT")
        return IRTCEnumPresenceDevices(ppEnumDevices)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_PresenceDevices() {
        result := ComCall(19, this, "ptr*", &ppDevicesCollection := 0, "HRESULT")
        return IRTCCollection(ppDevicesCollection)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubscriptionType() {
        result := ComCall(20, this, "int*", &penSubscriptionType := 0, "HRESULT")
        return penSubscriptionType
    }
}
