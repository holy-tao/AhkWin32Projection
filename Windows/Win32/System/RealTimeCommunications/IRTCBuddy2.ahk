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
     * @type {IRTCProfile2} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * @type {IRTCCollection} 
     */
    Groups {
        get => this.get_Groups()
    }

    /**
     * @type {IRTCCollection} 
     */
    PresenceDevices {
        get => this.get_PresenceDevices()
    }

    /**
     * @type {Integer} 
     */
    SubscriptionType {
        get => this.get_SubscriptionType()
    }

    /**
     * 
     * @returns {IRTCProfile2} 
     */
    get_Profile() {
        result := ComCall(13, this, "ptr*", &ppProfile := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRTCProfile2(ppProfile)
    }

    /**
     * Refresh Method (RDS)
     * @remarks
     * You must set the [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties before you use the **Refresh** method. All data-bound controls on the form associated with an **RDS.DataControl** object will reflect the new set of records. Any pre-existing [Recordset](../ado-api/recordset-object-ado.md) object is released, and any unsaved changes are discarded. The **Refresh** method automatically makes the first record the current record.  
     *   
     *  It is a good idea to call the **Refresh** method periodically when you work with data. If you retrieve data, and then leave it on a client computer for a while, it is likely to become out of date. It is possible that any changes that you make will fail, because someone else might have changed the record and submitted changes before you.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/refresh-method-rds
     */
    Refresh() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRTCEnumGroups} 
     */
    EnumerateGroups() {
        result := ComCall(15, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRTCEnumGroups(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Groups() {
        result := ComCall(16, this, "ptr*", &ppCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @param {Integer} enProperty 
     * @returns {BSTR} 
     */
    get_PresenceProperty(enProperty) {
        pbstrProperty := BSTR()
        result := ComCall(17, this, "int", enProperty, "ptr", pbstrProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrProperty
    }

    /**
     * 
     * @returns {IRTCEnumPresenceDevices} 
     */
    EnumeratePresenceDevices() {
        result := ComCall(18, this, "ptr*", &ppEnumDevices := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRTCEnumPresenceDevices(ppEnumDevices)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_PresenceDevices() {
        result := ComCall(19, this, "ptr*", &ppDevicesCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRTCCollection(ppDevicesCollection)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubscriptionType() {
        result := ComCall(20, this, "int*", &penSubscriptionType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return penSubscriptionType
    }
}
