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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Add", "Remove", "Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-get_count
     */
    get_Count(count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetFwOpenPort} port 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-add
     */
    Add(port) {
        result := ComCall(8, this, "ptr", port, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} portNumber 
     * @param {Integer} ipProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-remove
     */
    Remove(portNumber, ipProtocol) {
        result := ComCall(9, this, "int", portNumber, "int", ipProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} portNumber 
     * @param {Integer} ipProtocol 
     * @param {Pointer<INetFwOpenPort>} openPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-item
     */
    Item(portNumber, ipProtocol, openPort) {
        result := ComCall(10, this, "int", portNumber, "int", ipProtocol, "ptr*", openPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} newEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-get__newenum
     */
    get__NewEnum(newEnum) {
        result := ComCall(11, this, "ptr*", newEnum, "HRESULT")
        return result
    }
}
