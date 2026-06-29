#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IRTCProfile2.ahk" { IRTCProfile2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCCollection.ahk" { IRTCCollection }
#Import ".\IRTCBuddy.ahk" { IRTCBuddy }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRTCEnumBuddies.ahk" { IRTCEnumBuddies }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCBuddyGroup extends IUnknown {
    /**
     * The interface identifier for IRTCBuddyGroup
     * @type {Guid}
     */
    static IID := Guid("{60361e68-9164-4389-a4c6-d0b3925bda5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCBuddyGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Name         : IntPtr
        put_Name         : IntPtr
        AddBuddy         : IntPtr
        RemoveBuddy      : IntPtr
        EnumerateBuddies : IntPtr
        get_Buddies      : IntPtr
        get_Data         : IntPtr
        put_Data         : IntPtr
        get_Profile      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCBuddyGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {IRTCCollection} 
     */
    Buddies {
        get => this.get_Buddies()
    }

    /**
     * @type {BSTR} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * @type {IRTCProfile2} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrGroupName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrGroupName, "HRESULT")
        return pbstrGroupName
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     */
    put_Name(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(4, this, BSTR, bstrGroupName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRTCBuddy} pBuddy 
     * @returns {HRESULT} 
     */
    AddBuddy(pBuddy) {
        result := ComCall(5, this, "ptr", pBuddy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRTCBuddy} pBuddy 
     * @returns {HRESULT} 
     */
    RemoveBuddy(pBuddy) {
        result := ComCall(6, this, "ptr", pBuddy, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRTCEnumBuddies} 
     */
    EnumerateBuddies() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumBuddies(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Buddies() {
        result := ComCall(8, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Data() {
        pbstrData := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrData, "HRESULT")
        return pbstrData
    }

    /**
     * 
     * @param {BSTR} bstrData 
     * @returns {HRESULT} 
     */
    put_Data(bstrData) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(10, this, BSTR, bstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRTCProfile2} 
     */
    get_Profile() {
        result := ComCall(11, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile2(ppProfile)
    }

    Query(iid) {
        if (IRTCBuddyGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.AddBuddy := CallbackCreate(GetMethod(implObj, "AddBuddy"), flags, 2)
        this.vtbl.RemoveBuddy := CallbackCreate(GetMethod(implObj, "RemoveBuddy"), flags, 2)
        this.vtbl.EnumerateBuddies := CallbackCreate(GetMethod(implObj, "EnumerateBuddies"), flags, 2)
        this.vtbl.get_Buddies := CallbackCreate(GetMethod(implObj, "get_Buddies"), flags, 2)
        this.vtbl.get_Data := CallbackCreate(GetMethod(implObj, "get_Data"), flags, 2)
        this.vtbl.put_Data := CallbackCreate(GetMethod(implObj, "put_Data"), flags, 2)
        this.vtbl.get_Profile := CallbackCreate(GetMethod(implObj, "get_Profile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.AddBuddy)
        CallbackFree(this.vtbl.RemoveBuddy)
        CallbackFree(this.vtbl.EnumerateBuddies)
        CallbackFree(this.vtbl.get_Buddies)
        CallbackFree(this.vtbl.get_Data)
        CallbackFree(this.vtbl.put_Data)
        CallbackFree(this.vtbl.get_Profile)
    }
}
