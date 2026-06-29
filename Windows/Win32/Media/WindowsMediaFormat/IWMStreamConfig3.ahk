#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMStreamConfig2.ahk" { IWMStreamConfig2 }

/**
 * The IWMStreamConfig3 interface controls language settings for a stream.An IWMStreamConfig3 interface exists for every stream configuration object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmstreamconfig3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMStreamConfig3 extends IWMStreamConfig2 {
    /**
     * The interface identifier for IWMStreamConfig3
     * @type {Guid}
     */
    static IID := Guid("{cb164104-3aa9-45a7-9ac9-4daee131d6e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMStreamConfig3 interfaces
    */
    struct Vtbl extends IWMStreamConfig2.Vtbl {
        GetLanguage : IntPtr
        SetLanguage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMStreamConfig3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetLanguage method retrieves the RFC1766-compliant language string for the stream.
     * @param {PWSTR} pwszLanguageString Pointer to a wide-character <b>null</b>-terminated string containing the language string. Pass <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcchLanguageStringLength</i>.
     * @param {Pointer<Integer>} pcchLanguageStringLength Pointer to a <b>WORD</b> containing the size of the language string in wide characters. This size includes the terminating <b>null</b> character.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig3-getlanguage
     */
    GetLanguage(pwszLanguageString, pcchLanguageStringLength) {
        pwszLanguageString := pwszLanguageString is String ? StrPtr(pwszLanguageString) : pwszLanguageString

        pcchLanguageStringLengthMarshal := pcchLanguageStringLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(20, this, "ptr", pwszLanguageString, pcchLanguageStringLengthMarshal, pcchLanguageStringLength, "HRESULT")
        return result
    }

    /**
     * The SetLanguage method sets the language for a stream using an RFC1766-compliant string.
     * @remarks
     * The string passed to this method must be an RFC1766-compliant string. Use of other strings will cause problems when streaming a file made with this profile. For a list of commonly used language strings, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/language-strings">Language Strings</a>.
     * 
     * The new value will not take effect in the profile until you call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile-reconfigstream">IWMProfile::ReconfigStream</a>.
     * @param {PWSTR} pwszLanguageString Pointer to a wide-character null-terminated string containing the language string.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig3-setlanguage
     */
    SetLanguage(pwszLanguageString) {
        pwszLanguageString := pwszLanguageString is String ? StrPtr(pwszLanguageString) : pwszLanguageString

        result := ComCall(21, this, "ptr", pwszLanguageString, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMStreamConfig3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLanguage := CallbackCreate(GetMethod(implObj, "GetLanguage"), flags, 3)
        this.vtbl.SetLanguage := CallbackCreate(GetMethod(implObj, "SetLanguage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLanguage)
        CallbackFree(this.vtbl.SetLanguage)
    }
}
