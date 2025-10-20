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
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    put_ExternalIPAddressCallback(pUnk) {
        result := ComCall(7, this, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    put_NumberOfEntriesCallback(pUnk) {
        result := ComCall(8, this, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
