#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservices-get_count
     */
    get_Count(count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} svcType 
     * @param {Pointer<INetFwService>} service 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservices-item
     */
    Item(svcType, service) {
        result := ComCall(8, this, "int", svcType, "ptr*", service, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} newEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservices-get__newenum
     */
    get__NewEnum(newEnum) {
        result := ComCall(9, this, "ptr*", newEnum, "HRESULT")
        return result
    }
}
