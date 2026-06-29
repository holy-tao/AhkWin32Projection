#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_BUDDY_SUBSCRIPTION_TYPE.ahk" { RTC_BUDDY_SUBSCRIPTION_TYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IRTCProfile2.ahk" { IRTCProfile2 }
#Import ".\IRTCCollection.ahk" { IRTCCollection }
#Import ".\RTC_PRESENCE_PROPERTY.ahk" { RTC_PRESENCE_PROPERTY }
#Import ".\IRTCBuddy.ahk" { IRTCBuddy }
#Import ".\IRTCEnumGroups.ahk" { IRTCEnumGroups }
#Import ".\IRTCEnumPresenceDevices.ahk" { IRTCEnumPresenceDevices }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCBuddy2 extends IRTCBuddy {
    /**
     * The interface identifier for IRTCBuddy2
     * @type {Guid}
     */
    static IID := Guid("{102f9588-23e7-40e3-954d-cd7a1d5c0361}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCBuddy2 interfaces
    */
    struct Vtbl extends IRTCBuddy.Vtbl {
        get_Profile              : IntPtr
        Refresh                  : IntPtr
        EnumerateGroups          : IntPtr
        get_Groups               : IntPtr
        get_PresenceProperty     : IntPtr
        EnumeratePresenceDevices : IntPtr
        get_PresenceDevices      : IntPtr
        get_SubscriptionType     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCBuddy2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {RTC_BUDDY_SUBSCRIPTION_TYPE} 
     */
    SubscriptionType {
        get => this.get_SubscriptionType()
    }

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
     * @param {RTC_PRESENCE_PROPERTY} enProperty 
     * @returns {BSTR} 
     */
    get_PresenceProperty(enProperty) {
        pbstrProperty := BSTR.Owned()
        result := ComCall(17, this, RTC_PRESENCE_PROPERTY, enProperty, BSTR.Ptr, pbstrProperty, "HRESULT")
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
     * @returns {RTC_BUDDY_SUBSCRIPTION_TYPE} 
     */
    get_SubscriptionType() {
        result := ComCall(20, this, "int*", &penSubscriptionType := 0, "HRESULT")
        return penSubscriptionType
    }

    Query(iid) {
        if (IRTCBuddy2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Profile := CallbackCreate(GetMethod(implObj, "get_Profile"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.EnumerateGroups := CallbackCreate(GetMethod(implObj, "EnumerateGroups"), flags, 2)
        this.vtbl.get_Groups := CallbackCreate(GetMethod(implObj, "get_Groups"), flags, 2)
        this.vtbl.get_PresenceProperty := CallbackCreate(GetMethod(implObj, "get_PresenceProperty"), flags, 3)
        this.vtbl.EnumeratePresenceDevices := CallbackCreate(GetMethod(implObj, "EnumeratePresenceDevices"), flags, 2)
        this.vtbl.get_PresenceDevices := CallbackCreate(GetMethod(implObj, "get_PresenceDevices"), flags, 2)
        this.vtbl.get_SubscriptionType := CallbackCreate(GetMethod(implObj, "get_SubscriptionType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Profile)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.EnumerateGroups)
        CallbackFree(this.vtbl.get_Groups)
        CallbackFree(this.vtbl.get_PresenceProperty)
        CallbackFree(this.vtbl.EnumeratePresenceDevices)
        CallbackFree(this.vtbl.get_PresenceDevices)
        CallbackFree(this.vtbl.get_SubscriptionType)
    }
}
