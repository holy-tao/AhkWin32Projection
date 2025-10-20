#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetname
     */
    get_TargetName(pVal) {
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_farmname
     */
    get_FarmName(pVal) {
        result := ComCall(5, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} TargetFqdnName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetfqdn
     */
    get_TargetFQDN(TargetFqdnName) {
        result := ComCall(7, this, "ptr", TargetFqdnName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} TargetNetbiosName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetnetbios
     */
    get_TargetNetbios(TargetNetbiosName) {
        result := ComCall(9, this, "ptr", TargetNetbiosName, "HRESULT")
        return result
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
     * @param {Pointer<TSSD_ConnectionPoint>} SOCKADDR 
     * @param {Pointer<Integer>} numAddresses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_ipaddresses
     */
    get_IpAddresses(SOCKADDR, numAddresses) {
        result := ComCall(11, this, "ptr", SOCKADDR, "uint*", numAddresses, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetstate
     */
    get_TargetState(pState) {
        result := ComCall(13, this, "int*", pState, "HRESULT")
        return result
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
     * @param {Pointer<ITsSbTargetPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetpropertyset
     */
    get_TargetPropertySet(ppPropertySet) {
        result := ComCall(15, this, "ptr*", ppPropertySet, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_environmentname
     */
    get_EnvironmentName(pVal) {
        result := ComCall(17, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pNumSessions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_numsessions
     */
    get_NumSessions(pNumSessions) {
        result := ComCall(19, this, "uint*", pNumSessions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumPendingConnections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_numpendingconnections
     */
    get_NumPendingConnections(pNumPendingConnections) {
        result := ComCall(20, this, "uint*", pNumPendingConnections, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTargetLoad 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtarget-get_targetload
     */
    get_TargetLoad(pTargetLoad) {
        result := ComCall(21, this, "uint*", pTargetLoad, "HRESULT")
        return result
    }
}
