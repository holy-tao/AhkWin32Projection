#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to delay Service Control Protocol Description (SCPD) download and event subscription on the IUPnPService objects enumerated from the IUPnPServices object.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpserviceenumproperty
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPServiceEnumProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPServiceEnumProperty
     * @type {Guid}
     */
    static IID => Guid("{38873b37-91bb-49f4-b249-2e8efbb8a816}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetServiceEnumProperty"]

    /**
     * The SetServiceEnumProperty method is used to indicate opt-in to the delayed Service Control Protocol Description (SCPD) download and event subscription for the IUPnPService objects enumerated from the IUPnPServices object.
     * @param {Integer} dwMask Specifies a bit-wise flag to indicate an opt-in to the delayed SCPD download and even subscription. Possible values include:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>UPNP_SERVICE_DELAY_SCPD_AND_SUBSCRIPTION</td>
     * <td>0x1</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns <b>S_OK</b> on success. Otherwise, this method returns <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceenumproperty-setserviceenumproperty
     */
    SetServiceEnumProperty(dwMask) {
        result := ComCall(3, this, "uint", dwMask, "HRESULT")
        return result
    }
}
