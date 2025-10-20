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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TargetName(pVal) {
        result := ComCall(3, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     */
    put_TargetName(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(4, this, "ptr", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_FarmName(pVal) {
        result := ComCall(5, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     */
    put_FarmName(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(6, this, "ptr", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} TargetFqdnName 
     * @returns {HRESULT} 
     */
    get_TargetFQDN(TargetFqdnName) {
        result := ComCall(7, this, "ptr", TargetFqdnName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     */
    put_TargetFQDN(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(8, this, "ptr", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} TargetNetbiosName 
     * @returns {HRESULT} 
     */
    get_TargetNetbios(TargetNetbiosName) {
        result := ComCall(9, this, "ptr", TargetNetbiosName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     */
    put_TargetNetbios(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(10, this, "ptr", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TSSD_ConnectionPoint>} SOCKADDR 
     * @param {Pointer<UInt32>} numAddresses 
     * @returns {HRESULT} 
     */
    get_IpAddresses(SOCKADDR, numAddresses) {
        result := ComCall(11, this, "ptr", SOCKADDR, "uint*", numAddresses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TSSD_ConnectionPoint>} SOCKADDR 
     * @param {Integer} numAddresses 
     * @returns {HRESULT} 
     */
    put_IpAddresses(SOCKADDR, numAddresses) {
        result := ComCall(12, this, "ptr", SOCKADDR, "uint", numAddresses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    get_TargetState(pState) {
        result := ComCall(13, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    put_TargetState(State) {
        result := ComCall(14, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbTargetPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     */
    get_TargetPropertySet(ppPropertySet) {
        result := ComCall(15, this, "ptr", ppPropertySet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbTargetPropertySet>} pVal 
     * @returns {HRESULT} 
     */
    put_TargetPropertySet(pVal) {
        result := ComCall(16, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_EnvironmentName(pVal) {
        result := ComCall(17, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     */
    put_EnvironmentName(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(18, this, "ptr", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumSessions 
     * @returns {HRESULT} 
     */
    get_NumSessions(pNumSessions) {
        result := ComCall(19, this, "uint*", pNumSessions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumPendingConnections 
     * @returns {HRESULT} 
     */
    get_NumPendingConnections(pNumPendingConnections) {
        result := ComCall(20, this, "uint*", pNumPendingConnections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pTargetLoad 
     * @returns {HRESULT} 
     */
    get_TargetLoad(pTargetLoad) {
        result := ComCall(21, this, "uint*", pTargetLoad, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
