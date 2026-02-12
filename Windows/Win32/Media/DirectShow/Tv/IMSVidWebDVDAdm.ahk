#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidWebDVDAdm extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidWebDVDAdm
     * @type {Guid}
     */
    static IID => Guid("{b8be681a-eb2c-47f0-b415-94d5452f0e05}")

    /**
     * The class identifier for MSVidWebDVDAdm
     * @type {Guid}
     */
    static CLSID => Guid("{fa7c375b-66a7-4280-879d-fd459c84bb02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ChangePassword", "SaveParentalLevel", "SaveParentalCountry", "ConfirmPassword", "GetParentalLevel", "GetParentalCountry", "get_DefaultAudioLCID", "put_DefaultAudioLCID", "get_DefaultSubpictureLCID", "put_DefaultSubpictureLCID", "get_DefaultMenuLCID", "put_DefaultMenuLCID", "get_BookmarkOnStop", "put_BookmarkOnStop"]

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
     * ChangePassword Method (ADOX)
     * @remarks
     * For security reasons, the old password must be specified in addition to the new password.  
     *   
     *  An error will occur if the provider does not support the administration of trustee properties.
     * @param {BSTR} strUserName 
     * @param {BSTR} strOld 
     * @param {BSTR} strNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/changepassword-method-adox
     */
    ChangePassword(strUserName, strOld, strNew) {
        if(strUserName is String) {
            pin := BSTR.Alloc(strUserName)
            strUserName := pin.Value
        }
        if(strOld is String) {
            pin := BSTR.Alloc(strOld)
            strOld := pin.Value
        }
        if(strNew is String) {
            pin := BSTR.Alloc(strNew)
            strNew := pin.Value
        }

        result := ComCall(7, this, "ptr", strUserName, "ptr", strOld, "ptr", strNew, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/saveparentallevel-method
     */
    SaveParentalLevel(level, strUserName, strPassword) {
        if(strUserName is String) {
            pin := BSTR.Alloc(strUserName)
            strUserName := pin.Value
        }
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }

        result := ComCall(8, this, "int", level, "ptr", strUserName, "ptr", strPassword, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/saveparentalcountry-method
     */
    SaveParentalCountry(country, strUserName, strPassword) {
        if(strUserName is String) {
            pin := BSTR.Alloc(strUserName)
            strUserName := pin.Value
        }
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }

        result := ComCall(9, this, "int", country, "ptr", strUserName, "ptr", strPassword, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DVDAdm.ConfirmPassword method tests whether the specified password matches the previously saved password.
     * @remarks
     * Currently, the *sUserName* parameter is ignored on this and all related methods.
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/confirmpassword-method
     */
    ConfirmPassword(strUserName, strPassword) {
        if(strUserName is String) {
            pin := BSTR.Alloc(strUserName)
            strUserName := pin.Value
        }
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }

        result := ComCall(10, this, "ptr", strUserName, "ptr", strPassword, "short*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * The DVDAdm.GetParentalLevel method retrieves the parental level that was last saved to the registry.
     * @remarks
     * The parental level this method retrieves is not necessarily the same level currently stored in the MSWebDVD control; to get the level currently stored in the control, call the [**GetPlayerParentalLevel**](getplayerparentallevel-method.md) method. A value of -1 indicates that parental management is disabled.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/getparentallevel-method
     */
    GetParentalLevel() {
        result := ComCall(11, this, "int*", &lLevel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lLevel
    }

    /**
     * The DVDAdm.GetParentalCountry method retrieves the parental country/region that was last saved to the registry.
     * @remarks
     * The parental country/region this method retrieves is not necessarily the same country/region currently stored in the MSWebDVD object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/getparentalcountry-method
     */
    GetParentalCountry() {
        result := ComCall(12, this, "int*", &lCountry := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lCountry
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultAudioLCID() {
        result := ComCall(13, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_DefaultAudioLCID(newVal) {
        result := ComCall(14, this, "int", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultSubpictureLCID() {
        result := ComCall(15, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_DefaultSubpictureLCID(newVal) {
        result := ComCall(16, this, "int", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultMenuLCID() {
        result := ComCall(17, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_DefaultMenuLCID(newVal) {
        result := ComCall(18, this, "int", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_BookmarkOnStop() {
        result := ComCall(19, this, "short*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_BookmarkOnStop(newVal) {
        result := ComCall(20, this, "short", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
