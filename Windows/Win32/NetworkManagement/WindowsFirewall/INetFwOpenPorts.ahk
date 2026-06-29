#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\NET_FW_IP_PROTOCOL.ahk" { NET_FW_IP_PROTOCOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetFwOpenPort.ahk" { INetFwOpenPort }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The INetFwOpenPorts interface is a standard Automation collection interface.
 * @remarks
 * An instance
 * of this interface is retrieved through the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_globallyopenports">GloballyOpenPorts</a> property of the
 * INetFwProfile interface.
 * 
 * All configuration changes take effect
 * immediately.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwopenports
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwOpenPorts extends IDispatch {
    /**
     * The interface identifier for INetFwOpenPorts
     * @type {Guid}
     */
    static IID := Guid("{c0e9d7fa-e07e-430a-b19a-090ce82d92e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwOpenPorts interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
        Item         : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwOpenPorts.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves a read-only element yielding the number of items in the collection. (INetFwOpenPorts.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Opens a new port and adds it to the collection.
     * @remarks
     * If the port is already open, the existing settings are overwritten.
     * @param {INetFwOpenPort} port Port to add to the collection.
     * @returns {HRESULT} <h3>C++</h3>
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because a parameter was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  method failed because the  object is already in the collection.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds, the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because a parameter was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  method failed because the  object is already in the collection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-add
     */
    Add(port) {
        result := ComCall(8, this, "ptr", port, "HRESULT")
        return result
    }

    /**
     * Closes a port and removes it from the collection.
     * @remarks
     * If the port is already
     *    closed ,the <b>Remove</b> method has no effect.
     * @param {Integer} portNumber Port number to remove.
     * @param {NET_FW_IP_PROTOCOL} ipProtocol Protocol of the port to remove.
     * @returns {HRESULT} <h3>C++</h3>
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds, the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-remove
     */
    Remove(portNumber, ipProtocol) {
        result := ComCall(9, this, "int", portNumber, NET_FW_IP_PROTOCOL, ipProtocol, "HRESULT")
        return result
    }

    /**
     * Returns the specified port if it is in the collection.
     * @param {Integer} portNumber Port number to find.
     * @param {NET_FW_IP_PROTOCOL} ipProtocol Protocol of the port to find by type <a href="https://docs.microsoft.com/windows/desktop/api/icftypes/ne-icftypes-net_fw_ip_protocol">NET_FW_IP_PROTOCOL</a>.
     * @returns {INetFwOpenPort} Reference to the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwopenport">INetFwOpenPort</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-item
     */
    Item(portNumber, ipProtocol) {
        result := ComCall(10, this, "int", portNumber, NET_FW_IP_PROTOCOL, ipProtocol, "ptr*", &openPort := 0, "HRESULT")
        return INetFwOpenPort(openPort)
    }

    /**
     * Returns an object supporting IEnumVARIANT that can be used to iterate through all the ports in the collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenports-get__newenum
     */
    get__NewEnum() {
        result := ComCall(11, this, "ptr*", &newEnum := 0, "HRESULT")
        return IUnknown(newEnum)
    }

    Query(iid) {
        if (INetFwOpenPorts.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 3)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 4)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
