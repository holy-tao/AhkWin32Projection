#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets and retrieves user-name and password information for authentication purposes.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetcredential
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetCredential extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFNetCredential
     * @type {Guid}
     */
    static IID => Guid("{5b87ef6a-7ed8-434f-ba0e-184fac1628d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUser", "SetPassword", "GetUser", "GetPassword", "LoggedOnUser"]

    /**
     * Sets the user name.
     * @param {Pointer} pbData Pointer to a buffer that contains the user name. If <i>fDataIsEncrypted</i> is <b>FALSE</b>, the buffer is a wide-character string. Otherwise, the buffer contains encrypted data.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredential-setuser
     */
    SetUser(pbData, cbData, fDataIsEncrypted) {
        result := ComCall(3, this, "ptr", pbData, "uint", cbData, "int", fDataIsEncrypted, "HRESULT")
        return result
    }

    /**
     * Sets the password.
     * @param {Pointer} pbData Pointer to a buffer that contains the password. If <i>fDataIsEncrypted</i> is <b>FALSE</b>, the buffer is a wide-character string. Otherwise, the buffer contains encrypted data.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredential-setpassword
     */
    SetPassword(pbData, cbData, fDataIsEncrypted) {
        result := ComCall(4, this, "ptr", pbData, "uint", cbData, "int", fDataIsEncrypted, "HRESULT")
        return result
    }

    /**
     * Retrieves the user name.
     * @param {Pointer<Integer>} pcbData On input, specifies the size of the <i>pbData</i> buffer, in bytes. On output, receives the required buffer size. If <i>fEncryptData</i> is <b>FALSE</b>, the size includes the terminating null character.
     * @param {BOOL} fEncryptData If <b>TRUE</b>, the method returns an encrypted string. Otherwise, the method returns an unencrypted string.
     * @returns {Integer} Pointer to a buffer that receives the user name. To find the required buffer size, set this parameter to <b>NULL</b>. If <i>fEncryptData</i> is <b>FALSE</b>, the buffer contains a wide-character string. Otherwise, the buffer contains encrypted data.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredential-getuser
     */
    GetUser(pcbData, fEncryptData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "char*", &pbData := 0, pcbDataMarshal, pcbData, "int", fEncryptData, "HRESULT")
        return pbData
    }

    /**
     * Retrieves the password.
     * @param {Pointer<Integer>} pcbData On input, specifies the size of the <i>pbData</i> buffer, in bytes. On output, receives the required buffer size. If <i>fEncryptData</i> is <b>FALSE</b>, the size includes the terminating null character.
     * @param {BOOL} fEncryptData If <b>TRUE</b>, the method returns an encrypted string. Otherwise, the method returns an unencrypted string.
     * @returns {Integer} Pointer to a buffer that receives the password. To find the required buffer size, set this parameter to <b>NULL</b>. If <i>fEncryptData</i> is <b>FALSE</b>, the buffer contains a wide-character string. Otherwise, the buffer contains encrypted data.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredential-getpassword
     */
    GetPassword(pcbData, fEncryptData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "char*", &pbData := 0, pcbDataMarshal, pcbData, "int", fEncryptData, "HRESULT")
        return pbData
    }

    /**
     * Queries whether logged-on credentials should be used.
     * @returns {BOOL} Receives a Boolean value. If logged-on credentials should be used, the value is <b>TRUE</b>. Otherwise, the value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredential-loggedonuser
     */
    LoggedOnUser() {
        result := ComCall(7, this, "int*", &pfLoggedOnUser := 0, "HRESULT")
        return pfLoggedOnUser
    }
}
