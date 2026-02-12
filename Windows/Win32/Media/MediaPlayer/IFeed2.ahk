#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IFeed.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeed2 extends IFeed{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeed2
     * @type {Guid}
     */
    static IID => Guid("{33f2ea09-1398-4ab9-b6a4-f94b49d0a42e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 51

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemByEffectiveId", "get_LastItemDownloadTime", "get_Username", "get_Password", "SetCredentials", "ClearCredentials"]

    /**
     * @type {Float} 
     */
    LastItemDownloadTime {
        get => this.get_LastItemDownloadTime()
    }

    /**
     * @type {BSTR} 
     */
    Username {
        get => this.get_Username()
    }

    /**
     * @type {BSTR} 
     */
    Password {
        get => this.get_Password()
    }

    /**
     * 
     * @param {Integer} itemEffectiveId 
     * @returns {IDispatch} 
     */
    GetItemByEffectiveId(itemEffectiveId) {
        result := ComCall(51, this, "int", itemEffectiveId, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastItemDownloadTime() {
        result := ComCall(52, this, "double*", &lastItemDownloadTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lastItemDownloadTime
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Username() {
        username := BSTR()
        result := ComCall(53, this, "ptr", username, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return username
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Password() {
        password := BSTR()
        result := ComCall(54, this, "ptr", password, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return password
    }

    /**
     * Sets the attributes of a credential, such as the name associated with the credential. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The sspi.h header defines SetCredentialsAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {BSTR} username 
     * @param {BSTR} password 
     * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
     * 
     * If the function fails, the return value may be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> is not supported by Schannel. This return value will only be returned when the Schannel SSP is being used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to complete the request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/sspi/nf-sspi-setcredentialsattributesw
     */
    SetCredentials(username, password) {
        if(username is String) {
            pin := BSTR.Alloc(username)
            username := pin.Value
        }
        if(password is String) {
            pin := BSTR.Alloc(password)
            password := pin.Value
        }

        result := ComCall(55, this, "ptr", username, "ptr", password, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearCredentials() {
        result := ComCall(56, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
