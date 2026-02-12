#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCProfile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCProfile
     * @type {Guid}
     */
    static IID => Guid("{d07eca9e-4062-4dd4-9e7d-722a49ba7303}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Key", "get_Name", "get_XML", "get_ProviderName", "get_ProviderURI", "get_ProviderData", "get_ClientName", "get_ClientBanner", "get_ClientMinVer", "get_ClientCurVer", "get_ClientUpdateURI", "get_ClientData", "get_UserURI", "get_UserName", "get_UserAccount", "SetCredentials", "get_SessionCapabilities", "get_State"]

    /**
     * @type {BSTR} 
     */
    Key {
        get => this.get_Key()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    XML {
        get => this.get_XML()
    }

    /**
     * @type {BSTR} 
     */
    ProviderName {
        get => this.get_ProviderName()
    }

    /**
     * @type {BSTR} 
     */
    ProviderData {
        get => this.get_ProviderData()
    }

    /**
     * @type {BSTR} 
     */
    ClientName {
        get => this.get_ClientName()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ClientBanner {
        get => this.get_ClientBanner()
    }

    /**
     * @type {BSTR} 
     */
    ClientMinVer {
        get => this.get_ClientMinVer()
    }

    /**
     * @type {BSTR} 
     */
    ClientCurVer {
        get => this.get_ClientCurVer()
    }

    /**
     * @type {BSTR} 
     */
    ClientUpdateURI {
        get => this.get_ClientUpdateURI()
    }

    /**
     * @type {BSTR} 
     */
    ClientData {
        get => this.get_ClientData()
    }

    /**
     * @type {BSTR} 
     */
    UserURI {
        get => this.get_UserURI()
    }

    /**
     * @type {BSTR} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * @type {BSTR} 
     */
    UserAccount {
        get => this.get_UserAccount()
    }

    /**
     * @type {Integer} 
     */
    SessionCapabilities {
        get => this.get_SessionCapabilities()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Key() {
        pbstrKey := BSTR()
        result := ComCall(3, this, "ptr", pbstrKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrKey
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(4, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_XML() {
        pbstrXML := BSTR()
        result := ComCall(5, this, "ptr", pbstrXML, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrXML
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProviderName() {
        pbstrName := BSTR()
        result := ComCall(6, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * 
     * @param {Integer} enURI 
     * @returns {BSTR} 
     */
    get_ProviderURI(enURI) {
        pbstrURI := BSTR()
        result := ComCall(7, this, "int", enURI, "ptr", pbstrURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProviderData() {
        pbstrData := BSTR()
        result := ComCall(8, this, "ptr", pbstrData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrData
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientName() {
        pbstrName := BSTR()
        result := ComCall(9, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ClientBanner() {
        result := ComCall(10, this, "short*", &pfBanner := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfBanner
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientMinVer() {
        pbstrMinVer := BSTR()
        result := ComCall(11, this, "ptr", pbstrMinVer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrMinVer
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientCurVer() {
        pbstrCurVer := BSTR()
        result := ComCall(12, this, "ptr", pbstrCurVer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrCurVer
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientUpdateURI() {
        pbstrUpdateURI := BSTR()
        result := ComCall(13, this, "ptr", pbstrUpdateURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrUpdateURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientData() {
        pbstrData := BSTR()
        result := ComCall(14, this, "ptr", pbstrData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrData
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserURI() {
        pbstrUserURI := BSTR()
        result := ComCall(15, this, "ptr", pbstrUserURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrUserURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserName() {
        pbstrUserName := BSTR()
        result := ComCall(16, this, "ptr", pbstrUserName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrUserName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserAccount() {
        pbstrUserAccount := BSTR()
        result := ComCall(17, this, "ptr", pbstrUserAccount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrUserAccount
    }

    /**
     * Sets the attributes of a credential, such as the name associated with the credential. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The sspi.h header defines SetCredentialsAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {BSTR} bstrUserURI 
     * @param {BSTR} bstrUserAccount 
     * @param {BSTR} bstrPassword 
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
    SetCredentials(bstrUserURI, bstrUserAccount, bstrPassword) {
        if(bstrUserURI is String) {
            pin := BSTR.Alloc(bstrUserURI)
            bstrUserURI := pin.Value
        }
        if(bstrUserAccount is String) {
            pin := BSTR.Alloc(bstrUserAccount)
            bstrUserAccount := pin.Value
        }
        if(bstrPassword is String) {
            pin := BSTR.Alloc(bstrPassword)
            bstrPassword := pin.Value
        }

        result := ComCall(18, this, "ptr", bstrUserURI, "ptr", bstrUserAccount, "ptr", bstrPassword, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionCapabilities() {
        result := ComCall(19, this, "int*", &plSupportedSessions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plSupportedSessions
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(20, this, "int*", &penState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return penState
    }
}
