#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMProfileManagerLanguage interface controls the language of the system profiles parsed by the profile manager.An IWMProfileManagerLanguage interface exists for every profile manager object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmprofilemanagerlanguage
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMProfileManagerLanguage extends IUnknown {
    /**
     * The interface identifier for IWMProfileManagerLanguage
     * @type {Guid}
     */
    static IID := Guid("{ba4dcc78-7ee0-4ab8-b27a-dbce8bc51454}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMProfileManagerLanguage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUserLanguageID : IntPtr
        SetUserLanguageID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMProfileManagerLanguage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetUserLanguageID method retrieves the language identifier for the system profiles loaded by the profile manager object.
     * @remarks
     * The default language is U.S. English (0x409).
     * @param {Pointer<Integer>} wLangID Pointer to a <b>WORD</b> that receives the language identifier (LANGID) of the language set in the profile manager.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanagerlanguage-getuserlanguageid
     */
    GetUserLanguageID(wLangID) {
        wLangIDMarshal := wLangID is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, wLangIDMarshal, wLangID, "HRESULT")
        return result
    }

    /**
     * The SetUserLanguageID method sets the language of the system profiles that will be parsed by the profile manager object.
     * @remarks
     * English – United States (0x0409) is the default language. This method will also return NS_E_MOMATCHING_ELEMENT for all languages except US English if you have not moved the correct .prx file into the system root directory.
     * @param {Integer} wLangID <b>WORD</b> containing the language identifier (LANGID) of the language you want to use.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NOMATCHING_ELEMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified LANGID represents a locality not supported by a localized set of system profiles.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanagerlanguage-setuserlanguageid
     */
    SetUserLanguageID(wLangID) {
        result := ComCall(4, this, "ushort", wLangID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMProfileManagerLanguage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUserLanguageID := CallbackCreate(GetMethod(implObj, "GetUserLanguageID"), flags, 2)
        this.vtbl.SetUserLanguageID := CallbackCreate(GetMethod(implObj, "SetUserLanguageID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUserLanguageID)
        CallbackFree(this.vtbl.SetUserLanguageID)
    }
}
