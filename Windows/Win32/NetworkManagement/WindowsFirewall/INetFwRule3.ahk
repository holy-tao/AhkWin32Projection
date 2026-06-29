#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\INetFwRule2.ahk" { INetFwRule2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Allows an application or service to access all the properties of INetFwRule2 and to provide access to the requirements of app containers.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwrule3
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwRule3 extends INetFwRule2 {
    /**
     * The interface identifier for INetFwRule3
     * @type {Guid}
     */
    static IID := Guid("{b21563ff-d696-4222-ab46-4e89b73ab34a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwRule3 interfaces
    */
    struct Vtbl extends INetFwRule2.Vtbl {
        get_LocalAppPackageId           : IntPtr
        put_LocalAppPackageId           : IntPtr
        get_LocalUserOwner              : IntPtr
        put_LocalUserOwner              : IntPtr
        get_LocalUserAuthorizedList     : IntPtr
        put_LocalUserAuthorizedList     : IntPtr
        get_RemoteUserAuthorizedList    : IntPtr
        put_RemoteUserAuthorizedList    : IntPtr
        get_RemoteMachineAuthorizedList : IntPtr
        put_RemoteMachineAuthorizedList : IntPtr
        get_SecureFlags                 : IntPtr
        put_SecureFlags                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwRule3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    LocalAppPackageId {
        get => this.get_LocalAppPackageId()
        set => this.put_LocalAppPackageId(value)
    }

    /**
     * @type {BSTR} 
     */
    LocalUserOwner {
        get => this.get_LocalUserOwner()
        set => this.put_LocalUserOwner(value)
    }

    /**
     * @type {BSTR} 
     */
    LocalUserAuthorizedList {
        get => this.get_LocalUserAuthorizedList()
        set => this.put_LocalUserAuthorizedList(value)
    }

    /**
     * @type {BSTR} 
     */
    RemoteUserAuthorizedList {
        get => this.get_RemoteUserAuthorizedList()
        set => this.put_RemoteUserAuthorizedList(value)
    }

    /**
     * @type {BSTR} 
     */
    RemoteMachineAuthorizedList {
        get => this.get_RemoteMachineAuthorizedList()
        set => this.put_RemoteMachineAuthorizedList(value)
    }

    /**
     * @type {Integer} 
     */
    SecureFlags {
        get => this.get_SecureFlags()
        set => this.put_SecureFlags(value)
    }

    /**
     * Specifies the package identifier or the app container identifier of a process, whether from a Windows Store app or a desktop app. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-get_localapppackageid
     */
    get_LocalAppPackageId() {
        wszPackageId := BSTR.Owned()
        result := ComCall(45, this, BSTR.Ptr, wszPackageId, "HRESULT")
        return wszPackageId
    }

    /**
     * Specifies the package identifier or the app container identifier of a process, whether from a Windows Store app or a desktop app. (Put)
     * @param {BSTR} wszPackageId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-put_localapppackageid
     */
    put_LocalAppPackageId(wszPackageId) {
        wszPackageId := wszPackageId is String ? BSTR.Alloc(wszPackageId).Value : wszPackageId

        result := ComCall(46, this, BSTR, wszPackageId, "HRESULT")
        return result
    }

    /**
     * Specifies the user security identifier (SID) of the user who is the owner of the rule. (Get)
     * @remarks
     * If this rule does not specify <b>localUserConditions</b>, all the traffic that this rule matches must be destined to or originated from this user.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-get_localuserowner
     */
    get_LocalUserOwner() {
        wszUserOwner := BSTR.Owned()
        result := ComCall(47, this, BSTR.Ptr, wszUserOwner, "HRESULT")
        return wszUserOwner
    }

    /**
     * Specifies the user security identifier (SID) of the user who is the owner of the rule. (Put)
     * @remarks
     * If this rule does not specify <b>localUserConditions</b>, all the traffic that this rule matches must be destined to or originated from this user.
     * @param {BSTR} wszUserOwner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-put_localuserowner
     */
    put_LocalUserOwner(wszUserOwner) {
        wszUserOwner := wszUserOwner is String ? BSTR.Alloc(wszUserOwner).Value : wszUserOwner

        result := ComCall(48, this, BSTR, wszUserOwner, "HRESULT")
        return result
    }

    /**
     * Specifies a list of authorized local users for an app container. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-get_localuserauthorizedlist
     */
    get_LocalUserAuthorizedList() {
        wszUserAuthList := BSTR.Owned()
        result := ComCall(49, this, BSTR.Ptr, wszUserAuthList, "HRESULT")
        return wszUserAuthList
    }

    /**
     * Specifies a list of authorized local users for an app container. (Put)
     * @param {BSTR} wszUserAuthList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-put_localuserauthorizedlist
     */
    put_LocalUserAuthorizedList(wszUserAuthList) {
        wszUserAuthList := wszUserAuthList is String ? BSTR.Alloc(wszUserAuthList).Value : wszUserAuthList

        result := ComCall(50, this, BSTR, wszUserAuthList, "HRESULT")
        return result
    }

    /**
     * Specifies a list of remote users who are authorized to access an app container. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-get_remoteuserauthorizedlist
     */
    get_RemoteUserAuthorizedList() {
        wszUserAuthList := BSTR.Owned()
        result := ComCall(51, this, BSTR.Ptr, wszUserAuthList, "HRESULT")
        return wszUserAuthList
    }

    /**
     * Specifies a list of remote users who are authorized to access an app container. (Put)
     * @param {BSTR} wszUserAuthList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-put_remoteuserauthorizedlist
     */
    put_RemoteUserAuthorizedList(wszUserAuthList) {
        wszUserAuthList := wszUserAuthList is String ? BSTR.Alloc(wszUserAuthList).Value : wszUserAuthList

        result := ComCall(52, this, BSTR, wszUserAuthList, "HRESULT")
        return result
    }

    /**
     * Specifies a list of remote computers which are authorized to access an app container. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-get_remotemachineauthorizedlist
     */
    get_RemoteMachineAuthorizedList() {
        wszUserAuthList := BSTR.Owned()
        result := ComCall(53, this, BSTR.Ptr, wszUserAuthList, "HRESULT")
        return wszUserAuthList
    }

    /**
     * Specifies a list of remote computers which are authorized to access an app container. (Put)
     * @param {BSTR} wszUserAuthList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-put_remotemachineauthorizedlist
     */
    put_RemoteMachineAuthorizedList(wszUserAuthList) {
        wszUserAuthList := wszUserAuthList is String ? BSTR.Alloc(wszUserAuthList).Value : wszUserAuthList

        result := ComCall(54, this, BSTR, wszUserAuthList, "HRESULT")
        return result
    }

    /**
     * Specifies which firewall verifications of security levels provided by IPsec must be guaranteed to allow the collection. The allowed values must correspond to those of the NET_FW_AUTHENTICATE_TYPE enumeration. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-get_secureflags
     */
    get_SecureFlags() {
        result := ComCall(55, this, "int*", &lOptions := 0, "HRESULT")
        return lOptions
    }

    /**
     * Specifies which firewall verifications of security levels provided by IPsec must be guaranteed to allow the collection. The allowed values must correspond to those of the NET_FW_AUTHENTICATE_TYPE enumeration. (Put)
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule3-put_secureflags
     */
    put_SecureFlags(lOptions) {
        result := ComCall(56, this, "int", lOptions, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetFwRule3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LocalAppPackageId := CallbackCreate(GetMethod(implObj, "get_LocalAppPackageId"), flags, 2)
        this.vtbl.put_LocalAppPackageId := CallbackCreate(GetMethod(implObj, "put_LocalAppPackageId"), flags, 2)
        this.vtbl.get_LocalUserOwner := CallbackCreate(GetMethod(implObj, "get_LocalUserOwner"), flags, 2)
        this.vtbl.put_LocalUserOwner := CallbackCreate(GetMethod(implObj, "put_LocalUserOwner"), flags, 2)
        this.vtbl.get_LocalUserAuthorizedList := CallbackCreate(GetMethod(implObj, "get_LocalUserAuthorizedList"), flags, 2)
        this.vtbl.put_LocalUserAuthorizedList := CallbackCreate(GetMethod(implObj, "put_LocalUserAuthorizedList"), flags, 2)
        this.vtbl.get_RemoteUserAuthorizedList := CallbackCreate(GetMethod(implObj, "get_RemoteUserAuthorizedList"), flags, 2)
        this.vtbl.put_RemoteUserAuthorizedList := CallbackCreate(GetMethod(implObj, "put_RemoteUserAuthorizedList"), flags, 2)
        this.vtbl.get_RemoteMachineAuthorizedList := CallbackCreate(GetMethod(implObj, "get_RemoteMachineAuthorizedList"), flags, 2)
        this.vtbl.put_RemoteMachineAuthorizedList := CallbackCreate(GetMethod(implObj, "put_RemoteMachineAuthorizedList"), flags, 2)
        this.vtbl.get_SecureFlags := CallbackCreate(GetMethod(implObj, "get_SecureFlags"), flags, 2)
        this.vtbl.put_SecureFlags := CallbackCreate(GetMethod(implObj, "put_SecureFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LocalAppPackageId)
        CallbackFree(this.vtbl.put_LocalAppPackageId)
        CallbackFree(this.vtbl.get_LocalUserOwner)
        CallbackFree(this.vtbl.put_LocalUserOwner)
        CallbackFree(this.vtbl.get_LocalUserAuthorizedList)
        CallbackFree(this.vtbl.put_LocalUserAuthorizedList)
        CallbackFree(this.vtbl.get_RemoteUserAuthorizedList)
        CallbackFree(this.vtbl.put_RemoteUserAuthorizedList)
        CallbackFree(this.vtbl.get_RemoteMachineAuthorizedList)
        CallbackFree(this.vtbl.put_RemoteMachineAuthorizedList)
        CallbackFree(this.vtbl.get_SecureFlags)
        CallbackFree(this.vtbl.put_SecureFlags)
    }
}
