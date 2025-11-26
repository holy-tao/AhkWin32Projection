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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetname
     */
    get_TargetName() {
        pVal := BSTR()
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetname
     */
    put_TargetName(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(4, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_farmname
     */
    get_FarmName() {
        pVal := BSTR()
        result := ComCall(5, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_farmname
     */
    put_FarmName(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(6, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetfqdn
     */
    get_TargetFQDN() {
        TargetFqdnName := BSTR()
        result := ComCall(7, this, "ptr", TargetFqdnName, "HRESULT")
        return TargetFqdnName
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetfqdn
     */
    put_TargetFQDN(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(8, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetnetbios
     */
    get_TargetNetbios() {
        TargetNetbiosName := BSTR()
        result := ComCall(9, this, "ptr", TargetNetbiosName, "HRESULT")
        return TargetNetbiosName
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetnetbios
     */
    put_TargetNetbios(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(10, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} numAddresses 
     * @returns {TSSD_ConnectionPoint} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_ipaddresses
     */
    get_IpAddresses(numAddresses) {
        numAddressesMarshal := numAddresses is VarRef ? "uint*" : "ptr"

        SOCKADDR := TSSD_ConnectionPoint()
        result := ComCall(11, this, "ptr", SOCKADDR, numAddressesMarshal, numAddresses, "HRESULT")
        return SOCKADDR
    }

    /**
     * 
     * @param {Pointer<TSSD_ConnectionPoint>} SOCKADDR 
     * @param {Integer} numAddresses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_ipaddresses
     */
    put_IpAddresses(SOCKADDR, numAddresses) {
        result := ComCall(12, this, "ptr", SOCKADDR, "uint", numAddresses, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetstate
     */
    get_TargetState() {
        result := ComCall(13, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetstate
     */
    put_TargetState(State) {
        result := ComCall(14, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITsSbTargetPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetpropertyset
     */
    get_TargetPropertySet() {
        result := ComCall(15, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbTargetPropertySet(ppPropertySet)
    }

    /**
     * 
     * @param {ITsSbTargetPropertySet} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_targetpropertyset
     */
    put_TargetPropertySet(pVal) {
        result := ComCall(16, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_environmentname
     */
    get_EnvironmentName() {
        pVal := BSTR()
        result := ComCall(17, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-put_environmentname
     */
    put_EnvironmentName(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(18, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_numsessions
     */
    get_NumSessions() {
        result := ComCall(19, this, "uint*", &pNumSessions := 0, "HRESULT")
        return pNumSessions
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_numpendingconnections
     */
    get_NumPendingConnections() {
        result := ComCall(20, this, "uint*", &pNumPendingConnections := 0, "HRESULT")
        return pNumPendingConnections
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetload
     */
    get_TargetLoad() {
        result := ComCall(21, this, "uint*", &pTargetLoad := 0, "HRESULT")
        return pTargetLoad
    }
}
