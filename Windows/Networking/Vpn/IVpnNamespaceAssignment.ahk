#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\VpnNamespaceInfo.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnNamespaceAssignment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnNamespaceAssignment
     * @type {Guid}
     */
    static IID => Guid("{d7f7db18-307d-4c0e-bd62-8fa270bbadd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_NamespaceList", "get_NamespaceList", "put_ProxyAutoConfigUri", "get_ProxyAutoConfigUri"]

    /**
     * @type {IVector<VpnNamespaceInfo>} 
     */
    NamespaceList {
        get => this.get_NamespaceList()
        set => this.put_NamespaceList(value)
    }

    /**
     * @type {Uri} 
     */
    ProxyAutoConfigUri {
        get => this.get_ProxyAutoConfigUri()
        set => this.put_ProxyAutoConfigUri(value)
    }

    /**
     * 
     * @param {IVector<VpnNamespaceInfo>} value 
     * @returns {HRESULT} 
     */
    put_NamespaceList(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<VpnNamespaceInfo>} 
     */
    get_NamespaceList() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnNamespaceInfo, value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ProxyAutoConfigUri(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ProxyAutoConfigUri() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }
}
