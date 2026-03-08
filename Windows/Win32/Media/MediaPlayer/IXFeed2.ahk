#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\IXFeed.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeed2 extends IXFeed{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeed2
     * @type {Guid}
     */
    static IID => Guid("{ce528e77-3716-4eb7-956d-f5e37502e12a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 47

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemByEffectiveId", "LastItemDownloadTime", "Username", "Password", "SetCredentials", "ClearCredentials"]

    /**
     * 
     * @param {Integer} uiEffectiveId 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetItemByEffectiveId(uiEffectiveId, riid) {
        result := ComCall(47, this, "uint", uiEffectiveId, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastItemDownloadTime() {
        pstLastItemDownloadTime := SYSTEMTIME()
        result := ComCall(48, this, "ptr", pstLastItemDownloadTime, "HRESULT")
        return pstLastItemDownloadTime
    }

    /**
     * Learn about the Username element. This element captures the user name to be sent in the EAP-Identity response.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/eaphost/eaptlsuserpropertiesv1schema-username-element
     */
    Username() {
        result := ComCall(49, this, "ptr*", &ppszUsername := 0, "HRESULT")
        return ppszUsername
    }

    /**
     * Learn about the Password (EapType) element. This element identifies the password of the user or machine being authenticated.
     * @remarks
     * If the **Password (EapType)** element is not present, the password hash is obtained from winlogon. This element is optional.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/eaphost/mschapv2userpropertiesv1schema-password-eaptype-element
     */
    Password() {
        result := ComCall(50, this, "ptr*", &ppszPassword := 0, "HRESULT")
        return ppszPassword
    }

    /**
     * Sets the attributes of a credential, such as the name associated with the credential. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The sspi.h header defines SetCredentialsAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} pszUsername 
     * @param {PWSTR} pszPassword 
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
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-setcredentialsattributesa
     */
    SetCredentials(pszUsername, pszPassword) {
        pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(51, this, "ptr", pszUsername, "ptr", pszPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearCredentials() {
        result := ComCall(52, this, "HRESULT")
        return result
    }
}
