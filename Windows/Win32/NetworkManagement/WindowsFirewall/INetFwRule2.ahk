#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetFwRule.ahk

/**
 * Allows an application or service to access all the properties of INetFwRule as well as the four edge properties of a firewall rule specified by NET_FW_EDGE_TRAVERSAL_TYPE.
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwrule2
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwRule2 extends INetFwRule{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwRule2
     * @type {Guid}
     */
    static IID => Guid("{9c27c8da-189b-4dde-89f7-8b39a316782c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EdgeTraversalOptions", "put_EdgeTraversalOptions"]

    /**
     * @type {Integer} 
     */
    EdgeTraversalOptions {
        get => this.get_EdgeTraversalOptions()
        set => this.put_EdgeTraversalOptions(value)
    }

    /**
     * This property can be used to access the edge properties of a firewall rule defined by NET_FW_EDGE_TRAVERSAL_TYPE.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule2-get_edgetraversaloptions
     */
    get_EdgeTraversalOptions() {
        result := ComCall(43, this, "int*", &lOptions := 0, "HRESULT")
        return lOptions
    }

    /**
     * This property can be used to access the edge properties of a firewall rule defined by NET_FW_EDGE_TRAVERSAL_TYPE.
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule2-put_edgetraversaloptions
     */
    put_EdgeTraversalOptions(lOptions) {
        result := ComCall(44, this, "int", lOptions, "HRESULT")
        return result
    }
}
