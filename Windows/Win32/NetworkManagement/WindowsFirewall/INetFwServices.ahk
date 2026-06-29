#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetFwService.ahk" { INetFwService }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\NET_FW_SERVICE_TYPE.ahk" { NET_FW_SERVICE_TYPE }

/**
 * The INetFwServices interface is a standard Automation interface which provides access to a collection of services that may be authorized to listen through the firewall.
 * @remarks
 * An instance of this interface is retrieved through the
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_services">Services</a> property of the INetFwProfile interface. 
 * 
 * All configuration
 * changes take effect immediately.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwservices
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwServices extends IDispatch {
    /**
     * The interface identifier for INetFwServices
     * @type {Guid}
     */
    static IID := Guid("{79649bb4-903e-421b-94c9-79848e79f6ee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwServices interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        Item         : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwServices.Vtbl()
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
     * Retrieves a read-only element yielding the number of items in the collection. (INetFwServices.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservices-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Returns the specified service if it is in the collection.
     * @param {NET_FW_SERVICE_TYPE} svcType <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * Type of  service to fetch.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     * Type of  service to fetch. See <a href="https://docs.microsoft.com/windows/desktop/api/icftypes/ne-icftypes-net_fw_service_type">NET_FW_SERVICE_TYPE</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {INetFwService} <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * Reference to the returned <b>INetFwService</b> object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     * Reference to the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwservice">INetFwService</a> object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservices-item
     */
    Item(svcType) {
        result := ComCall(8, this, NET_FW_SERVICE_TYPE, svcType, "ptr*", &service := 0, "HRESULT")
        return INetFwService(service)
    }

    /**
     * Returns an object supporting IEnumVARIANT that can be used to iterate through all the services in the collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &newEnum := 0, "HRESULT")
        return IUnknown(newEnum)
    }

    Query(iid) {
        if (INetFwServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
