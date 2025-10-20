#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwOpenPorts interface is a standard Automation collection interface.
 * @remarks
 * 
  * An instance
  * of this interface is retrieved through the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_globallyopenports">GloballyOpenPorts</a> property of the
  * INetFwProfile interface.
  * 
  * All configuration changes take effect
  * immediately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwopenports
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwOpenPorts extends IDispatch{
    /**
     * The interface identifier for INetFwOpenPorts
     * @type {Guid}
     */
    static IID => Guid("{c0e9d7fa-e07e-430a-b19a-090ce82d92e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} count 
     * @returns {HRESULT} 
     */
    get_Count(count) {
        result := ComCall(7, this, "int*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwOpenPort>} port 
     * @returns {HRESULT} 
     */
    Add(port) {
        result := ComCall(8, this, "ptr", port, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} portNumber 
     * @param {Integer} ipProtocol 
     * @returns {HRESULT} 
     */
    Remove(portNumber, ipProtocol) {
        result := ComCall(9, this, "int", portNumber, "int", ipProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} portNumber 
     * @param {Integer} ipProtocol 
     * @param {Pointer<INetFwOpenPort>} openPort 
     * @returns {HRESULT} 
     */
    Item(portNumber, ipProtocol, openPort) {
        result := ComCall(10, this, "int", portNumber, "int", ipProtocol, "ptr", openPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} newEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(newEnum) {
        result := ComCall(11, this, "ptr", newEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
