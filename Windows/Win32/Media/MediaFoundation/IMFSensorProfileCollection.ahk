#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SENSORPROFILEID.ahk" { SENSORPROFILEID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFSensorProfile.ahk" { IMFSensorProfile }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains a collection of media foundation sensor profile objects.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsensorprofilecollection
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSensorProfileCollection extends IUnknown {
    /**
     * The interface identifier for IMFSensorProfileCollection
     * @type {Guid}
     */
    static IID := Guid("{c95ea55b-0187-48be-9353-8d2507662351}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSensorProfileCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProfileCount      : IntPtr
        GetProfile           : IntPtr
        AddProfile           : IntPtr
        FindProfile          : IntPtr
        RemoveProfileByIndex : IntPtr
        RemoveProfile        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSensorProfileCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetProfileCount() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * Retrieves the specified profile.
     * @param {Integer} Index Index of the profile to retrieve.
     * @returns {IMFSensorProfile} On success, returns a double pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprofile">IMFSensorProfile</a> object that describes the specified sensor profile.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-getprofile
     */
    GetProfile(Index) {
        result := ComCall(4, this, "uint", Index, "ptr*", &ppProfile := 0, "HRESULT")
        return IMFSensorProfile(ppProfile)
    }

    /**
     * Adds the specified profile to the collection.
     * @param {IMFSensorProfile} pProfile Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprofile">IMFSensorProfile</a> object describing the profile to add.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-addprofile
     */
    AddProfile(pProfile) {
        result := ComCall(5, this, "ptr", pProfile, "HRESULT")
        return result
    }

    /**
     * Finds a profile based on the specified profile ID.
     * @param {Pointer<SENSORPROFILEID>} ProfileId Pointer to the The ID of the profile to find.
     * @returns {IMFSensorProfile} On success, returns a double pointer to the profile.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-findprofile
     */
    FindProfile(ProfileId) {
        result := ComCall(6, this, SENSORPROFILEID.Ptr, ProfileId, "ptr*", &ppProfile := 0, "HRESULT")
        return IMFSensorProfile(ppProfile)
    }

    /**
     * Removes a profile based on the specified index.
     * @param {Integer} Index The index of the profile to remove.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-removeprofilebyindex
     */
    RemoveProfileByIndex(Index) {
        ComCall(7, this, "uint", Index)
    }

    /**
     * Removes the specified profile based on the specified profile ID.
     * @param {Pointer<SENSORPROFILEID>} ProfileId Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ns-mfidl-sensorprofileid">SENSORPROFILEID</a> of the profile to remove.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-removeprofile
     */
    RemoveProfile(ProfileId) {
        ComCall(8, this, SENSORPROFILEID.Ptr, ProfileId)
    }

    Query(iid) {
        if (IMFSensorProfileCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProfileCount := CallbackCreate(GetMethod(implObj, "GetProfileCount"), flags, 1)
        this.vtbl.GetProfile := CallbackCreate(GetMethod(implObj, "GetProfile"), flags, 3)
        this.vtbl.AddProfile := CallbackCreate(GetMethod(implObj, "AddProfile"), flags, 2)
        this.vtbl.FindProfile := CallbackCreate(GetMethod(implObj, "FindProfile"), flags, 3)
        this.vtbl.RemoveProfileByIndex := CallbackCreate(GetMethod(implObj, "RemoveProfileByIndex"), flags, 2)
        this.vtbl.RemoveProfile := CallbackCreate(GetMethod(implObj, "RemoveProfile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProfileCount)
        CallbackFree(this.vtbl.GetProfile)
        CallbackFree(this.vtbl.AddProfile)
        CallbackFree(this.vtbl.FindProfile)
        CallbackFree(this.vtbl.RemoveProfileByIndex)
        CallbackFree(this.vtbl.RemoveProfile)
    }
}
