#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\VpnRoute.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnRouteAssignment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnRouteAssignment
     * @type {Guid}
     */
    static IID => Guid("{db64de22-ce39-4a76-9550-f61039f80e48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Ipv4InclusionRoutes", "put_Ipv6InclusionRoutes", "get_Ipv4InclusionRoutes", "get_Ipv6InclusionRoutes", "put_Ipv4ExclusionRoutes", "put_Ipv6ExclusionRoutes", "get_Ipv4ExclusionRoutes", "get_Ipv6ExclusionRoutes", "put_ExcludeLocalSubnets", "get_ExcludeLocalSubnets"]

    /**
     * @type {IVector<VpnRoute>} 
     */
    Ipv4InclusionRoutes {
        get => this.get_Ipv4InclusionRoutes()
        set => this.put_Ipv4InclusionRoutes(value)
    }

    /**
     * @type {IVector<VpnRoute>} 
     */
    Ipv6InclusionRoutes {
        get => this.get_Ipv6InclusionRoutes()
        set => this.put_Ipv6InclusionRoutes(value)
    }

    /**
     * @type {IVector<VpnRoute>} 
     */
    Ipv4ExclusionRoutes {
        get => this.get_Ipv4ExclusionRoutes()
        set => this.put_Ipv4ExclusionRoutes(value)
    }

    /**
     * @type {IVector<VpnRoute>} 
     */
    Ipv6ExclusionRoutes {
        get => this.get_Ipv6ExclusionRoutes()
        set => this.put_Ipv6ExclusionRoutes(value)
    }

    /**
     * @type {Boolean} 
     */
    ExcludeLocalSubnets {
        get => this.get_ExcludeLocalSubnets()
        set => this.put_ExcludeLocalSubnets(value)
    }

    /**
     * 
     * @param {IVector<VpnRoute>} value 
     * @returns {HRESULT} 
     */
    put_Ipv4InclusionRoutes(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IVector<VpnRoute>} value 
     * @returns {HRESULT} 
     */
    put_Ipv6InclusionRoutes(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Ipv4InclusionRoutes() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnRoute, value)
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Ipv6InclusionRoutes() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnRoute, value)
    }

    /**
     * 
     * @param {IVector<VpnRoute>} value 
     * @returns {HRESULT} 
     */
    put_Ipv4ExclusionRoutes(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IVector<VpnRoute>} value 
     * @returns {HRESULT} 
     */
    put_Ipv6ExclusionRoutes(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Ipv4ExclusionRoutes() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnRoute, value)
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Ipv6ExclusionRoutes() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnRoute, value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExcludeLocalSubnets(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExcludeLocalSubnets() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
