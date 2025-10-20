#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCBuddy.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCBuddy2 extends IRTCBuddy{
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
     * 
     * @param {Pointer<IRTCProfile2>} ppProfile 
     * @returns {HRESULT} 
     */
    get_Profile(ppProfile) {
        result := ComCall(13, this, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCEnumGroups>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateGroups(ppEnum) {
        result := ComCall(15, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    get_Groups(ppCollection) {
        result := ComCall(16, this, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enProperty 
     * @param {Pointer<BSTR>} pbstrProperty 
     * @returns {HRESULT} 
     */
    get_PresenceProperty(enProperty, pbstrProperty) {
        result := ComCall(17, this, "int", enProperty, "ptr", pbstrProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCEnumPresenceDevices>} ppEnumDevices 
     * @returns {HRESULT} 
     */
    EnumeratePresenceDevices(ppEnumDevices) {
        result := ComCall(18, this, "ptr", ppEnumDevices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppDevicesCollection 
     * @returns {HRESULT} 
     */
    get_PresenceDevices(ppDevicesCollection) {
        result := ComCall(19, this, "ptr", ppDevicesCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penSubscriptionType 
     * @returns {HRESULT} 
     */
    get_SubscriptionType(penSubscriptionType) {
        result := ComCall(20, this, "int*", penSubscriptionType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
