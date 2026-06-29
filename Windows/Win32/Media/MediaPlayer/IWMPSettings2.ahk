#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPSettings.ahk" { IWMPSettings }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPSettings2 interface provides methods that supplement the IWMPSettings interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpsettings2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPSettings2 extends IWMPSettings {
    /**
     * The interface identifier for IWMPSettings2
     * @type {Guid}
     */
    static IID := Guid("{fda937a4-eece-4da5-a0b6-39bf89ade2c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPSettings2 interfaces
    */
    struct Vtbl extends IWMPSettings.Vtbl {
        get_defaultAudioLanguage : IntPtr
        get_mediaAccessRights    : IntPtr
        requestMediaAccessRights : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPSettings2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    defaultAudioLanguage {
        get => this.get_defaultAudioLanguage()
    }

    /**
     */
    mediaAccessRights {
        get => this.get_mediaAccessRights()
    }

    /**
     * The get_defaultAudioLanguage method retrieves the LCID of the default audio language specified in Windows Media Player.
     * @remarks
     * An LCID uniquely identifies a particular language dialect, called a locale.
     * @param {Pointer<Integer>} plLangID Pointer to a <b>long</b> containing the LCID.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings2-get_defaultaudiolanguage
     */
    get_defaultAudioLanguage(plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, plLangIDMarshal, plLangID, "HRESULT")
        return result
    }

    /**
     * The get_mediaAccessRights method retrieves a value indicating the permissions currently granted for library access.
     * @remarks
     * A webpage must first request permission from the user to read information from or write data to the library. This means that certain methods, properties, and events will be inaccessible from code if the appropriate access rights have not been granted. To obtain access rights, the application calls <b>IWMPSettings2::get_requestMediaAccessRights</b>, passing a parameter that specifies the desired access rights level.
     * 
     * Applications running on the user's computer always have full access rights.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>BSTR</b> containing the string "full".
     * @param {Pointer<BSTR>} pbstrRights 
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings2-get_mediaaccessrights
     */
    get_mediaAccessRights(pbstrRights) {
        result := ComCall(31, this, BSTR.Ptr, pbstrRights, "HRESULT")
        return result
    }

    /**
     * The requestMediaAccessRights method requests a specified level of access to the library.
     * @remarks
     * A webpage must first request permission from the user to read information from or write data to the library. Invoking this method prompts the user with a dialog box that requests the specified permission level. This means that certain methods, properties, and events will be inaccessible from code if the appropriate access rights have not been granted. The current access rights level can be retrieved by using <b>IWMPSettings2::get_mediaAccessRights</b>.
     * 
     * Applications running on the user's computer are not required to use this method.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>TRUE</b>.
     * @param {BSTR} bstrDesiredAccess 
     * @param {Pointer<VARIANT_BOOL>} pvbAccepted Pointer to a <b>VARIANT_BOOL</b> indicating whether the requested access rights were granted.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings2-requestmediaaccessrights
     */
    requestMediaAccessRights(bstrDesiredAccess, pvbAccepted) {
        bstrDesiredAccess := bstrDesiredAccess is String ? BSTR.Alloc(bstrDesiredAccess).Value : bstrDesiredAccess

        pvbAcceptedMarshal := pvbAccepted is VarRef ? "short*" : "ptr"

        result := ComCall(32, this, BSTR, bstrDesiredAccess, pvbAcceptedMarshal, pvbAccepted, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPSettings2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_defaultAudioLanguage := CallbackCreate(GetMethod(implObj, "get_defaultAudioLanguage"), flags, 2)
        this.vtbl.get_mediaAccessRights := CallbackCreate(GetMethod(implObj, "get_mediaAccessRights"), flags, 2)
        this.vtbl.requestMediaAccessRights := CallbackCreate(GetMethod(implObj, "requestMediaAccessRights"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_defaultAudioLanguage)
        CallbackFree(this.vtbl.get_mediaAccessRights)
        CallbackFree(this.vtbl.requestMediaAccessRights)
    }
}
