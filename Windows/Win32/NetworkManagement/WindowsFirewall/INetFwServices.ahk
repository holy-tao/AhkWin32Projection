#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetFwService.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwServices interface is a standard Automation interface which provides access to a collection of services that may be authorized to listen through the firewall.
 * @remarks
 * 
 * An instance of this interface is retrieved through the
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_services">Services</a> property of the INetFwProfile interface. 
 * 
 * All configuration
 * changes take effect immediately.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwservices
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwServices extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwServices
     * @type {Guid}
     */
    static IID => Guid("{79649bb4-903e-421b-94c9-79848e79f6ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Item", "get__NewEnum"]

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
     * Retrieves a read-only element yielding the number of items in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservices-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Returns the specified service if it is in the collection.
     * @param {Integer} svcType <table>
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
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservices-item
     */
    Item(svcType) {
        result := ComCall(8, this, "int", svcType, "ptr*", &service := 0, "HRESULT")
        return INetFwService(service)
    }

    /**
     * Returns an object supporting IEnumVARIANT that can be used to iterate through all the services in the collection.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &newEnum := 0, "HRESULT")
        return IUnknown(newEnum)
    }
}
