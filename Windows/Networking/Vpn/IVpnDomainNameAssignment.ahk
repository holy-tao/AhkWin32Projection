#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\VpnDomainNameInfo.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnDomainNameAssignment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnDomainNameAssignment
     * @type {Guid}
     */
    static IID => Guid("{4135b141-ccdb-49b5-9401-039a8ae767e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DomainNameList", "put_ProxyAutoConfigurationUri", "get_ProxyAutoConfigurationUri"]

    /**
     * @type {IVector<VpnDomainNameInfo>} 
     */
    DomainNameList {
        get => this.get_DomainNameList()
    }

    /**
     * @type {Uri} 
     */
    ProxyAutoConfigurationUri {
        get => this.get_ProxyAutoConfigurationUri()
        set => this.put_ProxyAutoConfigurationUri(value)
    }

    /**
     * 
     * @returns {IVector<VpnDomainNameInfo>} 
     */
    get_DomainNameList() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnDomainNameInfo, value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ProxyAutoConfigurationUri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ProxyAutoConfigurationUri() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }
}
