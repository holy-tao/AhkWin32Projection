#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidWebDVDAdm extends IDispatch {
    /**
     * The interface identifier for IMSVidWebDVDAdm
     * @type {Guid}
     */
    static IID := Guid("{b8be681a-eb2c-47f0-b415-94d5452f0e05}")

    /**
     * The class identifier for MSVidWebDVDAdm
     * @type {Guid}
     */
    static CLSID := Guid("{fa7c375b-66a7-4280-879d-fd459c84bb02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidWebDVDAdm interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ChangePassword            : IntPtr
        SaveParentalLevel         : IntPtr
        SaveParentalCountry       : IntPtr
        ConfirmPassword           : IntPtr
        GetParentalLevel          : IntPtr
        GetParentalCountry        : IntPtr
        get_DefaultAudioLCID      : IntPtr
        put_DefaultAudioLCID      : IntPtr
        get_DefaultSubpictureLCID : IntPtr
        put_DefaultSubpictureLCID : IntPtr
        get_DefaultMenuLCID       : IntPtr
        put_DefaultMenuLCID       : IntPtr
        get_BookmarkOnStop        : IntPtr
        put_BookmarkOnStop        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidWebDVDAdm.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    DefaultAudioLCID {
        get => this.get_DefaultAudioLCID()
        set => this.put_DefaultAudioLCID(value)
    }

    /**
     * @type {Integer} 
     */
    DefaultSubpictureLCID {
        get => this.get_DefaultSubpictureLCID()
        set => this.put_DefaultSubpictureLCID(value)
    }

    /**
     * @type {Integer} 
     */
    DefaultMenuLCID {
        get => this.get_DefaultMenuLCID()
        set => this.put_DefaultMenuLCID(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    BookmarkOnStop {
        get => this.get_BookmarkOnStop()
        set => this.put_BookmarkOnStop(value)
    }

    /**
     * The DVDAdm.ChangePassword method saves a new application password in the registry.
     * @remarks
     * Currently, the *sUserName* parameter is ignored on this and all related methods. This means that whoever knows the password can set the parental level. There is only one password and one parental level for the application. There is no support for individual user logon names or multiple password management. To enforce parental management levels, parents should set the password and then set the parental level appropriate for younger members of the group of relatives. When parents want to view a disc with adult-rated content, they can change the level, and then change it back when they are done viewing. As long as the children do not know the password, they can only watch content at or below the level set for them.
     * @param {BSTR} strUserName 
     * @param {BSTR} strOld 
     * @param {BSTR} strNew 
     * @returns {HRESULT} <span id="sUserName"></span><span id="susername"></span><span id="SUSERNAME"></span>*sUserName*
     * 
     * Specifies the current user's logon name as a String. The MSDVDAdm object ignores this parameter. See Remarks.
     * 
     * 
     * <span id="sOld"></span><span id="sold"></span><span id="SOLD"></span>*sOld*
     * 
     * Specifies the user's old password as a String.
     * 
     * 
     * <span id="sNew"></span><span id="snew"></span><span id="SNEW"></span>*sNew*
     * 
     * Specifies the user's new password as a String. Cannot be an empty string.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/changepassword-method
     */
    ChangePassword(strUserName, strOld, strNew) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strOld := strOld is String ? BSTR.Alloc(strOld).Value : strOld
        strNew := strNew is String ? BSTR.Alloc(strNew).Value : strNew

        result := ComCall(7, this, BSTR, strUserName, BSTR, strOld, BSTR, strNew, "HRESULT")
        return result
    }

    /**
     * The DVDAdm.SaveParentalLevel method saves a new default parental level to the registry.
     * @remarks
     * This method enables a user who knows the current password to save a new parental level setting to the registry. As with all the methods of **MSDVDAdm**, this method does not affect the current level in the player; it changes only the registry setting, so that the next time the MSWebDVD object is started, it will open with the new level. Specify -1 to disable parental management. To change the parental level in the player, call [**SelectParentalLevel**](selectparentallevel-method.md), which does not change the registry setting.
     * @param {Integer} level 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} <span id="iLevel"></span><span id="ilevel"></span><span id="ILEVEL"></span>*iLevel*
     * 
     * Specifies the parental level as anInteger value from 1 through 8.
     * 
     * 
     * <span id="sUserName"></span><span id="susername"></span><span id="SUSERNAME"></span>*sUserName*
     * 
     * Specifies the user name as a String. (Currently ignored.)
     * 
     * 
     * <span id="sPassword"></span><span id="spassword"></span><span id="SPASSWORD"></span>*sPassword*
     * 
     * Specifies the password as a String.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/saveparentallevel-method
     */
    SaveParentalLevel(level, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(8, this, "int", level, BSTR, strUserName, BSTR, strPassword, "HRESULT")
        return result
    }

    /**
     * The DVDAdm.SaveParentalCountry method saves the application's new parental country/region to the registry.
     * @remarks
     * This method enables a user who knows the current password to save a new parental country/region setting to the registry. As with all the methods of **MSDVDAdm**, this method does not affect the current level in the player; it changes only the registry setting, so that the next time the MSWebDVD object is created, it will open with the new country/region. To change the parental country/region in the player, call [**SelectParentalCountry**](selectparentalcountry-method.md), which does not change the registry setting.
     * @param {Integer} country 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} <span id="iCountry"></span><span id="icountry"></span><span id="ICOUNTRY"></span>*iCountry*
     * 
     * Specifies the parental country/region as an Integer.
     * 
     * 
     * <span id="sUserName"></span><span id="susername"></span><span id="SUSERNAME"></span>*sUserName*
     * 
     * Specifies the user name as a String. (Currently ignored.)
     * 
     * 
     * <span id="sPassword"></span><span id="spassword"></span><span id="SPASSWORD"></span>*sPassword*
     * 
     * Specifies the password as a String.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/saveparentalcountry-method
     */
    SaveParentalCountry(country, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(9, this, "int", country, BSTR, strUserName, BSTR, strPassword, "HRESULT")
        return result
    }

    /**
     * The DVDAdm.ConfirmPassword method tests whether the specified password matches the previously saved password.
     * @remarks
     * Currently, the *sUserName* parameter is ignored on this and all related methods.
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/confirmpassword-method
     */
    ConfirmPassword(strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(10, this, BSTR, strUserName, BSTR, strPassword, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The DVDAdm.GetParentalLevel method retrieves the parental level that was last saved to the registry.
     * @remarks
     * The parental level this method retrieves is not necessarily the same level currently stored in the MSWebDVD control; to get the level currently stored in the control, call the [**GetPlayerParentalLevel**](getplayerparentallevel-method.md) method. A value of -1 indicates that parental management is disabled.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/getparentallevel-method
     */
    GetParentalLevel() {
        result := ComCall(11, this, "int*", &lLevel := 0, "HRESULT")
        return lLevel
    }

    /**
     * The DVDAdm.GetParentalCountry method retrieves the parental country/region that was last saved to the registry.
     * @remarks
     * The parental country/region this method retrieves is not necessarily the same country/region currently stored in the MSWebDVD object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/getparentalcountry-method
     */
    GetParentalCountry() {
        result := ComCall(12, this, "int*", &lCountry := 0, "HRESULT")
        return lCountry
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultAudioLCID() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_DefaultAudioLCID(newVal) {
        result := ComCall(14, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultSubpictureLCID() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_DefaultSubpictureLCID(newVal) {
        result := ComCall(16, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultMenuLCID() {
        result := ComCall(17, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_DefaultMenuLCID(newVal) {
        result := ComCall(18, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_BookmarkOnStop() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_BookmarkOnStop(newVal) {
        result := ComCall(20, this, VARIANT_BOOL, newVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidWebDVDAdm.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ChangePassword := CallbackCreate(GetMethod(implObj, "ChangePassword"), flags, 4)
        this.vtbl.SaveParentalLevel := CallbackCreate(GetMethod(implObj, "SaveParentalLevel"), flags, 4)
        this.vtbl.SaveParentalCountry := CallbackCreate(GetMethod(implObj, "SaveParentalCountry"), flags, 4)
        this.vtbl.ConfirmPassword := CallbackCreate(GetMethod(implObj, "ConfirmPassword"), flags, 4)
        this.vtbl.GetParentalLevel := CallbackCreate(GetMethod(implObj, "GetParentalLevel"), flags, 2)
        this.vtbl.GetParentalCountry := CallbackCreate(GetMethod(implObj, "GetParentalCountry"), flags, 2)
        this.vtbl.get_DefaultAudioLCID := CallbackCreate(GetMethod(implObj, "get_DefaultAudioLCID"), flags, 2)
        this.vtbl.put_DefaultAudioLCID := CallbackCreate(GetMethod(implObj, "put_DefaultAudioLCID"), flags, 2)
        this.vtbl.get_DefaultSubpictureLCID := CallbackCreate(GetMethod(implObj, "get_DefaultSubpictureLCID"), flags, 2)
        this.vtbl.put_DefaultSubpictureLCID := CallbackCreate(GetMethod(implObj, "put_DefaultSubpictureLCID"), flags, 2)
        this.vtbl.get_DefaultMenuLCID := CallbackCreate(GetMethod(implObj, "get_DefaultMenuLCID"), flags, 2)
        this.vtbl.put_DefaultMenuLCID := CallbackCreate(GetMethod(implObj, "put_DefaultMenuLCID"), flags, 2)
        this.vtbl.get_BookmarkOnStop := CallbackCreate(GetMethod(implObj, "get_BookmarkOnStop"), flags, 2)
        this.vtbl.put_BookmarkOnStop := CallbackCreate(GetMethod(implObj, "put_BookmarkOnStop"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ChangePassword)
        CallbackFree(this.vtbl.SaveParentalLevel)
        CallbackFree(this.vtbl.SaveParentalCountry)
        CallbackFree(this.vtbl.ConfirmPassword)
        CallbackFree(this.vtbl.GetParentalLevel)
        CallbackFree(this.vtbl.GetParentalCountry)
        CallbackFree(this.vtbl.get_DefaultAudioLCID)
        CallbackFree(this.vtbl.put_DefaultAudioLCID)
        CallbackFree(this.vtbl.get_DefaultSubpictureLCID)
        CallbackFree(this.vtbl.put_DefaultSubpictureLCID)
        CallbackFree(this.vtbl.get_DefaultMenuLCID)
        CallbackFree(this.vtbl.put_DefaultMenuLCID)
        CallbackFree(this.vtbl.get_BookmarkOnStop)
        CallbackFree(this.vtbl.put_BookmarkOnStop)
    }
}
