#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\TSSD_ConnectionPoint.ahk
#Include .\ITsSbTargetPropertySet.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes properties that store configuration and state information about a target.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbtarget
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbTarget
     * @type {Guid}
     */
    static IID => Guid("{16616ecc-272d-411d-b324-126893033856}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetName", "put_TargetName", "get_FarmName", "put_FarmName", "get_TargetFQDN", "put_TargetFQDN", "get_TargetNetbios", "put_TargetNetbios", "get_IpAddresses", "put_IpAddresses", "get_TargetState", "put_TargetState", "get_TargetPropertySet", "put_TargetPropertySet", "get_EnvironmentName", "put_EnvironmentName", "get_NumSessions", "get_NumPendingConnections", "get_TargetLoad"]

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
     * @type {Integer} 
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
     * Specifies or retrieves the name of the target.
     * @remarks
     * 
     * This property was read-only prior to Windows Server 2012.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_targetname
     */
    get_TargetName() {
        pVal := BSTR()
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Specifies or retrieves the name of the target.
     * @remarks
     * 
     * This property was read-only prior to Windows Server 2012.
     * 
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-put_targetname
     */
    put_TargetName(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(4, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the name of the farm to which this target is joined.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_farmname
     */
    get_FarmName() {
        pVal := BSTR()
        result := ComCall(5, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves or specifies the name of the farm to which this target is joined.
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-put_farmname
     */
    put_FarmName(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(6, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the fully qualified domain name of the target.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_targetfqdn
     */
    get_TargetFQDN() {
        TargetFqdnName := BSTR()
        result := ComCall(7, this, "ptr", TargetFqdnName, "HRESULT")
        return TargetFqdnName
    }

    /**
     * Retrieves or specifies the fully qualified domain name of the target.
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-put_targetfqdn
     */
    put_TargetFQDN(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(8, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the NetBIOS name of the target.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_targetnetbios
     */
    get_TargetNetbios() {
        TargetNetbiosName := BSTR()
        result := ComCall(9, this, "ptr", TargetNetbiosName, "HRESULT")
        return TargetNetbiosName
    }

    /**
     * Retrieves or specifies the NetBIOS name of the target.
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-put_targetnetbios
     */
    put_TargetNetbios(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(10, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the external IP addresses of the target.
     * @remarks
     * 
     * This property was formerly known as <b>TargetExternalIpAddresses</b> in Windows Server 2008 R2.
     * 
     * If the number of external IP addresses is unknown, you can call this method with <i>sockaddr</i> set to <b>NULL</b>. The method will then return, in the <i>numAddresses</i> parameter, the number of <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ns-sessdirpublictypes-tssd_connectionpoint">TSSD_ConnectionPoint</a> structures necessary to receive all the external IP addresses. Allocate the array for <i>sockaddr</i> based on this number, and then call the method again, setting <i>sockaddr</i> to the newly allocated array and <i>numAddresses</i> to the number returned by the first call.
     * 
     * 
     * @param {Pointer<Integer>} numAddresses 
     * @returns {TSSD_ConnectionPoint} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_ipaddresses
     */
    get_IpAddresses(numAddresses) {
        numAddressesMarshal := numAddresses is VarRef ? "uint*" : "ptr"

        SOCKADDR := TSSD_ConnectionPoint()
        result := ComCall(11, this, "ptr", SOCKADDR, numAddressesMarshal, numAddresses, "HRESULT")
        return SOCKADDR
    }

    /**
     * Retrieves or specifies the external IP addresses of the target.
     * @remarks
     * 
     * This property was formerly known as <b>TargetExternalIpAddresses</b> in Windows Server 2008 R2.
     * 
     * If the number of external IP addresses is unknown, you can call this method with <i>sockaddr</i> set to <b>NULL</b>. The method will then return, in the <i>numAddresses</i> parameter, the number of <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ns-sessdirpublictypes-tssd_connectionpoint">TSSD_ConnectionPoint</a> structures necessary to receive all the external IP addresses. Allocate the array for <i>sockaddr</i> based on this number, and then call the method again, setting <i>sockaddr</i> to the newly allocated array and <i>numAddresses</i> to the number returned by the first call.
     * 
     * 
     * @param {Pointer<TSSD_ConnectionPoint>} SOCKADDR 
     * @param {Integer} numAddresses 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-put_ipaddresses
     */
    put_IpAddresses(SOCKADDR, numAddresses) {
        result := ComCall(12, this, "ptr", SOCKADDR, "uint", numAddresses, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the target state.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_targetstate
     */
    get_TargetState() {
        result := ComCall(13, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Retrieves or specifies the target state.
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-put_targetstate
     */
    put_TargetState(State) {
        result := ComCall(14, this, "int", State, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the set of properties for the target.
     * @returns {ITsSbTargetPropertySet} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_targetpropertyset
     */
    get_TargetPropertySet() {
        result := ComCall(15, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbTargetPropertySet(ppPropertySet)
    }

    /**
     * Retrieves or specifies the set of properties for the target.
     * @param {ITsSbTargetPropertySet} pVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-put_targetpropertyset
     */
    put_TargetPropertySet(pVal) {
        result := ComCall(16, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the name of the environment associated with the target.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_environmentname
     */
    get_EnvironmentName() {
        pVal := BSTR()
        result := ComCall(17, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves or specifies the name of the environment associated with the target.
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-put_environmentname
     */
    put_EnvironmentName(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(18, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of sessions maintained by broker for the target.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_numsessions
     */
    get_NumSessions() {
        result := ComCall(19, this, "uint*", &pNumSessions := 0, "HRESULT")
        return pNumSessions
    }

    /**
     * Retrieves the number of pending user connections for the target.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_numpendingconnections
     */
    get_NumPendingConnections() {
        result := ComCall(20, this, "uint*", &pNumPendingConnections := 0, "HRESULT")
        return pNumPendingConnections
    }

    /**
     * Retrieves the relative load on a target.
     * @remarks
     * 
     * The weight of a pending session relative to an active session can be changed by setting the value of the <i>LB_ConnectionEstablishmentPenalty</i> parameter for the Connection Broker. This parameter is located under the<b>HKLM\System\CurrentControlSet\Services\Tssdis\Parameters</b> registry key. The default value of 1 specifies that pending sessions have the same weight as active sessions.
     * 
     * This property is available on Windows Server 2012 R2 with <a href="https://support.microsoft.com/help/3091411/user-connection-fails-when-many-connections-are-made-to-windows-server">KB3091411</a> installed in the <a href="https://docs.microsoft.com/windows/desktop/TermServ/itssbtargetex">ITsSbTargetEx</a> interface.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtarget-get_targetload
     */
    get_TargetLoad() {
        result := ComCall(21, this, "uint*", &pTargetLoad := 0, "HRESULT")
        return pTargetLoad
    }
}
