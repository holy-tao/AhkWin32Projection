#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INetFwRule2.ahk

/**
 * Allows an application or service to access all the properties of INetFwRule2 and to provide access to the requirements of app containers.
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwrule3
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwRule3 extends INetFwRule2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwRule3
     * @type {Guid}
     */
    static IID => Guid("{b21563ff-d696-4222-ab46-4e89b73ab34a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 45

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalAppPackageId", "put_LocalAppPackageId", "get_LocalUserOwner", "put_LocalUserOwner", "get_LocalUserAuthorizedList", "put_LocalUserAuthorizedList", "get_RemoteUserAuthorizedList", "put_RemoteUserAuthorizedList", "get_RemoteMachineAuthorizedList", "put_RemoteMachineAuthorizedList", "get_SecureFlags", "put_SecureFlags"]

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
     * Specifies the package identifier or the app container identifier of a process, whether from a Windows Store app or a desktop app.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-get_localapppackageid
     */
    get_LocalAppPackageId() {
        wszPackageId := BSTR()
        result := ComCall(45, this, "ptr", wszPackageId, "HRESULT")
        return wszPackageId
    }

    /**
     * Specifies the package identifier or the app container identifier of a process, whether from a Windows Store app or a desktop app.
     * @param {BSTR} wszPackageId 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-put_localapppackageid
     */
    put_LocalAppPackageId(wszPackageId) {
        wszPackageId := wszPackageId is String ? BSTR.Alloc(wszPackageId).Value : wszPackageId

        result := ComCall(46, this, "ptr", wszPackageId, "HRESULT")
        return result
    }

    /**
     * Specifies the user security identifier (SID) of the user who is the owner of the rule.
     * @remarks
     * 
     * If this rule does not specify <b>localUserConditions</b>, all the traffic that this rule matches must be destined to or originated from this user.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-get_localuserowner
     */
    get_LocalUserOwner() {
        wszUserOwner := BSTR()
        result := ComCall(47, this, "ptr", wszUserOwner, "HRESULT")
        return wszUserOwner
    }

    /**
     * Specifies the user security identifier (SID) of the user who is the owner of the rule.
     * @remarks
     * 
     * If this rule does not specify <b>localUserConditions</b>, all the traffic that this rule matches must be destined to or originated from this user.
     * 
     * 
     * @param {BSTR} wszUserOwner 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-put_localuserowner
     */
    put_LocalUserOwner(wszUserOwner) {
        wszUserOwner := wszUserOwner is String ? BSTR.Alloc(wszUserOwner).Value : wszUserOwner

        result := ComCall(48, this, "ptr", wszUserOwner, "HRESULT")
        return result
    }

    /**
     * Specifies a list of authorized local users for an app container.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-get_localuserauthorizedlist
     */
    get_LocalUserAuthorizedList() {
        wszUserAuthList := BSTR()
        result := ComCall(49, this, "ptr", wszUserAuthList, "HRESULT")
        return wszUserAuthList
    }

    /**
     * Specifies a list of authorized local users for an app container.
     * @param {BSTR} wszUserAuthList 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-put_localuserauthorizedlist
     */
    put_LocalUserAuthorizedList(wszUserAuthList) {
        wszUserAuthList := wszUserAuthList is String ? BSTR.Alloc(wszUserAuthList).Value : wszUserAuthList

        result := ComCall(50, this, "ptr", wszUserAuthList, "HRESULT")
        return result
    }

    /**
     * Specifies a list of remote users who are authorized to access an app container.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-get_remoteuserauthorizedlist
     */
    get_RemoteUserAuthorizedList() {
        wszUserAuthList := BSTR()
        result := ComCall(51, this, "ptr", wszUserAuthList, "HRESULT")
        return wszUserAuthList
    }

    /**
     * Specifies a list of remote users who are authorized to access an app container.
     * @param {BSTR} wszUserAuthList 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-put_remoteuserauthorizedlist
     */
    put_RemoteUserAuthorizedList(wszUserAuthList) {
        wszUserAuthList := wszUserAuthList is String ? BSTR.Alloc(wszUserAuthList).Value : wszUserAuthList

        result := ComCall(52, this, "ptr", wszUserAuthList, "HRESULT")
        return result
    }

    /**
     * Specifies a list of remote computers which are authorized to access an app container.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-get_remotemachineauthorizedlist
     */
    get_RemoteMachineAuthorizedList() {
        wszUserAuthList := BSTR()
        result := ComCall(53, this, "ptr", wszUserAuthList, "HRESULT")
        return wszUserAuthList
    }

    /**
     * Specifies a list of remote computers which are authorized to access an app container.
     * @param {BSTR} wszUserAuthList 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-put_remotemachineauthorizedlist
     */
    put_RemoteMachineAuthorizedList(wszUserAuthList) {
        wszUserAuthList := wszUserAuthList is String ? BSTR.Alloc(wszUserAuthList).Value : wszUserAuthList

        result := ComCall(54, this, "ptr", wszUserAuthList, "HRESULT")
        return result
    }

    /**
     * Specifies which firewall verifications of security levels provided by IPsec must be guaranteed to allow the collection. The allowed values must correspond to those of the NET_FW_AUTHENTICATE_TYPE enumeration.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-get_secureflags
     */
    get_SecureFlags() {
        result := ComCall(55, this, "int*", &lOptions := 0, "HRESULT")
        return lOptions
    }

    /**
     * Specifies which firewall verifications of security levels provided by IPsec must be guaranteed to allow the collection. The allowed values must correspond to those of the NET_FW_AUTHENTICATE_TYPE enumeration.
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule3-put_secureflags
     */
    put_SecureFlags(lOptions) {
        result := ComCall(56, this, "int", lOptions, "HRESULT")
        return result
    }
}
