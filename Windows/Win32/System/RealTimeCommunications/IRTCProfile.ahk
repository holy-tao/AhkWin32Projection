#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\RTC_REGISTRATION_STATE.ahk" { RTC_REGISTRATION_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\RTC_PROVIDER_URI.ahk" { RTC_PROVIDER_URI }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCProfile extends IUnknown {
    /**
     * The interface identifier for IRTCProfile
     * @type {Guid}
     */
    static IID := Guid("{d07eca9e-4062-4dd4-9e7d-722a49ba7303}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCProfile interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Key                 : IntPtr
        get_Name                : IntPtr
        get_XML                 : IntPtr
        get_ProviderName        : IntPtr
        get_ProviderURI         : IntPtr
        get_ProviderData        : IntPtr
        get_ClientName          : IntPtr
        get_ClientBanner        : IntPtr
        get_ClientMinVer        : IntPtr
        get_ClientCurVer        : IntPtr
        get_ClientUpdateURI     : IntPtr
        get_ClientData          : IntPtr
        get_UserURI             : IntPtr
        get_UserName            : IntPtr
        get_UserAccount         : IntPtr
        SetCredentials          : IntPtr
        get_SessionCapabilities : IntPtr
        get_State               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCProfile.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {RTC_REGISTRATION_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Key() {
        pbstrKey := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrKey, "HRESULT")
        return pbstrKey
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_XML() {
        pbstrXML := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrXML, "HRESULT")
        return pbstrXML
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProviderName() {
        pbstrName := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {RTC_PROVIDER_URI} enURI 
     * @returns {BSTR} 
     */
    get_ProviderURI(enURI) {
        pbstrURI := BSTR.Owned()
        result := ComCall(7, this, RTC_PROVIDER_URI, enURI, BSTR.Ptr, pbstrURI, "HRESULT")
        return pbstrURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProviderData() {
        pbstrData := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrData, "HRESULT")
        return pbstrData
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientName() {
        pbstrName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ClientBanner() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pfBanner := 0, "HRESULT")
        return pfBanner
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientMinVer() {
        pbstrMinVer := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrMinVer, "HRESULT")
        return pbstrMinVer
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientCurVer() {
        pbstrCurVer := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrCurVer, "HRESULT")
        return pbstrCurVer
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientUpdateURI() {
        pbstrUpdateURI := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrUpdateURI, "HRESULT")
        return pbstrUpdateURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClientData() {
        pbstrData := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrData, "HRESULT")
        return pbstrData
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserURI() {
        pbstrUserURI := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstrUserURI, "HRESULT")
        return pbstrUserURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserName() {
        pbstrUserName := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pbstrUserName, "HRESULT")
        return pbstrUserName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserAccount() {
        pbstrUserAccount := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstrUserAccount, "HRESULT")
        return pbstrUserAccount
    }

    /**
     * 
     * @param {BSTR} bstrUserURI 
     * @param {BSTR} bstrUserAccount 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     */
    SetCredentials(bstrUserURI, bstrUserAccount, bstrPassword) {
        bstrUserURI := bstrUserURI is String ? BSTR.Alloc(bstrUserURI).Value : bstrUserURI
        bstrUserAccount := bstrUserAccount is String ? BSTR.Alloc(bstrUserAccount).Value : bstrUserAccount
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(18, this, BSTR, bstrUserURI, BSTR, bstrUserAccount, BSTR, bstrPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionCapabilities() {
        result := ComCall(19, this, "int*", &plSupportedSessions := 0, "HRESULT")
        return plSupportedSessions
    }

    /**
     * 
     * @returns {RTC_REGISTRATION_STATE} 
     */
    get_State() {
        result := ComCall(20, this, "int*", &penState := 0, "HRESULT")
        return penState
    }

    Query(iid) {
        if (IRTCProfile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Key := CallbackCreate(GetMethod(implObj, "get_Key"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_XML := CallbackCreate(GetMethod(implObj, "get_XML"), flags, 2)
        this.vtbl.get_ProviderName := CallbackCreate(GetMethod(implObj, "get_ProviderName"), flags, 2)
        this.vtbl.get_ProviderURI := CallbackCreate(GetMethod(implObj, "get_ProviderURI"), flags, 3)
        this.vtbl.get_ProviderData := CallbackCreate(GetMethod(implObj, "get_ProviderData"), flags, 2)
        this.vtbl.get_ClientName := CallbackCreate(GetMethod(implObj, "get_ClientName"), flags, 2)
        this.vtbl.get_ClientBanner := CallbackCreate(GetMethod(implObj, "get_ClientBanner"), flags, 2)
        this.vtbl.get_ClientMinVer := CallbackCreate(GetMethod(implObj, "get_ClientMinVer"), flags, 2)
        this.vtbl.get_ClientCurVer := CallbackCreate(GetMethod(implObj, "get_ClientCurVer"), flags, 2)
        this.vtbl.get_ClientUpdateURI := CallbackCreate(GetMethod(implObj, "get_ClientUpdateURI"), flags, 2)
        this.vtbl.get_ClientData := CallbackCreate(GetMethod(implObj, "get_ClientData"), flags, 2)
        this.vtbl.get_UserURI := CallbackCreate(GetMethod(implObj, "get_UserURI"), flags, 2)
        this.vtbl.get_UserName := CallbackCreate(GetMethod(implObj, "get_UserName"), flags, 2)
        this.vtbl.get_UserAccount := CallbackCreate(GetMethod(implObj, "get_UserAccount"), flags, 2)
        this.vtbl.SetCredentials := CallbackCreate(GetMethod(implObj, "SetCredentials"), flags, 4)
        this.vtbl.get_SessionCapabilities := CallbackCreate(GetMethod(implObj, "get_SessionCapabilities"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Key)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_XML)
        CallbackFree(this.vtbl.get_ProviderName)
        CallbackFree(this.vtbl.get_ProviderURI)
        CallbackFree(this.vtbl.get_ProviderData)
        CallbackFree(this.vtbl.get_ClientName)
        CallbackFree(this.vtbl.get_ClientBanner)
        CallbackFree(this.vtbl.get_ClientMinVer)
        CallbackFree(this.vtbl.get_ClientCurVer)
        CallbackFree(this.vtbl.get_ClientUpdateURI)
        CallbackFree(this.vtbl.get_ClientData)
        CallbackFree(this.vtbl.get_UserURI)
        CallbackFree(this.vtbl.get_UserName)
        CallbackFree(this.vtbl.get_UserAccount)
        CallbackFree(this.vtbl.SetCredentials)
        CallbackFree(this.vtbl.get_SessionCapabilities)
        CallbackFree(this.vtbl.get_State)
    }
}
