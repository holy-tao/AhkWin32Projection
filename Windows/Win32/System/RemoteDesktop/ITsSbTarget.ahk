#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\TARGET_STATE.ahk" { TARGET_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbTargetPropertySet.ahk" { ITsSbTargetPropertySet }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\TSSD_ConnectionPoint.ahk" { TSSD_ConnectionPoint }

/**
 * Exposes properties that store configuration and state information about a target.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbtarget
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbTarget extends IUnknown {
    /**
     * The interface identifier for ITsSbTarget
     * @type {Guid}
     */
    static IID := Guid("{16616ecc-272d-411d-b324-126893033856}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_TargetName            : IntPtr
        put_TargetName            : IntPtr
        get_FarmName              : IntPtr
        put_FarmName              : IntPtr
        get_TargetFQDN            : IntPtr
        put_TargetFQDN            : IntPtr
        get_TargetNetbios         : IntPtr
        put_TargetNetbios         : IntPtr
        get_IpAddresses           : IntPtr
        put_IpAddresses           : IntPtr
        get_TargetState           : IntPtr
        put_TargetState           : IntPtr
        get_TargetPropertySet     : IntPtr
        put_TargetPropertySet     : IntPtr
        get_EnvironmentName       : IntPtr
        put_EnvironmentName       : IntPtr
        get_NumSessions           : IntPtr
        get_NumPendingConnections : IntPtr
        get_TargetLoad            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

    /**
     * @type {BSTR} 
     */
    FarmName {
        get => this.get_FarmName()
        set => this.put_FarmName(value)
    }

    /**
     * @type {BSTR} 
     */
    TargetFQDN {
        get => this.get_TargetFQDN()
        set => this.put_TargetFQDN(value)
    }

    /**
     * @type {BSTR} 
     */
    TargetNetbios {
        get => this.get_TargetNetbios()
        set => this.put_TargetNetbios(value)
    }

    /**
     * @type {TARGET_STATE} 
     */
    TargetState {
        get => this.get_TargetState()
        set => this.put_TargetState(value)
    }

    /**
     * @type {ITsSbTargetPropertySet} 
     */
    TargetPropertySet {
        get => this.get_TargetPropertySet()
        set => this.put_TargetPropertySet(value)
    }

    /**
     * @type {BSTR} 
     */
    EnvironmentName {
        get => this.get_EnvironmentName()
        set => this.put_EnvironmentName(value)
    }

    /**
     * @type {Integer} 
     */
    NumSessions {
        get => this.get_NumSessions()
    }

    /**
     * @type {Integer} 
     */
    NumPendingConnections {
        get => this.get_NumPendingConnections()
    }

    /**
     * @type {Integer} 
     */
    TargetLoad {
        get => this.get_TargetLoad()
    }

    /**
     * Specifies or retrieves the name of the target. (Get)
     * @remarks
     * This property was read-only prior to Windows Server 2012.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetname
     */
    get_TargetName() {
        pVal := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Specifies or retrieves the name of the target. (Put)
     * @remarks
     * This property was read-only prior to Windows Server 2012.
     * @param {BSTR} _Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetname
     */
    put_TargetName(_Val) {
        _Val := _Val is String ? BSTR.Alloc(_Val).Value : _Val

        result := ComCall(4, this, BSTR, _Val, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the name of the farm to which this target is joined. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_farmname
     */
    get_FarmName() {
        pVal := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves or specifies the name of the farm to which this target is joined. (Put)
     * @param {BSTR} _Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_farmname
     */
    put_FarmName(_Val) {
        _Val := _Val is String ? BSTR.Alloc(_Val).Value : _Val

        result := ComCall(6, this, BSTR, _Val, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the fully qualified domain name of the target. (ITsSbTargetEx.get_TargetFQDN)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetfqdn
     */
    get_TargetFQDN() {
        TargetFqdnName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, TargetFqdnName, "HRESULT")
        return TargetFqdnName
    }

    /**
     * Retrieves or specifies the fully qualified domain name of the target. (ITsSbTargetEx.put_TargetFQDN)
     * @param {BSTR} _Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetfqdn
     */
    put_TargetFQDN(_Val) {
        _Val := _Val is String ? BSTR.Alloc(_Val).Value : _Val

        result := ComCall(8, this, BSTR, _Val, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the NetBIOS name of the target. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetnetbios
     */
    get_TargetNetbios() {
        TargetNetbiosName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, TargetNetbiosName, "HRESULT")
        return TargetNetbiosName
    }

    /**
     * Retrieves or specifies the NetBIOS name of the target. (Put)
     * @param {BSTR} _Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetnetbios
     */
    put_TargetNetbios(_Val) {
        _Val := _Val is String ? BSTR.Alloc(_Val).Value : _Val

        result := ComCall(10, this, BSTR, _Val, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the external IP addresses of the target. (ITsSbTargetEx.get_IpAddresses)
     * @remarks
     * This property was formerly known as <b>TargetExternalIpAddresses</b> in Windows Server 2008 R2.
     * 
     * If the number of external IP addresses is unknown, you can call this method with <i>sockaddr</i> set to <b>NULL</b>. The method will then return, in the <i>numAddresses</i> parameter, the number of <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ns-sessdirpublictypes-tssd_connectionpoint">TSSD_ConnectionPoint</a> structures necessary to receive all the external IP addresses. Allocate the array for <i>sockaddr</i> based on this number, and then call the method again, setting <i>sockaddr</i> to the newly allocated array and <i>numAddresses</i> to the number returned by the first call.
     * @param {Pointer<Integer>} numAddresses 
     * @returns {TSSD_ConnectionPoint} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_ipaddresses
     */
    get_IpAddresses(numAddresses) {
        numAddressesMarshal := numAddresses is VarRef ? "uint*" : "ptr"

        _SOCKADDR := TSSD_ConnectionPoint()
        result := ComCall(11, this, TSSD_ConnectionPoint.Ptr, _SOCKADDR, numAddressesMarshal, numAddresses, "HRESULT")
        return _SOCKADDR
    }

    /**
     * Retrieves or specifies the external IP addresses of the target. (ITsSbTargetEx.put_IpAddresses)
     * @remarks
     * This property was formerly known as <b>TargetExternalIpAddresses</b> in Windows Server 2008 R2.
     * 
     * If the number of external IP addresses is unknown, you can call this method with <i>sockaddr</i> set to <b>NULL</b>. The method will then return, in the <i>numAddresses</i> parameter, the number of <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ns-sessdirpublictypes-tssd_connectionpoint">TSSD_ConnectionPoint</a> structures necessary to receive all the external IP addresses. Allocate the array for <i>sockaddr</i> based on this number, and then call the method again, setting <i>sockaddr</i> to the newly allocated array and <i>numAddresses</i> to the number returned by the first call.
     * @param {Pointer<TSSD_ConnectionPoint>} _SOCKADDR 
     * @param {Integer} numAddresses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_ipaddresses
     */
    put_IpAddresses(_SOCKADDR, numAddresses) {
        result := ComCall(12, this, TSSD_ConnectionPoint.Ptr, _SOCKADDR, "uint", numAddresses, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the target state. (ITsSbTargetEx.get_TargetState)
     * @returns {TARGET_STATE} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetstate
     */
    get_TargetState() {
        result := ComCall(13, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Retrieves or specifies the target state. (ITsSbTargetEx.put_TargetState)
     * @param {TARGET_STATE} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetstate
     */
    put_TargetState(State) {
        result := ComCall(14, this, TARGET_STATE, State, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the set of properties for the target. (ITsSbTargetEx.get_TargetPropertySet)
     * @returns {ITsSbTargetPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetpropertyset
     */
    get_TargetPropertySet() {
        result := ComCall(15, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbTargetPropertySet(ppPropertySet)
    }

    /**
     * Retrieves or specifies the set of properties for the target. (ITsSbTargetEx.put_TargetPropertySet)
     * @param {ITsSbTargetPropertySet} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetpropertyset
     */
    put_TargetPropertySet(pVal) {
        result := ComCall(16, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the name of the environment associated with the target. (ITsSbTargetEx.get_EnvironmentName)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_environmentname
     */
    get_EnvironmentName() {
        pVal := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves or specifies the name of the environment associated with the target. (ITsSbTargetEx.put_EnvironmentName)
     * @param {BSTR} _Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_environmentname
     */
    put_EnvironmentName(_Val) {
        _Val := _Val is String ? BSTR.Alloc(_Val).Value : _Val

        result := ComCall(18, this, BSTR, _Val, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of sessions maintained by broker for the target.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_numsessions
     */
    get_NumSessions() {
        result := ComCall(19, this, "uint*", &pNumSessions := 0, "HRESULT")
        return pNumSessions
    }

    /**
     * Retrieves the number of pending user connections for the target.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_numpendingconnections
     */
    get_NumPendingConnections() {
        result := ComCall(20, this, "uint*", &pNumPendingConnections := 0, "HRESULT")
        return pNumPendingConnections
    }

    /**
     * Retrieves the relative load on a target.
     * @remarks
     * The weight of a pending session relative to an active session can be changed by setting the value of the <i>LB_ConnectionEstablishmentPenalty</i> parameter for the Connection Broker. This parameter is located under the <b>HKLM\System\CurrentControlSet\Services\Tssdis\Parameters</b> registry key. The default value of 1 specifies that pending sessions have the same weight as active sessions.
     * 
     * This property is available on Windows Server 2012 R2 with <a href="https://support.microsoft.com/help/3091411/user-connection-fails-when-many-connections-are-made-to-windows-server">KB3091411</a> installed in the <a href="https://docs.microsoft.com/windows/desktop/TermServ/itssbtargetex">ITsSbTargetEx</a> interface.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetload
     */
    get_TargetLoad() {
        result := ComCall(21, this, "uint*", &pTargetLoad := 0, "HRESULT")
        return pTargetLoad
    }

    Query(iid) {
        if (ITsSbTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TargetName := CallbackCreate(GetMethod(implObj, "get_TargetName"), flags, 2)
        this.vtbl.put_TargetName := CallbackCreate(GetMethod(implObj, "put_TargetName"), flags, 2)
        this.vtbl.get_FarmName := CallbackCreate(GetMethod(implObj, "get_FarmName"), flags, 2)
        this.vtbl.put_FarmName := CallbackCreate(GetMethod(implObj, "put_FarmName"), flags, 2)
        this.vtbl.get_TargetFQDN := CallbackCreate(GetMethod(implObj, "get_TargetFQDN"), flags, 2)
        this.vtbl.put_TargetFQDN := CallbackCreate(GetMethod(implObj, "put_TargetFQDN"), flags, 2)
        this.vtbl.get_TargetNetbios := CallbackCreate(GetMethod(implObj, "get_TargetNetbios"), flags, 2)
        this.vtbl.put_TargetNetbios := CallbackCreate(GetMethod(implObj, "put_TargetNetbios"), flags, 2)
        this.vtbl.get_IpAddresses := CallbackCreate(GetMethod(implObj, "get_IpAddresses"), flags, 3)
        this.vtbl.put_IpAddresses := CallbackCreate(GetMethod(implObj, "put_IpAddresses"), flags, 3)
        this.vtbl.get_TargetState := CallbackCreate(GetMethod(implObj, "get_TargetState"), flags, 2)
        this.vtbl.put_TargetState := CallbackCreate(GetMethod(implObj, "put_TargetState"), flags, 2)
        this.vtbl.get_TargetPropertySet := CallbackCreate(GetMethod(implObj, "get_TargetPropertySet"), flags, 2)
        this.vtbl.put_TargetPropertySet := CallbackCreate(GetMethod(implObj, "put_TargetPropertySet"), flags, 2)
        this.vtbl.get_EnvironmentName := CallbackCreate(GetMethod(implObj, "get_EnvironmentName"), flags, 2)
        this.vtbl.put_EnvironmentName := CallbackCreate(GetMethod(implObj, "put_EnvironmentName"), flags, 2)
        this.vtbl.get_NumSessions := CallbackCreate(GetMethod(implObj, "get_NumSessions"), flags, 2)
        this.vtbl.get_NumPendingConnections := CallbackCreate(GetMethod(implObj, "get_NumPendingConnections"), flags, 2)
        this.vtbl.get_TargetLoad := CallbackCreate(GetMethod(implObj, "get_TargetLoad"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TargetName)
        CallbackFree(this.vtbl.put_TargetName)
        CallbackFree(this.vtbl.get_FarmName)
        CallbackFree(this.vtbl.put_FarmName)
        CallbackFree(this.vtbl.get_TargetFQDN)
        CallbackFree(this.vtbl.put_TargetFQDN)
        CallbackFree(this.vtbl.get_TargetNetbios)
        CallbackFree(this.vtbl.put_TargetNetbios)
        CallbackFree(this.vtbl.get_IpAddresses)
        CallbackFree(this.vtbl.put_IpAddresses)
        CallbackFree(this.vtbl.get_TargetState)
        CallbackFree(this.vtbl.put_TargetState)
        CallbackFree(this.vtbl.get_TargetPropertySet)
        CallbackFree(this.vtbl.put_TargetPropertySet)
        CallbackFree(this.vtbl.get_EnvironmentName)
        CallbackFree(this.vtbl.put_EnvironmentName)
        CallbackFree(this.vtbl.get_NumSessions)
        CallbackFree(this.vtbl.get_NumPendingConnections)
        CallbackFree(this.vtbl.get_TargetLoad)
    }
}
