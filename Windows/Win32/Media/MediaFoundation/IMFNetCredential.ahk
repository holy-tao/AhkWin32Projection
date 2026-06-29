#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sets and retrieves user-name and password information for authentication purposes.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfnetcredential
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFNetCredential extends IUnknown {
    /**
     * The interface identifier for IMFNetCredential
     * @type {Guid}
     */
    static IID := Guid("{5b87ef6a-7ed8-434f-ba0e-184fac1628d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFNetCredential interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetUser      : IntPtr
        SetPassword  : IntPtr
        GetUser      : IntPtr
        GetPassword  : IntPtr
        LoggedOnUser : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFNetCredential.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the user name.
     * @param {Integer} pbData Pointer to a buffer that contains the user name. If <i>fDataIsEncrypted</i> is <b>FALSE</b>, the buffer is a wide-character string. Otherwise, the buffer contains encrypted data.
     * @param {Integer} cbData Size of <i>pbData</i>, in bytes. If <i>fDataIsEncrypted</i> is <b>FALSE</b>, the size includes the terminating null character.
     * @param {BOOL} fDataIsEncrypted If <b>TRUE</b>, the user name is encrypted. Otherwise, the user name is not encrypted.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-setuser
     */
    SetUser(pbData, cbData, fDataIsEncrypted) {
        result := ComCall(3, this, "ptr", pbData, "uint", cbData, BOOL, fDataIsEncrypted, "HRESULT")
        return result
    }

    /**
     * Sets the password.
     * @param {Integer} pbData Pointer to a buffer that contains the password. If <i>fDataIsEncrypted</i> is <b>FALSE</b>, the buffer is a wide-character string. Otherwise, the buffer contains encrypted data.
     * @param {Integer} cbData Size of <i>pbData</i>, in bytes. If <i>fDataIsEncrypted</i> is <b>FALSE</b>, the size includes the terminating null character.
     * @param {BOOL} fDataIsEncrypted If <b>TRUE</b>, the password is encrypted. Otherwise, the password is not encrypted.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-setpassword
     */
    SetPassword(pbData, cbData, fDataIsEncrypted) {
        result := ComCall(4, this, "ptr", pbData, "uint", cbData, BOOL, fDataIsEncrypted, "HRESULT")
        return result
    }

    /**
     * Retrieves the user name.
     * @remarks
     * If the user name is not available, the method might succeed and set *<i>pcbData</i> to zero.
     * @param {Pointer<Integer>} pcbData On input, specifies the size of the <i>pbData</i> buffer, in bytes. On output, receives the required buffer size. If <i>fEncryptData</i> is <b>FALSE</b>, the size includes the terminating null character.
     * @param {BOOL} fEncryptData If <b>TRUE</b>, the method returns an encrypted string. Otherwise, the method returns an unencrypted string.
     * @returns {Integer} Pointer to a buffer that receives the user name. To find the required buffer size, set this parameter to <b>NULL</b>. If <i>fEncryptData</i> is <b>FALSE</b>, the buffer contains a wide-character string. Otherwise, the buffer contains encrypted data.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-getuser
     */
    GetUser(pcbData, fEncryptData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "char*", &pbData := 0, pcbDataMarshal, pcbData, BOOL, fEncryptData, "HRESULT")
        return pbData
    }

    /**
     * Retrieves the password.
     * @remarks
     * If the password is not available, the method might succeed and set *<i>pcbData</i> to zero.
     * @param {Pointer<Integer>} pcbData On input, specifies the size of the <i>pbData</i> buffer, in bytes. On output, receives the required buffer size. If <i>fEncryptData</i> is <b>FALSE</b>, the size includes the terminating null character.
     * @param {BOOL} fEncryptData If <b>TRUE</b>, the method returns an encrypted string. Otherwise, the method returns an unencrypted string.
     * @returns {Integer} Pointer to a buffer that receives the password. To find the required buffer size, set this parameter to <b>NULL</b>. If <i>fEncryptData</i> is <b>FALSE</b>, the buffer contains a wide-character string. Otherwise, the buffer contains encrypted data.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-getpassword
     */
    GetPassword(pcbData, fEncryptData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "char*", &pbData := 0, pcbDataMarshal, pcbData, BOOL, fEncryptData, "HRESULT")
        return pbData
    }

    /**
     * Queries whether logged-on credentials should be used.
     * @returns {BOOL} Receives a Boolean value. If logged-on credentials should be used, the value is <b>TRUE</b>. Otherwise, the value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-loggedonuser
     */
    LoggedOnUser() {
        result := ComCall(7, this, BOOL.Ptr, &pfLoggedOnUser := 0, "HRESULT")
        return pfLoggedOnUser
    }

    Query(iid) {
        if (IMFNetCredential.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetUser := CallbackCreate(GetMethod(implObj, "SetUser"), flags, 4)
        this.vtbl.SetPassword := CallbackCreate(GetMethod(implObj, "SetPassword"), flags, 4)
        this.vtbl.GetUser := CallbackCreate(GetMethod(implObj, "GetUser"), flags, 4)
        this.vtbl.GetPassword := CallbackCreate(GetMethod(implObj, "GetPassword"), flags, 4)
        this.vtbl.LoggedOnUser := CallbackCreate(GetMethod(implObj, "LoggedOnUser"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetUser)
        CallbackFree(this.vtbl.SetPassword)
        CallbackFree(this.vtbl.GetUser)
        CallbackFree(this.vtbl.GetPassword)
        CallbackFree(this.vtbl.LoggedOnUser)
    }
}
