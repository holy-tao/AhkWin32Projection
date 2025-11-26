#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INATEventManager interface provides methods for NAT applications with UPnP technology to register callback interfaces with the NAT. The system calls the methods in these interfaces when the configuration of the NAT changes.
 * @see https://docs.microsoft.com/windows/win32/api//natupnp/nn-natupnp-inateventmanager
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INATEventManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INATEventManager
     * @type {Guid}
     */
    static IID => Guid("{624bd588-9060-4109-b0b0-1adbbcac32df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ExternalIPAddressCallback", "put_NumberOfEntriesCallback"]

    /**
     * @type {HRESULT} 
     */
    ExternalIPAddressCallback {
        set => this.put_ExternalIPAddressCallback(value)
    }

    /**
     * @type {HRESULT} 
     */
    NumberOfEntriesCallback {
        set => this.put_NumberOfEntriesCallback(value)
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-inateventmanager-put_externalipaddresscallback
     */
    put_ExternalIPAddressCallback(pUnk) {
        result := ComCall(7, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-inateventmanager-put_numberofentriescallback
     */
    put_NumberOfEntriesCallback(pUnk) {
        result := ComCall(8, this, "ptr", pUnk, "HRESULT")
        return result
    }
}
