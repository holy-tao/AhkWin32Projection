#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetFwRule.ahk" { INetFwRule }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Allows an application or service to access all the properties of INetFwRule as well as the four edge properties of a firewall rule specified by NET_FW_EDGE_TRAVERSAL_TYPE.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwrule2
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwRule2 extends INetFwRule {
    /**
     * The interface identifier for INetFwRule2
     * @type {Guid}
     */
    static IID := Guid("{9c27c8da-189b-4dde-89f7-8b39a316782c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwRule2 interfaces
    */
    struct Vtbl extends INetFwRule.Vtbl {
        get_EdgeTraversalOptions : IntPtr
        put_EdgeTraversalOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwRule2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    EdgeTraversalOptions {
        get => this.get_EdgeTraversalOptions()
        set => this.put_EdgeTraversalOptions(value)
    }

    /**
     * This property can be used to access the edge properties of a firewall rule defined by NET_FW_EDGE_TRAVERSAL_TYPE. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule2-get_edgetraversaloptions
     */
    get_EdgeTraversalOptions() {
        result := ComCall(43, this, "int*", &lOptions := 0, "HRESULT")
        return lOptions
    }

    /**
     * This property can be used to access the edge properties of a firewall rule defined by NET_FW_EDGE_TRAVERSAL_TYPE. (Put)
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule2-put_edgetraversaloptions
     */
    put_EdgeTraversalOptions(lOptions) {
        result := ComCall(44, this, "int", lOptions, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetFwRule2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EdgeTraversalOptions := CallbackCreate(GetMethod(implObj, "get_EdgeTraversalOptions"), flags, 2)
        this.vtbl.put_EdgeTraversalOptions := CallbackCreate(GetMethod(implObj, "put_EdgeTraversalOptions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EdgeTraversalOptions)
        CallbackFree(this.vtbl.put_EdgeTraversalOptions)
    }
}
