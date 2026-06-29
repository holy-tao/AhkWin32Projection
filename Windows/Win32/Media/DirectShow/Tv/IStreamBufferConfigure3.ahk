#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IStreamBufferConfigure2.ahk" { IStreamBufferConfigure2 }

/**
 * The IStreamBufferConfigure3 interface is exposed by the StreamBufferConfig object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferConfigure3)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambufferconfigure3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IStreamBufferConfigure3 extends IStreamBufferConfigure2 {
    /**
     * The interface identifier for IStreamBufferConfigure3
     * @type {Guid}
     */
    static IID := Guid("{7e2d2a1e-7192-4bd7-80c1-061fd1d10402}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamBufferConfigure3 interfaces
    */
    struct Vtbl extends IStreamBufferConfigure2.Vtbl {
        SetStartRecConfig : IntPtr
        GetStartRecConfig : IntPtr
        SetNamespace      : IntPtr
        GetNamespace      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamBufferConfigure3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetStartRecConfig method specifies whether the IStreamBufferRecordControl::Start method automatically stops the current recording.
     * @remarks
     * By default, if another recording is still in progress, the <b>IStreamBufferRecordControl::Start</b> method fails. If the <i>fStartStopsCur</i> parameter is <b>TRUE</b>, the <b>Start</b> method will automatically stop a recording in progress.
     * @param {BOOL} fStartStopsCur If <b>TRUE</b>, the <b>Start</b> method automatically stops the current recording. Otherwise, the <b>Start</b> method fails if another recording is in progress. The default value is <b>FALSE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure3-setstartrecconfig
     */
    SetStartRecConfig(fStartStopsCur) {
        result := ComCall(13, this, BOOL, fStartStopsCur, "HRESULT")
        return result
    }

    /**
     * The GetStartRecConfig method queries whether the IStreamBufferRecordControl::Start method automatically stops the current recording.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the <b>Start</b> method automatically stops the current recording. Otherwise, the <b>Start</b> method fails if another recording is in progress.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure3-getstartrecconfig
     */
    GetStartRecConfig() {
        result := ComCall(14, this, BOOL.Ptr, &pfStartStopsCur := 0, "HRESULT")
        return pfStartStopsCur
    }

    /**
     * The SetNamespace method specifies a prefix that is added to the names of the synchronization objects that the Stream Buffer Engine uses to synchronize the reader and writer.
     * @remarks
     * The default value is "Global".
     * 
     * If the value is "Global", the synchronization objects are created in the global name space, which requires administrator privileges in Windows Vista or later. If the value is <b>NULL</b>, the synchronization objects are created in the local session name space, which does not require administrator privileges.
     * @param {PWSTR} pszNamespace Pointer to a null-terminated wide character string. If <b>NULL</b>, no prefix is used. Currently, the following values are supported.
     * 
     * <ul>
     * <li>L"Global"</li>
     * <li><b>NULL</b></li>
     * </ul>
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
     * <dt><b>CO_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified prefix is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure3-setnamespace
     */
    SetNamespace(pszNamespace) {
        pszNamespace := pszNamespace is String ? StrPtr(pszNamespace) : pszNamespace

        result := ComCall(15, this, "ptr", pszNamespace, "HRESULT")
        return result
    }

    /**
     * The GetNamespace method retrieves the prefix that is added to the names of the synchronization objects that the Stream Buffer Engine uses to synchronize the reader and writer.
     * @returns {PWSTR} Receives a pointer to a null-terminated, wide-character string. The caller must free the string by calling <b>CoTaskMemFree</b>. If no prefix is defined, this variable receives a <b>NULL</b> pointer.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure3-getnamespace
     */
    GetNamespace() {
        result := ComCall(16, this, PWSTR.Ptr, &ppszNamespace := 0, "HRESULT")
        return ppszNamespace
    }

    Query(iid) {
        if (IStreamBufferConfigure3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStartRecConfig := CallbackCreate(GetMethod(implObj, "SetStartRecConfig"), flags, 2)
        this.vtbl.GetStartRecConfig := CallbackCreate(GetMethod(implObj, "GetStartRecConfig"), flags, 2)
        this.vtbl.SetNamespace := CallbackCreate(GetMethod(implObj, "SetNamespace"), flags, 2)
        this.vtbl.GetNamespace := CallbackCreate(GetMethod(implObj, "GetNamespace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStartRecConfig)
        CallbackFree(this.vtbl.GetStartRecConfig)
        CallbackFree(this.vtbl.SetNamespace)
        CallbackFree(this.vtbl.GetNamespace)
    }
}
