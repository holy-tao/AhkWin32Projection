#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\VpnTrafficFilter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnTrafficFilterAssignment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnTrafficFilterAssignment
     * @type {Guid}
     */
    static IID => Guid("{56ccd45c-e664-471e-89cd-601603b9e0f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TrafficFilterList", "get_AllowOutbound", "put_AllowOutbound", "get_AllowInbound", "put_AllowInbound"]

    /**
     * @type {IVector<VpnTrafficFilter>} 
     */
    TrafficFilterList {
        get => this.get_TrafficFilterList()
    }

    /**
     * @type {Boolean} 
     */
    AllowOutbound {
        get => this.get_AllowOutbound()
        set => this.put_AllowOutbound(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowInbound {
        get => this.get_AllowInbound()
        set => this.put_AllowInbound(value)
    }

    /**
     * 
     * @returns {IVector<VpnTrafficFilter>} 
     */
    get_TrafficFilterList() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnTrafficFilter, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowOutbound() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowOutbound(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowInbound() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowInbound(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
